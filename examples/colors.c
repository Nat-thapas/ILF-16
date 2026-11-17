// Color display demo: the same program as colors.asm, written in C.
//
// Fills the screen with diagonal stripes of all 16 colours, which shift every frame

int main() {
    int x, y;
    int color = 0;

    for (;;) {
        for (y = 0; y < 256; y++) {
            for (x = 0; x < 256; x++) {
                pixel(x, y, color);
                color = (color + 1) & 15;
            }
            color = (color + 1) & 15;
        }
        color = (color + 1) & 15;
    }
}
