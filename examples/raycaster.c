// Raycaster: walk around a maze seen in first person. The C version of raycaster.asm.
//
// Input port 0: game controller, d-pad 1 (bits 0-3). Up and down walk forwards and backwards,
//               left and right turn. Switches on bits 0-3 work as well.
//
// For each of 128 screen columns (2 pixels wide) a ray is sent out from the player and stepped
// from one grid line of the map to the next until it enters a wall. How far it went decides how
// tall the wall is drawn in that column; which kind of grid line it crossed picks the lighter or
// darker shade of the wall's colour.
//
// Positions and distances are Q8.8 (256 = one map square), directions are signed Q14
// (16384 = 1.0). Dividing is slow, so 1/x comes from two tables that are filled in when the
// program starts:
//   recip[n]  = 131072 / n : how far a ray travels between two grid lines, by its direction / 32
//   height[n] = 16384 / n  : half the height of a wall on screen, by its distance / 2

#define SKY_COLOR 1
#define FLOOR_COLOR 5

// sin(2 * pi * n / 256) * 16384
int sine[256] = {
    0, 402, 804, 1205, 1606, 2006, 2404, 2801, 3196, 3590, 3981, 4370, 4756, 5139, 5520, 5897,
    6270, 6639, 7005, 7366, 7723, 8076, 8423, 8765, 9102, 9434, 9760, 10080, 10394, 10702, 11003, 11297,
    11585, 11866, 12140, 12406, 12665, 12916, 13160, 13395, 13623, 13842, 14053, 14256, 14449, 14635, 14811, 14978,
    15137, 15286, 15426, 15557, 15679, 15791, 15893, 15986, 16069, 16143, 16207, 16261, 16305, 16340, 16364, 16379,
    16384, 16379, 16364, 16340, 16305, 16261, 16207, 16143, 16069, 15986, 15893, 15791, 15679, 15557, 15426, 15286,
    15137, 14978, 14811, 14635, 14449, 14256, 14053, 13842, 13623, 13395, 13160, 12916, 12665, 12406, 12140, 11866,
    11585, 11297, 11003, 10702, 10394, 10080, 9760, 9434, 9102, 8765, 8423, 8076, 7723, 7366, 7005, 6639,
    6270, 5897, 5520, 5139, 4756, 4370, 3981, 3590, 3196, 2801, 2404, 2006, 1606, 1205, 804, 402,
    0, -402, -804, -1205, -1606, -2006, -2404, -2801, -3196, -3590, -3981, -4370, -4756, -5139, -5520, -5897,
    -6270, -6639, -7005, -7366, -7723, -8076, -8423, -8765, -9102, -9434, -9760, -10080, -10394, -10702, -11003, -11297,
    -11585, -11866, -12140, -12406, -12665, -12916, -13160, -13395, -13623, -13842, -14053, -14256, -14449, -14635, -14811, -14978,
    -15137, -15286, -15426, -15557, -15679, -15791, -15893, -15986, -16069, -16143, -16207, -16261, -16305, -16340, -16364, -16379,
    -16384, -16379, -16364, -16340, -16305, -16261, -16207, -16143, -16069, -15986, -15893, -15791, -15679, -15557, -15426, -15286,
    -15137, -14978, -14811, -14635, -14449, -14256, -14053, -13842, -13623, -13395, -13160, -12916, -12665, -12406, -12140, -11866,
    -11585, -11297, -11003, -10702, -10394, -10080, -9760, -9434, -9102, -8765, -8423, -8076, -7723, -7366, -7005, -6639,
    -6270, -5897, -5520, -5139, -4756, -4370, -3981, -3590, -3196, -2801, -2404, -2006, -1606, -1205, -804, -402
};

// The map, 16 x 16 squares. 0 is empty, 1 to 4 are walls of different colours.
int map[16 * 16] = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 2, 2, 0, 0, 0, 0, 0, 3, 0, 3, 0, 3, 0, 1,
    1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 0, 0, 0, 4, 4, 4, 0, 0, 0, 0, 0, 3, 0, 1,
    1, 0, 0, 0, 0, 4, 0, 4, 0, 0, 2, 0, 0, 0, 0, 1,
    1, 0, 3, 0, 0, 4, 0, 4, 0, 0, 2, 0, 0, 3, 0, 1,
    1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1,
    1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 4, 4, 0, 1,
    1, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 4, 0, 0, 1,
    1, 0, 4, 4, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1,
    1, 0, 4, 0, 0, 2, 2, 2, 2, 2, 0, 3, 0, 3, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

// Two colours for every kind of wall: for the sides facing east/west, and north/south
int wall_colors[10] = {0, 0, 8, 2, 11, 3, 10, 9, 7, 6};

unsigned recip[640];
unsigned height[2048];

unsigned pos_x = 0x0480;        // the player starts at (4.5, 8.5), looking east
unsigned pos_y = 0x0880;
unsigned angle;                 // 65536 is a full turn; 0 is east and it grows clockwise

