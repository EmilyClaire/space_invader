

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
(0015)                       029  || .equ END_COL = 0x1D
(0016)                       224  || .equ SHIP_COLOR = 0xE0;0x03 ;blue
(0017)                            || 					   ;0xE0 ;red
(0018)                            || 					   ;     ;green
(0019)                            || 
(0020)                       032  || .EQU INPUT_LEFT_ID   = 0x20
(0021)                       033  || .EQU INPUT_RIGHT_ID  = 0x21
(0022)                       034  || .EQU INPUT_SHOOT_ID  = 0x22
(0023)                            || 
(0024)                            || 
(0025)                            || .CSEG
(0026)                       016  || .ORG 0x10
(0027)                            || 
(0028)  CS-0x010  0x1A000         ||    SEI
(0029)                            || 
(0030)                     0x011  || reset:
(0031)  CS-0x011  0x081C9         || 	    CALL clear_row
(0032)  CS-0x012  0x36828         || 		MOV R8, 0x28
(0033)  CS-0x013  0x3671D         || 		MOV R7, 0x1D
(0034)  CS-0x014  0x36600         || 		MOV R6, 0x00
(0035)                     0x015  || reset_loop:
(0036)  CS-0x015  0x04439         || 		MOV R4, R7
(0037)  CS-0x016  0x04541         || 		MOV R5, R8
(0038)  CS-0x017  0x08341         || 		call draw_dot
(0039)  CS-0x018  0x2C801         || 		SUB R8, 0x01
(0040)  CS-0x019  0x080AB         || 		BRNE reset_loop
(0041)                            || 
(0042)  CS-0x01A  0x2C701         || 		SUB R7, 0x01
(0043)  CS-0x01B  0x307FF         || 		CMP R7, 0xFF
(0044)  CS-0x01C  0x080AB         || 		BRNE reset_loop
(0045)                            || 	
(0046)  CS-0x01D  0x08379         || 		call pause
(0047)                            || 
(0048)  CS-0x01E  0x37B1D         ||    MOV  R27, 0x1D
(0049)  CS-0x01F  0x37C14         ||    MOV  R28, 0x14
(0050)  CS-0x020  0x366FF         || 	MOV R6, 0xFF
(0051)  CS-0x021  0x044D9         || 	MOV R4, R27
(0052)  CS-0x022  0x045E1         || 	MOV R5, R28
(0053)  CS-0x023  0x08341         || 	call draw_dot
(0054)                            || 
(0055)  CS-0x024  0x36700         ||    MOV  R7, 0x00
(0056)  CS-0x025  0x36800         ||    MOV  R8, 0x00 
(0057)  CS-0x026  0x36A25         ||    MOV  R10, END_ROW
(0058)  CS-0x027  0x36B01         || 	MOV R11, 0x01
(0059)  CS-0x028  0x36303         || 	MOV R3, 0x03
(0060)                            || 	
(0061)                     0x029  || start:
(0062)  CS-0x029  0x04439         || 	MOV R4, R7
(0063)  CS-0x02A  0x04541         || 	MOV R5, R8
(0064)  CS-0x02B  0x082D1         || 	CALL draw_ship
(0065)  CS-0x02C  0x02858         || 	ADD R8, R11
(0066)  CS-0x02D  0x2C301         || 	SUB R3, 0x01
(0067)  CS-0x02E  0x0814B         || 	BRNE start
(0068)                            || 
(0069)  CS-0x02F  0x08379         || call pause
(0070)                     0x030  || MAIN:     
(0071)                            || 			
(0072)  CS-0x030  0x04439         ||             MOV  R4, R7   ;y coordin
(0073)  CS-0x031  0x04541         || 			MOV  R5, R8   ;x coordin
(0074)  CS-0x032  0x082D1         || 			call draw_ship  
(0075)  CS-0x033  0x08379  0x033  || main_pause:	call pause
(0076)                            || 			
(0077)                            || 
(0078)  CS-0x034  0x2CA01  0x034  || ret_pause:	SUB R10, 0x01
(0079)  CS-0x035  0x30A00         || 			CMP R10, 0x00
(0080)  CS-0x036  0x081F2         || 			BREQ col
(0081)                            || 
(0082)                            || 
(0083)  CS-0x037  0x02858  0x037  || end_main:	ADD R8, R11
(0084)  CS-0x038  0x08180         || 			BRN MAIN
(0085)                            || 
(0086)                            || 
(0087)                            || 
(0088)                            || 
(0089)                            || 
(0090)                            || 
(0091)                     0x039  || clear_row:
(0092)                            || 
(0093)                            ||    
(0094)  CS-0x039  0x083D9         ||    CALL clear_square
(0095)  CS-0x03A  0x2C801         ||    SUB R8, 0x01
(0096)  CS-0x03B  0x308FF         ||    CMP R8, 0xFF
(0097)  CS-0x03C  0x081CB         ||    BRNE clear_row
(0098)  CS-0x03D  0x18002         ||    RET
(0099)                            || 
(0100)                            || 
(0101)                            || 
(0102)                            || 
(0103)                            || 
(0104)                            || 
(0105)                            || 
(0106)                            || 
(0107)  CS-0x03E  0x28701  0x03E  || col:		ADD R7, 0x01
(0108)  CS-0x03F  0x36A25         || 			MOV R10, END_ROW
(0109)  CS-0x040  0x3071D         || 			CMP R7, END_COL
(0110)  CS-0x041  0x08372         || 			BREQ DONE
(0111)                            || 			
(0112)  CS-0x042  0x30B01         || 			CMP R11, 0x01
(0113)  CS-0x043  0x0824A         || 			BREQ set_neg
(0114)                            || 	
(0115)  CS-0x044  0x36B01         || 			MOV R11, 0x01
(0116)  CS-0x045  0x08271         || 			call clear_ship
(0117)  CS-0x046  0x36800         || 			MOV R8, 0x00
(0118)  CS-0x047  0x36303         || 			MOV R3, 0x03
(0119)  CS-0x048  0x08148         || 			BRN start
(0120)                            || 
(0121)  CS-0x049  0x36BFF  0x049  || set_neg:	MOV R11, 0xFF
(0122)  CS-0x04A  0x08271         || 			CALL clear_ship
(0123)  CS-0x04B  0x36827         || 			MOV R8, 0x27
(0124)  CS-0x04C  0x36303         || 			MoV R3, 0x03
(0125)  CS-0x04D  0x08148         || 			brn start
(0126)                            || 
(0127)                            || 
(0128)                     0x04E  || clear_ship:
(0129)  CS-0x04E  0x2C701         || 			SUB R7, 0x01
(0130)  CS-0x04F  0x36303         || 			MOV R3, 0x03
(0131)  CS-0x050  0x36600         || 			MOV R6, 0x00
(0132)                     0x051  || clear_loop: 
(0133)  CS-0x051  0x04541         || 			MOV R5, R8
(0134)  CS-0x052  0x04439         || 			MOV R4, R7
(0135)  CS-0x053  0x08341         || 			call draw_dot
(0136)  CS-0x054  0x02858         || 			ADD R8, R11
(0137)  CS-0x055  0x2C301         || 			SUB R3, 0x01
(0138)  CS-0x056  0x30303         || 			CMP R3, 0x03
(0139)  CS-0x057  0x0828B         || 			BRNE clear_loop
(0140)                            || 						
(0141)  CS-0x058  0x28701         || 			ADD R7, 0x01
(0142)  CS-0x059  0x18002         || 			ret
(0143)                            || 
(0144)                            || 
(0145)                     0x05A  || draw_ship:
(0146)  CS-0x05A  0x04541         || 			MOV R5, R8
(0147)  CS-0x05B  0x04439         || 			MOV R4, R7
(0148)  CS-0x05C  0x36600         || 			MOV R6, 0x00
(0149)                            || 
(0150)                            || 
(0151)  CS-0x05D  0x30BFF         || 			CMP R11, 0xFF
(0152)  CS-0x05E  0x0830A         || 			BREQ draw_neg
(0153)                            || 
(0154)  CS-0x05F  0x2C503         || 			SUB R5, 0x03
(0155)  CS-0x060  0x08310         || 			brn rest
(0156)                            || 
(0157)  CS-0x061  0x28503  0x061  || draw_neg:	ADD R5, 0x03
(0158)                            || 
(0159)  CS-0x062  0x08341  0x062  || rest:		call draw_dot
(0160)                            || 
(0161)                            || 
(0162)  CS-0x063  0x04541         || 			MOV R5, R8
(0163)  CS-0x064  0x04439         || 			MOV R4, R7
(0164)  CS-0x065  0x366E0         || 			MOV R6, SHIP_COLOR
(0165)  CS-0x066  0x08341         || 			call draw_dot
(0166)  CS-0x067  0x18002         || 			ret
(0167)                            || 
(0168)                     0x068  || draw_dot: 
(0169)  CS-0x068  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0170)  CS-0x069  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0171)                            || 
(0172)  CS-0x06A  0x34591  0x06A  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0173)  CS-0x06B  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0174)  CS-0x06C  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0175)  CS-0x06D  0x18002         ||         RET
(0176)                            || 	   
(0177)  CS-0x06E  0x08370  0x06E  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0178)                            || 
(0179)                            || 
(0180)  CS-0x06F  0x3712F  0x06F  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0181)  CS-0x070  0x2D101  0x070  || outside_for0: 	SUB     R17, 0x01
(0182)                            || 
(0183)  CS-0x071  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0184)  CS-0x072  0x2D201  0x072  || middle_for0:  	SUB     R18, 0x01
(0185)                            ||              
(0186)  CS-0x073  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0187)  CS-0x074  0x2D301  0x074  || inside_for0:  	SUB     R19, 0x01
(0188)  CS-0x075  0x083A3         ||              	BRNE    inside_for0
(0189)                            ||              
(0190)  CS-0x076  0x23200         ||              	OR      R18, 0x00              
(0191)  CS-0x077  0x08393         ||              	BRNE    middle_for0
(0192)                            ||              
(0193)  CS-0x078  0x23100         ||              	OR      R17, 0x00               
(0194)  CS-0x079  0x08383         ||              	BRNE    outside_for0
(0195)                            || 
(0196)  CS-0x07A  0x18002         || 				ret
(0197)                            || 
(0198)                     0x07B  || clear_square:
(0199)                            || 
(0200)  CS-0x07B  0x044D9         ||    MOV  R4, R27   ;y coordin
(0201)  CS-0x07C  0x045E1         ||    MOV  R5, R28   ;x coordin
(0202)  CS-0x07D  0x36600         ||    MOV  R6, 0x00
(0203)  CS-0x07E  0x08341         ||    CALL draw_dot   ;clears dot at the origin
(0204)  CS-0x07F  0x18002         ||    RET
(0205)                            || 
(0206)                            || 
(0207)                     0x080  || ISR:
(0208)                            || 
(0209)  CS-0x080  0x31C00         || 	CMP R28, 0x00
(0210)  CS-0x081  0x08442         || 	BREQ ISR_END
(0211)                            || 
(0212)  CS-0x082  0x083D9         ||    CALL clear_square
(0213)                            || 
(0214)                            ||    
(0215)  CS-0x083  0x2DC01         ||    SUB  R28, 0x01  
(0216)                            || 
(0217)                            || 
(0218)  CS-0x084  0x044D9         ||    MOV  R4, R27   ;y coordin
(0219)  CS-0x085  0x045E1         ||    MOV  R5, R28   ;x coordin
(0220)  CS-0x086  0x366FF         ||    MOV  R6, 0xFF
(0221)  CS-0x087  0x08341         ||    CALL draw_dot   ;draw red square at origin
(0222)                            ||    
(0223)                     0x088  || ISR_END:
(0224)  CS-0x088  0x1A003         || 		RETIE
(0225)                            || 
(0226)                            || .CSEG
(0227)                       1023  || .ORG 0x3FF
(0228)  CS-0x3FF  0x08400  0x3FF  || VECTOR:      BRN ISR
(0229)                            || 





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
CLEAR_LOOP     0x051   (0132)  ||  0139 
CLEAR_ROW      0x039   (0091)  ||  0031 0097 
CLEAR_SHIP     0x04E   (0128)  ||  0116 0122 
CLEAR_SQUARE   0x07B   (0198)  ||  0094 0212 
COL            0x03E   (0107)  ||  0080 
DD_OUT         0x06A   (0172)  ||  
DONE           0x06E   (0177)  ||  0110 0177 
DRAW_DOT       0x068   (0168)  ||  0038 0053 0135 0159 0165 0203 0221 
DRAW_NEG       0x061   (0157)  ||  0152 
DRAW_SHIP      0x05A   (0145)  ||  0064 0074 
END_MAIN       0x037   (0083)  ||  
INSIDE_FOR0    0x074   (0187)  ||  0188 
ISR            0x080   (0207)  ||  0228 
ISR_END        0x088   (0223)  ||  0210 
MAIN           0x030   (0070)  ||  0084 
MAIN_PAUSE     0x033   (0075)  ||  
MIDDLE_FOR0    0x072   (0184)  ||  0191 
OUTSIDE_FOR0   0x070   (0181)  ||  0194 
PAUSE          0x06F   (0180)  ||  0046 0069 0075 
RESET          0x011   (0030)  ||  
RESET_LOOP     0x015   (0035)  ||  0040 0044 
REST           0x062   (0159)  ||  0155 
RET_PAUSE      0x034   (0078)  ||  
SET_NEG        0x049   (0121)  ||  0113 
START          0x029   (0061)  ||  0067 0119 0125 
VECTOR         0x3FF   (0228)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0015)  ||  0109 
END_ROW        0x025   (0014)  ||  0057 0108 
INPUT_LEFT_ID  0x020   (0020)  ||  
INPUT_RIGHT_ID 0x021   (0021)  ||  
INPUT_SHOOT_ID 0x022   (0022)  ||  
INSIDE_FOR_COUNT 0x02F   (0010)  ||  0186 
LEDS           0x040   (0008)  ||  
MIDDLE_FOR_COUNT 0x02F   (0011)  ||  0183 
OUTSIDE_FOR_COUNT 0x02F   (0012)  ||  0180 
SHIP_COLOR     0x0E0   (0016)  ||  0164 
SSEG           0x081   (0007)  ||  
VGA_COLOR      0x092   (0006)  ||  0174 
VGA_HADD       0x090   (0004)  ||  0173 
VGA_LADD       0x091   (0005)  ||  0172 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
