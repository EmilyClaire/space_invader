

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
(0007)                       064  || .EQU LEDS = 0x40
(0008)                            || 
(0009)                       047  || .EQU INSIDE_FOR_COUNT    = 	0x2f
(0010)                       047  || .EQU MIDDLE_FOR_COUNT    = 0x2f
(0011)                       047  || .EQU OUTSIDE_FOR_COUNT   = 0x2f
(0012)                            || 
(0013)                       037  || .equ END_ROW = 0x25
(0014)                       029  || .equ END_COL = 0x1D
(0015)                       224  || .equ SHIP_COLOR = 0xE0;0x03 ;blue
(0016)                            || 					   ;0xE0 ;red
(0017)                            || 					   ; 0x1C    ;green
(0018)                            || 
(0019)                       032  || .EQU INTERRUPT_ID  = 0x20
(0020)                            || 
(0021)                       096  || .equ SSEG_CNTR_ID = 0x60
(0022)                       128  || .equ SSEG_VAL_ID  = 0x80
(0023)                            || 
(0024)                            || .CSEG
(0025)                       016  || .ORG 0x10
(0026)                            || 
(0027)  CS-0x010  0x1A000         ||    SEI
(0028)                            || 
(0029)  CS-0x011  0x36281         || MOV R2, 0x81
(0030)  CS-0x012  0x34260         || OUT R2, SSEG_CNTR_ID
(0031)                     0x013  || reset:
(0032)  CS-0x013  0x081D9         || 	    CALL clear_row
(0033)  CS-0x014  0x36828         || 		MOV R8, 0x28
(0034)  CS-0x015  0x3671D         || 		MOV R7, 0x1D
(0035)  CS-0x016  0x36600         || 		MOV R6, 0x00
(0036)                     0x017  || reset_loop:
(0037)  CS-0x017  0x04439         || 		MOV R4, R7
(0038)  CS-0x018  0x04541         || 		MOV R5, R8
(0039)  CS-0x019  0x08351         || 		call draw_dot
(0040)  CS-0x01A  0x2C801         || 		SUB R8, 0x01
(0041)  CS-0x01B  0x080BB         || 		BRNE reset_loop
(0042)                            || 
(0043)  CS-0x01C  0x2C701         || 		SUB R7, 0x01
(0044)  CS-0x01D  0x307FF         || 		CMP R7, 0xFF
(0045)  CS-0x01E  0x080BB         || 		BRNE reset_loop
(0046)                            || 	
(0047)  CS-0x01F  0x08389         || 		call pause
(0048)                            || 
(0049)  CS-0x020  0x37B1B         ||    MOV  R27, 0x1B
(0050)  CS-0x021  0x37C14         ||    MOV  R28, 0x14
(0051)  CS-0x022  0x366FF         || 	MOV R6, 0xFF
(0052)  CS-0x023  0x044D9         || 	MOV R4, R27
(0053)  CS-0x024  0x045E1         || 	MOV R5, R28
(0054)  CS-0x025  0x08351         || 	call draw_dot
(0055)                            || 
(0056)  CS-0x026  0x36700         ||    MOV  R7, 0x00
(0057)  CS-0x027  0x36800         ||    MOV  R8, 0x00 
(0058)  CS-0x028  0x36A25         ||    MOV  R10, END_ROW
(0059)  CS-0x029  0x36B01         || 	MOV R11, 0x01
(0060)  CS-0x02A  0x36303         || 	MOV R3, 0x03
(0061)                            || 	
(0062)                     0x02B  || start:
(0063)  CS-0x02B  0x04439         || 	MOV R4, R7
(0064)  CS-0x02C  0x04541         || 	MOV R5, R8
(0065)  CS-0x02D  0x082E1         || 	CALL draw_ship
(0066)  CS-0x02E  0x02858         || 	ADD R8, R11
(0067)  CS-0x02F  0x2C301         || 	SUB R3, 0x01
(0068)  CS-0x030  0x0815B         || 	BRNE start
(0069)                            || 
(0070)  CS-0x031  0x08389         || call pause
(0071)                     0x032  || MAIN:     
(0072)                            || 			
(0073)  CS-0x032  0x04439         ||             MOV  R4, R7   ;y coordin
(0074)  CS-0x033  0x04541         || 			MOV  R5, R8   ;x coordin
(0075)  CS-0x034  0x082E1         || 			call draw_ship  
(0076)  CS-0x035  0x08389  0x035  || main_pause:	call pause
(0077)                            || 			
(0078)                            || 
(0079)  CS-0x036  0x2CA01  0x036  || ret_pause:	SUB R10, 0x01
(0080)  CS-0x037  0x30A00         || 			CMP R10, 0x00
(0081)  CS-0x038  0x08202         || 			BREQ col
(0082)                            || 
(0083)                            || 
(0084)  CS-0x039  0x02858  0x039  || end_main:	ADD R8, R11
(0085)  CS-0x03A  0x08190         || 			BRN MAIN
(0086)                            || 
(0087)                            || 
(0088)                            || 
(0089)                            || 
(0090)                            || 
(0091)                            || 
(0092)                     0x03B  || clear_row:
(0093)                            || 
(0094)                            ||    
(0095)  CS-0x03B  0x083E9         ||    CALL clear_square
(0096)  CS-0x03C  0x2C801         ||    SUB R8, 0x01
(0097)  CS-0x03D  0x308FF         ||    CMP R8, 0xFF
(0098)  CS-0x03E  0x081DB         ||    BRNE clear_row
(0099)  CS-0x03F  0x18002         ||    RET
(0100)                            || 
(0101)                            || 
(0102)                            || 
(0103)                            || 
(0104)                            || 
(0105)                            || 
(0106)                            || 
(0107)                            || 
(0108)  CS-0x040  0x28701  0x040  || col:		ADD R7, 0x01
(0109)  CS-0x041  0x36A25         || 			MOV R10, END_ROW
(0110)  CS-0x042  0x3071D         || 			CMP R7, END_COL
(0111)  CS-0x043  0x08382         || 			BREQ DONE
(0112)                            || 			
(0113)  CS-0x044  0x30B01         || 			CMP R11, 0x01
(0114)  CS-0x045  0x0825A         || 			BREQ set_neg
(0115)                            || 	
(0116)  CS-0x046  0x36B01         || 			MOV R11, 0x01
(0117)  CS-0x047  0x08281         || 			call clear_ship
(0118)  CS-0x048  0x36800         || 			MOV R8, 0x00
(0119)  CS-0x049  0x36303         || 			MOV R3, 0x03
(0120)  CS-0x04A  0x08158         || 			BRN start
(0121)                            || 
(0122)  CS-0x04B  0x36BFF  0x04B  || set_neg:	MOV R11, 0xFF
(0123)  CS-0x04C  0x08281         || 			CALL clear_ship
(0124)  CS-0x04D  0x36827         || 			MOV R8, 0x27
(0125)  CS-0x04E  0x36303         || 			MoV R3, 0x03
(0126)  CS-0x04F  0x08158         || 			brn start
(0127)                            || 
(0128)                            || 
(0129)                     0x050  || clear_ship:
(0130)  CS-0x050  0x2C701         || 			SUB R7, 0x01
(0131)  CS-0x051  0x36303         || 			MOV R3, 0x03
(0132)  CS-0x052  0x36600         || 			MOV R6, 0x00
(0133)                     0x053  || clear_loop: 
(0134)  CS-0x053  0x04541         || 			MOV R5, R8
(0135)  CS-0x054  0x04439         || 			MOV R4, R7
(0136)  CS-0x055  0x08351         || 			call draw_dot
(0137)  CS-0x056  0x02858         || 			ADD R8, R11
(0138)  CS-0x057  0x2C301         || 			SUB R3, 0x01
(0139)  CS-0x058  0x30303         || 			CMP R3, 0x03
(0140)  CS-0x059  0x0829B         || 			BRNE clear_loop
(0141)                            || 						
(0142)  CS-0x05A  0x28701         || 			ADD R7, 0x01
(0143)  CS-0x05B  0x18002         || 			ret
(0144)                            || 
(0145)                            || 
(0146)                     0x05C  || draw_ship:
(0147)  CS-0x05C  0x04541         || 			MOV R5, R8
(0148)  CS-0x05D  0x04439         || 			MOV R4, R7
(0149)  CS-0x05E  0x36600         || 			MOV R6, 0x00
(0150)                            || 
(0151)                            || 
(0152)  CS-0x05F  0x30BFF         || 			CMP R11, 0xFF
(0153)  CS-0x060  0x0831A         || 			BREQ draw_neg
(0154)                            || 
(0155)  CS-0x061  0x2C503         || 			SUB R5, 0x03
(0156)  CS-0x062  0x08320         || 			brn rest
(0157)                            || 
(0158)  CS-0x063  0x28503  0x063  || draw_neg:	ADD R5, 0x03
(0159)                            || 
(0160)  CS-0x064  0x08351  0x064  || rest:		call draw_dot
(0161)                            || 
(0162)                            || 
(0163)  CS-0x065  0x04541         || 			MOV R5, R8
(0164)  CS-0x066  0x04439         || 			MOV R4, R7
(0165)  CS-0x067  0x366E0         || 			MOV R6, SHIP_COLOR
(0166)  CS-0x068  0x08351         || 			call draw_dot
(0167)  CS-0x069  0x18002         || 			ret
(0168)                            || 
(0169)                     0x06A  || draw_dot: 
(0170)  CS-0x06A  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0171)  CS-0x06B  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0172)                            || 
(0173)  CS-0x06C  0x34591  0x06C  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0174)  CS-0x06D  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0175)  CS-0x06E  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0176)  CS-0x06F  0x18002         ||         RET
(0177)                            || 	   
(0178)  CS-0x070  0x08380  0x070  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0179)                            || 
(0180)                            || 
(0181)  CS-0x071  0x3712F  0x071  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0182)  CS-0x072  0x2D101  0x072  || outside_for0: 	SUB     R17, 0x01
(0183)                            || 
(0184)  CS-0x073  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0185)  CS-0x074  0x2D201  0x074  || middle_for0:  	SUB     R18, 0x01
(0186)                            ||              
(0187)  CS-0x075  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0188)  CS-0x076  0x2D301  0x076  || inside_for0:  	SUB     R19, 0x01
(0189)  CS-0x077  0x083B3         ||              	BRNE    inside_for0
(0190)                            ||              
(0191)  CS-0x078  0x23200         ||              	OR      R18, 0x00              
(0192)  CS-0x079  0x083A3         ||              	BRNE    middle_for0
(0193)                            ||              
(0194)  CS-0x07A  0x23100         ||              	OR      R17, 0x00               
(0195)  CS-0x07B  0x08393         ||              	BRNE    outside_for0
(0196)                            || 
(0197)  CS-0x07C  0x18002         || 				ret
(0198)                            || 
(0199)                     0x07D  || clear_square:
(0200)                            || 
(0201)  CS-0x07D  0x044D9         ||    MOV  R4, R27   ;y coordin
(0202)  CS-0x07E  0x045E1         ||    MOV  R5, R28   ;x coordin
(0203)  CS-0x07F  0x36600         ||    MOV  R6, 0x00
(0204)  CS-0x080  0x08351         ||    CALL draw_dot   ;clears dot at the origin
(0205)  CS-0x081  0x18002         ||    RET
(0206)                            || 
(0207)                            || ;		mov r29, 0x01
(0208)                            || ;		mov r30, 0x02
(0209)                            ||  ;       mov r31, 0x03
(0210)                            || 
(0211)                     0x082  || ISR: 
(0212)  CS-0x082  0x33620         ||    IN R22, INTERRUPT_ID
(0213)  CS-0x083  0x35680         || 	OUT  R22, SSEG_VAL_ID
(0214)                            || 
(0215)  CS-0x084  0x31600         || 	cmp r22, 0x00
(0216)  CS-0x085  0x0847A         ||     breq testing0
(0217)                            || 
(0218)  CS-0x086  0x31605         || 	cmp r22, 0x05
(0219)  CS-0x087  0x084BA         || 	breq testing5
(0220)                            || 
(0221)  CS-0x088  0x31603         ||    CMP R22, 0x03
(0222)  CS-0x089  0x084FA         ||    BREQ shoot
(0223)                            || 
(0224)  CS-0x08A  0x31615         ||    CMP R22, 0x15
(0225)  CS-0x08B  0x0853A         ||    BREQ moveLeft   
(0226)                            || 
(0227)  CS-0x08C  0x31601         ||    CMP R22, 0x01  
(0228)  CS-0x08D  0x08582         ||    BREQ moveRight
(0229)                            || 
(0230)  CS-0x08E  0x085C8         ||    brn ISR_END
(0231)                            || 
(0232)                     0x08F  || testing0: 
(0233)  CS-0x08F  0x044D9         ||    MOV  R4, R27   ;y coordin
(0234)  CS-0x090  0x045E1         ||    MOV  R5, R28   ;x coordin
(0235)                            || 
(0236)  CS-0x091  0x36603         || 	mov r6, 0x03
(0237)  CS-0x092  0x08351         ||     call draw_dot
(0238)  CS-0x093  0x08389         || 	call pause
(0239)  CS-0x094  0x366FF         || 	mov r6, 0xff
(0240)  CS-0x095  0x08351         || 	call draw_dot
(0241)  CS-0x096  0x085C8         ||     brn isr_end
(0242)                            || 
(0243)                            || 
(0244)                            || 
(0245)                     0x097  || testing5: 
(0246)  CS-0x097  0x044D9         ||    MOV  R4, R27   ;y coordin
(0247)  CS-0x098  0x045E1         ||    MOV  R5, R28   ;x coordin
(0248)                            || 
(0249)  CS-0x099  0x3661C         || 	mov r6, 0x1c
(0250)  CS-0x09A  0x08351         ||     call draw_dot
(0251)  CS-0x09B  0x08389         || 	call pause
(0252)  CS-0x09C  0x366FF         || 	mov r6, 0xff
(0253)  CS-0x09D  0x08351         || 	call draw_dot
(0254)  CS-0x09E  0x085C8         ||     brn isr_end
(0255)                            || 
(0256)                            || 
(0257)                     0x09F  || shoot: 
(0258)  CS-0x09F  0x044D9         ||    MOV  R4, R27   ;y coordin
(0259)  CS-0x0A0  0x045E1         ||    MOV  R5, R28   ;x coordin
(0260)                            || 
(0261)  CS-0x0A1  0x366E0         || 	  mov R6, 0xE0
(0262)  CS-0x0A2  0x08351         || 	  call draw_dot
(0263)  CS-0x0A3  0x08389         ||       call pause
(0264)  CS-0x0A4  0x366FF         || 	  mov R6, 0xFF
(0265)  CS-0x0A5  0x08351         ||       call draw_dot
(0266)  CS-0x0A6  0x085C8         || 	  brn ISR_END
(0267)                            || 
(0268)                     0x0A7  || moveLeft:
(0269)  CS-0x0A7  0x31C00         || 	CMP R28, 0x00
(0270)  CS-0x0A8  0x085CA         || 	BREQ ISR_END
(0271)                            || 
(0272)  CS-0x0A9  0x083E9         ||    CALL clear_square
(0273)                            || 
(0274)                            ||    
(0275)  CS-0x0AA  0x2DC01         ||    SUB  R28, 0x01  
(0276)                            || 
(0277)                            || 
(0278)  CS-0x0AB  0x044D9         ||    MOV  R4, R27   ;y coordin
(0279)  CS-0x0AC  0x045E1         ||    MOV  R5, R28   ;x coordin
(0280)  CS-0x0AD  0x366FF         ||    MOV  R6, 0xFF
(0281)  CS-0x0AE  0x08351         ||    CALL draw_dot   ;draw red square at origin
(0282)  CS-0x0AF  0x085C8         ||    brn ISR_END
(0283)                            || 
(0284)                     0x0B0  || moveRight:
(0285)  CS-0x0B0  0x31C25         || 	CMP R28, END_ROW
(0286)  CS-0x0B1  0x085CA         || 	BREQ ISR_END
(0287)                            || 
(0288)  CS-0x0B2  0x083E9         ||    CALL clear_square
(0289)                            || 
(0290)                            ||    
(0291)  CS-0x0B3  0x29C01         ||    ADD  R28, 0x01  
(0292)                            || 
(0293)                            || 
(0294)  CS-0x0B4  0x044D9         ||    MOV  R4, R27   ;y coordin
(0295)  CS-0x0B5  0x045E1         ||    MOV  R5, R28   ;x coordin
(0296)  CS-0x0B6  0x366FF         ||    MOV  R6, 0xFF
(0297)  CS-0x0B7  0x08351         ||    CALL draw_dot   ;draw red square at origin
(0298)                            ||    
(0299)  CS-0x0B8  0x085C8         || 	brn ISR_END
(0300)                     0x0B9  || ISR_END:
(0301)  CS-0x0B9  0x1A003         || 		RETIE
(0302)                            || 
(0303)                            || .CSEG
(0304)                       1023  || .ORG 0x3FF
(0305)  CS-0x3FF  0x08410  0x3FF  || VECTOR:      BRN ISR
(0306)                            || 





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
CLEAR_LOOP     0x053   (0133)  ||  0140 
CLEAR_ROW      0x03B   (0092)  ||  0032 0098 
CLEAR_SHIP     0x050   (0129)  ||  0117 0123 
CLEAR_SQUARE   0x07D   (0199)  ||  0095 0272 0288 
COL            0x040   (0108)  ||  0081 
DD_OUT         0x06C   (0173)  ||  
DONE           0x070   (0178)  ||  0111 0178 
DRAW_DOT       0x06A   (0169)  ||  0039 0054 0136 0160 0166 0204 0237 0240 0250 0253 
                               ||  0262 0265 0281 0297 
