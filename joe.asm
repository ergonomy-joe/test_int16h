;display returns value from int 16h
;joe 2025/02/12
CODE	SEGMENT 'CODE'
	ASSUME CS:CODE
	org 100h
top:
	mov	ah,1
	int	16h
	jnz	top
	mov	ah,0
	int	16h
	mov	bx,ax
	mov	cx,4
zeloop:
	push	cx
	mov	cl,4
	mov	al,bh
	shr	al,cl
	shl	bx,cl
	cmp	al,10
	jb	below
	add	al,'A' - 10
	jmp	after
below:
	add	al,'0'
after:
	mov	ah,0Eh
	int	10h

	pop	cx
	loop	zeloop

	mov	al,10
	mov	ah,0Eh
	int	10h

	mov	al,13
	mov	ah,0Eh
	int	10h

	jmp	top

CODE	ENDS
	END top
