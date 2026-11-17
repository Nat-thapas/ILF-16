// Printing numbers on the display: the Fibonacci numbers, then the prime numbers. The C
// version of numbers.asm.
//
// Every line shows a count, then the number in decimal and in hexadecimal. Numbers are 32 bits,
// kept as two words. The list goes back to the top when it reaches the bottom of the screen.
//
//   Fibonacci numbers: F0 to F47, the largest that fits in 32 bits.
//   Prime numbers:     all 12251 primes below 131072, found with the sieve of Eratosthenes.
//
// Input port 0:  hold any bit (a switch or a button) to skip the pauses and go at full speed.
// Output port 0: lower word of the number.   Output port 1: upper word.   Output port 2: count.
//
// Text is drawn with a 3x5 pixel font, each font pixel 2x2 on the screen, in 8x12 character
// cells (32 columns, 21 rows). A character is one word: 15 pixels from the top bit down, row by
// row, and a 1 in the lowest bit that tells the drawing loop where the pixels end.
// Characters 0-15 are the hexadecimal digits, the letters carry on to Z = 35, and 36 is a space.

#define SPACE 36
#define FIRST_ROW 3             // rows 0 and 1 are the title and the column names
#define ROWS 21
#define COUNT_COL 3
#define DECIMAL_COL 9
#define HEX_COL 20
#define LINE_END 28

unsigned font[37] = {
    0xF6DF, 0x592F, 0xE7CF, 0xE79F,     // 0 1 2 3
    0xB793, 0xF39F, 0xF3DF, 0xE493,     // 4 5 6 7
    0xF7DF, 0xF79F, 0xF7DB, 0xD75D,     // 8 9 A B
    0xF24F, 0xD6DD, 0xF3CF, 0xF3C9,     // C D E F
    0xF2DF, 0xB7DB, 0xE92F, 0x24DF,     // G H I J
    0xB75B, 0x924F, 0xBFDB, 0xD6DB,     // K L M N
    0x56D5, 0xF7C9, 0xF6F3, 0xF75B,     // O P Q R
    0x711D, 0xE925, 0xB6DF, 0xB6D5,     // S T U V
    0xB7FB, 0xB55B, 0xB525, 0xE54F,     // W X Y Z
    0x0001                              // space
};

// Powers of ten as upper word, lower word. Printing starts at the top for 10 digits and at
// 10000 for 5 digits. The last digit is whatever is left, so 1 is not in the table.
#define POWERS 9
unsigned pow10[2 * POWERS] = {
    0x3B9A, 0xCA00,             // 1000000000
    0x05F5, 0xE100,             // 100000000
    0x0098, 0x9680,             // 10000000
    0x000F, 0x4240,             // 1000000
    0x0001, 0x86A0,             // 100000
    0, 10000,
    0, 1000,
    0, 100,
    0, 10
};

unsigned sieve[4096];           // one bit for every odd number below 131072

int row, col;                   // where the next character goes
int color;
unsigned count;
unsigned value_hi, value_lo;    // the number to print

// Draw character number `ch` at the current column and row, and move one column on
void put_char(int ch) {
    unsigned bits = font[ch];
    int px = (col << 3) + 2;    // the 6 pixels of a character are at x = 2..7 of its cell
    int py = row * 12;
    int ink = color;
    int c;
    do {
        c = (int)bits < 0 ? ink : 0;    // the top bit is the next font pixel
        bits <<= 1;
        pixel(px, py, c);
        pixel(px + 1, py, c);
        pixel(px, py + 1, c);
        pixel(px + 1, py + 1, c);
        px += 2;
        if (!(px & 7)) {        // past the right edge of the cell: start the next row
            px -= 6;
            py += 2;
        }
    } while (bits << 1);        // done when only the marker bit is left, at the top
    col++;
}

// Print text made of capital letters, digits and spaces
void put_string(char *s) {
    int c;
    while ((c = *s++)) put_char(c == ' ' ? SPACE : c >= 'A' ? c - 'A' + 10 : c - '0');
}

