ORG 0000H
LJMP MAIN 
ORG 0080H
MAIN:
   	MOV R2,#11H
   	MOV R3,#14H
   	MOV A,#31H;十进制的49
	SETB P2.6
	SETB P2.7
CHECK1:
   	SUBB A,R2
   	JNB Acc.7,CHECK2
   	LJMP LOOP1
CHECK2:
   	SUBB A,R3
   	JB Acc.7,LOOP1
LOOP:
	MOV A, #0FFH
   	JNB P2.7, ADD1 ;P2.7为高电平，则作加运算，反之则作减运算
	JNB P2.6, SUBB1
  	MOV A, #0FFH
	JMP LOOP
ADD1:
  	MOV A, R2
   	ADD A, R3
   	CPL A
   	MOV P1, A
	SETB P2.7
  	LJMP LOOP
SUBB1:
  	MOV A, R2
   	SUBB A, R3
   	JB Acc.7, SUBB2
   	CPL A
  	MOV P1, A
	SETB P2.6
   	LJMP LOOP
SUBB2:
   	MOV A, R3
   	SUBB A, R2
   	SETB Acc.7
   	CPL A
   	MOV P1, A
	SETB P2.6  
   	LJMP LOOP
   	RET
LOOP1:
   	MOV P1, #00H;如果参与运算的数大于49，则让所有的LED均亮
   	RET
  	END