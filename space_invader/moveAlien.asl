

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
(0015)                       227  || .equ SHIP_COLOR = 0xE3;0x03 ;blue
(0016)                            || 					   ;0xE0 ;red
(0017)                            || 					   ; 0x1C    ;green
(0018)                            || 					; 0xE3 ; pink
(0019)                            || 						;0xFC ; yellow
(0020)                            || 					;0x1F aqua
(0021)                       032  || .EQU INTERRUPT_ID  = 0x20
(0022)                            || 
(0023)                       096  || .equ SSEG_CNTR_ID = 0x60
(0024)                       128  || .equ SSEG_VAL_ID  = 0x80
(0025)                            || 
(0026)                            || .CSEG
(0027)                       016  || .ORG 0x10
(0028)                            || 
(0029)  CS-0x010  0x1A000         ||    SEI
(0030)                            || 
(0031)  CS-0x011  0x36281         || MOV R2, 0x81
(0032)  CS-0x012  0x34260         || OUT R2, SSEG_CNTR_ID
(0033)                     0x013  || reset:
(0034)  CS-0x013  0x081D9         || 	    CALL clear_row
(0035)  CS-0x014  0x36828         || 		MOV R8, 0x28
(0036)  CS-0x015  0x3671D         || 		MOV R7, 0x1D
(0037)  CS-0x016  0x36600         || 		MOV R6, 0x00
(0038)                     0x017  || reset_loop:
(0039)  CS-0x017  0x04439         || 		MOV R4, R7
(0040)  CS-0x018  0x04541         || 		MOV R5, R8
(0041)  CS-0x019  0x08351         || 		call draw_dot
(0042)  CS-0x01A  0x2C801         || 		SUB R8, 0x01
(0043)  CS-0x01B  0x080BB         || 		BRNE reset_loop
(0044)                            || 
(0045)  CS-0x01C  0x2C701         || 		SUB R7, 0x01
(0046)  CS-0x01D  0x307FF         || 		CMP R7, 0xFF
(0047)  CS-0x01E  0x080BB         || 		BRNE reset_loop
(0048)                            || 	
(0049)  CS-0x01F  0x08389         || 		call pause
(0050)                            || 
(0051)  CS-0x020  0x37B1B         ||    MOV  R27, 0x1B
(0052)  CS-0x021  0x37C14         ||    MOV  R28, 0x14
(0053)  CS-0x022  0x366FF         || 	MOV R6, 0xFF
(0054)  CS-0x023  0x044D9         || 	MOV R4, R27
(0055)  CS-0x024  0x045E1         || 	MOV R5, R28
(0056)  CS-0x025  0x08351         || 	call draw_dot
(0057)                            || 
(0058)  CS-0x026  0x36700         ||    MOV  R7, 0x00
(0059)  CS-0x027  0x36800         ||    MOV  R8, 0x00 
(0060)  CS-0x028  0x36A25         ||    MOV  R10, END_ROW
(0061)  CS-0x029  0x36B01         || 	MOV R11, 0x01
(0062)  CS-0x02A  0x36303         || 	MOV R3, 0x03
(0063)                            || 	
(0064)                     0x02B  || start:
(0065)  CS-0x02B  0x04439         || 	MOV R4, R7
(0066)  CS-0x02C  0x04541         || 	MOV R5, R8
(0067)  CS-0x02D  0x082E1         || 	CALL draw_ship
(0068)  CS-0x02E  0x02858         || 	ADD R8, R11
(0069)  CS-0x02F  0x2C301         || 	SUB R3, 0x01
(0070)  CS-0x030  0x0815B         || 	BRNE start
(0071)                            || 
(0072)  CS-0x031  0x08389         || call pause
(0073)                     0x032  || MAIN:     
(0074)                            || 			
(0075)  CS-0x032  0x04439         ||             MOV  R4, R7   ;y coordin
(0076)  CS-0x033  0x04541         || 			MOV  R5, R8   ;x coordin
(0077)  CS-0x034  0x082E1         || 			call draw_ship  
(0078)  CS-0x035  0x08389  0x035  || main_pause:	call pause
(0079)                            || 			
(0080)                            || 
(0081)  CS-0x036  0x2CA01  0x036  || ret_pause:	SUB R10, 0x01
(0082)  CS-0x037  0x30A00         || 			CMP R10, 0x00
(0083)  CS-0x038  0x08202         || 			BREQ col
(0084)                            || 
(0085)                            || 
(0086)  CS-0x039  0x02858  0x039  || end_main:	ADD R8, R11
(0087)  CS-0x03A  0x08190         || 			BRN MAIN
(0088)                            || 
(0089)                            || 
(0090)                            || 
(0091)                            || 
(0092)                            || 
(0093)                            || 
(0094)                     0x03B  || clear_row:
(0095)                            || 
(0096)                            ||    
(0097)  CS-0x03B  0x083E9         ||    CALL clear_square
(0098)  CS-0x03C  0x2C801         ||    SUB R8, 0x01
(0099)  CS-0x03D  0x308FF         ||    CMP R8, 0xFF
(0100)  CS-0x03E  0x081DB         ||    BRNE clear_row
(0101)  CS-0x03F  0x18002         ||    RET
(0102)                            || 
(0103)                            || 
(0104)                            || 
(0105)                            || 
(0106)                            || 
(0107)                            || 
(0108)                            || 
(0109)                            || 
(0110)  CS-0x040  0x28701  0x040  || col:		ADD R7, 0x01
(0111)  CS-0x041  0x36A25         || 			MOV R10, END_ROW
(0112)  CS-0x042  0x3071D         || 			CMP R7, END_COL
(0113)  CS-0x043  0x08382         || 			BREQ DONE
(0114)                            || 			
(0115)  CS-0x044  0x30B01         || 			CMP R11, 0x01
(0116)  CS-0x045  0x0825A         || 			BREQ set_neg
(0117)                            || 	
(0118)  CS-0x046  0x36B01         || 			MOV R11, 0x01
(0119)  CS-0x047  0x08281         || 			call clear_ship
(0120)  CS-0x048  0x36800         || 			MOV R8, 0x00
(0121)  CS-0x049  0x36303         || 			MOV R3, 0x03
(0122)  CS-0x04A  0x08158         || 			BRN start
(0123)                            || 
(0124)  CS-0x04B  0x36BFF  0x04B  || set_neg:	MOV R11, 0xFF
(0125)  CS-0x04C  0x08281         || 			CALL clear_ship
(0126)  CS-0x04D  0x36827         || 			MOV R8, 0x27
(0127)  CS-0x04E  0x36303         || 			MoV R3, 0x03
(0128)  CS-0x04F  0x08158         || 			brn start
(0129)                            || 
(0130)                            || 
(0131)                     0x050  || clear_ship:
(0132)  CS-0x050  0x2C701         || 			SUB R7, 0x01
(0133)  CS-0x051  0x36303         || 			MOV R3, 0x03
(0134)  CS-0x052  0x36600         || 			MOV R6, 0x00
(0135)                     0x053  || clear_loop: 
(0136)  CS-0x053  0x04541         || 			MOV R5, R8
(0137)  CS-0x054  0x04439         || 			MOV R4, R7
(0138)  CS-0x055  0x08351         || 			call draw_dot
(0139)  CS-0x056  0x02858         || 			ADD R8, R11
(0140)  CS-0x057  0x2C301         || 			SUB R3, 0x01
(0141)  CS-0x058  0x30303         || 			CMP R3, 0x03
(0142)  CS-0x059  0x0829B         || 			BRNE clear_loop
(0143)                            || 						
(0144)  CS-0x05A  0x28701         || 			ADD R7, 0x01
(0145)  CS-0x05B  0x18002         || 			ret
(0146)                            || 
(0147)                            || 
(0148)                     0x05C  || draw_ship:
(0149)  CS-0x05C  0x04541         || 			MOV R5, R8
(0150)  CS-0x05D  0x04439         || 			MOV R4, R7
(0151)  CS-0x05E  0x36600         || 			MOV R6, 0x00
(0152)                            || 
(0153)                            || 
(0154)  CS-0x05F  0x30BFF         || 			CMP R11, 0xFF
(0155)  CS-0x060  0x0831A         || 			BREQ draw_neg
(0156)                            || 
(0157)  CS-0x061  0x2C503         || 			SUB R5, 0x03
(0158)  CS-0x062  0x08320         || 			brn rest
(0159)                            || 
(0160)  CS-0x063  0x28503  0x063  || draw_neg:	ADD R5, 0x03
(0161)                            || 
(0162)  CS-0x064  0x08351  0x064  || rest:		call draw_dot
(0163)                            || 
(0164)                            || 
(0165)  CS-0x065  0x04541         || 			MOV R5, R8
(0166)  CS-0x066  0x04439         || 			MOV R4, R7
(0167)  CS-0x067  0x366E3         || 			MOV R6, SHIP_COLOR
(0168)  CS-0x068  0x08351         || 			call draw_dot
(0169)  CS-0x069  0x18002         || 			ret
(0170)                            || 
(0171)                     0x06A  || draw_dot: 
(0172)  CS-0x06A  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0173)  CS-0x06B  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0174)                            || 
(0175)  CS-0x06C  0x34591  0x06C  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0176)  CS-0x06D  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0177)  CS-0x06E  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0178)  CS-0x06F  0x18002         ||         RET
(0179)                            || 	   
(0180)  CS-0x070  0x08380  0x070  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0181)                            || 
(0182)                            || 
(0183)  CS-0x071  0x3712F  0x071  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0184)  CS-0x072  0x2D101  0x072  || outside_for0: 	SUB     R17, 0x01
(0185)                            || 
(0186)  CS-0x073  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0187)  CS-0x074  0x2D201  0x074  || middle_for0:  	SUB     R18, 0x01
(0188)                            ||              
(0189)  CS-0x075  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0190)  CS-0x076  0x2D301  0x076  || inside_for0:  	SUB     R19, 0x01
(0191)  CS-0x077  0x083B3         ||              	BRNE    inside_for0
(0192)                            ||              
(0193)  CS-0x078  0x23200         ||              	OR      R18, 0x00              
(0194)  CS-0x079  0x083A3         ||              	BRNE    middle_for0
(0195)                            ||              
(0196)  CS-0x07A  0x23100         ||              	OR      R17, 0x00               
(0197)  CS-0x07B  0x08393         ||              	BRNE    outside_for0
(0198)                            || 
(0199)  CS-0x07C  0x18002         || 				ret
(0200)                            || 
(0201)                     0x07D  || clear_square:
(0202)                            || 
(0203)  CS-0x07D  0x044D9         ||    MOV  R4, R27   ;y coordin
(0204)  CS-0x07E  0x045E1         ||    MOV  R5, R28   ;x coordin
(0205)  CS-0x07F  0x36600         ||    MOV  R6, 0x00
(0206)  CS-0x080  0x08351         ||    CALL draw_dot   ;clears dot at the origin
(0207)  CS-0x081  0x18002         ||    RET
(0208)                            || 
(0209)                            || ;		mov r29, 0x01
(0210)                            || ;		mov r30, 0x02
(0211)                            ||  ;       mov r31, 0x03
(0212)                            || 
(0213)                     0x082  || ISR: 
(0214)  CS-0x082  0x33620         ||    IN R22, INTERRUPT_ID
(0215)  CS-0x083  0x35680         || 	OUT  R22, SSEG_VAL_ID
(0216)                            || 
(0217)  CS-0x084  0x31600         || 	cmp r22, 0x00
(0218)  CS-0x085  0x0847A         ||     breq testing0
(0219)                            || 
(0220)  CS-0x086  0x31603         || 	cmp r22, 0x03
(0221)  CS-0x087  0x084BA         || 	breq testing5
(0222)                            || 
(0223)  CS-0x088  0x31605         ||    CMP R22, 0x05
(0224)  CS-0x089  0x084FA         ||    BREQ shoot
(0225)                            || 
(0226)  CS-0x08A  0x31602         ||    CMP R22, 0x02
(0227)  CS-0x08B  0x0853A         ||    BREQ moveLeft   
(0228)                            || 
(0229)  CS-0x08C  0x31601         ||    CMP R22, 0x01  
(0230)  CS-0x08D  0x08582         ||    BREQ moveRight
(0231)                            || 
(0232)  CS-0x08E  0x085C8         ||    brn ISR_END
(0233)                            || 
(0234)                     0x08F  || testing0: 
(0235)  CS-0x08F  0x044D9         ||    MOV  R4, R27   ;y coordin
(0236)  CS-0x090  0x045E1         ||    MOV  R5, R28   ;x coordin
(0237)                            || 
(0238)  CS-0x091  0x36603         || 	mov r6, 0x03
(0239)  CS-0x092  0x08351         ||     call draw_dot
(0240)  CS-0x093  0x08389         || 	call pause
(0241)  CS-0x094  0x366FF         || 	mov r6, 0xff
(0242)  CS-0x095  0x08351         || 	call draw_dot
(0243)  CS-0x096  0x085C8         ||     brn isr_end
(0244)                            || 
(0245)                            || 
(0246)                            || 
(0247)                     0x097  || testing5: 
(0248)  CS-0x097  0x044D9         ||    MOV  R4, R27   ;y coordin
(0249)  CS-0x098  0x045E1         ||    MOV  R5, R28   ;x coordin
(0250)                            || 
(0251)  CS-0x099  0x3661C         || 	mov r6, 0x1c
(0252)  CS-0x09A  0x08351         ||     call draw_dot
(0253)  CS-0x09B  0x08389         || 	call pause
(0254)  CS-0x09C  0x366FF         || 	mov r6, 0xff
(0255)  CS-0x09D  0x08351         || 	call draw_dot
(0256)  CS-0x09E  0x085C8         ||     brn isr_end
(0257)                            || 
(0258)                            || 
(0259)                     0x09F  || shoot: 
(0260)  CS-0x09F  0x044D9         ||    MOV  R4, R27   ;y coordin
(0261)  CS-0x0A0  0x045E1         ||    MOV  R5, R28   ;x coordin
(0262)                            || 
(0263)  CS-0x0A1  0x366E0         || 	  mov R6, 0xE0
(0264)  CS-0x0A2  0x08351         || 	  call draw_dot
(0265)  CS-0x0A3  0x08389         ||       call pause
(0266)  CS-0x0A4  0x366FF         || 	  mov R6, 0xFF
(0267)  CS-0x0A5  0x08351         ||       call draw_dot
(0268)  CS-0x0A6  0x085C8         || 	  brn ISR_END
(0269)                            || 
(0270)                     0x0A7  || moveLeft:
(0271)  CS-0x0A7  0x31C00         || 	CMP R28, 0x00
(0272)  CS-0x0A8  0x085CA         || 	BREQ ISR_END
(0273)                            || 
(0274)  CS-0x0A9  0x083E9         ||    CALL clear_square
(0275)                            || 
(0276)                            ||    
(0277)  CS-0x0AA  0x2DC01         ||    SUB  R28, 0x01  
(0278)                            || 
(0279)                            || 
(0280)  CS-0x0AB  0x044D9         ||    MOV  R4, R27   ;y coordin
(0281)  CS-0x0AC  0x045E1         ||    MOV  R5, R28   ;x coordin
(0282)  CS-0x0AD  0x366FF         ||    MOV  R6, 0xFF
(0283)  CS-0x0AE  0x08351         ||    CALL draw_dot   ;draw red square at origin
(0284)  CS-0x0AF  0x085C8         ||    brn ISR_END
(0285)                            || 
(0286)                     0x0B0  || moveRight:
(0287)  CS-0x0B0  0x31C25         || 	CMP R28, END_ROW
(0288)  CS-0x0B1  0x085CA         || 	BREQ ISR_END
(0289)                            || 
(0290)  CS-0x0B2  0x083E9         ||    CALL clear_square
(0291)                            || 
(0292)                            ||    
(0293)  CS-0x0B3  0x29C01         ||    ADD  R28, 0x01  
(0294)                            || 
(0295)                            || 
(0296)  CS-0x0B4  0x044D9         ||    MOV  R4, R27   ;y coordin
(0297)  CS-0x0B5  0x045E1         ||    MOV  R5, R28   ;x coordin
(0298)  CS-0x0B6  0x366FF         ||    MOV  R6, 0xFF
(0299)  CS-0x0B7  0x08351         ||    CALL draw_dot   ;draw red square at origin
(0300)                            ||    
(0301)  CS-0x0B8  0x085C8         || 	brn ISR_END
(0302)                     0x0B9  || ISR_END:
(0303)  CS-0x0B9  0x1A003         || 		RETIE
(0304)                            || 
(0305)                            || .CSEG
(0306)                       1023  || .ORG 0x3FF
(0307)  CS-0x3FF  0x08410  0x3FF  || VECTOR:      BRN ISR
(0308)                            || 





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
CLEAR_LOOP     0x053   (0135)  ||  0142 
CLEAR_ROW      0x03B   (0094)  ||  0034 0100 
CLEAR_SHIP     0x050   (0131)  ||  0119 0125 
CLEAR_SQUARE   0x07D   (0201)  ||  0097 0274 0290 
COL            0x040   (0110)  ||  0083 
DD_OUT         0x06C   (0175)  ||  
DONE           0x070   (0180)  ||  0113 0180 
DRAW_DOT       0x06A   (0171)  ||  0041 0056 0138 0162 0168 0206 0239 0242 0252 0255 
                               ||  0264 0267 0283 0299 
