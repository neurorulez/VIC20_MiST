	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_autoboot
_autoboot:
	stdec	r6
						// allocreg r1

						//overrides.c, line 8
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_bootrom_name
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 8
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//overrides.c, line 9
						//setreturn
						// (obj to r0) flags 1 type a
						// const
	.liconst	0
	mr	r0
	ldinc	r6
	mr	r7

	.section	.data.1
	.align	4
	.global	_bootrom_name
_bootrom_name:
						// Declaring from tree
						// static
	.ref	l1
	.section	.rodata.2
	.align	4
l1:
	.byte	86
	.byte	73
	.byte	67
	.byte	50
	.byte	48
	.byte	32
	.byte	32
	.byte	32
	.byte	82
	.byte	79
	.byte	77
	.byte	0
