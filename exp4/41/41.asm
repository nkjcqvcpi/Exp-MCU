ORG 0000H	;       
LJMP MAIN	;
MAIN:
	MOV P2,#0FEH
	MOV R1,#00
	MOV DPTR,#0080H
	MOV A,R1
LOOP1:
	CJNE A,#0AH,LOOP
	MOV R1,#00
	MOV A,R1
LOOP:
	MOVC A,@A+DPTR
	MOV P0,A
	ACALL DELay	;
	INC R1
	MOV A,R1
	ACALL LOOP1
DElay:	MOV R7,#10	;延时子程序
DEL1:	MOV R6,#200
DEL2:	MOV R5,#248
DJNZ R5,$
DJNZ R6,DEL2
DJNZ R7,DEL1
RET    	
ORG 0080H	;
DB  0C0H, 0F9H, 0A4H, 0B0H, 99H, 92H, 82H, 0F8H, 80H, 90H
END