// Print the 32-bit number hi:lo in decimal, without leading zeros. `power` is where to start
// in the table of powers of ten. There is no 32-bit division, so each digit is found by
// counting how many times its power of ten can be subtracted.
void put_decimal(unsigned hi, unsigned lo, unsigned *power) {
    unsigned ph, pl;
    int digit, seen = 0;
    do {
        ph = *power++;
        pl = *power++;
        digit = 0;
        while (hi > ph || (hi == ph && lo >= pl)) {
            hi -= ph;
            if (lo < pl) hi--;  // borrow
            lo -= pl;
            digit++;
        }
        seen |= digit;          // stays 0 until the first digit that is not 0
        put_char(seen ? digit : SPACE);
    } while (power < pow10 + 2 * POWERS);
    put_char(lo);               // what is left is the last digit
}

// Print a word as 4 hexadecimal digits
void put_hex(unsigned value) {
    int i;
    for (i = 4; i; i--) {
        put_char(value >> 12);
        value <<= 4;
    }
}

// Print count and value on the current row, send them to the output ports, and move to the
// next row (clearing it, so it is easy to see where the list has got to)
void print_line() {
    color = 6;
    col = COUNT_COL;
    put_decimal(0, count, pow10 + 10);
    color = 7;
    col = DECIMAL_COL;
    put_decimal(value_hi, value_lo, pow10);
    color = 11;
    col = HEX_COL;
    put_hex(value_hi);
    put_hex(value_lo);

    out(0, value_lo);
    out(1, value_hi);
    out(2, count);

    if (++row >= ROWS) row = FIRST_ROW;
    col = COUNT_COL;
    while (col < LINE_END) put_char(SPACE);
}

// Clear the screen and print the title and the column names
void heading(char *title, int column) {
    int x, y;
    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);
    row = 0;
    color = 10;
    col = column;
    put_string(title);
    row = 1;
    color = 12;
    col = 7;
    put_string("N    DECIMAL      HEX");
    row = FIRST_ROW;
}

// Wait for n * 1.4 ms. Any bit of input port 0 ends the wait straight away.
void pause(int n) {
    do {
        if (in(0)) return;
        stall(0xFFFF);
    } while (--n);
}

int main() {
    unsigned i, j, p, last;
    unsigned next_hi, next_lo;      // the Fibonacci number after the one being printed

    for (;;) {
        heading("FIBONACCI NUMBERS", 7);
        value_hi = 0;               // F0 = 0
        value_lo = 0;
        next_hi = 0;                // F1 = 1
        next_lo = 1;
        for (count = 0; count < 48; count++) {
            print_line();
            // (value, next) = (next, value + next): the lower words carry into the upper ones
            // when their sum comes out smaller than what was added
            i = value_lo + next_lo;
            j = value_hi + next_hi + (i < next_lo);
            value_lo = next_lo;
            value_hi = next_hi;
            next_lo = i;
            next_hi = j;
            pause(150);
        }
        pause(2000);

        heading("PRIME NUMBERS", 9);
        // Sieve of Eratosthenes over the odd numbers only: bit i of the sieve stands for
        // 2i + 1, and is set once that number is known not to be prime.
        for (i = 0; i < 4096; i++) sieve[i] = 0;
        for (i = 1; i < 181; i++) {     // 363 * 363 is more than 131072, so 181 is enough
            if (sieve[i >> 4] >> (i & 15) & 1) continue;
            // p = 2i + 1 is prime: mark its odd multiples from p * p up. Moving p bits along
            // the sieve is the next odd multiple, and p * p is bit 2i(i + 1).
            p = 2 * i + 1;
            j = 2 * i * (i + 1);
            do {
                sieve[j >> 4] |= 1 << (j & 15);
                last = j;
                j += p;
            } while (j > last);         // until j goes past the last bit and wraps around
        }

        // 2 is the only even prime, so it is printed by hand
        count = 1;
        value_hi = 0;
        value_lo = 2;
        i = 0;
        for (;;) {
            print_line();
            pause(30);
            // look for the next bit that is not set
            do {
                if (++i == 0) goto done;        // past the last bit
            } while (sieve[i >> 4] >> (i & 15) & 1);
            value_hi = i >> 15;                 // the prime is 2i + 1, which can need 17 bits
            value_lo = 2 * i + 1;
            count++;
        }
    done:
        pause(4000);
    }
}
