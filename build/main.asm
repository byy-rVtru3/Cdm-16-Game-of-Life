### SECTION: .text
rsect _src_main_c_16807

next_gen: ext
print: ext
IS_RUNNING: ext


macro movens/2
push $1
pop $2
mend

main>                                   # -- Begin function main
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r5, 0
	ldi	r6, CUR_WRITE
	ldi	r4, CUR_READ
__LBB0_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, IS_RUNNING
	ldw	r0, r0
	cmp	r0, r5
	beq	__LBB0_1
	br	__LBB0_2
__LBB0_2:                               # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	ldw	r6, r1
	ldw	r4, r0
	jsr	next_gen
	ldw	r6, r0
	jsr	print
	ldw	r4, r0
	ldw	r6, r1
	stw	r4, r1
	stw	r6, r0
	br	__LBB0_1
                                        # -- End function
### SECTION: .bss
FIELD0>                                 # @FIELD0
	ds	216

### SECTION: .data
CUR_READ>                               # @CUR_READ
	dc	FIELD0

### SECTION: .bss
FIELD1>                                 # @FIELD1
	ds	216

### SECTION: .data
CUR_WRITE>                              # @CUR_WRITE
	dc	FIELD1

end.
