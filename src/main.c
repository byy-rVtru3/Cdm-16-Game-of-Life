#include "life.h"
#include "print.h"
unsigned short FIELD0[FIELD_SIZE];
unsigned short FIELD1[FIELD_SIZE];
extern volatile short IS_RUNNING;
unsigned short* CUR_READ = FIELD0;
unsigned short* CUR_WRITE = FIELD1;

int main(void) {
    while(1) {
        if (IS_RUNNING) {
            next_gen(CUR_READ, CUR_WRITE);
            print(CUR_WRITE);
            unsigned short* tmp = CUR_READ;
            CUR_READ = CUR_WRITE;
            CUR_WRITE = tmp;
        }
    }
    return 0;
}