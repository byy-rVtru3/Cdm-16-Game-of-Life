#include "life.h"
extern volatile short KEYBOARD;
extern volatile short IS_RUNNING;
extern volatile short COORD;
extern volatile short ALIVE_CEILS;
extern volatile unsigned short* CUR_READ;
extern volatile short DISPLAY[SIZE];
short CEILS[4] = {
    0b1000000000000000, 0b0000100000000000, 0b0000000010000000, 0b0000000000001000
};
short CURSOR[SIZE] = {
    0b1000000000000000, 0b0100000000000000, 0b0010000000000000, 0b0001000000000000,
    0b0000100000000000, 0b0000010000000000, 0b0000001000000000, 0b0000000100000000,
    0b0000000010000000, 0b0000000001000000, 0b0000000000100000, 0b0000000000010000,
    0b0000000000001000, 0b0000000000000100, 0b0000000000000010, 0b0000000000000001,

};
short mul6[] = {
    0, 6, 12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102, 108, 114, 120
};
__attribute__((CDM_ISR)) void KB_ISR(void) {
    short Y_COORD = ((COORD & 0b1111000000000000) >> 12);
    short X_COORD = COORD & 0b0000000000001111;
    short keycode = KEYBOARD;
    switch (keycode)
    {
    case 0b0000000000000001: // enter
    {
        unsigned short cur = CUR_READ[(mul6[X_COORD + 1] + 1) + (Y_COORD >> 2)] & CEILS[Y_COORD & 0b11];
        if (cur == 0) {
            CUR_READ[(mul6[X_COORD + 1] + 1) + (Y_COORD >> 2)] |= CEILS[Y_COORD & 0b11]; // set
            DISPLAY[X_COORD] |= CURSOR[Y_COORD];
        } else {
            CUR_READ[(mul6[X_COORD + 1] + 1) + (Y_COORD >> 2)] &= (~CEILS[Y_COORD & 0b11]); //clear
            DISPLAY[X_COORD] &= (~CURSOR[Y_COORD]);
        }
        break;
    }
    case 0b0000000000000010: // pause
        IS_RUNNING = !IS_RUNNING;
        break;
    default:
        break;
    }
}