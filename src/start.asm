asect 0x0000
start: ext
default_handler: ext  
KB_ISR: ext 
# Interrupt vector table (IVT)
dc start,           0    # Startup/Reset vector
dc default_handler, 0   # Unaligned SP
dc default_handler, 0   # Unaligned PC
dc default_handler, 0   # Invalid instruction
dc default_handler, 0   # Double fault
dc KB_ISR,          0   # Keyboard
align 0x80              # Reserve space for the rest 
                        # of IVT
rsect irp_handlers
KB_ISR: ext 

rsect exc_handlers
default_handler>
    halt

rsect start
main: ext               # main.c
start>
    ldi r0, 0xffa0 
    stsp r0
    clr r0
    ei
    jsr main
    halt


asect 0xffd0 # ffd0 - ffef
DISPLAY> ds 32
asect 0xfff0
KEYBOARD> ds 2
IS_RUNNING> ds 2 # game state
COORD> ds 2
PROGRESS> ds 2
end.