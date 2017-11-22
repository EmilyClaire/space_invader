

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
(0020)                       032  || .EQU INTERRUPT_ID  = 0x20
(0021)                            || 
(0022)                            || 
(0023)                            || .CSEG
(0024)                       016  || .ORG 0x10
(0025)                            || 
(0026)  CS-0x010  0x1A000         ||    SEI
(0027)                            || 
(0028)                     0x011  || reset:
(0029)  CS-0x011  0x081C9         || 	    CALL clear_row
(0030)  CS-0x012  0x36828         || 		MOV R8, 0x28
(0031)  CS-0x013  0x3671D         || 		MOV R7, 0x1D
(0032)  CS-0x014  0x36600         || 		MOV R6, 0x00
(0033)                     0x015  || reset_loop:
(0034)  CS-0x015  0x04439         || 		MOV R4, R7
(0035)  CS-0x016  0x04541         || 		MOV R5, R8
(0036)  CS-0x017  0x08341         || 		call draw_dot
(0037)  CS-0x018  0x2C801         || 		SUB R8, 0x01
(0038)  CS-0x019  0x080AB         || 		BRNE reset_loop
(0039)                            || 
(0040)  CS-0x01A  0x2C701         || 		SUB R7, 0x01
(0041)  CS-0x01B  0x307FF         || 		CMP R7, 0xFF
(0042)  CS-0x01C  0x080AB         || 		BRNE reset_loop
(0043)                            || 	
(0044)  CS-0x01D  0x08379         || 		call pause
(0045)                            || 
(0046)  CS-0x01E  0x37B1B         ||    MOV  R27, 0x1B
(0047)  CS-0x01F  0x37C14         ||    MOV  R28, 0x14
(0048)  CS-0x020  0x366FF         || 	MOV R6, 0xFF
(0049)  CS-0x021  0x044D9         || 	MOV R4, R27
(0050)  CS-0x022  0x045E1         || 	MOV R5, R28
(0051)  CS-0x023  0x08341         || 	call draw_dot
(0052)                            || 
(0053)  CS-0x024  0x36700         ||    MOV  R7, 0x00
(0054)  CS-0x025  0x36800         ||    MOV  R8, 0x00 
(0055)  CS-0x026  0x36A25         ||    MOV  R10, END_ROW
(0056)  CS-0x027  0x36B01         || 	MOV R11, 0x01
(0057)  CS-0x028  0x36303         || 	MOV R3, 0x03
(0058)                            || 	
(0059)                     0x029  || start:
(0060)  CS-0x029  0x04439         || 	MOV R4, R7
(0061)  CS-0x02A  0x04541         || 	MOV R5, R8
(0062)  CS-0x02B  0x082D1         || 	CALL draw_ship
(0063)  CS-0x02C  0x02858         || 	ADD R8, R11
(0064)  CS-0x02D  0x2C301         || 	SUB R3, 0x01
(0065)  CS-0x02E  0x0814B         || 	BRNE start
(0066)                            || 
(0067)  CS-0x02F  0x08379         || call pause
(0068)                     0x030  || MAIN:     
(0069)                            || 			
(0070)  CS-0x030  0x04439         ||             MOV  R4, R7   ;y coordin
(0071)  CS-0x031  0x04541         || 			MOV  R5, R8   ;x coordin
(0072)  CS-0x032  0x082D1         || 			call draw_ship  
(0073)  CS-0x033  0x08379  0x033  || main_pause:	call pause
(0074)                            || 			
(0075)                            || 
(0076)  CS-0x034  0x2CA01  0x034  || ret_pause:	SUB R10, 0x01
(0077)  CS-0x035  0x30A00         || 			CMP R10, 0x00
(0078)  CS-0x036  0x081F2         || 			BREQ col
(0079)                            || 
(0080)                            || 
(0081)  CS-0x037  0x02858  0x037  || end_main:	ADD R8, R11
(0082)  CS-0x038  0x08180         || 			BRN MAIN
(0083)                            || 
(0084)                            || 
(0085)                            || 
(0086)                            || 
(0087)                            || 
(0088)                            || 
(0089)                     0x039  || clear_row:
(0090)                            || 
(0091)                            ||    
(0092)  CS-0x039  0x083D9         ||    CALL clear_square
(0093)  CS-0x03A  0x2C801         ||    SUB R8, 0x01
(0094)  CS-0x03B  0x308FF         ||    CMP R8, 0xFF
(0095)  CS-0x03C  0x081CB         ||    BRNE clear_row
(0096)  CS-0x03D  0x18002         ||    RET
(0097)                            || 
(0098)                            || 
(0099)                            || 
(0100)                            || 
(0101)                            || 
(0102)                            || 
(0103)                            || 
(0104)                            || 
(0105)  CS-0x03E  0x28701  0x03E  || col:		ADD R7, 0x01
(0106)  CS-0x03F  0x36A25         || 			MOV R10, END_ROW
(0107)  CS-0x040  0x3071D         || 			CMP R7, END_COL
(0108)  CS-0x041  0x08372         || 			BREQ DONE
(0109)                            || 			
(0110)  CS-0x042  0x30B01         || 			CMP R11, 0x01
(0111)  CS-0x043  0x0824A         || 			BREQ set_neg
(0112)                            || 	
(0113)  CS-0x044  0x36B01         || 			MOV R11, 0x01
(0114)  CS-0x045  0x08271         || 			call clear_ship
(0115)  CS-0x046  0x36800         || 			MOV R8, 0x00
(0116)  CS-0x047  0x36303         || 			MOV R3, 0x03
(0117)  CS-0x048  0x08148         || 			BRN start
(0118)                            || 
(0119)  CS-0x049  0x36BFF  0x049  || set_neg:	MOV R11, 0xFF
(0120)  CS-0x04A  0x08271         || 			CALL clear_ship
(0121)  CS-0x04B  0x36827         || 			MOV R8, 0x27
(0122)  CS-0x04C  0x36303         || 			MoV R3, 0x03
(0123)  CS-0x04D  0x08148         || 			brn start
(0124)                            || 
(0125)                            || 
(0126)                     0x04E  || clear_ship:
(0127)  CS-0x04E  0x2C701         || 			SUB R7, 0x01
(0128)  CS-0x04F  0x36303         || 			MOV R3, 0x03
(0129)  CS-0x050  0x36600         || 			MOV R6, 0x00
(0130)                     0x051  || clear_loop: 
(0131)  CS-0x051  0x04541         || 			MOV R5, R8
(0132)  CS-0x052  0x04439         || 			MOV R4, R7
(0133)  CS-0x053  0x08341         || 			call draw_dot
(0134)  CS-0x054  0x02858         || 			ADD R8, R11
(0135)  CS-0x055  0x2C301         || 			SUB R3, 0x01
(0136)  CS-0x056  0x30303         || 			CMP R3, 0x03
(0137)  CS-0x057  0x0828B         || 			BRNE clear_loop
(0138)                            || 						
(0139)  CS-0x058  0x28701         || 			ADD R7, 0x01
(0140)  CS-0x059  0x18002         || 			ret
(0141)                            || 
(0142)                            || 
(0143)                     0x05A  || draw_ship:
(0144)  CS-0x05A  0x04541         || 			MOV R5, R8
(0145)  CS-0x05B  0x04439         || 			MOV R4, R7
(0146)  CS-0x05C  0x36600         || 			MOV R6, 0x00
(0147)                            || 
(0148)                            || 
(0149)  CS-0x05D  0x30BFF         || 			CMP R11, 0xFF
(0150)  CS-0x05E  0x0830A         || 			BREQ draw_neg
(0151)                            || 
(0152)  CS-0x05F  0x2C503         || 			SUB R5, 0x03
(0153)  CS-0x060  0x08310         || 			brn rest
(0154)                            || 
(0155)  CS-0x061  0x28503  0x061  || draw_neg:	ADD R5, 0x03
(0156)                            || 
(0157)  CS-0x062  0x08341  0x062  || rest:		call draw_dot
(0158)                            || 
(0159)                            || 
(0160)  CS-0x063  0x04541         || 			MOV R5, R8
(0161)  CS-0x064  0x04439         || 			MOV R4, R7
(0162)  CS-0x065  0x366E0         || 			MOV R6, SHIP_COLOR
(0163)  CS-0x066  0x08341         || 			call draw_dot
(0164)  CS-0x067  0x18002         || 			ret
(0165)                            || 
(0166)                     0x068  || draw_dot: 
(0167)  CS-0x068  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0168)  CS-0x069  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0169)                            || 
(0170)  CS-0x06A  0x34591  0x06A  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0171)  CS-0x06B  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0172)  CS-0x06C  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0173)  CS-0x06D  0x18002         ||         RET
(0174)                            || 	   
(0175)  CS-0x06E  0x08370  0x06E  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0176)                            || 
(0177)                            || 
(0178)  CS-0x06F  0x3712F  0x06F  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0179)  CS-0x070  0x2D101  0x070  || outside_for0: 	SUB     R17, 0x01
(0180)                            || 
(0181)  CS-0x071  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0182)  CS-0x072  0x2D201  0x072  || middle_for0:  	SUB     R18, 0x01
(0183)                            ||              
(0184)  CS-0x073  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0185)  CS-0x074  0x2D301  0x074  || inside_for0:  	SUB     R19, 0x01
(0186)  CS-0x075  0x083A3         ||              	BRNE    inside_for0
(0187)                            ||              
(0188)  CS-0x076  0x23200         ||              	OR      R18, 0x00              
(0189)  CS-0x077  0x08393         ||              	BRNE    middle_for0
(0190)                            ||              
(0191)  CS-0x078  0x23100         ||              	OR      R17, 0x00               
(0192)  CS-0x079  0x08383         ||              	BRNE    outside_for0
(0193)                            || 
(0194)  CS-0x07A  0x18002         || 				ret
(0195)                            || 
(0196)                     0x07B  || clear_square:
(0197)                            || 
(0198)  CS-0x07B  0x044D9         ||    MOV  R4, R27   ;y coordin
(0199)  CS-0x07C  0x045E1         ||    MOV  R5, R28   ;x coordin
(0200)  CS-0x07D  0x36600         ||    MOV  R6, 0x00
(0201)  CS-0x07E  0x08341         ||    CALL draw_dot   ;clears dot at the origin
(0202)  CS-0x07F  0x18002         ||    RET
(0203)                            || 
(0204)                            || ;		mov r29, 0x01
(0205)                            || ;		mov r30, 0x02
(0206)                            ||  ;       mov r31, 0x03
(0207)                            || 
(0208)                     0x080  || ISR: 
(0209)  CS-0x080  0x33620         ||    IN R22, INTERRUPT_ID
(0210)                            || 	
(0211)  CS-0x081  0x31600         || 	cmp r22, 0x00
(0212)  CS-0x082  0x0845A         ||     breq testing
(0213)                            || 	
(0214)  CS-0x083  0x31603         ||    CMP R22, 0x03
(0215)  CS-0x084  0x08482         ||    BREQ shoot
(0216)                            || 
(0217)  CS-0x085  0x31602         ||    CMP R22, 0x02
(0218)  CS-0x086  0x084C2         ||    BREQ moveLeft   
(0219)                            || 
(0220)  CS-0x087  0x31601         ||    CMP R22, 0x01  
(0221)  CS-0x088  0x0850A         ||    BREQ moveRight
(0222)                            || 
(0223)  CS-0x089  0x08458         ||    brn testing
(0224)                            || 
(0225)  CS-0x08A  0x08550         ||    brn ISR_END
(0226)                            || 
(0227)                     0x08B  || testing: 
(0228)  CS-0x08B  0x044D9         ||    MOV  R4, R27   ;y coordin
(0229)  CS-0x08C  0x045E1         ||    MOV  R5, R28   ;x coordin
(0230)                            || 
(0231)  CS-0x08D  0x36603         || 	mov r6, 0x03
(0232)  CS-0x08E  0x08341         ||     call draw_dot
(0233)  CS-0x08F  0x08550         ||     brn isr_end
(0234)                            || 
(0235)                     0x090  || shoot: 
(0236)  CS-0x090  0x044D9         ||    MOV  R4, R27   ;y coordin
(0237)  CS-0x091  0x045E1         ||    MOV  R5, R28   ;x coordin
(0238)                            || 
(0239)  CS-0x092  0x366E0         || 	  mov R6, 0xE0
(0240)  CS-0x093  0x08341         || 	  call draw_dot
(0241)  CS-0x094  0x08379         ||       call pause
(0242)  CS-0x095  0x366FF         || 	  mov R6, 0xFF
(0243)  CS-0x096  0x08341         ||       call draw_dot
(0244)  CS-0x097  0x08550         || 	  brn ISR_END
(0245)                            || 
(0246)                     0x098  || moveLeft:
(0247)  CS-0x098  0x31C00         || 	CMP R28, 0x00
(0248)  CS-0x099  0x08552         || 	BREQ ISR_END
(0249)                            || 
(0250)  CS-0x09A  0x083D9         ||    CALL clear_square
(0251)                            || 
(0252)                            ||    
(0253)  CS-0x09B  0x2DC01         ||    SUB  R28, 0x01  
(0254)                            || 
(0255)                            || 
(0256)  CS-0x09C  0x044D9         ||    MOV  R4, R27   ;y coordin
(0257)  CS-0x09D  0x045E1         ||    MOV  R5, R28   ;x coordin
(0258)  CS-0x09E  0x366FF         ||    MOV  R6, 0xFF
(0259)  CS-0x09F  0x08341         ||    CALL draw_dot   ;draw red square at origin
(0260)  CS-0x0A0  0x08550         ||    brn ISR_END
(0261)                            || 
(0262)                     0x0A1  || moveRight:
(0263)  CS-0x0A1  0x31C25         || 	CMP R28, END_ROW
(0264)  CS-0x0A2  0x08552         || 	BREQ ISR_END
(0265)                            || 
(0266)  CS-0x0A3  0x083D9         ||    CALL clear_square
(0267)                            || 
(0268)                            ||    
(0269)  CS-0x0A4  0x29C01         ||    ADD  R28, 0x01  
(0270)                            || 
(0271)                            || 
(0272)  CS-0x0A5  0x044D9         ||    MOV  R4, R27   ;y coordin
(0273)  CS-0x0A6  0x045E1         ||    MOV  R5, R28   ;x coordin
(0274)  CS-0x0A7  0x366FF         ||    MOV  R6, 0xFF
(0275)  CS-0x0A8  0x08341         ||    CALL draw_dot   ;draw red square at origin
(0276)                            ||    
(0277)  CS-0x0A9  0x08550         || 	brn ISR_END
(0278)                     0x0AA  || ISR_END:
(0279)  CS-0x0AA  0x1A003         || 		RETIE
(0280)                            || 
(0281)                            || .CSEG
(0282)                       1023  || .ORG 0x3FF
(0283)  CS-0x3FF  0x08400  0x3FF  || VECTOR:      BRN ISR
(0284)                            || 





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
CLEAR_LOOP     0x051   (0130)  ||  0137 
CLEAR_ROW      0x039   (0089)  ||  0029 0095 
CLEAR_SHIP     0x04E   (0126)  ||  0114 0120 
CLEAR_SQUARE   0x07B   (0196)  ||  0092 0250 0266 
COL            0x03E   (0105)  ||  0078 
DD_OUT         0x06A   (0170)  ||  
DONE           0x06E   (0175)  ||  0108 0175 
DRAW_DOT       0x068   (0166)  ||  0036 0051 0133 0157 0163 0201 0232 0240 0243 0259 
                               ||  0275 
