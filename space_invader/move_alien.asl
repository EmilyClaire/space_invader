

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


(0001)                            || .DSEG
(0002)                       000  || .ORG 0x00
(0003)                            || 
(0004)                       144  || .EQU VGA_HADD = 0x90
(0005)                       145  || .EQU VGA_LADD = 0x91
(0006)                       146  || .EQU VGA_COLOR = 0x92
(0007)                       129  || .EQU SSEG = 0x81
(0008)                       064  || .EQU LEDS = 0x40
(0009)                            || 
(0010)                       047  || .EQU INSIDE_FOR_COUNT    = 	0x2f
(0011)                       047  || .EQU MIDDLE_FOR_COUNT    = 0x2f
(0012)                       047  || .EQU OUTSIDE_FOR_COUNT   = 0x2f
(0013)                            || 
(0014)                       037  || .equ END_ROW = 0x25
(0015)                       010  || .equ END_COL = 0x0A
(0016)                       003  || .equ SHIP_COLOR = 0x03
(0017)                            || 
(0018)                            || 
(0019)                            || 
(0020)                            || .CSEG
(0021)                       016  || .ORG 0x10
(0022)                            || 
(0023)  CS-0x010  0x1A000         ||    SEI
(0024)                            || 
(0025)                     0x011  || reset:
(0026)  CS-0x011  0x36828         || 		MOV R8, 0x28
(0027)  CS-0x012  0x3671D         || 		MOV R7, 0x1D
(0028)  CS-0x013  0x36600         || 		MOV R6, 0x00
(0029)                     0x014  || reset_loop:
(0030)  CS-0x014  0x04439         || 		MOV R4, R7
(0031)  CS-0x015  0x04541         || 		MOV R5, R8
(0032)  CS-0x016  0x082E1         || 		call draw_dot
(0033)  CS-0x017  0x2C801         || 		SUB R8, 0x01
(0034)  CS-0x018  0x080A3         || 		BRNE reset_loop
(0035)                            || 
(0036)  CS-0x019  0x2C701         || 		SUB R7, 0x01
(0037)  CS-0x01A  0x307FF         || 		CMP R7, 0xFF
(0038)  CS-0x01B  0x080A3         || 		BRNE reset_loop
(0039)                            || 	
(0040)  CS-0x01C  0x08361         || 		call pause
(0041)                            || 
(0042)  CS-0x01D  0x36700         ||    MOV  R7, 0x00
(0043)  CS-0x01E  0x36800         ||    MOV  R8, 0x00 
(0044)  CS-0x01F  0x36A25         ||    MOV  R10, END_ROW
(0045)  CS-0x020  0x36B01         || 	MOV R11, 0x01
(0046)  CS-0x021  0x36303         || 	MOV R3, 0x03
(0047)                            || 
(0048)                     0x022  || start:
(0049)  CS-0x022  0x04439         || 	MOV R4, R7
(0050)  CS-0x023  0x04541         || 	MOV R5, R8
(0051)  CS-0x024  0x08271         || 	CALL draw_ship
(0052)  CS-0x025  0x02858         || 	ADD R8, R11
(0053)  CS-0x026  0x2C301         || 	SUB R3, 0x01
(0054)  CS-0x027  0x08113         || 	BRNE start
(0055)                            || 
(0056)  CS-0x028  0x08361         || call pause
(0057)                     0x029  || MAIN:     
(0058)  CS-0x029  0x04439         || 			MOV  R4, R7   ;y coordin
(0059)  CS-0x02A  0x04541         || 			MOV  R5, R8   ;x coordin
(0060)  CS-0x02B  0x08271         || 			call draw_ship  
(0061)  CS-0x02C  0x08361  0x02C  || main_pause:	call pause
(0062)                            || 			
(0063)                            || 
(0064)  CS-0x02D  0x2CA01  0x02D  || ret_pause:	SUB R10, 0x01
(0065)  CS-0x02E  0x30A00         || 			CMP R10, 0x00
(0066)  CS-0x02F  0x08192         || 			BREQ col
(0067)                            || 
(0068)                            || 
(0069)  CS-0x030  0x02858  0x030  || end_main:	ADD R8, R11
(0070)  CS-0x031  0x08148         || 			BRN MAIN
(0071)                            || 
(0072)  CS-0x032  0x28701  0x032  || col:		ADD R7, 0x01
(0073)  CS-0x033  0x36A25         || 			MOV R10, END_ROW
(0074)  CS-0x034  0x3070A         || 			CMP R7, END_COL
(0075)  CS-0x035  0x0835A         || 			BREQ DONE
(0076)                            || 			
(0077)  CS-0x036  0x30B01         || 			CMP R11, 0x01
(0078)  CS-0x037  0x081EA         || 			BREQ set_neg
(0079)                            || 	
(0080)  CS-0x038  0x36B01         || 			MOV R11, 0x01
(0081)  CS-0x039  0x08211         || 			call clear_ship
(0082)  CS-0x03A  0x36800         || 			MOV R8, 0x00
(0083)  CS-0x03B  0x36303         || 			MOV R3, 0x03
(0084)  CS-0x03C  0x08110         || 			BRN start
(0085)                            || 
(0086)  CS-0x03D  0x36BFF  0x03D  || set_neg:	MOV R11, 0xFF
(0087)  CS-0x03E  0x08211         || 			CALL clear_ship
(0088)  CS-0x03F  0x36827         || 			MOV R8, 0x27
(0089)  CS-0x040  0x36303         || 			MoV R3, 0x03
(0090)  CS-0x041  0x08110         || 			brn start
(0091)                            || 
(0092)                            || 
(0093)                     0x042  || clear_ship:
(0094)  CS-0x042  0x2C701         || 			SUB R7, 0x01
(0095)  CS-0x043  0x36303         || 			MOV R3, 0x03
(0096)  CS-0x044  0x36600         || 			MOV R6, 0x00
(0097)                     0x045  || clear_loop: 
(0098)  CS-0x045  0x04541         || 			MOV R5, R8
(0099)  CS-0x046  0x04439         || 			MOV R4, R7
(0100)  CS-0x047  0x082E1         || 			call draw_dot
(0101)  CS-0x048  0x02858         || 			ADD R8, R11
(0102)  CS-0x049  0x2C301         || 			SUB R3, 0x01
(0103)  CS-0x04A  0x30303         || 			CMP R3, 0x03
(0104)  CS-0x04B  0x0822B         || 			BRNE clear_loop
(0105)                            || 						
(0106)  CS-0x04C  0x28701         || 			ADD R7, 0x01
(0107)  CS-0x04D  0x18002         || 			ret
(0108)                            || 
(0109)                            || 
(0110)                     0x04E  || draw_ship:
(0111)  CS-0x04E  0x04541         || 			MOV R5, R8
(0112)  CS-0x04F  0x04439         || 			MOV R4, R7
(0113)  CS-0x050  0x36600         || 			MOV R6, 0x00
(0114)                            || 
(0115)                            || 
(0116)  CS-0x051  0x30BFF         || 			CMP R11, 0xFF
(0117)  CS-0x052  0x082AA         || 			BREQ draw_neg
(0118)                            || 
(0119)  CS-0x053  0x2C503         || 			SUB R5, 0x03
(0120)  CS-0x054  0x082B0         || 			brn rest
(0121)                            || 
(0122)  CS-0x055  0x28503  0x055  || draw_neg:	ADD R5, 0x03
(0123)                            || 
(0124)  CS-0x056  0x082E1  0x056  || rest:		call draw_dot
(0125)                            || 
(0126)                            || 
(0127)  CS-0x057  0x04541         || 			MOV R5, R8
(0128)  CS-0x058  0x04439         || 			MOV R4, R7
(0129)  CS-0x059  0x36603         || 			MOV R6, SHIP_COLOR
(0130)  CS-0x05A  0x082E1         || 			call draw_dot
(0131)  CS-0x05B  0x18002         || 			ret
(0132)                            || 
(0133)                     0x05C  || draw_dot: 
(0134)  CS-0x05C  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0135)  CS-0x05D  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0136)                            || 
(0137)  CS-0x05E  0x34591  0x05E  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0138)  CS-0x05F  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0139)  CS-0x060  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0140)  CS-0x061  0x18002         ||         RET
(0141)                            || 
(0142)                            || 
(0143)                            || 
(0144)  CS-0x062  0x04439  0x062  || ISR:            MOV  R4, R7   ;y coordin
(0145)  CS-0x063  0x04541         ||    MOV  R5, R8   ;x coordin
(0146)  CS-0x064  0x36600         ||    MOV  R6, 0x00
(0147)  CS-0x065  0x082E1         ||    CALL draw_dot   ;draw red square at origin
(0148)                            || 
(0149)                            ||     
(0150)  CS-0x066  0x04439         ||    MOV  R4, R7   ;y coordin
(0151)  CS-0x067  0x04541         ||    MOV  R5, R8   ;x coordin
(0152)  CS-0x068  0x36603         ||    MOV  R6, 0x03
(0153)  CS-0x069  0x082E1         ||    CALL draw_dot   ;draw red square at origin
(0154)                            || 
(0155)                            || 
(0156)  CS-0x06A  0x1A003         ||    RETIE
(0157)                            || 	   
(0158)                            || 
(0159)                            || 
(0160)  CS-0x06B  0x08358  0x06B  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0161)                            || 
(0162)                            || 
(0163)  CS-0x06C  0x3712F  0x06C  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0164)  CS-0x06D  0x2D101  0x06D  || outside_for0: 	SUB     R17, 0x01
(0165)                            || 
(0166)  CS-0x06E  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0167)  CS-0x06F  0x2D201  0x06F  || middle_for0:  	SUB     R18, 0x01
(0168)                            ||              
(0169)  CS-0x070  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0170)  CS-0x071  0x2D301  0x071  || inside_for0:  	SUB     R19, 0x01
(0171)  CS-0x072  0x0838B         ||              	BRNE    inside_for0
(0172)                            ||              
(0173)  CS-0x073  0x23200         ||              	OR      R18, 0x00              
(0174)  CS-0x074  0x0837B         ||              	BRNE    middle_for0
(0175)                            ||              
(0176)  CS-0x075  0x23100         ||              	OR      R17, 0x00               
(0177)  CS-0x076  0x0836B         ||              	BRNE    outside_for0
(0178)                            || 
(0179)  CS-0x077  0x18002         || 				ret
(0180)                            || 
(0181)                            || .CSEG
(0182)                       1023  || .ORG 0x3FF
(0183)  CS-0x3FF  0x08310  0x3FF  || VECTOR:      BRN ISR
(0184)                            || 





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
CLEAR_LOOP     0x045   (0097)  ||  0104 
CLEAR_SHIP     0x042   (0093)  ||  0081 0087 
COL            0x032   (0072)  ||  0066 
DD_OUT         0x05E   (0137)  ||  
DONE           0x06B   (0160)  ||  0075 0160 
DRAW_DOT       0x05C   (0133)  ||  0032 0100 0124 0130 0147 0153 
DRAW_NEG       0x055   (0122)  ||  0117 
DRAW_SHIP      0x04E   (0110)  ||  0051 0060 
END_MAIN       0x030   (0069)  ||  
INSIDE_FOR0    0x071   (0170)  ||  0171 
ISR            0x062   (0144)  ||  0183 
MAIN           0x029   (0057)  ||  0070 
MAIN_PAUSE     0x02C   (0061)  ||  
MIDDLE_FOR0    0x06F   (0167)  ||  0174 
OUTSIDE_FOR0   0x06D   (0164)  ||  0177 
PAUSE          0x06C   (0163)  ||  0040 0056 0061 
RESET          0x011   (0025)  ||  
RESET_LOOP     0x014   (0029)  ||  0034 0038 
REST           0x056   (0124)  ||  0120 
RET_PAUSE      0x02D   (0064)  ||  
SET_NEG        0x03D   (0086)  ||  0078 
START          0x022   (0048)  ||  0054 0084 0090 
VECTOR         0x3FF   (0183)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x00A   (0015)  ||  0074 
END_ROW        0x025   (0014)  ||  0044 0073 
INSIDE_FOR_COUNT 0x02F   (0010)  ||  0169 
LEDS           0x040   (0008)  ||  
MIDDLE_FOR_COUNT 0x02F   (0011)  ||  0166 
OUTSIDE_FOR_COUNT 0x02F   (0012)  ||  0163 
SHIP_COLOR     0x003   (0016)  ||  0129 
SSEG           0x081   (0007)  ||  
VGA_COLOR      0x092   (0006)  ||  0139 
VGA_HADD       0x090   (0004)  ||  0138 
VGA_LADD       0x091   (0005)  ||  0137 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
