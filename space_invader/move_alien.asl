

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
(0016)                       003  || .equ SHIP_COLOR = 0x03
(0017)                            || 
(0018)                       032  || .EQU INPUT_LEFT_ID   = 0x20
(0019)                       033  || .EQU INPUT_RIGHT_ID  = 0x21
(0020)                       034  || .EQU INPUT_SHOOT_ID  = 0x22
(0021)                            || 
(0022)                            || 
(0023)                            || .CSEG
(0024)                       016  || .ORG 0x10
(0025)                            || 
(0026)  CS-0x010  0x1A000         ||    SEI
(0027)                            || 
(0028)                     0x011  || reset:
(0029)  CS-0x011  0x36828         || 		MOV R8, 0x28
(0030)  CS-0x012  0x3671D         || 		MOV R7, 0x1D
(0031)  CS-0x013  0x36600         || 		MOV R6, 0x00
(0032)                     0x014  || reset_loop:
(0033)  CS-0x014  0x04439         || 		MOV R4, R7
(0034)  CS-0x015  0x04541         || 		MOV R5, R8
(0035)  CS-0x016  0x08311         || 		call draw_dot
(0036)  CS-0x017  0x2C801         || 		SUB R8, 0x01
(0037)  CS-0x018  0x080A3         || 		BRNE reset_loop
(0038)                            || 
(0039)  CS-0x019  0x2C701         || 		SUB R7, 0x01
(0040)  CS-0x01A  0x307FF         || 		CMP R7, 0xFF
(0041)  CS-0x01B  0x080A3         || 		BRNE reset_loop
(0042)                            || 	
(0043)  CS-0x01C  0x08349         || 		call pause
(0044)                            || 
(0045)  CS-0x01D  0x37B1D         ||    MOV  R27, 0x1D
(0046)  CS-0x01E  0x37C14         ||    MOV  R28, 0x14
(0047)  CS-0x01F  0x366FF         || 	MOV R6, 0xFF
(0048)  CS-0x020  0x044D9         || 	MOV R4, R27
(0049)  CS-0x021  0x045E1         || 	MOV R5, R28
(0050)  CS-0x022  0x08311         || 	call draw_dot
(0051)                            || 
(0052)  CS-0x023  0x36700         ||    MOV  R7, 0x00
(0053)  CS-0x024  0x36800         ||    MOV  R8, 0x00 
(0054)  CS-0x025  0x36A25         ||    MOV  R10, END_ROW
(0055)  CS-0x026  0x36B01         || 	MOV R11, 0x01
(0056)  CS-0x027  0x36303         || 	MOV R3, 0x03
(0057)                            || 	
(0058)                     0x028  || start:
(0059)  CS-0x028  0x04439         || 	MOV R4, R7
(0060)  CS-0x029  0x04541         || 	MOV R5, R8
(0061)  CS-0x02A  0x082A1         || 	CALL draw_ship
(0062)  CS-0x02B  0x02858         || 	ADD R8, R11
(0063)  CS-0x02C  0x2C301         || 	SUB R3, 0x01
(0064)  CS-0x02D  0x08143         || 	BRNE start
(0065)                            || 
(0066)  CS-0x02E  0x08349         || call pause
(0067)                     0x02F  || MAIN:     
(0068)  CS-0x02F  0x04439         || 			MOV  R4, R7   ;y coordin
(0069)  CS-0x030  0x04541         || 			MOV  R5, R8   ;x coordin
(0070)  CS-0x031  0x082A1         || 			call draw_ship  
(0071)  CS-0x032  0x08349  0x032  || main_pause:	call pause
(0072)                            || 			
(0073)                            || 
(0074)  CS-0x033  0x2CA01  0x033  || ret_pause:	SUB R10, 0x01
(0075)  CS-0x034  0x30A00         || 			CMP R10, 0x00
(0076)  CS-0x035  0x081C2         || 			BREQ col
(0077)                            || 
(0078)                            || 
(0079)  CS-0x036  0x02858  0x036  || end_main:	ADD R8, R11
(0080)  CS-0x037  0x08178         || 			BRN MAIN
(0081)                            || 
(0082)  CS-0x038  0x28701  0x038  || col:		ADD R7, 0x01
(0083)  CS-0x039  0x36A25         || 			MOV R10, END_ROW
(0084)  CS-0x03A  0x3071D         || 			CMP R7, END_COL
(0085)  CS-0x03B  0x08342         || 			BREQ DONE
(0086)                            || 			
(0087)  CS-0x03C  0x30B01         || 			CMP R11, 0x01
(0088)  CS-0x03D  0x0821A         || 			BREQ set_neg
(0089)                            || 	
(0090)  CS-0x03E  0x36B01         || 			MOV R11, 0x01
(0091)  CS-0x03F  0x08241         || 			call clear_ship
(0092)  CS-0x040  0x36800         || 			MOV R8, 0x00
(0093)  CS-0x041  0x36303         || 			MOV R3, 0x03
(0094)  CS-0x042  0x08140         || 			BRN start
(0095)                            || 
(0096)  CS-0x043  0x36BFF  0x043  || set_neg:	MOV R11, 0xFF
(0097)  CS-0x044  0x08241         || 			CALL clear_ship
(0098)  CS-0x045  0x36827         || 			MOV R8, 0x27
(0099)  CS-0x046  0x36303         || 			MoV R3, 0x03
(0100)  CS-0x047  0x08140         || 			brn start
(0101)                            || 
(0102)                            || 
(0103)                     0x048  || clear_ship:
(0104)  CS-0x048  0x2C701         || 			SUB R7, 0x01
(0105)  CS-0x049  0x36303         || 			MOV R3, 0x03
(0106)  CS-0x04A  0x36600         || 			MOV R6, 0x00
(0107)                     0x04B  || clear_loop: 
(0108)  CS-0x04B  0x04541         || 			MOV R5, R8
(0109)  CS-0x04C  0x04439         || 			MOV R4, R7
(0110)  CS-0x04D  0x08311         || 			call draw_dot
(0111)  CS-0x04E  0x02858         || 			ADD R8, R11
(0112)  CS-0x04F  0x2C301         || 			SUB R3, 0x01
(0113)  CS-0x050  0x30303         || 			CMP R3, 0x03
(0114)  CS-0x051  0x0825B         || 			BRNE clear_loop
(0115)                            || 						
(0116)  CS-0x052  0x28701         || 			ADD R7, 0x01
(0117)  CS-0x053  0x18002         || 			ret
(0118)                            || 
(0119)                            || 
(0120)                     0x054  || draw_ship:
(0121)  CS-0x054  0x04541         || 			MOV R5, R8
(0122)  CS-0x055  0x04439         || 			MOV R4, R7
(0123)  CS-0x056  0x36600         || 			MOV R6, 0x00
(0124)                            || 
(0125)                            || 
(0126)  CS-0x057  0x30BFF         || 			CMP R11, 0xFF
(0127)  CS-0x058  0x082DA         || 			BREQ draw_neg
(0128)                            || 
(0129)  CS-0x059  0x2C503         || 			SUB R5, 0x03
(0130)  CS-0x05A  0x082E0         || 			brn rest
(0131)                            || 
(0132)  CS-0x05B  0x28503  0x05B  || draw_neg:	ADD R5, 0x03
(0133)                            || 
(0134)  CS-0x05C  0x08311  0x05C  || rest:		call draw_dot
(0135)                            || 
(0136)                            || 
(0137)  CS-0x05D  0x04541         || 			MOV R5, R8
(0138)  CS-0x05E  0x04439         || 			MOV R4, R7
(0139)  CS-0x05F  0x36603         || 			MOV R6, SHIP_COLOR
(0140)  CS-0x060  0x08311         || 			call draw_dot
(0141)  CS-0x061  0x18002         || 			ret
(0142)                            || 
(0143)                     0x062  || draw_dot: 
(0144)  CS-0x062  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0145)  CS-0x063  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0146)                            || 
(0147)  CS-0x064  0x34591  0x064  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0148)  CS-0x065  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0149)  CS-0x066  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0150)  CS-0x067  0x18002         ||         RET
(0151)                            || 	   
(0152)  CS-0x068  0x08340  0x068  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0153)                            || 
(0154)                            || 
(0155)  CS-0x069  0x3712F  0x069  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0156)  CS-0x06A  0x2D101  0x06A  || outside_for0: 	SUB     R17, 0x01
(0157)                            || 
(0158)  CS-0x06B  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0159)  CS-0x06C  0x2D201  0x06C  || middle_for0:  	SUB     R18, 0x01
(0160)                            ||              
(0161)  CS-0x06D  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0162)  CS-0x06E  0x2D301  0x06E  || inside_for0:  	SUB     R19, 0x01
(0163)  CS-0x06F  0x08373         ||              	BRNE    inside_for0
(0164)                            ||              
(0165)  CS-0x070  0x23200         ||              	OR      R18, 0x00              
(0166)  CS-0x071  0x08363         ||              	BRNE    middle_for0
(0167)                            ||              
(0168)  CS-0x072  0x23100         ||              	OR      R17, 0x00               
(0169)  CS-0x073  0x08353         ||              	BRNE    outside_for0
(0170)                            || 
(0171)  CS-0x074  0x18002         || 				ret
(0172)                            || 
(0173)                     0x075  || clear_square:
(0174)                            || 
(0175)  CS-0x075  0x044D9         ||    MOV  R4, R27   ;y coordin
(0176)  CS-0x076  0x045E1         ||    MOV  R5, R28   ;x coordin
(0177)  CS-0x077  0x36600         ||    MOV  R6, 0x00
(0178)  CS-0x078  0x08311         ||    CALL draw_dot   ;clears dot at the origin
(0179)  CS-0x079  0x18002         ||    RET
(0180)                            || 
(0181)                            || 
(0182)                     0x07A  || ISR:            
(0183)  CS-0x07A  0x083A9         ||    CALL clear_square
(0184)                            ||    
(0185)  CS-0x07B  0x2DC01         ||    SUB  R28, 0x01  
(0186)                            || 
(0187)                            || 
(0188)  CS-0x07C  0x044D9         ||    MOV  R4, R27   ;y coordin
(0189)  CS-0x07D  0x045E1         ||    MOV  R5, R28   ;x coordin
(0190)  CS-0x07E  0x366FF         ||    MOV  R6, 0xFF
(0191)  CS-0x07F  0x08311         ||    CALL draw_dot   ;draw red square at origin
(0192)                            ||    
(0193)  CS-0x080  0x31C00         ||    CMP R28, 0x00
(0194)  CS-0x081  0x08342         ||    BREQ DONE
(0195)                            || 
(0196)  CS-0x082  0x1A003         ||    RETIE
(0197)                            || 
(0198)                            || .CSEG
(0199)                       1023  || .ORG 0x3FF
(0200)  CS-0x3FF  0x083D0  0x3FF  || VECTOR:      BRN ISR
(0201)                            || 





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
CLEAR_LOOP     0x04B   (0107)  ||  0114 
CLEAR_SHIP     0x048   (0103)  ||  0091 0097 
CLEAR_SQUARE   0x075   (0173)  ||  0183 
COL            0x038   (0082)  ||  0076 
DD_OUT         0x064   (0147)  ||  
DONE           0x068   (0152)  ||  0085 0152 0194 
DRAW_DOT       0x062   (0143)  ||  0035 0050 0110 0134 0140 0178 0191 
DRAW_NEG       0x05B   (0132)  ||  0127 
DRAW_SHIP      0x054   (0120)  ||  0061 0070 
END_MAIN       0x036   (0079)  ||  
INSIDE_FOR0    0x06E   (0162)  ||  0163 
ISR            0x07A   (0182)  ||  0200 
MAIN           0x02F   (0067)  ||  0080 
MAIN_PAUSE     0x032   (0071)  ||  
MIDDLE_FOR0    0x06C   (0159)  ||  0166 
OUTSIDE_FOR0   0x06A   (0156)  ||  0169 
PAUSE          0x069   (0155)  ||  0043 0066 0071 
RESET          0x011   (0028)  ||  
RESET_LOOP     0x014   (0032)  ||  0037 0041 
REST           0x05C   (0134)  ||  0130 
RET_PAUSE      0x033   (0074)  ||  
SET_NEG        0x043   (0096)  ||  0088 
START          0x028   (0058)  ||  0064 0094 0100 
VECTOR         0x3FF   (0200)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0015)  ||  0084 
END_ROW        0x025   (0014)  ||  0054 0083 
INPUT_LEFT_ID  0x020   (0018)  ||  
INPUT_RIGHT_ID 0x021   (0019)  ||  
INPUT_SHOOT_ID 0x022   (0020)  ||  
INSIDE_FOR_COUNT 0x02F   (0010)  ||  0161 
LEDS           0x040   (0008)  ||  
MIDDLE_FOR_COUNT 0x02F   (0011)  ||  0158 
OUTSIDE_FOR_COUNT 0x02F   (0012)  ||  0155 
SHIP_COLOR     0x003   (0016)  ||  0139 
SSEG           0x081   (0007)  ||  
VGA_COLOR      0x092   (0006)  ||  0149 
VGA_HADD       0x090   (0004)  ||  0148 
VGA_LADD       0x091   (0005)  ||  0147 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
