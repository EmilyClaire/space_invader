

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
(0031)  CS-0x011  0x36828         || 		MOV R8, 0x28
(0032)  CS-0x012  0x3671D         || 		MOV R7, 0x1D
(0033)  CS-0x013  0x36600         || 		MOV R6, 0x00
(0034)                     0x014  || reset_loop:
(0035)  CS-0x014  0x04439         || 		MOV R4, R7
(0036)  CS-0x015  0x04541         || 		MOV R5, R8
(0037)  CS-0x016  0x08311         || 		call draw_dot
(0038)  CS-0x017  0x2C801         || 		SUB R8, 0x01
(0039)  CS-0x018  0x080A3         || 		BRNE reset_loop
(0040)                            || 
(0041)  CS-0x019  0x2C701         || 		SUB R7, 0x01
(0042)  CS-0x01A  0x307FF         || 		CMP R7, 0xFF
(0043)  CS-0x01B  0x080A3         || 		BRNE reset_loop
(0044)                            || 	
(0045)  CS-0x01C  0x08349         || 		call pause
(0046)                            || 
(0047)  CS-0x01D  0x37B1D         ||    MOV  R27, 0x1D
(0048)  CS-0x01E  0x37C14         ||    MOV  R28, 0x14
(0049)  CS-0x01F  0x366FF         || 	MOV R6, 0xFF
(0050)  CS-0x020  0x044D9         || 	MOV R4, R27
(0051)  CS-0x021  0x045E1         || 	MOV R5, R28
(0052)  CS-0x022  0x08311         || 	call draw_dot
(0053)                            || 
(0054)  CS-0x023  0x36700         ||    MOV  R7, 0x00
(0055)  CS-0x024  0x36800         ||    MOV  R8, 0x00 
(0056)  CS-0x025  0x36A25         ||    MOV  R10, END_ROW
(0057)  CS-0x026  0x36B01         || 	MOV R11, 0x01
(0058)  CS-0x027  0x36303         || 	MOV R3, 0x03
(0059)                            || 	
(0060)                     0x028  || start:
(0061)  CS-0x028  0x04439         || 	MOV R4, R7
(0062)  CS-0x029  0x04541         || 	MOV R5, R8
(0063)  CS-0x02A  0x082A1         || 	CALL draw_ship
(0064)  CS-0x02B  0x02858         || 	ADD R8, R11
(0065)  CS-0x02C  0x2C301         || 	SUB R3, 0x01
(0066)  CS-0x02D  0x08143         || 	BRNE start
(0067)                            || 
(0068)  CS-0x02E  0x08349         || call pause
(0069)                     0x02F  || MAIN:     
(0070)  CS-0x02F  0x04439         || 			MOV  R4, R7   ;y coordin
(0071)  CS-0x030  0x04541         || 			MOV  R5, R8   ;x coordin
(0072)  CS-0x031  0x082A1         || 			call draw_ship  
(0073)  CS-0x032  0x08349  0x032  || main_pause:	call pause
(0074)                            || 			
(0075)                            || 
(0076)  CS-0x033  0x2CA01  0x033  || ret_pause:	SUB R10, 0x01
(0077)  CS-0x034  0x30A00         || 			CMP R10, 0x00
(0078)  CS-0x035  0x081C2         || 			BREQ col
(0079)                            || 
(0080)                            || 
(0081)  CS-0x036  0x02858  0x036  || end_main:	ADD R8, R11
(0082)  CS-0x037  0x08178         || 			BRN MAIN
(0083)                            || 
(0084)  CS-0x038  0x28701  0x038  || col:		ADD R7, 0x01
(0085)  CS-0x039  0x36A25         || 			MOV R10, END_ROW
(0086)  CS-0x03A  0x3071D         || 			CMP R7, END_COL
(0087)  CS-0x03B  0x08342         || 			BREQ DONE
(0088)                            || 			
(0089)  CS-0x03C  0x30B01         || 			CMP R11, 0x01
(0090)  CS-0x03D  0x0821A         || 			BREQ set_neg
(0091)                            || 	
(0092)  CS-0x03E  0x36B01         || 			MOV R11, 0x01
(0093)  CS-0x03F  0x08241         || 			call clear_ship
(0094)  CS-0x040  0x36800         || 			MOV R8, 0x00
(0095)  CS-0x041  0x36303         || 			MOV R3, 0x03
(0096)  CS-0x042  0x08140         || 			BRN start
(0097)                            || 
(0098)  CS-0x043  0x36BFF  0x043  || set_neg:	MOV R11, 0xFF
(0099)  CS-0x044  0x08241         || 			CALL clear_ship
(0100)  CS-0x045  0x36827         || 			MOV R8, 0x27
(0101)  CS-0x046  0x36303         || 			MoV R3, 0x03
(0102)  CS-0x047  0x08140         || 			brn start
(0103)                            || 
(0104)                            || 
(0105)                     0x048  || clear_ship:
(0106)  CS-0x048  0x2C701         || 			SUB R7, 0x01
(0107)  CS-0x049  0x36303         || 			MOV R3, 0x03
(0108)  CS-0x04A  0x36600         || 			MOV R6, 0x00
(0109)                     0x04B  || clear_loop: 
(0110)  CS-0x04B  0x04541         || 			MOV R5, R8
(0111)  CS-0x04C  0x04439         || 			MOV R4, R7
(0112)  CS-0x04D  0x08311         || 			call draw_dot
(0113)  CS-0x04E  0x02858         || 			ADD R8, R11
(0114)  CS-0x04F  0x2C301         || 			SUB R3, 0x01
(0115)  CS-0x050  0x30303         || 			CMP R3, 0x03
(0116)  CS-0x051  0x0825B         || 			BRNE clear_loop
(0117)                            || 						
(0118)  CS-0x052  0x28701         || 			ADD R7, 0x01
(0119)  CS-0x053  0x18002         || 			ret
(0120)                            || 
(0121)                            || 
(0122)                     0x054  || draw_ship:
(0123)  CS-0x054  0x04541         || 			MOV R5, R8
(0124)  CS-0x055  0x04439         || 			MOV R4, R7
(0125)  CS-0x056  0x36600         || 			MOV R6, 0x00
(0126)                            || 
(0127)                            || 
(0128)  CS-0x057  0x30BFF         || 			CMP R11, 0xFF
(0129)  CS-0x058  0x082DA         || 			BREQ draw_neg
(0130)                            || 
(0131)  CS-0x059  0x2C503         || 			SUB R5, 0x03
(0132)  CS-0x05A  0x082E0         || 			brn rest
(0133)                            || 
(0134)  CS-0x05B  0x28503  0x05B  || draw_neg:	ADD R5, 0x03
(0135)                            || 
(0136)  CS-0x05C  0x08311  0x05C  || rest:		call draw_dot
(0137)                            || 
(0138)                            || 
(0139)  CS-0x05D  0x04541         || 			MOV R5, R8
(0140)  CS-0x05E  0x04439         || 			MOV R4, R7
(0141)  CS-0x05F  0x366E0         || 			MOV R6, SHIP_COLOR
(0142)  CS-0x060  0x08311         || 			call draw_dot
(0143)  CS-0x061  0x18002         || 			ret
(0144)                            || 
(0145)                     0x062  || draw_dot: 
(0146)  CS-0x062  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0147)  CS-0x063  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0148)                            || 
(0149)  CS-0x064  0x34591  0x064  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0150)  CS-0x065  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0151)  CS-0x066  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0152)  CS-0x067  0x18002         ||         RET
(0153)                            || 	   
(0154)  CS-0x068  0x08340  0x068  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0155)                            || 
(0156)                            || 
(0157)  CS-0x069  0x3712F  0x069  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0158)  CS-0x06A  0x2D101  0x06A  || outside_for0: 	SUB     R17, 0x01
(0159)                            || 
(0160)  CS-0x06B  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0161)  CS-0x06C  0x2D201  0x06C  || middle_for0:  	SUB     R18, 0x01
(0162)                            ||              
(0163)  CS-0x06D  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0164)  CS-0x06E  0x2D301  0x06E  || inside_for0:  	SUB     R19, 0x01
(0165)  CS-0x06F  0x08373         ||              	BRNE    inside_for0
(0166)                            ||              
(0167)  CS-0x070  0x23200         ||              	OR      R18, 0x00              
(0168)  CS-0x071  0x08363         ||              	BRNE    middle_for0
(0169)                            ||              
(0170)  CS-0x072  0x23100         ||              	OR      R17, 0x00               
(0171)  CS-0x073  0x08353         ||              	BRNE    outside_for0
(0172)                            || 
(0173)  CS-0x074  0x18002         || 				ret
(0174)                            || 
(0175)                     0x075  || clear_square:
(0176)                            || 
(0177)  CS-0x075  0x044D9         ||    MOV  R4, R27   ;y coordin
(0178)  CS-0x076  0x045E1         ||    MOV  R5, R28   ;x coordin
(0179)  CS-0x077  0x36600         ||    MOV  R6, 0x00
(0180)  CS-0x078  0x08311         ||    CALL draw_dot   ;clears dot at the origin
(0181)  CS-0x079  0x18002         ||    RET
(0182)                            || 
(0183)                            || 
(0184)                     0x07A  || ISR:            
(0185)  CS-0x07A  0x083A9         ||    CALL clear_square
(0186)  CS-0x07B  0x31C00         ||    CMP R28, 0x00
(0187)                            ||    BREQ retie   
            syntax error

