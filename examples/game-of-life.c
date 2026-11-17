// Conway's Game of Life on a 64x64 grid that wraps around at the edges. The C version of
// game-of-life.asm.
//
// Hold any bit of input port 0 (a switch or a button) to start again from a new random grid.
// Output port 0 shows the generation number.
//
// The grid has one word per cell, with a one cell border on every side (66 words per row).
// Before each generation the opposite edge is copied into the border, so the neighbour
// counting never has to deal with wrapping.
// Bit 0 of a cell is its current state. The next state is first written to bit 1, and only
// moved down to bit 0 once every cell has been counted.

#define ALIVE_COLOR 11
#define ROW 66                          // words per row of the grid
#define FIRST (grid + ROW + 1)          // cell (0, 0): one row and one column in

unsigned grid[ROW * ROW];

// Draw cell (x, y) in a colour: a 3x3 square, leaving a 1 pixel gap between cells
void draw_cell(int x, int y, int color) {
    int px = x << 2, py = y << 2;
    int px1 = px + 1, px2 = px + 2;
    pixel(px, py, color);
    pixel(px1, py, color);
    pixel(px2, py, color);
    py++;
    pixel(px, py, color);
    pixel(px1, py, color);
    pixel(px2, py, color);
    py++;
    pixel(px, py, color);
    pixel(px1, py, color);
    pixel(px2, py, color);
}

// Copy `count` words, moving both pointers by `step` after every word
void copy(unsigned *src, unsigned *dst, int step, int count) {
    do {
        *dst = *src;
        src += step;
        dst += step;
    } while (--count);
}

int main() {
    unsigned *p;
    unsigned cell, next, count, gen;
    unsigned rng = 0xACE1;
    int x, y;

    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);

    for (;;) {
        // fill the grid at random, about one cell in four alive
        p = FIRST;
        for (y = 0; y < 64; y++) {
            for (x = 0; x < 64; x++) {
                rng ^= rng << 7;        // 16-bit xorshift random number generator
                rng ^= rng >> 9;
                rng ^= rng << 8;
                cell = (rng & 3) == 0;
                *p++ = cell;
                draw_cell(x, y, cell ? ALIVE_COLOR : 0);
            }
            p += 2;                     // skip the right and left border
        }

        for (gen = 0; !in(0); gen++) {
            out(0, gen);

            // copy the edges into the opposite border: rows first, then columns (with the corners)
            copy(grid + 64 * ROW + 1, grid + 1, 1, 64);         // bottom row -> top border
            copy(FIRST, grid + 65 * ROW + 1, 1, 64);            // top row -> bottom border
            copy(grid + 64, grid, ROW, ROW);                    // right column -> left border
            copy(grid + 1, grid + 65, ROW, ROW);                // left column -> right border

            // pass 1: count the neighbours of every cell and store its next state in bit 1
            p = FIRST;
            for (y = 64; y; y--) {
                for (x = 64; x; x--) {
                    // the three above and the one to the left may already have their bit 1
                    // set; the one to the right and the three below are still 0 or 1
                    count = (p[-ROW - 1] & 1) + (p[-ROW] & 1) + (p[-ROW + 1] & 1) + (p[-1] & 1)
                        + p[1] + p[ROW - 1] + p[ROW] + p[ROW + 1];
                    // alive next if it has 3 neighbours, or 2 and is alive now
                    cell = *p;
                    *p++ = cell | ((count | cell) == 3 ? 2 : 0);
                }
                p += 2;
            }

            // pass 2: make the next state current, redrawing only the cells that changed
            p = FIRST;
            for (y = 0; y < 64; y++) {
                for (x = 0; x < 64; x++) {
                    cell = *p;
                    next = cell >> 1;
                    *p++ = next;
                    if (next != (cell & 1)) draw_cell(x, y, next ? ALIVE_COLOR : 0);
                }
                p += 2;
            }

            // wait about 40 ms so it does not run too fast to follow
            for (x = 30; x; x--) stall(0xFFFF);
        }
    }
}
