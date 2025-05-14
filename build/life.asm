### SECTION: .text
rsect _src_life_c_16807

next_state: ext
PROGRESS: ext


macro movens/2
push $1
pop $2
mend

next_gen>                               # -- Begin function next_gen
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-16
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, PROGRESS
	ldi	r3, -32768
	stw	r2, r3
	ldi	r2, 6
	add	r1, 14
	add	r0, 14
	ldi	r4, 12
__LBB0_1:                               # %for.cond1.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	ssw	r0, -12                         # 2-byte Folded Spill
	ssw	r2, -16                         # 2-byte Folded Spill
	ldi	r6, 0
	ssw	r1, -14                         # 2-byte Folded Spill
	br	__LBB0_4
__LBB0_4:                               # %for.body4
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lsw	r1, -12                         # 2-byte Folded Reload
	add r1, r6, r0
	ldw	r0, r4, r4
	ssw	r4, -8                          # 2-byte Folded Spill
	ldi	r2, -12
	ldw	r0, r2, r3
	shr	r3, r2, 3
	shr	r4, r4, 3
	add r4, r2, r2
	ssw	r2, -10                         # 2-byte Folded Spill
	ldi	r2, -2
	ldw	r0, r2, r2
	shl	r2, r2, 8
	shl	r2, r2, 9-8
	ldi	r4, 7680
	and r2, r4, r5
	ldw	r1, r6, r2
	shr	r2, r4, 7
	or r4, r5, r4
	lsw	r1, -10                         # 2-byte Folded Reload
	add r1, r4, r1
	ssw	r1, -10                         # 2-byte Folded Spill
	shl	r2, r5, 1
	ldi	r1, 8190
	and r5, r1, r5
	ldi	r1, 2
	ldw	r0, r1, r4
	shr	r4, r4, 8
	shr	r4, r4, 15-8
	or r4, r5, r4
	lsw	r1, -10                         # 2-byte Folded Reload
	add r1, r4, r1
	ssw	r1, -10                         # 2-byte Folded Spill
	ldi	r1, -14
	ldw	r0, r1, r5
	shl	r5, r5, 8
	shl	r5, r5, 9-8
	ldi	r1, 7680
	and r5, r1, r5
	shr	r3, r4, 7
	or r4, r5, r4
	lsw	r1, -10                         # 2-byte Folded Reload
	add r1, r4, r4
	shl	r3, r3, 1
	ldi	r1, 8190
	and r3, r1, r3
	ldi	r1, -10
	ldw	r0, r1, r5
	shr	r5, r5, 8
	shr	r5, r5, 15-8
	or r5, r3, r3
	add r4, r3, r3
	ldi	r1, 10
	ldw	r0, r1, r4
	shl	r4, r4, 8
	shl	r4, r4, 9-8
	ldi	r1, 7680
	and r4, r1, r4
	lsw	r1, -8                          # 2-byte Folded Reload
	shr	r1, r5, 7
	or r5, r4, r4
	add r3, r4, r3
	ldi	r4, 12
	shl	r1, r1, 1
	ldi	r5, 8190
	and r1, r5, r1
	ldi	r5, 14
	ldw	r0, r5, r0
	shr	r0, r0, 8
	shr	r0, r0, 15-8
	or r0, r1, r0
	add r3, r0, r0
	or r0, r2, r0
	jsr	next_state
	lsw	r1, -14                         # 2-byte Folded Reload
	stw	r1, r6, r0
	add	r6, 2
	ldi	r0, 8
	cmp	r6, r0
	beq	__LBB0_3
	br	__LBB0_4
__LBB0_3:                               # %for.cond.cleanup3
                                        #   in Loop: Header=BB0_1 Depth=1
	ldi	r0, PROGRESS
	movens	r0, r2
	ldw	r2, r0
	shra	r0, r0, 1
	ldw	r2, r3
	or r3, r0, r0
	stw	r2, r0
	add	r1, 12
	lsw	r6, -12                         # 2-byte Folded Reload
	add	r6, 12
	lsw	r2, -16                         # 2-byte Folded Reload
	movens	r2, r0
	add	r0, 6
	ldi	r3, 91
	cmp	r2, r3
	movens	r0, r2
	movens	r6, r0
	blo	__LBB0_1
	br	__LBB0_2
__LBB0_2:                               # %for.cond.cleanup
	ldi	r0, 0
	ldi	r1, PROGRESS
	stw	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	16
	pop	fp
	rts
                                        # -- End function
end.
