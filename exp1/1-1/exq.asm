      ORG 0000H
   	LJMP MAIN 
   	ORG 0080H
MAIN:
   	MOV R2,#22H
   	MOV R3,#05H
   	MOV A,#31H;????49
CHECK1:
   	SUBB A,R2
   	JNB Acc.7,CHECK2
   	LJMP LOOP1
CHECK2:
   	SUBB A,R3
   	JB Acc.7,LOOP1
LOOP:
   	JB P2.7,ADD1;
  	 LJMP SUBB1
ADD1:
  	MOV A,R2
   	ADD A,R3
	DA A
	CPL A
   	MOV P1,A
  	 LJMP LOOP
SUBB1:
  	MOV A,R3
	XRL A,#0FFH 
   	ADD A,R2
   	JB Acc.7,SUBB2
   	DA A
	CPL A
  	MOV P1,A
   	LJMP LOOP
SUBB2:
   	MOV A,R2
	XRL A,#0FFH 
	ADD A,R3
	DA A
	CPL A
   	MOV P1,A  
   	LJMP LOOP
   	RET
LOOP1:
   	MOV P1,#00H;??????????49,?????LED??
   	RET
  	END
