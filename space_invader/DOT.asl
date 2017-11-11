

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || ; --------------------------------------------------------------------
(0002)                            || ; A simple etch-a-sketch program to illustrate an example
(0003)                            || ; of how to write an interrupt based assembly language program that
(0004)                            || ; interfaces the keyboard and VGA.  
(0005)                            || ;
(0006)                            || ; Uses keys W, A, S, and D to move the cursor up, left, down, and right
(0007)                            || ; No reset currently implemented
(0008)                            || ;
(0009)                            || ; Author: Bridget Benson
(0010)                            || ; --------------------------------------------------------------------
(0011)                            || 
(0012)                            || .CSEG
(0013)                       016  || .ORG 0x10
(0014)                            || 
(0015)                       144  || .EQU VGA_HADD = 0x90
(0016)                       145  || .EQU VGA_LADD = 0x91
(0017)                       146  || .EQU VGA_COLOR = 0x92
(0018)                       129  || .EQU SSEG = 0x81
(0019)                       064  || .EQU LEDS = 0x40
(0020)                            || 
(0021)                            || 
(0022)                            || ;- Looping Constants: --------------------------------------------------|
(0023)                       176  || .EQU INSIDE_FOR_COUNT    = 0xB0 ;
(0024)                       176  || .EQU MIDDLE_FOR_COUNT    = 0xB0 ;
(0025)                       176  || .EQU OUTSIDE_FOR_COUNT   = 0xB0 ;
(0026)                            || ;-----------------------------------------------------------------------|
(0027)                            || 
(0028)                            || ;R0 is for status
(0029)                            || ;R1 is for interrupt count
(0030)                            || ;r2 is keyboard input
(0031)                            || ;r4 is for y
(0032)                            || ;r5 is for x
(0033)                            || ;r6 is for color
(0034)                            || ;r7 temp y
(0035)                            || ;r8 temp x
(0036)                            || 
(0037)                     0x010  || main:
(0038)                            || 
(0039)  CS-0x010  0x36000         ||    MOV  R0, 0x00
(0040)  CS-0x011  0x36100         ||    MOV  R1, 0x00
(0041)  CS-0x012  0x3670F         ||    MOV  R7, 0x0f
(0042)  CS-0x013  0x36815         ||    MOV  R8, 0x15
(0043)  CS-0x014  0x04439         ||    MOV  R4, R7   ;y coordin
(0044)  CS-0x015  0x04541         ||    MOV  R5, R8   ;x coordin
(0045)  CS-0x016  0x36600         ||    MOV  R6, 0x00 ; clear
(0046)  CS-0x017  0x082E9         ||    CALL draw_dot   
(0047)                            || 
(0048)                            || 
(0049)  CS-0x018  0x36000         ||    MOV  R0, 0x00
(0050)  CS-0x019  0x36100         ||    MOV  R1, 0x00
(0051)  CS-0x01A  0x3670F         ||    MOV  R7, 0x0F
(0052)  CS-0x01B  0x36814         ||    MOV  R8, 0x14
(0053)  CS-0x01C  0x04439         ||    MOV  R4, R7   ;y coordin
(0054)  CS-0x01D  0x04541         ||    MOV  R5, R8   ;x coordin
(0055)  CS-0x01E  0x366E0         ||    MOV  R6, 0xE0
(0056)  CS-0x01F  0x082E9         ||    CALL draw_dot   ;draw red square at origin
(0057)                            || 
(0058)  CS-0x020  0x36000         ||    MOV  R0, 0x00
(0059)  CS-0x021  0x36100         ||    MOV  R1, 0x00
(0060)  CS-0x022  0x3670E         ||    MOV  R7, 0x0E
(0061)  CS-0x023  0x36814         ||    MOV  R8, 0x14
(0062)  CS-0x024  0x04439         ||    MOV  R4, R7   ;y coordin
(0063)  CS-0x025  0x04541         ||    MOV  R5, R8   ;x coordin
(0064)  CS-0x026  0x366FF         ||    MOV  R6, 0xFF
(0065)  CS-0x027  0x082E9         ||    CALL draw_dot   ;draw red square at origin
(0066)                            || 
(0067)                            || 
(0068)                            || 
(0069)  CS-0x028  0x08319         || 	CALL pause ;
(0070)                            || 
(0071)                            || 
(0072)  CS-0x029  0x36000         ||    MOV  R0, 0x00
(0073)  CS-0x02A  0x36100         ||    MOV  R1, 0x00
(0074)  CS-0x02B  0x36710         ||    MOV  R7, 0x10
(0075)  CS-0x02C  0x36814         ||    MOV  R8, 0x14
(0076)  CS-0x02D  0x04439         ||    MOV  R4, R7   ;y coordin
(0077)  CS-0x02E  0x04541         ||    MOV  R5, R8   ;x coordin
(0078)  CS-0x02F  0x366F0         ||    MOV  R6, 0xF0 ;draw
(0079)  CS-0x030  0x082E9         ||    CALL draw_dot  
(0080)                            || 
(0081)  CS-0x031  0x08319         || 	call pause;
(0082)                            || 
(0083)  CS-0x032  0x36000         ||    MOV  R0, 0x00
(0084)  CS-0x033  0x36100         ||    MOV  R1, 0x00
(0085)  CS-0x034  0x36710         ||    MOV  R7, 0x10
(0086)  CS-0x035  0x36815         ||    MOV  R8, 0x15
(0087)  CS-0x036  0x04439         ||    MOV  R4, R7   ;y coordin
(0088)  CS-0x037  0x04541         ||    MOV  R5, R8   ;x coordin
(0089)  CS-0x038  0x366F0         ||    MOV  R6, 0xF0 ; draw
(0090)  CS-0x039  0x082E9         ||    CALL draw_dot  
(0091)                            || 
(0092)  CS-0x03A  0x36000         ||    MOV  R0, 0x00
(0093)  CS-0x03B  0x36100         ||    MOV  R1, 0x00
(0094)  CS-0x03C  0x3670F         ||    MOV  R7, 0x0F
(0095)  CS-0x03D  0x36814         ||    MOV  R8, 0x14
(0096)  CS-0x03E  0x04439         ||    MOV  R4, R7   ;y coordin
(0097)  CS-0x03F  0x04541         ||    MOV  R5, R8   ;x coordin
(0098)  CS-0x040  0x36600         ||    MOV  R6, 0x00 ;clear
(0099)  CS-0x041  0x082E9         ||    CALL draw_dot   
(0100)                            || 
(0101)                            || 
(0102)  CS-0x042  0x08319         || 	call pause;
(0103)                            || 
(0104)                            || 
(0105)  CS-0x043  0x36000         ||    MOV  R0, 0x00
(0106)  CS-0x044  0x36100         ||    MOV  R1, 0x00
(0107)  CS-0x045  0x3670F         ||    MOV  R7, 0x0f
(0108)  CS-0x046  0x36815         ||    MOV  R8, 0x15
(0109)  CS-0x047  0x04439         ||    MOV  R4, R7   ;y coordin
(0110)  CS-0x048  0x04541         ||    MOV  R5, R8   ;x coordin
(0111)  CS-0x049  0x366E0         ||    MOV  R6, 0xe0 ; draw
(0112)  CS-0x04A  0x082E9         ||    CALL draw_dot  
(0113)                            || 
(0114)                            || 
(0115)  CS-0x04B  0x36000         ||    MOV  R0, 0x00
(0116)  CS-0x04C  0x36100         ||    MOV  R1, 0x00
(0117)  CS-0x04D  0x36710         ||    MOV  R7, 0x10
(0118)  CS-0x04E  0x36814         ||    MOV  R8, 0x14
(0119)  CS-0x04F  0x04439         ||    MOV  R4, R7   ;y coordin
(0120)  CS-0x050  0x04541         ||    MOV  R5, R8   ;x coordin
(0121)  CS-0x051  0x36600         ||    MOV  R6, 0x00 ;clear
(0122)  CS-0x052  0x082E9         ||    CALL draw_dot   
(0123)                            || 
(0124)                            || 
(0125)  CS-0x053  0x08319         || 	call pause;
(0126)                            || 
(0127)                            || 
(0128)  CS-0x054  0x36000         ||    MOV  R0, 0x00
(0129)  CS-0x055  0x36100         ||    MOV  R1, 0x00
(0130)  CS-0x056  0x36710         ||    MOV  R7, 0x10
(0131)  CS-0x057  0x36815         ||    MOV  R8, 0x15
(0132)  CS-0x058  0x04439         ||    MOV  R4, R7   ;y coordin
(0133)  CS-0x059  0x04541         ||    MOV  R5, R8   ;x coordin
(0134)  CS-0x05A  0x36600         ||    MOV  R6, 0x00 ;clear
(0135)  CS-0x05B  0x082E9         ||    CALL draw_dot   
(0136)                            || 
(0137)                            || 
(0138)                            || 
(0139)                            || 
(0140)                            || 
(0141)  CS-0x05C  0x08080         || 	   BRN  main   ; continuous loop waiting for interrupts
(0142)                            ||    
(0143)                            || 
(0144)                            || ; --------------------------------------------------------------------
(0145)                            || ; function draw_dot
(0146)                            || ; --------------------------------------------------------------------
(0147)                     0x05D  || draw_dot: 
(0148)  CS-0x05D  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0149)  CS-0x05E  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0150)                            || 
(0151)  CS-0x05F  0x34591  0x05F  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0152)  CS-0x060  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0153)  CS-0x061  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0154)  CS-0x062  0x18002         ||         RET
(0155)                            || 
(0156)                     0x063  || pause: 
(0157)                            || ;-HOLD-DELAY-1-----------------------------------------------------------
(0158)  CS-0x063  0x361B0         || 		MOV     R1, OUTSIDE_FOR_COUNT
(0159)  CS-0x064  0x2C101  0x064  || OUTSIDE_FOR1: 	SUB     R1, 0x01
(0160)                            ||  
(0161)  CS-0x065  0x362B0         || 		MOV     R2, MIDDLE_FOR_COUNT
(0162)  CS-0x066  0x2C201  0x066  || MIDDLE_FOR1:  	SUB     R2, 0x01
(0163)                            ||              
(0164)  CS-0x067  0x363B0         || 		MOV     R3, INSIDE_FOR_COUNT
(0165)  CS-0x068  0x2C301  0x068  || INSIDE_FOR1:  	SUB     R3, 0x01
(0166)  CS-0x069  0x08343         || 		BRNE    INSIDE_FOR1
(0167)                            || 
(0168)  CS-0x06A  0x22200         || 		OR      R2, 0x00
(0169)  CS-0x06B  0x08333         || 		BRNE    MIDDLE_FOR1
(0170)                            || 
(0171)  CS-0x06C  0x22100         || 		OR      R1, 0x00
(0172)  CS-0x06D  0x08323         || 		BRNE    OUTSIDE_FOR1
(0173)                            || 
(0174)  CS-0x06E  0x18002         || 		ret
(0175)                            || 





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
DD_OUT         0x05F   (0151)  ||  
DRAW_DOT       0x05D   (0147)  ||  0046 0056 0065 0079 0090 0099 0112 0122 0135 
INSIDE_FOR1    0x068   (0165)  ||  0166 
MAIN           0x010   (0037)  ||  0141 
MIDDLE_FOR1    0x066   (0162)  ||  0169 
OUTSIDE_FOR1   0x064   (0159)  ||  0172 
PAUSE          0x063   (0156)  ||  0069 0081 0102 0125 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INSIDE_FOR_COUNT 0x0B0   (0023)  ||  0164 
LEDS           0x040   (0019)  ||  
MIDDLE_FOR_COUNT 0x0B0   (0024)  ||  0161 
OUTSIDE_FOR_COUNT 0x0B0   (0025)  ||  0158 
SSEG           0x081   (0018)  ||  
VGA_COLOR      0x092   (0017)  ||  0153 
VGA_HADD       0x090   (0015)  ||  0152 
VGA_LADD       0x091   (0016)  ||  0151 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
