// Blocks: a falling-block puzzle. Fit the pieces together; every full row disappears.
// The C version of blocks.asm.
//
// Input port 0: game controller, d-pad 1 (bits 0-3):
//               left / right move the piece, up turns it, down drops it faster.
//               After the game is over, release everything and press any button to play again.
// Output port 0: score.    Output port 1: rows cleared.
//
// Run it in real time: the game is paced with stall(), which takes no time in unlimited mode.
//
// The whole screen is a grid of 32 x 32 squares of 8 pixels, kept in `board`, one word per
// square (0 = empty, otherwise its colour). A square's number is y * 32 + x.
// The well is 12 squares wide and 24 deep (columns 3-14, rows 4-27), with a wall around it
// that is simply more non-empty squares, so a piece can never leave the well.
//
// A piece is a word: 16 bits for a 4 x 4 block of squares, top bit first, row by row.
// There are 12 pieces, each stored in its 4 orientations.

#define WALL_COLOR 5
#define TEXT_COLOR 12
#define NUMBER_COLOR 7

enum { UP = 1, DOWN = 2, LEFT = 4, RIGHT = 8 };

// Squares of the board
#define ROW 32
#define WELL_TOP (4 * ROW + 3)          // row 4, column 3
#define WELL_BOTTOM (27 * ROW + 3)      // row 27, column 3
#define START (4 * ROW + 7)             // where a new piece appears
#define PREVIEW (20 * ROW + 18)         // where the piece after it is shown

// A 3x5 pixel font: 15 pixels from the top bit down, row by row, and a 1 in the lowest bit
// that marks the end. Characters 0-9 are the digits, then A = 10 to Z = 35.
unsigned font[36] = {
    0xF6DF, 0x592F, 0xE7CF, 0xE79F,     // 0 1 2 3
    0xB793, 0xF39F, 0xF3DF, 0xE493,     // 4 5 6 7
    0xF7DF, 0xF79F, 0xF7DB, 0xD75D,     // 8 9 A B
    0xF24F, 0xD6DD, 0xF3CF, 0xF3C9,     // C D E F
    0xF2DF, 0xB7DB, 0xE92F, 0x24DF,     // G H I J
    0xB75B, 0x924F, 0xBFDB, 0xD6DB,     // K L M N
    0x56D5, 0xF7C9, 0xF6F3, 0xF75B,     // O P Q R
    0x711D, 0xE925, 0xB6DF, 0xB6D5,     // S T U V
    0xB7FB, 0xB55B, 0xB525, 0xE54F      // W X Y Z
};

unsigned pieces[12][4] = {
    {0xC000, 0x8800, 0xC000, 0x8800},   // two in a row
    {0x0E00, 0x4440, 0x0E00, 0x4440},   // three in a row
    {0x8C00, 0xC800, 0xC400, 0x4C00},   // small corner
    {0x0F00, 0x4444, 0x0F00, 0x4444},   // four in a row
    {0xCC00, 0xCC00, 0xCC00, 0xCC00},   // square
    {0xE400, 0x4C40, 0x4E00, 0x8C80},   // T
    {0x88C0, 0xE800, 0xC440, 0x2E00},   // L
    {0x44C0, 0x8E00, 0xC880, 0xE200},   // J
    {0x6C00, 0x8C40, 0x6C00, 0x8C40},   // S
    {0xC600, 0x4C80, 0xC600, 0x4C80},   // Z
    {0x4E40, 0x4E40, 0x4E40, 0x4E40},   // plus
    {0xAE00, 0xC8C0, 0xEA00, 0xC4C0}    // U
};

int piece_colors[12] = {12, 11, 10, 9, 8, 14, 13, 15, 7, 6, 4, 3};

int board[32 * ROW];

// The falling piece: which one, which way round, and the square of its top left corner
int type, rot, pos;
int next;                       // the piece that comes after it

unsigned score, rows, level;
int period;                     // frames between two steps down
int gravity;                    // frames since the last step down
int held;                       // the buttons that were down last frame
int repeat;                     // frames since the buttons last changed
unsigned rng = 0x1D2B;

int text_x, text_y, text_color; // where the next character goes, and its colour

