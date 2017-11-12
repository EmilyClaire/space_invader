

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
(0015)                       047  || .EQU INSIDE_FOR_COUNT    = 0x2f;0xB4
(0016)                       047  || .EQU MIDDLE_FOR_COUNT    = 0x2f;0xCA
(0017)                       047  || .EQU OUTSIDE_FOR_COUNT   = 0x2f
(0018)                            || 
(0019)                       039  || .equ END_ROW = 0x27
(0020)                       006  || .equ END_COL = 0x06
(0021)                       003  || .equ SHIP_COLOR = 0x03
(0022)                            || 
(0023)                            || 
(0024)                            || 
(0025)                            || .CSEG
(0026)                       016  || .ORG 0x10
(0027)                            || 
(0028)  CS-0x010  0x1A000         ||    SEI
(0029)  CS-0x011  0x36000         ||    MOV  R0, 0x00
(0030)  CS-0x012  0x36100         ||    MOV  R1, 0x00
(0031)  CS-0x013  0x36700         ||    MOV  R7, 0x00
(0032)  CS-0x014  0x36800         ||    MOV  R8, 0x00 
(0033)  CS-0x015  0x37227         ||    MOV  R18, END_ROW
(0034)  CS-0x016  0x36B01         || 	MOV R11, 0x01
(0035)                            || 	
(0036)                     0x017  || MAIN:     
(0037)  CS-0x017  0x04439         || 			MOV  R4, R7   ;y coordin
(0038)  CS-0x018  0x04541         || 			MOV  R5, R8   ;x coordin
(0039)  CS-0x019  0x08149         || 			CALL draw_ship   ;draw red square at origin
(0040)  CS-0x01A  0x08219         || 			call pause
(0041)                            || 			
(0042)  CS-0x01B  0x30827         || 			CMP R8, END_ROW
(0043)  CS-0x01C  0x080FA         || 			BREQ col
(0044)                            || 
(0045)                            || 
(0046)  CS-0x01D  0x02858  0x01D  || end_main:	ADD R8, R11
(0047)  CS-0x01E  0x080B8         || 			BRN MAIN
(0048)                            || 
(0049)                            || 
(0050)                            || 
(0051)  CS-0x01F  0x28701  0x01F  || col:		ADD R7, 0x01
(0052)  CS-0x020  0x37227         || 			MOV R18, END_ROW
(0053)  CS-0x021  0x30706         || 			CMP R7, END_COL
(0054)  CS-0x022  0x08212         || 			BREQ DONE
(0055)                            || 			
(0056)  CS-0x023  0x30B01         || 			CMP R11, 0x01
(0057)  CS-0x024  0x0813A         || 			BREQ set_neg
(0058)                            || 	
(0059)  CS-0x025  0x36B01         || 			MOV R11, 0x01
(0060)  CS-0x026  0x080E8         || 			BRN end_main
(0061)                            || 
(0062)  CS-0x027  0x36BFF  0x027  || set_neg:	MOV R11, 0xFF
(0063)  CS-0x028  0x080E8         || 			brn end_main
(0064)                            || 
(0065)                     0x029  || draw_ship:
(0066)  CS-0x029  0x04541         || 			MOV R5, R8
(0067)  CS-0x02A  0x04439         || 			MOV R4, R7
(0068)  CS-0x02B  0x36600         || 			MOV R6, 0x00
(0069)  CS-0x02C  0x2C503         || 			SUB R5, 0x03
(0070)  CS-0x02D  0x08199         || 			call draw_dot
(0071)                            || 
(0072)                            || 
(0073)  CS-0x02E  0x04541         || 			MOV R5, R8
(0074)  CS-0x02F  0x04439         || 			MOV R4, R7
(0075)  CS-0x030  0x36603         || 			MOV R6, SHIP_COLOR
(0076)  CS-0x031  0x08199         || 			call draw_dot
(0077)  CS-0x032  0x18002         || 			ret
(0078)                            || 
(0079)                     0x033  || draw_dot: 
(0080)  CS-0x033  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0081)  CS-0x034  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0082)                            || 
(0083)  CS-0x035  0x34591  0x035  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0084)  CS-0x036  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0085)  CS-0x037  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0086)  CS-0x038  0x18002         ||         RET
(0087)                            || 
(0088)                            || 
(0089)                            || 
(0090)  CS-0x039  0x04439  0x039  || ISR:            MOV  R4, R7   ;y coordin
(0091)  CS-0x03A  0x04541         ||    MOV  R5, R8   ;x coordin
(0092)  CS-0x03B  0x36600         ||    MOV  R6, 0x00
(0093)  CS-0x03C  0x08199         ||    CALL draw_dot   ;draw red square at origin
(0094)                            || 
(0095)                            ||     
(0096)  CS-0x03D  0x04439         ||    MOV  R4, R7   ;y coordin
(0097)  CS-0x03E  0x04541         ||    MOV  R5, R8   ;x coordin
(0098)  CS-0x03F  0x36603         ||    MOV  R6, 0x03
(0099)  CS-0x040  0x08199         ||    CALL draw_dot   ;draw red square at origin
(0100)                            || 
(0101)                            || 
(0102)  CS-0x041  0x1A003         ||    RETIE
(0103)                            || 	   
(0104)                            || 
(0105)                            || 
(0106)  CS-0x042  0x08210  0x042  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0107)                            || 
(0108)                            || 
(0109)  CS-0x043  0x3712F  0x043  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0110)  CS-0x044  0x2D101  0x044  || outside_for0: 	SUB     R17, 0x01
(0111)                            || 
(0112)  CS-0x045  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0113)  CS-0x046  0x2D201  0x046  || middle_for0:  	SUB     R18, 0x01
(0114)                            ||              
(0115)  CS-0x047  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0116)  CS-0x048  0x2D301  0x048  || inside_for0:  	SUB     R19, 0x01
(0117)  CS-0x049  0x08243         ||              	BRNE    inside_for0
(0118)                            ||              
(0119)  CS-0x04A  0x23200         ||              	OR      R18, 0x00              
(0120)  CS-0x04B  0x08233         ||              	BRNE    middle_for0
(0121)                            ||              
(0122)  CS-0x04C  0x23100         ||              	OR      R17, 0x00               
(0123)  CS-0x04D  0x08223         ||              	BRNE    outside_for0
(0124)                            || 
(0125)  CS-0x04E  0x18002         || 				ret
(0126)                            || 
(0127)                            || .CSEG
(0128)                       1023  || .ORG 0x3FF
(0129)  CS-0x3FF  0x081C8  0x3FF  || VECTOR:      BRN ISR
(0130)                            || 





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
COL            0x01F   (0051)  ||  0043 
DD_OUT         0x035   (0083)  ||  
DONE           0x042   (0106)  ||  0054 0106 
DRAW_DOT       0x033   (0079)  ||  0070 0076 0093 0099 
DRAW_SHIP      0x029   (0065)  ||  0039 
END_MAIN       0x01D   (0046)  ||  0060 0063 
INSIDE_FOR0    0x048   (0116)  ||  0117 
ISR            0x039   (0090)  ||  0129 
MAIN           0x017   (0036)  ||  0047 
MIDDLE_FOR0    0x046   (0113)  ||  0120 
OUTSIDE_FOR0   0x044   (0110)  ||  0123 
PAUSE          0x043   (0109)  ||  0040 
SET_NEG        0x027   (0062)  ||  0057 
VECTOR         0x3FF   (0129)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x006   (0020)  ||  0053 
END_ROW        0x027   (0019)  ||  0033 0042 0052 
INSIDE_FOR_COUNT 0x02F   (0015)  ||  0115 
LEDS           0x040   (0013)  ||  
MIDDLE_FOR_COUNT 0x02F   (0016)  ||  0112 
OUTSIDE_FOR_COUNT 0x02F   (0017)  ||  0109 
SHIP_COLOR     0x003   (0021)  ||  0075 
SSEG           0x081   (0012)  ||  
VGA_COLOR      0x092   (0011)  ||  0085 
VGA_HADD       0x090   (0009)  ||  0084 
VGA_LADD       0x091   (0010)  ||  0083 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
