// Mandelbrot set, drawn with 16-bit fixed point arithmetic. The C version of mandelbrot.asm.
//
// Numbers are signed Q4.12 (4096 = 1.0). A product of two of them is a 32-bit Q8.24 value:
// mulhi() gives its upper word and * its lower word, which are then stitched back into Q4.12.
// The view is 3.0 wide (real -2.25 to 0.75, imaginary -1.5 to 1.5), so one pixel is 48/4096.
//
// Output port 0 shows the row being drawn. Takes a few seconds at real speed.

#define MAX_ITER 64
#define PIXEL_STEP 48

// Colours for points outside the set, indexed by (iterations mod 16)
int palette[16] = {1, 2, 13, 14, 8, 9, 10, 7, 15, 6, 12, 11, 3, 5, 4, 2};

int main() {
    int px, py;         // the pixel
    int cx, cy;         // the point c it stands for
    int zx, zy;         // z, which starts at c and becomes z * z + c over and over
    int x2, y2, hi, iter;
    int four = 0x4000;

    cy = -6144;                     // -1.5
    for (py = 0; py < 256; py++) {
        out(0, py);
        cx = -9216;                 // -2.25
        for (px = 0; px < 256; px++) {
            zx = cx;
            zy = cy;
            for (iter = 0; iter < MAX_ITER; iter++) {
                // x2 = zx * zx. The upper word is Q8.8: if it is already 4.0 or more, |z| > 2.
                hi = mulhi(zx, zx);
                if (hi >= 0x400) break;
                x2 = (hi << 4) | ((unsigned)(zx * zx) >> 12);
                hi = mulhi(zy, zy);
                if (hi >= 0x400) break;
                y2 = (hi << 4) | ((unsigned)(zy * zy) >> 12);
                if ((unsigned)(x2 + y2) > (unsigned)four) break;
                // zy = 2 * zx * zy + cy (one bit less of shift does the doubling)
                zy = ((mulhi(zx, zy) << 5) | ((unsigned)(zx * zy) >> 11)) + cy;
                zx = x2 - y2 + cx;
            }
            // points that never escaped are inside the set, and black
            pixel(px, py, iter == MAX_ITER ? 0 : palette[iter & 15]);
            cx += PIXEL_STEP;
        }
        cy += PIXEL_STEP;
    }
    return 0;
}
