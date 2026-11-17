// Rotating 3D wireframe cube, drawn in perspective. The C version of cube.asm.
//
// Input port 0: analog stick (optional). While it is off centre it turns the cube: left/right
//               about the vertical axis, up/down about the horizontal one. Left alone, the
//               cube spins by itself.
//
// Every frame the 8 corners are rotated about two axes and projected onto the screen, the 12
// edges of the previous frame are erased and the new ones drawn with Bresenham's line algorithm.
//
// Coordinates are signed Q8.8 (256 = 1 pixel). Sines are signed Q15 (32767 = 1.0), so the
// upper word of a product (mulhi) is half the answer and gets doubled afterwards.
// Dividing is slow, so the perspective divide is a table of 256 * 160 / (160 + z) in Q8.8,
// indexed by the whole part of z.

#define HALF_SIZE 0x3400        // 52.0: half the length of an edge

// sin(2 * pi * n / 256) * 32767
int sine[256] = {
    0, 804, 1608, 2410, 3212, 4011, 4808, 5602, 6393, 7179, 7962, 8739, 9512, 10278, 11039, 11793,
    12539, 13279, 14010, 14732, 15446, 16151, 16846, 17530, 18204, 18868, 19519, 20159, 20787, 21403, 22005, 22594,
    23170, 23731, 24279, 24811, 25329, 25832, 26319, 26790, 27245, 27683, 28105, 28510, 28898, 29268, 29621, 29956,
    30273, 30571, 30852, 31113, 31356, 31580, 31785, 31971, 32137, 32285, 32412, 32521, 32609, 32678, 32728, 32757,
    32767, 32757, 32728, 32678, 32609, 32521, 32412, 32285, 32137, 31971, 31785, 31580, 31356, 31113, 30852, 30571,
    30273, 29956, 29621, 29268, 28898, 28510, 28105, 27683, 27245, 26790, 26319, 25832, 25329, 24811, 24279, 23731,
    23170, 22594, 22005, 21403, 20787, 20159, 19519, 18868, 18204, 17530, 16846, 16151, 15446, 14732, 14010, 13279,
    12539, 11793, 11039, 10278, 9512, 8739, 7962, 7179, 6393, 5602, 4808, 4011, 3212, 2410, 1608, 804,
    0, -804, -1608, -2410, -3212, -4011, -4808, -5602, -6393, -7179, -7962, -8739, -9512, -10278, -11039, -11793,
    -12539, -13279, -14010, -14732, -15446, -16151, -16846, -17530, -18204, -18868, -19519, -20159, -20787, -21403, -22005, -22594,
    -23170, -23731, -24279, -24811, -25329, -25832, -26319, -26790, -27245, -27683, -28105, -28510, -28898, -29268, -29621, -29956,
    -30273, -30571, -30852, -31113, -31356, -31580, -31785, -31971, -32137, -32285, -32412, -32521, -32609, -32678, -32728, -32757,
    -32767, -32757, -32728, -32678, -32609, -32521, -32412, -32285, -32137, -31971, -31785, -31580, -31356, -31113, -30852, -30571,
    -30273, -29956, -29621, -29268, -28898, -28510, -28105, -27683, -27245, -26790, -26319, -25832, -25329, -24811, -24279, -23731,
    -23170, -22594, -22005, -21403, -20787, -20159, -19519, -18868, -18204, -17530, -16846, -16151, -15446, -14732, -14010, -13279,
    -12539, -11793, -11039, -10278, -9512, -8739, -7962, -7179, -6393, -5602, -4808, -4011, -3212, -2410, -1608, -804
};

// 256 * 160 / (160 + z) for z = -128 to 127
int scale[256] = {
    1280, 1241, 1205, 1170, 1138, 1107, 1078, 1050, 1024, 999, 975, 953, 931, 910, 890, 871,
    853, 836, 819, 803, 788, 773, 759, 745, 731, 719, 706, 694, 683, 671, 661, 650,
    640, 630, 621, 611, 602, 594, 585, 577, 569, 561, 554, 546, 539, 532, 525, 518,
    512, 506, 500, 493, 488, 482, 476, 471, 465, 460, 455, 450, 445, 440, 436, 431,
    427, 422, 418, 414, 410, 406, 402, 398, 394, 390, 386, 383, 379, 376, 372, 369,
    366, 362, 359, 356, 353, 350, 347, 344, 341, 339, 336, 333, 330, 328, 325, 323,
    320, 318, 315, 313, 310, 308, 306, 303, 301, 299, 297, 295, 293, 290, 288, 286,
    284, 282, 281, 279, 277, 275, 273, 271, 269, 268, 266, 264, 263, 261, 259, 258,
    256, 254, 253, 251, 250, 248, 247, 245, 244, 242, 241, 240, 238, 237, 235, 234,
    233, 231, 230, 229, 228, 226, 225, 224, 223, 221, 220, 219, 218, 217, 216, 214,
    213, 212, 211, 210, 209, 208, 207, 206, 205, 204, 203, 202, 201, 200, 199, 198,
    197, 196, 195, 194, 193, 192, 191, 191, 190, 189, 188, 187, 186, 185, 185, 184,
    183, 182, 181, 180, 180, 179, 178, 177, 177, 176, 175, 174, 174, 173, 172, 171,
    171, 170, 169, 169, 168, 167, 167, 166, 165, 164, 164, 163, 163, 162, 161, 161,
    160, 159, 159, 158, 158, 157, 156, 156, 155, 155, 154, 153, 153, 152, 152, 151,
    151, 150, 149, 149, 148, 148, 147, 147, 146, 146, 145, 145, 144, 144, 143, 143
};

