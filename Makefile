# https://makefiletutorial.com/#automatic-variables-and-wildcards
CC := clang-cdm-windows/clang
C_OPTS := -target cdm -S -O1

ASM := cocas
ASM_OPTS := -t cdm16 --debug build/out.dbg.json

SRC_FILES := src/print.c src/life.c src/main.c src/conclusion.c src/interrupts.c
ASM_FILES := $(patsubst src/%.c,build/%.asm,$(SRC_FILES))

all: build/out.img  

build/out.img: $(ASM_FILES) src/start.asm
	$(ASM) $(ASM_OPTS) $^ -o $@

$(ASM_FILES): build/%.asm: src/%.c
	$(CC) $(C_OPTS) $< -o $@

clean:
	rm -f build/*

rebuild: clean all