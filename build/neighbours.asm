### SECTION: .text
rsect _neighbours_c_16807



macro movens/2
push $1
pop $2
mend

next_state_1ceil>                       # -- Begin function next_state_1ceil
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ssw	r4, -2                          # 2-byte Folded Spill
	ldi	r1, 6
	and r0, r1, r3
	ldi	r2, 0
	ldi	r1, 1
	ldi	r4, 2
	cmp	r3, r4
	movens	r1, r3
	beq	__LBB0_2
# %bb.1:                                # %entry
	movens	r2, r3
__LBB0_2:                               # %entry
	ldi	r4, 9
	and r0, r4, r0
	cmp	r0, r2
	bne	__LBB0_4
# %bb.3:                                # %entry
	movens	r2, r1
__LBB0_4:                               # %entry
	and r3, r1, r0
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	2
	pop	fp
	rts
                                        # -- End function
next_state>                             # -- Begin function next_state
# %bb.0:                                # %entry
	shr	r0, r1, 3
	or r1, r0, r1
	shr	r0, r2, 1
	and r1, r2, r1
	ldi	r2, -1
	xor r0, r2, r0
	shr	r0, r0, 2
	and r0, r1, r0
	ldi	r1, 4369
	and r0, r1, r0
	shl	r0, r0, 3
	rts
                                        # -- End function
end.