DRAW_NEG       0x063   (0158)  ||  0153 
DRAW_SHIP      0x05C   (0146)  ||  0065 0075 
END_MAIN       0x039   (0084)  ||  
INSIDE_FOR0    0x076   (0188)  ||  0189 
ISR            0x082   (0211)  ||  0305 
ISR_END        0x0B9   (0300)  ||  0230 0241 0254 0266 0270 0282 0286 0299 
MAIN           0x032   (0071)  ||  0085 
MAIN_PAUSE     0x035   (0076)  ||  
MIDDLE_FOR0    0x074   (0185)  ||  0192 
MOVELEFT       0x0A7   (0268)  ||  0225 
MOVERIGHT      0x0B0   (0284)  ||  0228 
OUTSIDE_FOR0   0x072   (0182)  ||  0195 
PAUSE          0x071   (0181)  ||  0047 0070 0076 0238 0251 0263 
RESET          0x013   (0031)  ||  
RESET_LOOP     0x017   (0036)  ||  0041 0045 
REST           0x064   (0160)  ||  0156 
RET_PAUSE      0x036   (0079)  ||  
SET_NEG        0x04B   (0122)  ||  0114 
SHOOT          0x09F   (0257)  ||  0222 
START          0x02B   (0062)  ||  0068 0120 0126 
TESTING0       0x08F   (0232)  ||  0216 
TESTING5       0x097   (0245)  ||  0219 
VECTOR         0x3FF   (0305)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0014)  ||  0110 
END_ROW        0x025   (0013)  ||  0058 0109 0285 
INSIDE_FOR_COUNT 0x02F   (0009)  ||  0187 
INTERRUPT_ID   0x020   (0019)  ||  0212 
LEDS           0x040   (0007)  ||  
MIDDLE_FOR_COUNT 0x02F   (0010)  ||  0184 
OUTSIDE_FOR_COUNT 0x02F   (0011)  ||  0181 
SHIP_COLOR     0x0E0   (0015)  ||  0165 
SSEG_CNTR_ID   0x060   (0021)  ||  0030 
SSEG_VAL_ID    0x080   (0022)  ||  0213 
VGA_COLOR      0x092   (0006)  ||  0175 
VGA_HADD       0x090   (0004)  ||  0174 
VGA_LADD       0x091   (0005)  ||  0173 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