(0188)                            ||    
(0189)  CS-0x07C  0x2DC01         || 	SUB  R28, 0x01  
(0190)                            || 
(0191)                            || 
(0192)  CS-0x07D  0x044D9         ||    MOV  R4, R27   ;y coordin
(0193)  CS-0x07E  0x045E1         ||    MOV  R5, R28   ;x coordin
(0194)  CS-0x07F  0x366FF         ||    MOV  R6, 0xFF
(0195)  CS-0x080  0x08311         ||    CALL draw_dot   ;draw red square at origin
(0196)                            ||    
(0197)                            || 
(0198)                            || 
(0199)  CS-0x081  0x1A003         || 	RETIE
(0200)                            || 
(0201)                            || .CSEG
(0202)                       1023  || .ORG 0x3FF
(0203)  CS-0x3FF  0x083D0  0x3FF  || VECTOR:      BRN ISR
(0204)                            || 





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
CLEAR_LOOP     0x04B   (0109)  ||  0116 
CLEAR_SHIP     0x048   (0105)  ||  0093 0099 
CLEAR_SQUARE   0x075   (0175)  ||  0185 
COL            0x038   (0084)  ||  0078 
DD_OUT         0x064   (0149)  ||  
DONE           0x068   (0154)  ||  0087 0154 
DRAW_DOT       0x062   (0145)  ||  0037 0052 0112 0136 0142 0180 0195 
DRAW_NEG       0x05B   (0134)  ||  0129 
DRAW_SHIP      0x054   (0122)  ||  0063 0072 
END_MAIN       0x036   (0081)  ||  
INSIDE_FOR0    0x06E   (0164)  ||  0165 
ISR            0x07A   (0184)  ||  0203 
MAIN           0x02F   (0069)  ||  0082 
MAIN_PAUSE     0x032   (0073)  ||  
MIDDLE_FOR0    0x06C   (0161)  ||  0168 
OUTSIDE_FOR0   0x06A   (0158)  ||  0171 
PAUSE          0x069   (0157)  ||  0045 0068 0073 
RESET          0x011   (0030)  ||  
RESET_LOOP     0x014   (0034)  ||  0039 0043 
REST           0x05C   (0136)  ||  0132 
RET_PAUSE      0x033   (0076)  ||  
SET_NEG        0x043   (0098)  ||  0090 
START          0x028   (0060)  ||  0066 0096 0102 
VECTOR         0x3FF   (0203)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0015)  ||  0086 
END_ROW        0x025   (0014)  ||  0056 0085 
INPUT_LEFT_ID  0x020   (0020)  ||  
INPUT_RIGHT_ID 0x021   (0021)  ||  
INPUT_SHOOT_ID 0x022   (0022)  ||  
INSIDE_FOR_COUNT 0x02F   (0010)  ||  0163 
LEDS           0x040   (0008)  ||  
MIDDLE_FOR_COUNT 0x02F   (0011)  ||  0160 
OUTSIDE_FOR_COUNT 0x02F   (0012)  ||  0157 
SHIP_COLOR     0x0E0   (0016)  ||  0141 
SSEG           0x081   (0007)  ||  
VGA_COLOR      0x092   (0006)  ||  0151 
VGA_HADD       0x090   (0004)  ||  0150 
VGA_LADD       0x091   (0005)  ||  0149 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
