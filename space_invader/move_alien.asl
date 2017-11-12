

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


(0001)                            || 
(0002)                            || 
(0003)                            || .DSEG
(0004)                       000  || .ORG 0x00
(0005)                            || 
(0006)                            || 
(0007)                            || 
(0008)                            || 
(0009)                       144  || .EQU VGA_HADD = 0x90
(0010)                       145  || .EQU VGA_LADD = 0x91
(0011)                       146  || .EQU VGA_COLOR = 0x92
(0012)                       129  || .EQU SSEG = 0x81
(0013)                       064  || .EQU LEDS = 0x40
(0014)                            || 
(0015)                       047  || .EQU INSIDE_FOR_COUNT    = 	0x2f
(0016)                       047  || .EQU MIDDLE_FOR_COUNT    = 0x2f
(0017)                       047  || .EQU OUTSIDE_FOR_COUNT   = 0x2f
(0018)                            || 
(0019)                       040  || .equ END_ROW = 0x28
(0020)                       006  || .equ END_COL = 0x06
(0021)                       003  || .equ SHIP_COLOR = 0x03
(0022)                            || 
(0023)                            || 
(0024)                            || 
(0025)                            || .CSEG
(0026)                       016  || .ORG 0x10
(0027)                            || 
(0028)  CS-0x010  0x1A000         ||    SEI
(0029)                            || 
(0030)  CS-0x011  0x36101         ||    MOV  R1, 0x01
(0031)  CS-0x012  0x36700         ||    MOV  R7, 0x00
(0032)  CS-0x013  0x36800         ||    MOV  R8, 0x00 
(0033)  CS-0x014  0x36A28         ||    MOV  R10, END_ROW
(0034)  CS-0x015  0x36B01         || 	MOV R11, 0x01
(0035)                            || 	
(0036)                     0x016  || MAIN:     
(0037)  CS-0x016  0x04439         || 			MOV  R4, R7   ;y coordin
(0038)  CS-0x017  0x04541         || 			MOV  R5, R8   ;x coordin
(0039)  CS-0x018  0x08159         || 			call draw_ship  
(0040)  CS-0x019  0x08249  0x019  || main_pause:	call pause
(0041)                            || 			
(0042)                            || 
(0043)  CS-0x01A  0x2CA01  0x01A  || ret_pause:	SUB R10, 0x01
(0044)  CS-0x01B  0x30A00         || 			CMP R10, 0x00
(0045)  CS-0x01C  0x080FA         || 			BREQ col
(0046)                            || 
(0047)                            || 
(0048)  CS-0x01D  0x02858  0x01D  || end_main:	ADD R8, R11
(0049)  CS-0x01E  0x080B0         || 			BRN MAIN
(0050)                            || 
(0051)                            || 
(0052)                            || 
(0053)  CS-0x01F  0x28701  0x01F  || col:		ADD R7, 0x01
(0054)  CS-0x020  0x36A28         || 			MOV R10, END_ROW
(0055)  CS-0x021  0x30706         || 			CMP R7, END_COL
(0056)  CS-0x022  0x08242         || 			BREQ DONE
(0057)                            || 			
(0058)  CS-0x023  0x30B01         || 			CMP R11, 0x01
(0059)  CS-0x024  0x08142         || 			BREQ set_neg
(0060)                            || 	
(0061)  CS-0x025  0x36B01         || 			MOV R11, 0x01
(0062)  CS-0x026  0x368FF         || 			MOV R8, 0xFF
(0063)  CS-0x027  0x080E8         || 			BRN end_main
(0064)                            || 
(0065)  CS-0x028  0x36BFF  0x028  || set_neg:	MOV R11, 0xFF
(0066)  CS-0x029  0x36828         || 			MOV R8, 0x28
(0067)  CS-0x02A  0x080E8         || 			brn end_main
(0068)                            || 
(0069)                     0x02B  || draw_ship:
(0070)  CS-0x02B  0x04541         || 			MOV R5, R8
(0071)  CS-0x02C  0x04439         || 			MOV R4, R7
(0072)  CS-0x02D  0x36600         || 			MOV R6, 0x00
(0073)                            || 
(0074)                            || 
(0075)  CS-0x02E  0x30BFF         || 			CMP R11, 0xFF
(0076)  CS-0x02F  0x08192         || 			BREQ draw_neg
(0077)                            || 
(0078)  CS-0x030  0x2C503         || 			SUB R5, 0x03
(0079)  CS-0x031  0x08198         || 			brn rest
(0080)                            || 
(0081)  CS-0x032  0x28503  0x032  || draw_neg:	ADD R5, 0x03
(0082)                            || 
(0083)  CS-0x033  0x081C9  0x033  || rest:		call draw_dot
(0084)                            || 
(0085)                            || 
(0086)  CS-0x034  0x04541         || 			MOV R5, R8
(0087)  CS-0x035  0x04439         || 			MOV R4, R7
(0088)  CS-0x036  0x36603         || 			MOV R6, SHIP_COLOR
(0089)  CS-0x037  0x081C9         || 			call draw_dot
(0090)  CS-0x038  0x18002         || 			ret
(0091)                            || 
(0092)                     0x039  || draw_dot: 
(0093)  CS-0x039  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0094)  CS-0x03A  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0095)                            || 
(0096)  CS-0x03B  0x34591  0x03B  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0097)  CS-0x03C  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0098)  CS-0x03D  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0099)  CS-0x03E  0x18002         ||         RET
(0100)                            || 
(0101)                            || 
(0102)                            || 
(0103)  CS-0x03F  0x04439  0x03F  || ISR:            MOV  R4, R7   ;y coordin
(0104)  CS-0x040  0x04541         ||    MOV  R5, R8   ;x coordin
(0105)  CS-0x041  0x36600         ||    MOV  R6, 0x00
(0106)  CS-0x042  0x081C9         ||    CALL draw_dot   ;draw red square at origin
(0107)                            || 
(0108)                            ||     
(0109)  CS-0x043  0x04439         ||    MOV  R4, R7   ;y coordin
(0110)  CS-0x044  0x04541         ||    MOV  R5, R8   ;x coordin
(0111)  CS-0x045  0x36603         ||    MOV  R6, 0x03
(0112)  CS-0x046  0x081C9         ||    CALL draw_dot   ;draw red square at origin
(0113)                            || 
(0114)                            || 
(0115)  CS-0x047  0x1A003         ||    RETIE
(0116)                            || 	   
(0117)                            || 
(0118)                            || 
(0119)  CS-0x048  0x08240  0x048  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0120)                            || 
(0121)                            || 
(0122)  CS-0x049  0x3712F  0x049  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0123)  CS-0x04A  0x2D101  0x04A  || outside_for0: 	SUB     R17, 0x01
(0124)                            || 
(0125)  CS-0x04B  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0126)  CS-0x04C  0x2D201  0x04C  || middle_for0:  	SUB     R18, 0x01
(0127)                            ||              
(0128)  CS-0x04D  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0129)  CS-0x04E  0x2D301  0x04E  || inside_for0:  	SUB     R19, 0x01
(0130)  CS-0x04F  0x08273         ||              	BRNE    inside_for0
(0131)                            ||              
(0132)  CS-0x050  0x23200         ||              	OR      R18, 0x00              
(0133)  CS-0x051  0x08263         ||              	BRNE    middle_for0
(0134)                            ||              
(0135)  CS-0x052  0x23100         ||              	OR      R17, 0x00               
(0136)  CS-0x053  0x08253         ||              	BRNE    outside_for0
(0137)                            || 
(0138)  CS-0x054  0x18002         || 				ret
(0139)                            || 
(0140)                            || .CSEG
(0141)                       1023  || .ORG 0x3FF
(0142)  CS-0x3FF  0x081F8  0x3FF  || VECTOR:      BRN ISR
(0143)                            || 





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
COL            0x01F   (0053)  ||  0045 
DD_OUT         0x03B   (0096)  ||  
DONE           0x048   (0119)  ||  0056 0119 
DRAW_DOT       0x039   (0092)  ||  0083 0089 0106 0112 
DRAW_NEG       0x032   (0081)  ||  0076 
DRAW_SHIP      0x02B   (0069)  ||  0039 
END_MAIN       0x01D   (0048)  ||  0063 0067 
INSIDE_FOR0    0x04E   (0129)  ||  0130 
ISR            0x03F   (0103)  ||  0142 
MAIN           0x016   (0036)  ||  0049 
MAIN_PAUSE     0x019   (0040)  ||  
MIDDLE_FOR0    0x04C   (0126)  ||  0133 
OUTSIDE_FOR0   0x04A   (0123)  ||  0136 
PAUSE          0x049   (0122)  ||  0040 
REST           0x033   (0083)  ||  0079 
RET_PAUSE      0x01A   (0043)  ||  
SET_NEG        0x028   (0065)  ||  0059 
VECTOR         0x3FF   (0142)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x006   (0020)  ||  0055 
END_ROW        0x028   (0019)  ||  0033 0054 
INSIDE_FOR_COUNT 0x02F   (0015)  ||  0128 
LEDS           0x040   (0013)  ||  
MIDDLE_FOR_COUNT 0x02F   (0016)  ||  0125 
OUTSIDE_FOR_COUNT 0x02F   (0017)  ||  0122 
SHIP_COLOR     0x003   (0021)  ||  0088 
SSEG           0x081   (0012)  ||  
VGA_COLOR      0x092   (0011)  ||  0098 
VGA_HADD       0x090   (0009)  ||  0097 
VGA_LADD       0x091   (0010)  ||  0096 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
