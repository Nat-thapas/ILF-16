// Snake on a 32x32 board. The C version of snake.asm.
//
// Input port 0: game controller. D-pad 1 (bits 0-3: up, down, left, right) steers the snake.
//               After a crash, release everything and press any button to play again.
// Output port 0: score.
//
// Run it in real time: the game is paced with stall(), which takes no time in unlimited mode.

#define SNAKE_COLOR 11
#define FOOD_COLOR 8
#define CRASH_COLOR 9

enum { EMPTY, SNAKE, FOOD };
enum { UP = 1, DOWN = 2, LEFT = 4, RIGHT = 8 };

int board[1024];        // one word per cell; a cell number is y * 32 + x
int body[1024];         // cell numbers of the snake's body: a ring buffer from tail to head
unsigned rng = 0x1D2B;

// Draw a cell in a colour: a 7x7 square, leaving a 1 pixel gap between cells
void draw_cell(int cell, int color) {
    int x = ((cell & 31) << 3) + 1;
    int y = ((cell >> 5) << 3) + 1;
    do {
        do pixel(x, y, color);
        while (++x & 7);
        x -= 7;
    } while (++y & 7);
}

// Put food on a random empty cell
void place_food() {
    int cell;
    if (!rng) rng = 0xACE1;     // the random number generator must never be 0
    do {
        rng ^= rng << 7;        // 16-bit xorshift
        rng ^= rng >> 9;
        rng ^= rng << 8;
        cell = rng & 1023;
    } while (board[cell]);
    board[cell] = FOOD;
    draw_cell(cell, FOOD_COLOR);
}

int main() {
    int head, head_ptr, tail_ptr;
    int dir, want, keys, timer;
    int x, y, i;
    unsigned score;

    for (;;) {
        // a new game: clear the screen and the board
        for (y = 0; y < 256; y++)
            for (x = 0; x < 256; x++) pixel(x, y, 0);
        for (i = 0; i < 1024; i++) board[i] = EMPTY;

        // start 3 cells long in the middle of the board (cells 526 to 528), moving right
        head_ptr = 0;
        tail_ptr = 0;
        for (head = 526;; head++) {
            board[head] = SNAKE;
            body[head_ptr] = head;
            draw_cell(head, SNAKE_COLOR);
            if (head == 528) break;
            head_ptr++;
        }
        dir = want = RIGHT;
        score = 0;
        out(0, score);
        place_food();

        for (;;) {
            // Time between moves: 60 stalls of 1.4 ms, getting shorter as the score goes up
            timer = 60 - (score >> 1);
            if (timer < 20) timer = 20;
            do {
                stall(0xFFFF);
                keys = in(0) & 15;
                if (keys) {
                    rng += timer;       // when keys are pressed makes the food less predictable
                    keys &= -keys;      // keep only the lowest pressed direction
                    // ignore it if it is the opposite of the current direction
                    if ((keys | dir) != (UP | DOWN) && (keys | dir) != (LEFT | RIGHT)) want = keys;
                }
            } while (--timer);

            // move the head one cell, crashing if that leaves the board
            dir = want;
            if (dir == UP) {
                if (head < 32) break;
                head -= 32;
            } else if (dir == DOWN) {
                if (head >= 992) break;
                head += 32;
            } else if (dir == LEFT) {
                if (!(head & 31)) break;
                head--;
            } else {
                if ((head & 31) == 31) break;
                head++;
            }

            if (board[head] == FOOD) {
                score++;
                out(0, score);
                place_food();
            } else {
                // not food: the tail moves on (before the crash test, so the snake can follow
                // its tail)
                i = body[tail_ptr];
                board[i] = EMPTY;
                draw_cell(i, 0);
                tail_ptr = (tail_ptr + 1) & 1023;
                if (board[head]) break;
            }
            board[head] = SNAKE;
            head_ptr = (head_ptr + 1) & 1023;
            body[head_ptr] = head;
            draw_cell(head, SNAKE_COLOR);
        }

        // game over: show where it crashed, then wait for the buttons to be let go and pressed
        draw_cell(head, CRASH_COLOR);
        while (in(0)) {
        }
        while (!in(0)) rng++;
    }
}
