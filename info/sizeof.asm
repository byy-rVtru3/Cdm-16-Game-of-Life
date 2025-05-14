### SECTION: .text
rsect _sizeof_c_16807



macro movens/2
push $1
pop $2
mend

getSizes>                               # -- Begin function getSizes
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ldi	r0, 2
	ssw	r0, -2
	ldi	r1, 1
	ssw	r1, -4
	ssw	r0, -6
	addsp	6
	pop	fp
	rts
                                        # -- End function
end.
