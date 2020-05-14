title MultArray Procedure      (AsmMultArray.asm)

.586
.model flat,C

AsmMultArray PROTO,
	srchVal:DWORD, arrayPtr:PTR DWORD, arraySize:DWORD

.code
;-----------------------------------------------
AsmMultArray PROC USES edi,
	mval:DWORD, arrayPtr:PTR DWORD, arraySize:DWORD
;
; Multiplies each element of an array by mval.
;-----------------------------------------------
	pushad				; save registers

	mov esi, arrayPtr	; set esi to address of array
	mov ecx, arraySize	; set ecx to size of array for loop

L1:
	mov eax, [esi]		; move value into eax of current array element
	mul mval			; multiply by value
	;mov [esi], eax		; not requirement, but would move lower half of result back into memory
	add esi, 4			; move esi

	LOOP L1				; loop

	popad				; return registers
	ret   
AsmMultArray ENDP

END