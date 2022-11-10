		ORG 0000H;       
		LJMP MAIN;
MAIN: 	
		MOV  P2,#0FEH;
      	MOV R1,#00;
     	MOV  DPTR,#0080H;
     	MOV   A,R1;
LOOP1:  
		CJNE   A,#0AH,LOOP;
        MOV R1,#00;
        MOV   A,R1;
 LOOP:		
		MOVC  A,@A+DPTR;
		MOV   P0,A;
		ACALL DELay;
		INC R1;
		MOV   A,R1;
		ACALL   LOOP1;
DElay:  	
		MOV R7,#10;
DEL1:	    	
		MOV R6,#200;
DEL2:      	
		MOV R5,#248;
		DJNZ R5,$;
		DJNZ R6,DEL2;
		DJNZ R7,DEL1;
		RET    	
		ORG 0080H;
		DB  3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH;
		END;