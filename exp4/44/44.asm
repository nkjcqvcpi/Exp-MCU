ORG		0000H;程序的初始位置
LJMP	MAIN  ;跳到程序的起始位置
ORG		0003H ;外部中断程序0入口
LJMP	INT       ;跳到中断程序的起始位置		
ORG		0100H
MAIN:
	CLR	IT0         ;采用低电平触发
    SETB EX0         ;允许外部中断0中断
	SETB   EA          ;开启总中断
	MOV    R3,#00H     ;将R3置0
	MOV    DPTR,#TABLE ;将表文件头的地址赋给基址		
LOOP:
	MOV    A,R3        ;将R3置给A
	MOVC   A,@A+DPTR	  ;基址加变址查表内容赋给A	
	MOV    P0,A        ;将A给P0口
	AJMP   LOOP
DELAY:  MOV R7,#25       ;延时程序
LOOP3:  MOV R6,#50
LOOP2:  MOV R5,#50
LOOP1:  DJNZ R5,LOOP1
        DJNZ R6,LOOP2
        DJNZ R7,LOOP3
        RET 
INT:   ACALL  DELAY          ;中断程序  
LOOP4: JNB    P3.2,LOOP4
       ACALL  DELAY
LOOP5: JNB    P3.2,LOOP5     ;去抖动
       INC    R3             ;R3加一 
       CJNE   R3,#10,RETURN  ;若R3不为10则转移  
       MOV    R3,#0          ;将R3置0 
RETURN: RETI
TABLE:  DB   0C0H, 0F9H, 0A4H, 0B0H, 99H, 92H, 82H, 0F8H, 80H, 90H
        END                  ;程序结束