// Draw a square of the board in a colour: 7x7 pixels, leaving a 1 pixel gap between squares
void draw_cell(int cell, int color) {
    int x = ((cell & 31) << 3) + 1;
    int y = ((cell >> 5) << 3) + 1;
    do {
        do pixel(x, y, color);
        while (++x & 7);
        x -= 7;
    } while (++y & 7);
}

// Draw a piece in a colour with its top left corner on a square
void draw_piece(unsigned piece, int cell, int color) {
    int k = 4;
    for (;;) {
        if ((int)piece < 0) draw_cell(cell, color);     // the top bit is the next square
        piece <<= 1;
        if (!piece) return;                             // no squares left
        cell++;
        if (!--k) {                                     // next row of the piece
            k = 4;
            cell += ROW - 4;
        }
    }
}

// Does a piece with its top left corner on a square overlap anything on the board?
int overlaps(unsigned piece, int cell) {
    int k = 4;
    for (;;) {
        if ((int)piece < 0 && board[cell]) return 1;
        piece <<= 1;
        if (!piece) return 0;
        cell++;
        if (!--k) {
            k = 4;
            cell += ROW - 4;
        }
    }
}

// The same three things for the falling piece, where it is now
int blocked() {
    return overlaps(pieces[type][rot], pos);
}
void erase_piece() {
    draw_piece(pieces[type][rot], pos, 0);
}
void show_piece() {
    draw_piece(pieces[type][rot], pos, piece_colors[type]);
}

// A random piece, 0 to 11
int random_piece() {
    unsigned r = rng;
    if (!r) r = 0xACE1;         // the random number generator must never be 0
    do {
        r ^= r << 7;            // 16-bit xorshift
        r ^= r >> 9;
        r ^= r << 8;
    } while ((r & 15) >= 12);
    rng = r;
    return r & 15;
}

// Draw a character at the text position and move that on to the next character.
// text_x must be 2 more than a multiple of 8.
void put_char(int ch) {
    unsigned bits = font[ch];
    int x = text_x, y = text_y, ink = text_color;
    int c;
    do {
        c = (int)bits < 0 ? ink : 0;    // the top bit is the next font pixel
        bits <<= 1;
        pixel(x, y, c);
        pixel(x + 1, y, c);
        pixel(x, y + 1, c);
        pixel(x + 1, y + 1, c);
        x += 2;
        if (!(x & 7)) {         // start the next row of the character
            x -= 6;
            y += 2;
        }
    } while (bits << 1);        // done when only the marker bit is left, at the top
    text_x += 8;
}

// Print text made of capital letters
void put_string(int x, int y, char *s) {
    text_x = x;
    text_y = y;
    while (*s) put_char(*s++ - 'A' + 10);
}

// Print a number as 5 decimal digits
void put_number(int x, int y, unsigned n) {
    unsigned power;
    text_x = x;
    text_y = y;
    for (power = 10000; power; power /= 10) {
        put_char(n / power);
        n %= power;
    }
}

// Show the score, rows and level, on the screen and on the output ports
void show_numbers() {
    text_color = NUMBER_COLOR;
    put_number(146, 52, score);
    put_number(146, 88, rows);
    put_number(146, 124, level);
    out(0, score);
    out(1, rows);
}

void new_game() {
    int x, y, cell;
    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);
    for (cell = 0; cell < 32 * ROW; cell++) board[cell] = 0;

    // the wall: down both sides of the well (columns 2 and 15), then along the bottom (row 28)
    for (cell = WELL_TOP - 1; cell < 28 * ROW; cell += ROW - 13) {
        board[cell] = WALL_COLOR;
        draw_cell(cell, WALL_COLOR);
        cell += 13;
        board[cell] = WALL_COLOR;
        draw_cell(cell, WALL_COLOR);
    }
    for (; cell < 28 * ROW + 16; cell++) {
        board[cell] = WALL_COLOR;
        draw_cell(cell, WALL_COLOR);
    }

    text_color = 10;
    put_string(106, 12, "BLOCKS");
    text_color = TEXT_COLOR;
    put_string(146, 40, "SCORE");
    put_string(146, 76, "ROWS");
    put_string(146, 112, "LEVEL");
    put_string(146, 148, "NEXT");

    score = 0;
    rows = 0;
    level = 0;
    period = 24;
    show_numbers();
}