DRAW_NEG       0x063   (0160)  ||  0155 
DRAW_SHIP      0x05C   (0148)  ||  0067 0077 
END_MAIN       0x039   (0086)  ||  
INSIDE_FOR0    0x076   (0190)  ||  0191 
ISR            0x082   (0213)  ||  0307 
ISR_END        0x0B9   (0302)  ||  0232 0243 0256 0268 0272 0284 0288 0301 
MAIN           0x032   (0073)  ||  0087 
MAIN_PAUSE     0x035   (0078)  ||  
MIDDLE_FOR0    0x074   (0187)  ||  0194 
MOVELEFT       0x0A7   (0270)  ||  0227 
MOVERIGHT      0x0B0   (0286)  ||  0230 
OUTSIDE_FOR0   0x072   (0184)  ||  0197 
PAUSE          0x071   (0183)  ||  0049 0072 0078 0240 0253 0265 
RESET          0x013   (0033)  ||  
RESET_LOOP     0x017   (0038)  ||  0043 0047 
REST           0x064   (0162)  ||  0158 
RET_PAUSE      0x036   (0081)  ||  
SET_NEG        0x04B   (0124)  ||  0116 
SHOOT          0x09F   (0259)  ||  0224 
START          0x02B   (0064)  ||  0070 0122 0128 
TESTING0       0x08F   (0234)  ||  0218 
TESTING5       0x097   (0247)  ||  0221 
VECTOR         0x3FF   (0307)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0014)  ||  0112 
END_ROW        0x025   (0013)  ||  0060 0111 0287 
INSIDE_FOR_COUNT 0x02F   (0009)  ||  0189 
INTERRUPT_ID   0x020   (0021)  ||  0214 
LEDS           0x040   (0007)  ||  
MIDDLE_FOR_COUNT 0x02F   (0010)  ||  0186 
OUTSIDE_FOR_COUNT 0x02F   (0011)  ||  0183 
SHIP_COLOR     0x0E3   (0015)  ||  0167 
SSEG_CNTR_ID   0x060   (0023)  ||  0032 
SSEG_VAL_ID    0x080   (0024)  ||  0215 
VGA_COLOR      0x092   (0006)  ||  0177 
VGA_HADD       0x090   (0004)  ||  0176 
VGA_LADD       0x091   (0005)  ||  0175 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
