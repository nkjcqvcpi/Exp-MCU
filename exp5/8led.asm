		ORG   0000H;
		LJMP  MAIN
        ORG   000BH;
       	LJMP  ITOP;
        ORG   0080H
MAIN: 	
		MOV P0,#7FH;
        MOV A,P0
        MOV SP,#60H
        MOV B,#14H;
        MOV TMOD,#01H;
        MOV TL0,#0B0H;
        MOV TH0,#3CH;
        SETB ET0;
        SETB EA;
        SETB TR0;
HERE: 	
		SJMP HERE
ITOP:  
		MOV TL0,#0B0H;
        MOV TH0,#3CH;
        DJNZ B,RETURN;
        CLR TR0;
        MOV R3,#01H;
        RR A;
        MOV P0,A
        MOV B,#14H;
        SETB TR0;
RETURN:  
		RETI
		END