// One frame, about 22 ms: act on the buttons and let the piece fall. Returns 1 when the piece
// has landed.
int frame() {
    int keys, act, k;
    for (k = 16; k; k--) stall(0xFFFF);

    // Act on a button when it goes down. Left, right and down also repeat every other frame
    // once they have been held for 8 frames.
    keys = in(0) & 15;
    act = keys & ~held;
    held = keys;
    if (act) {
        rng += repeat;          // when buttons are pressed makes the pieces less predictable
        repeat = 0;
    } else {
        repeat++;
        if (repeat >= 8 && !(repeat & 1)) act = keys & (DOWN | LEFT | RIGHT);
    }

    // Every move is tried the same way: take the piece off the screen, move it, and put it
    // back where it was if it does not fit there.
    if (act & LEFT) {
        erase_piece();
        pos--;
        if (blocked()) pos++;
        show_piece();
    }
    if (act & RIGHT) {
        erase_piece();
        pos++;
        if (blocked()) pos--;
        show_piece();
    }
    if (act & UP) {
        erase_piece();
        rot = (rot + 1) & 3;
        // if it does not fit turned, try one square left, then right
        if (blocked()) {
            pos--;
            if (blocked()) {
                pos += 2;
                if (blocked()) {
                    pos--;      // no: leave it as it was
                    rot = (rot - 1) & 3;
                }
            }
        }
        show_piece();
    }

    // one step down, if down is pressed or it is time
    if (!(act & DOWN) && ++gravity < period) return 0;
    gravity = 0;
    erase_piece();
    pos += ROW;
    if (blocked()) {
        pos -= ROW;
        show_piece();
        return 1;
    }
    show_piece();
    return 0;
}

// The piece cannot go down any further: it becomes part of the board, and full rows go
void land() {
    unsigned piece = pieces[type][rot];
    int color = piece_colors[type];
    int *p = board + pos;
    int *q;
    int k = 4, full = 0, cell;

    for (;;) {
        if ((int)piece < 0) *p = color;
        piece <<= 1;
        if (!piece) break;
        p++;
        if (!--k) {
            k = 4;
            p += ROW - 4;
        }
    }
    score++;

    // look for full rows, from the bottom of the well up
    p = board + WELL_BOTTOM;
    while (p >= board + WELL_TOP) {
        for (k = 0; k < 12 && p[k]; k++) {
        }
        if (k < 12) {
            p -= ROW;
            continue;
        }
        // full: every square from here up to the second row of the well becomes the one
        // above it, and the top row of the well is emptied. Then this row is looked at
        // again: it has new squares in it.
        full++;
        for (q = p + 11; q >= board + WELL_TOP + ROW; q--) *q = q[-ROW];
        for (k = 0; k < 12; k++) board[WELL_TOP + k] = 0;
    }

    if (full) {
        rows += full;
        level = rows >> 3;              // a level for every 8 rows,
        period = 24 - 2 * level;        // and 2 frames faster per level, down to 2
        if (period < 2) period = 2;
        score += full * full * 10;      // 10, 40, 90 or 160 points for 1 to 4 rows at once
        // draw the well again from the board
        for (cell = WELL_TOP; cell < 28 * ROW; cell += ROW - 12)
            for (k = 12; k; k--) {
                draw_cell(cell, board[cell]);
                cell++;
            }
    }
    show_numbers();
}

int main() {
    int full;
    for (;;) {
        new_game();
        next = random_piece();
        for (;;) {
            // bring in the next piece at the top of the well
            type = next;
            next = random_piece();
            rot = 0;
            pos = START;
            // show the piece after this one, under NEXT
            draw_piece(0xFFFF, PREVIEW, 0);
            draw_piece(pieces[next][0], PREVIEW, piece_colors[next]);
            gravity = 0;
            full = blocked();
            show_piece();
            if (full) break;            // no room for it: the well is full
            while (!frame()) {
            }
            land();
        }

        text_color = 8;
        put_string(146, 208, "GAME");
        put_string(146, 220, "OVER");
        while (in(0)) {
        }
        while (!in(0)) {
        }
    }
}
