// VGA demo: the same program as vga-demo.asm, written in C.
//
// Fills the screen with diagonal stripes of all 16 colours, which shift every frame, with a
// grid of white squares on top.

int main() {
    int x, y;
    int color = 0;

    for (;;) {
        for (y = 0; y < 256; y++) {
            for (x = 0; x < 256; x++) {
                if ((x & y & 0x60) == 0x60) pixel(x, y, 15);
                else pixel(x, y, color);
                color = (color + 1) & 15;
            }
            color = (color + 1) & 15;
        }
        color = (color + 1) & 15;
    }
}
