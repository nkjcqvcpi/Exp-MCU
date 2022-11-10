	   ORG 0000H	;
       LJMP MAIN	;
       ORG 0080H	;
MAIN:  MOV P1,#0DBH	;11011011--零为亮
       ACALL DELay	;
       MOV P1,#06DH	;01101101
       ACALL DELay	;
       MOV P1,#0B6H	;10110110
       ACALL DELay	;
       AJMP MAIN	;
delay: mov r7,#255	;延时子程序
d1:    mov r6,#255
d2:    djnz r6,d2
       djnz r7,d1
       ret
   	   end