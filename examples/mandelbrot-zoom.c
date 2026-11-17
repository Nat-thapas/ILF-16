// Mandelbrot zoom: keeps zooming in on one point of the Mandelbrot set (the branching
// filaments above the main body), then starts again. The C version of mandelbrot-zoom.asm.
//
// Drawn at 128x128 (2x2 pixel blocks): a frame takes about half a second at real speed, and
// the whole zoom about 40 seconds. Try the unlimited speed mode as well.
// See mandelbrot.c for how the fixed point arithmetic works: numbers are signed Q4.12.
//
// The distance between two blocks is kept in 1/256ths of the smallest Q4.12 step, and gets
// 1/16 smaller every frame. It starts at 96 (the whole set) and the zoom ends when it reaches
// 1, where neighbouring blocks would land on the same number: a magnification of 96 times.
//
// Output port 0 shows the frame number.

#define MAX_ITER 48
#define FIRST_STEP 0x6000       // 96 * 256
#define TARGET_X 0xFE62         // -0.1011
#define TARGET_Y 3917           //  0.9563 (drawn towards the bottom, as y grows downwards)

// Colours for points outside the set, indexed by (iterations mod 16)
int palette[16] = {1, 2, 13, 14, 8, 9, 10, 7, 15, 6, 12, 11, 3, 5, 4, 2};

int main() {
    int px, py;                 // the block being drawn
    int cx, cy;                 // the point it stands for
    int zx, zy, x2, y2, hi, iter, color;
    int origin_x, origin_y;     // the point in the top left corner
    unsigned step;
    unsigned frame = 0;

    for (;;) {
        // zoom in by 1/16 every frame
        for (step = FIRST_STEP; step >= 256; step -= step >> 4) {
            out(0, ++frame);

            // the top left corner is 64 blocks up and left of the target: 64 * step / 256
            origin_x = TARGET_X - (step >> 2);
            origin_y = TARGET_Y - (step >> 2);

            for (py = 0; py < 128; py++) {
                // cy = origin_y + py * step / 256, using both halves of the 32-bit product
                cy = origin_y + ((py * step >> 8) | (umulhi(py, step) << 8));
                for (px = 0; px < 128; px++) {
                    cx = origin_x + ((px * step >> 8) | (umulhi(px, step) << 8));

                    zx = cx;
                    zy = cy;
                    for (iter = 0; iter < MAX_ITER; iter++) {
                        hi = mulhi(zx, zx);
                        if (hi >= 0x400) break;
                        x2 = (hi << 4) | ((unsigned)(zx * zx) >> 12);
                        hi = mulhi(zy, zy);
                        if (hi >= 0x400) break;
                        y2 = (hi << 4) | ((unsigned)(zy * zy) >> 12);
                        // escaped if x2 + y2 >= 4.0 (0x4000, so one of the top two bits is set)
                        if ((unsigned)(x2 + y2) >> 14) break;
                        zy = ((mulhi(zx, zy) << 5) | ((unsigned)(zx * zy) >> 11)) + cy;
                        zx = x2 - y2 + cx;
                    }
                    color = iter == MAX_ITER ? 0 : palette[iter & 15];

                    // draw the 2x2 block
                    pixel(px << 1, py << 1, color);
                    pixel((px << 1) + 1, py << 1, color);
                    pixel(px << 1, (py << 1) + 1, color);
                    pixel((px << 1) + 1, (py << 1) + 1, color);
                }
            }
        }

        // fully zoomed in: hold the last frame for about a second, then start again
        for (iter = 700; iter; iter--) stall(0xFFFF);
    }
}
