### SECTION: .text
rsect _src_interrupts_c_16807

COORD: ext
KEYBOARD: ext
CUR_READ: ext
DISPLAY: ext
IS_RUNNING: ext


macro movens/2
push $1
pop $2
mend

KB_ISR>                                 # -- Begin function KB_ISR
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-12
	ssw	r0, -2                          # 2-byte Folded Spill
	ssw	r1, -4                          # 2-byte Folded Spill
	ssw	r2, -6                          # 2-byte Folded Spill
	ssw	r3, -8                          # 2-byte Folded Spill
	ssw	r4, -10                         # 2-byte Folded Spill
	ssw	r5, -12                         # 2-byte Folded Spill
	ldi	r0, COORD
	ldw	r0, r3
	ldw	r0, r0
	ldi	r1, KEYBOARD
	ldw	r1, r4
	ldi	r2, 2
	cmp	r4, r2
	ldi	r1, 1
	beq	__LBB0_5
	br	__LBB0_1
__LBB0_1:                               # %entry
	cmp	r4, r1
	bne	__LBB0_8
	br	__LBB0_2
__LBB0_2:                               # %sw.bb
	ldi	r1, 15
	and r0, r1, r0
	shr	r3, r1, 8
	shr	r1, r1, 12-8
	ldi	r4, CUR_READ
	ldb	r4, r4
	ldi	r5, CUR_READ+1
	ldb	r5, r5
	shl	r5, r5, 8
	or r5, r4, r4
	shl	r0, r0, 1
	ldi	r5, mul6+2
	ldw	r0, r5, r5
	shl	r5, r5, 1
	add r4, r5, r4
	shr	r3, r3, 8
	shr	r3, r3, 13-8
	ldi	r5, 6
	and r3, r5, r3
	add r4, r3, r3
	ldi	r4, 3
	and r1, r4, r4
	ldw	r3, r2, r5
	shl	r4, r2, 1
	ldi	r4, CEILS
	ldw	r2, r4, r2
	add	r3, 2
	and r2, r5, r4
	ldi	r5, 0
	cmp	r4, r5
	bne	__LBB0_4
	br	__LBB0_3
__LBB0_4:                               # %if.else
	ldi	r4, -1
	xor r2, r4, r2
	ldw	r3, r5
	and r5, r2, r2
	stw	r3, r2
	shl	r1, r1, 1
	ldi	r2, CURSOR
	ldw	r1, r2, r1
	xor r1, r4, r1
	ldi	r2, DISPLAY
	ldw	r0, r2, r3
	and r3, r1, r1
	stw	r0, r2, r1
	br	__LBB0_8
__LBB0_3:                               # %if.then
	ldw	r3, r4
	or r4, r2, r2
	stw	r3, r2
	shl	r1, r1, 1
	ldi	r2, CURSOR
	ldw	r1, r2, r1
	ldi	r2, DISPLAY
	ldw	r0, r2, r3
	or r3, r1, r1
	stw	r0, r2, r1
	br	__LBB0_8
__LBB0_5:                               # %sw.bb33
	ldi	r0, IS_RUNNING
	ldw	r0, r3
	ldi	r2, 0
	cmp	r3, r2
	beq	__LBB0_7
# %bb.6:                                # %sw.bb33
	movens	r2, r1
__LBB0_7:                               # %sw.bb33
	stw	r0, r1
__LBB0_8:                               # %sw.epilog
	lsw	r5, -12                         # 2-byte Folded Reload
	lsw	r4, -10                         # 2-byte Folded Reload
	lsw	r3, -8                          # 2-byte Folded Reload
	lsw	r2, -6                          # 2-byte Folded Reload
	lsw	r1, -4                          # 2-byte Folded Reload
	lsw	r0, -2                          # 2-byte Folded Reload
	addsp	12
	pop	fp
	rti
                                        # -- End function
### SECTION: .data
CEILS>                                  # @CEILS
	dc	32768                           # 0x8000
	dc	2048                            # 0x800
	dc	128                             # 0x80
	dc	8                               # 0x8

CURSOR>                                 # @CURSOR
	dc	32768                           # 0x8000
	dc	16384                           # 0x4000
	dc	8192                            # 0x2000
	dc	4096                            # 0x1000
	dc	2048                            # 0x800
	dc	1024                            # 0x400
	dc	512                             # 0x200
	dc	256                             # 0x100
	dc	128                             # 0x80
	dc	64                              # 0x40
	dc	32                              # 0x20
	dc	16                              # 0x10
	dc	8                               # 0x8
	dc	4                               # 0x4
	dc	2                               # 0x2
	dc	1                               # 0x1

mul6>                                   # @mul6
	dc	0                               # 0x0
	dc	6                               # 0x6
	dc	12                              # 0xc
	dc	18                              # 0x12
	dc	24                              # 0x18
	dc	30                              # 0x1e
	dc	36                              # 0x24
	dc	42                              # 0x2a
	dc	48                              # 0x30
	dc	54                              # 0x36
	dc	60                              # 0x3c
	dc	66                              # 0x42
	dc	72                              # 0x48
	dc	78                              # 0x4e
	dc	84                              # 0x54
	dc	90                              # 0x5a
	dc	96                              # 0x60
	dc	102                             # 0x66
	dc	108                             # 0x6c
	dc	114                             # 0x72
	dc	120                             # 0x78

end.