// The 12 edges: the two corners each one joins, and its colour.
// Bit 0 of a corner number is its x side, bit 1 its y side and bit 2 its z side.
int edges[12][3] = {
    {0, 1, 8},  {2, 3, 8},  {4, 5, 8},  {6, 7, 8},
    {0, 2, 11}, {1, 3, 11}, {4, 6, 11}, {5, 7, 11},
    {0, 4, 12}, {1, 5, 12}, {2, 6, 12}, {3, 7, 12}
};

struct point {
    int x, y;
};

// Where the 8 corners are on the screen, in this frame and in the previous one
struct point corners[8], previous[8];

unsigned angle_a, angle_b;      // 65536 is a full turn; the upper 8 bits index the sine table

// Bresenham's line algorithm
void line(int x0, int y0, int x1, int y1, int color) {
    int dx, dy, step_x, step_y, err, e2;
    dx = x1 - x0;               // dx = |x1 - x0|, step_x = direction of x
    step_x = 1;
    if (dx < 0) {
        dx = -dx;
        step_x = -1;
    }
    dy = y0 - y1;               // dy = -|y1 - y0|, step_y = direction of y
    step_y = 1;
    if (dy > 0) {
        dy = -dy;
        step_y = -1;
    }
    err = dx + dy;
    for (;;) {
        pixel(x0, y0, color);
        if (x0 == x1 && y0 == y1) break;
        e2 = err << 1;
        if (e2 >= dy) {
            err += dy;
            x0 += step_x;
        }
        if (e2 <= dx) {
            err += dx;
            y0 += step_y;
        }
    }
}

// Draw every edge between the given points. Colours are ANDed with `mask` (0 erases).
void draw_edges(struct point *points, int mask) {
    int *edge = edges[0];
    struct point *a, *b;
    int i;
    for (i = 12; i; i--) {
        a = points + *edge++;
        b = points + *edge++;
        line(a->x, a->y, b->x, b->y, *edge++ & mask);
    }
}

// Turn the corners of the cube and work out where they are on the screen
void place_corners(int sin_a, int cos_a, int sin_b, int cos_b) {
    int i, x, y, z, t;
    for (i = 0; i < 8; i++) {
        // the corner's position before turning comes from the bits of its number
        x = i & 1 ? HALF_SIZE : -HALF_SIZE;
        y = i & 2 ? HALF_SIZE : -HALF_SIZE;
        z = i & 4 ? HALF_SIZE : -HALF_SIZE;
        // turn about the vertical axis: (x, z) = (x cos a + z sin a, z cos a - x sin a)
        t = (mulhi(x, cos_a) + mulhi(z, sin_a)) << 1;
        z = (mulhi(z, cos_a) - mulhi(x, sin_a)) << 1;
        x = t;
        // turn about the horizontal axis: (y, z) = (y cos b - z sin b, y sin b + z cos b)
        t = (mulhi(y, cos_b) - mulhi(z, sin_b)) << 1;
        z = (mulhi(y, sin_b) + mulhi(z, cos_b)) << 1;
        y = t;
        // perspective: scale x and y by the table entry for z, then move to the screen centre
        t = scale[((unsigned)z >> 8) ^ 128];    // whole part of z, -128..127 -> index 0..255
        corners[i].x = mulhi(x, t) + 128;
        corners[i].y = mulhi(y, t) + 128;
    }
}

int main() {
    int x, y, i;
    unsigned stick, a, b;

    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);

    for (;;) {
        // turn: by the stick if it is being used, otherwise at a steady speed
        stick = in(0);
        if (stick) {
            x = stick & 255;            // low byte: signed x
            if (x >= 128) x -= 256;
            y = stick >> 8;             // high byte: signed y
            if (y >= 128) y -= 256;
            angle_a += x << 3;
            angle_b += y << 3;
        } else {
            angle_a += 300;
            angle_b += 190;
        }

        // the cosine is the sine a quarter turn later
        a = angle_a >> 8;
        b = angle_b >> 8;
        place_corners(sine[a], sine[(a + 64) & 255], sine[b], sine[(b + 64) & 255]);

        // erase the previous frame's edges, then draw the new ones
        draw_edges(previous, 0);
        draw_edges(corners, 15);

        // remember where the corners are so they can be erased next frame
        for (i = 0; i < 8; i++) {
            previous[i].x = corners[i].x;
            previous[i].y = corners[i].y;
        }

        // wait about 27 ms: together with the drawing that gives roughly 30 frames per second
        for (i = 20; i; i--) stall(0xFFFF);
    }
}
