// Fire: the classic demo effect. The C version of fire.asm.
//
// Input port 0: hold any bit (a switch or a button) to put the fire out. Let go to light it again.
//
// The fire is a grid of 128 x 48 heat values, drawn as blocks of 2 x 4 pixels at the bottom of
// the screen. The two bottom rows are not shown: they are the fuel, set at random to hot (3
// times in 4) or cold every frame. Every other cell becomes the average of the three cells
// below it and the one two rows down, minus a little random cooling, so the heat rises and
// fades. Rows are done from the top down, so each cell still sees last frame's heat below it.
//
// Heat is 0 to 255 and its upper 4 bits pick the colour. A block is only drawn again when its
// colour changes. For better looking flames, change the palette in the emulator to a smooth
// ramp from black through red and yellow to white (colours 0, 2, 8, 9, 10 and 7 are used).

#define WIDTH 128
#define HEIGHT 48
#define TOP 72                      // screen y of the first row: 46 rows of 4 pixels end at 256

unsigned heat[WIDTH * HEIGHT];

// Colour for every 16 steps of heat
int ramp[16] = {0, 0, 2, 2, 2, 8, 8, 8, 8, 9, 9, 9, 10, 10, 10, 7};

int main() {
    unsigned *p;
    unsigned h, t, fuel;
    unsigned rng = 1, multiplier = 25173;
    int px, py, x1, color;

    for (;;) {
        // fuel: every cell of the two bottom rows is hot or cold at random (all cold if a bit
        // of input port 0 is on)
        fuel = in(0) ? 0 : 255;
        p = heat + WIDTH * (HEIGHT - 2);
        for (t = 2 * WIDTH; t; t--) {
            rng = rng * multiplier + 1;     // random numbers: multiply and add 1, use the upper bits
            *p++ = rng >> 14 ? fuel : 0;    // hot 3 times out of 4
        }

        p = heat;
        for (py = TOP; py < 256; py += 4) {
            for (px = 0; px < 256; px += 2) {
                // the average of the cells below left, below, below right and two below
                h = (p[WIDTH - 1] + p[WIDTH] + p[WIDTH + 1] + p[2 * WIDTH]) >> 2;
                // cool down by 2 to 9
                rng = rng * multiplier + 1;
                t = (rng >> 13) + 2;
                h = h > t ? h - t : 0;
                // has the colour changed?
                color = h >> 4;
                if (color != *p >> 4) {
                    color = ramp[color];
                    x1 = px + 1;
                    pixel(px, py, color);
                    pixel(x1, py, color);
                    pixel(px, py + 1, color);
                    pixel(x1, py + 1, color);
                    pixel(px, py + 2, color);
                    pixel(x1, py + 2, color);
                    pixel(px, py + 3, color);
                    pixel(x1, py + 3, color);
                }
                *p++ = h;
            }
        }

        // wait about 16 ms: with the work above that is roughly 30 frames per second
        for (t = 12; t; t--) stall(0xFFFF);
    }
}
