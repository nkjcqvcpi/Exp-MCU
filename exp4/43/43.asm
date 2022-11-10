ORG 0000H
LJMP MAIN
ORG 0003H  ;外部中断口0的地址入口
LJMP INT_0
ORG 0013H  ;外部中断口1的地址入口
LJMP INT_1
ORG 0080H
MAIN: 
	MOV SP,#30H
    SETB EA  ;打开中断总开关
 	SETB EX0  ;打开外部中断0
	SETB EX1  ;打开外部中断1
	SETB IT0
	SETB IT1
	SJMP $
INT_0:
	CLR EX0  ;关外部中断0
    PUSH PSW  ;现场保护
    PUSH ACC
	SETB EX0  ;打开外部中断0
	LCALL DELAY  ;调用延时10ms，去抖动  
	JB P3.2,RETURN1	;若K0为高电平则跳出
    MOV P0,#0C0H  ;否则数码管显示0
RETURN1:
	CLR EX0
    POP ACC  ;现场恢复
	POP PSW
	SETB EX0
    RETI
INT_1:
	CLR EX1  ;关外部中断1
    PUSH PSW  ;现场保护
    PUSH ACC
	SETB EX1  ;打开外部中断1
	LCALL DELAY  ;调用延时10ms，去抖动
	JB P3.3,RETURN2  ;若K1为高电平则跳出
    MOV P0,#0F9H  ;否则会数码管显示1
RETURN2:
	CLR EX1
    POP ACC  ;现场恢复
	POP PSW
	SETB EX1
	RETI  
DELAY:	MOV R7,#100
D1: 	MOV R6,#100
D2: 	DJNZ R6,D2
 		DJNZ R7,D1
		RET	 
		END