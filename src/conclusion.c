#include "conclusion.h"
short next_state_1ceil(char word) {
    return !(word & 0b00000100) && (word & 0b00000010) && (word & 0b00000001 || word & 0b00001000);
}
short next_state(short word) {
    return ((((word & 0b0100010001000100) ^ 0b0100010001000100) >> 2) &
    ((word & 0b0010001000100010) >> 1) &
    ((word & 0b0001000100010001) | (word & 0b1000100010001000) >> 3)) << 3;
}


#ifdef NEIGHBOURS_TEST
#include <stdio.h>
#include <assert.h>
void print_b(short word) {
    for (short i = 15; i >= 0; i--) {
        printf("%d", (word >> i) & 1);
    }
    printf("\n");
}
short countNeighbours_default(short word) {
    short mask = 0b1111000000000000;
    short ans = 0;
    for (short i = 3; i >= 0; i--) {
        short cur = (word & mask) >> (i * 4);
        short alive = cur & 0b0000000000001000;
        short count = cur & 0b0000000000000111;
        if (!alive && count == 3 || alive && (count == 2 || count == 3)) {
            ans |= (0b0000000000000001 << (i * 4));
        }
        mask >>= 4;
    }
    return ans;
}
int main(void) {
    assert(next_state_1ceil(0b00000000) == 0);
    assert(next_state_1ceil(0b00000001) == 0);
    assert(next_state_1ceil(0b00000010) == 0);
    assert(next_state_1ceil(0b00000011) == 1);
    assert(next_state_1ceil(0b00000100) == 0);
    assert(next_state_1ceil(0b00000101) == 0);
    assert(next_state_1ceil(0b00000110) == 0);
    assert(next_state_1ceil(0b00000111) == 0);
    assert(next_state_1ceil(0b00001000) == 0);
    assert(next_state_1ceil(0b00001001) == 0);
    assert(next_state_1ceil(0b00001010) == 1);
    assert(next_state_1ceil(0b00001011) == 1);
    assert(next_state_1ceil(0b00001100) == 0);
    assert(next_state_1ceil(0b00001101) == 0);
    assert(next_state_1ceil(0b00001110) == 0);
    assert(next_state_1ceil(0b00001111) == 0);
    for (short c1 = 0; c1 < 16; c1++) {
        for (short c2 = 0; c2 < 16; c2++) {
            for (short c3 = 0; c3 < 16; c3++) {
                for (short c4 = 0; c4 < 16; c4++) {
                    short word = (c1 << 12) | (c2 << 8) | (c3 << 4) | (c4);
                    assert(next_state(word) == countNeighbours_default(word));
                    print_b(next_state(word));
                    if (word == 32904) {
                        getc(stdin);
                    }
                }
            }
        }
    }
}
#endif