DRAW_NEG       0x061   (0155)  ||  0150 
DRAW_SHIP      0x05A   (0143)  ||  0062 0072 
END_MAIN       0x037   (0081)  ||  
INSIDE_FOR0    0x074   (0185)  ||  0186 
ISR            0x080   (0208)  ||  0283 
ISR_END        0x0AA   (0278)  ||  0225 0233 0244 0248 0260 0264 0277 
MAIN           0x030   (0068)  ||  0082 
MAIN_PAUSE     0x033   (0073)  ||  
MIDDLE_FOR0    0x072   (0182)  ||  0189 
MOVELEFT       0x098   (0246)  ||  0218 
MOVERIGHT      0x0A1   (0262)  ||  0221 
OUTSIDE_FOR0   0x070   (0179)  ||  0192 
PAUSE          0x06F   (0178)  ||  0044 0067 0073 0241 
RESET          0x011   (0028)  ||  
RESET_LOOP     0x015   (0033)  ||  0038 0042 
REST           0x062   (0157)  ||  0153 
RET_PAUSE      0x034   (0076)  ||  
SET_NEG        0x049   (0119)  ||  0111 
SHOOT          0x090   (0235)  ||  0215 
START          0x029   (0059)  ||  0065 0117 0123 
TESTING        0x08B   (0227)  ||  0212 0223 
VECTOR         0x3FF   (0283)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0015)  ||  0107 
END_ROW        0x025   (0014)  ||  0055 0106 0263 
INSIDE_FOR_COUNT 0x02F   (0010)  ||  0184 
INTERRUPT_ID   0x020   (0020)  ||  0209 
LEDS           0x040   (0008)  ||  
MIDDLE_FOR_COUNT 0x02F   (0011)  ||  0181 
OUTSIDE_FOR_COUNT 0x02F   (0012)  ||  0178 
SHIP_COLOR     0x0E0   (0016)  ||  0162 
SSEG           0x081   (0007)  ||  
VGA_COLOR      0x092   (0006)  ||  0172 
VGA_HADD       0x090   (0004)  ||  0171 
VGA_LADD       0x091   (0005)  ||  0170 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
