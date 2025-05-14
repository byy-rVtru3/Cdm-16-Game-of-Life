### SECTION: .text
rsect _src_print_c_16807

PROGRESS: ext
DISPLAY: ext


macro movens/2
push $1
pop $2
mend

print>                                  # -- Begin function print
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, PROGRESS
	ldi	r1, -32768
	stw	r2, r1
	ldi	r1, 0
	add	r0, 14
	ldi	r4, 8
	movens	r1, r6
__LBB0_1:                               # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	ssw	r6, -8                          # 2-byte Folded Spill
	ldi	r2, 0
	movens	r2, r1
	br	__LBB0_4
__LBB0_4:                               # %for.body4
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r0, r1, r3
	shr	r3, r5, 8
	shr	r5, r5, 9-8
	movens	r0, r6
	movens	r4, r0
	ldi	r4, 4
	and r5, r4, r5
	movens	r0, r4
	movens	r6, r0
	shl	r2, r2, 4
	or r5, r2, r2
	shr	r3, r5, 8
	shr	r5, r5, 12-8
	and r5, r4, r5
	or r2, r5, r2
	shr	r3, r5, 6
	ldi	r6, 2
	and r5, r6, r5
	or r2, r5, r2
	ldi	r5, 1
	shr	r3, r3, 3
	and r3, r5, r3
	or r2, r3, r2
	add	r1, 2
	cmp	r1, r4
	beq	__LBB0_3
	br	__LBB0_4
__LBB0_3:                               # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_1 Depth=1
	lsw	r6, -8                          # 2-byte Folded Reload
	shl	r6, r1, 1
	ldi	r3, DISPLAY
	stw	r1, r3, r2
	ldi	r1, PROGRESS
	movens	r1, r3
	ldw	r3, r1
	shra	r1, r1, 1
	ldw	r3, r2
	or r2, r1, r1
	stw	r3, r1
	add	r0, 12
	add	r6, 1
	ldi	r1, 16
	cmp	r6, r1
	beq	__LBB0_2
	br	__LBB0_1
__LBB0_2:                               # %for.cond.cleanup
	ldi	r0, 0
	ldi	r1, PROGRESS
	stw	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	8
	pop	fp
	rts
                                        # -- End function
end.