// Fill in the tables. Both get smaller as n grows, so instead of dividing (the numbers do not
// fit in 16 bits), the previous value is lowered until value * n is small enough.
void make_tables() {
    unsigned n, t;
    t = 32767;                  // recip[n] = 131072 / n, at most 32767
    recip[0] = t;
    for (n = 1; n < 640; n++) {
        while (umulhi(t, n) >= 2) t--;      // upper word of t * n: below 2 means t * n < 131072
        recip[n] = t;
    }
    t = 128;                    // height[n] = 16384 / n, at most 128 (the whole screen)
    height[0] = t;
    for (n = 1; n < 2048; n++) {
        while (umulhi(t, n) || (t * n) >> 14) t--;
        height[n] = t;
    }
}

// Send a ray from the player in direction (ray_x, ray_y) until it hits a wall. Returns the
// distance to the wall, measured straight ahead and halved, in the lower 11 bits; above that
// is the index of the wall's colour.
unsigned cast(int ray_x, int ray_y) {
    unsigned side_x, side_y, delta_x, delta_y, part, wall;
    int step_x, step_y, cell;

    // For x: which way the ray steps through the map (step_x), how far it travels between two
    // grid lines (delta_x), and how far it is to the first one (side_x).
    part = pos_x & 255;         // how far the player is into the square
    if (ray_x < 0) {
        step_x = -1;
        delta_x = recip[(unsigned)-ray_x >> 5];
    } else {
        step_x = 1;
        part = 256 - part;      // going east: the rest of the square is ahead
        delta_x = recip[(unsigned)ray_x >> 5];
    }
    side_x = (umulhi(part, delta_x) << 8) | (part * delta_x >> 8);

    // the same for y, where a step is a whole row of the map
    part = pos_y & 255;
    if (ray_y < 0) {
        step_y = -16;
        delta_y = recip[(unsigned)-ray_y >> 5];
    } else {
        step_y = 16;
        part = 256 - part;
        delta_y = recip[(unsigned)ray_y >> 5];
    }
    side_y = (umulhi(part, delta_y) << 8) | (part * delta_y >> 8);

    // the map square the player is in
    cell = (pos_x >> 8) + ((pos_y >> 8) << 4);

    // step to whichever grid line is nearer, until the square entered is a wall
    for (;;) {
        if (side_x < side_y) {
            side_x += delta_x;
            cell += step_x;
            wall = map[cell];
            if (wall) return (wall << 12) | (((side_x - delta_x) >> 1) & 2047);
        } else {
            side_y += delta_y;
            cell += step_y;
            wall = map[cell];
            if (wall) return (wall << 12) | 0x800 | (((side_y - delta_y) >> 1) & 2047);
        }
    }
}

// Draw one column, two pixels wide: sky down to `top`, wall down to `bottom`, then floor
void draw_column(int x, int top, int bottom, int color) {
    int y = 0, x1 = x + 1;
    int sky = SKY_COLOR, ground = FLOOR_COLOR;
    for (; y < top; y++) {
        pixel(x, y, sky);
        pixel(x1, y, sky);
    }
    for (; y < bottom; y++) {
        pixel(x, y, color);
        pixel(x1, y, color);
    }
    for (; y < 256; y++) {
        pixel(x, y, ground);
        pixel(x1, y, ground);
    }
}

int main() {
    unsigned keys, a, hit, half;
    int dir_x, dir_y;           // the direction the player faces, then of the ray being sent
    int move_x, move_y;
    int plane_x, plane_y, step_x, step_y;
    int x;

    make_tables();

    for (;;) {
        // turn
        keys = in(0);
        if (keys & 4) angle -= 768;
        if (keys & 8) angle += 768;

        // the direction the player faces: (cos, sin) of the angle
        a = angle >> 8;
        dir_y = sine[a];
        dir_x = sine[(a + 64) & 255];

        // walk: about 0.08 of a square per frame, forwards or backwards
        if (keys & 3) {
            move_x = mulhi(dir_x, 80);
            move_y = mulhi(dir_y, 80);
            if (!(keys & 1)) {
                move_x = -move_x;
                move_y = -move_y;
            }
            // x and y are moved separately, so the player slides along a wall instead of
            // stopping. The square 4 steps ahead must be empty: that keeps a little distance
            // from the walls.
            if (!map[((pos_x + (move_x << 2)) >> 8) + ((pos_y >> 8) << 4)]) pos_x += move_x;
            if (!map[(((pos_y + (move_y << 2)) >> 8) << 4) + (pos_x >> 8)]) pos_y += move_y;
        }

        // The screen is a line across the view, at right angles to the direction: 0.66 of its
        // length to either side, which gives a 66 degree field of view. The ray for the left
        // edge is direction - plane, and each column adds plane / 64.
        plane_x = -(mulhi(dir_y, 21627) << 1);      // 21627 is 0.66 in Q15
        plane_y = mulhi(dir_x, 21627) << 1;
        step_x = mulhi(plane_x, 1024);
        step_y = mulhi(plane_y, 1024);
        dir_x -= plane_x;
        dir_y -= plane_y;

        for (x = 0; x < 256; x += 2) {
            hit = cast(dir_x, dir_y);
            half = height[hit & 2047];              // half the height of the wall
            draw_column(x, 128 - half, 128 + half, wall_colors[hit >> 11]);
            dir_x += step_x;
            dir_y += step_y;
        }

        // a frame takes about 15 ms to draw: wait 19 ms more for roughly 30 frames per second
        for (x = 14; x; x--) stall(0xFFFF);
    }
}
