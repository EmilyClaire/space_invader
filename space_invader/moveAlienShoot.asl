

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
(0007)                            || 
(0008)                       047  || .EQU INSIDE_FOR_COUNT    = 	0x2f
(0009)                       047  || .EQU MIDDLE_FOR_COUNT    = 0x2f
(0010)                       047  || .EQU OUTSIDE_FOR_COUNT   = 0x2f
(0011)                            || 
(0012)                       031  || .EQU INSIDE_FOR_COUNT2    = 	0x1f
(0013)                       031  || .EQU MIDDLE_FOR_COUNT2    = 0x1f
(0014)                       031  || .EQU OUTSIDE_FOR_COUNT2   = 0x1f
(0015)                            || 
(0016)                       074  || .equ END_ROW_SHIP = 0x4A; the row length minus 3 times 2
(0017)                       039  || .equ END_ROW_PLAYER = 0x27
(0018)                       029  || .equ END_COL = 0x1D
(0019)                       227  || .equ SHIP_COLOR = 0xE3;0x03 ;blue
(0020)                            || 					   ;0xE0 ;red
(0021)                            || 					   ; 0x1C    ;green
(0022)                            || 					; 0xE3 ; pink
(0023)                            || 						;0xFC ; yellow
(0024)                            || 					;0x1F aqua
(0025)                            || 
(0026)                       252  || .equ PLAYER_BULLET_COLOR = 0xFC
(0027)                       032  || .EQU INTERRUPT_ID  = 0x20
(0028)                            || 
(0029)                       096  || .equ SSEG_CNTR_ID = 0x60
(0030)                       128  || .equ SSEG_VAL_ID  = 0x80
(0031)                            || 
(0032)                            || .CSEG
(0033)                       016  || .ORG 0x10
(0034)                            || 
(0035)  CS-0x010  0x1A000         ||    SEI
(0036)                            || 
(0037)                            || 
(0038)  CS-0x011  0x36281         || MOV R2, 0x81
(0039)  CS-0x012  0x34260         || OUT R2, SSEG_CNTR_ID
(0040)  CS-0x013  0x37000         || 	MOV R16, 0x00	
(0041)  CS-0x014  0x36CFF         || 	MOV R12, 0xFF
(0042)  CS-0x015  0x36DFF         || 	MOV R13, 0xFF
(0043)  CS-0x016  0x36EFF         || 	MOV R14, 0xFF
(0044)  CS-0x017  0x36FFF         || 	MOV R15, 0xFF
(0045)  CS-0x018  0x37F02         ||     MOV R31, 0x02
(0046)                     0x019  || reset:
(0047)  CS-0x019  0x083E1         || 	    CALL clear_row
(0048)  CS-0x01A  0x36827         || 		MOV R8, END_ROW_PLAYER
(0049)  CS-0x01B  0x3671D         || 		MOV R7, END_COL
(0050)  CS-0x01C  0x36600         || 		MOV R6, 0x00
(0051)                     0x01D  || reset_loop:
(0052)  CS-0x01D  0x04439         || 		MOV R4, R7
(0053)  CS-0x01E  0x04541         || 		MOV R5, R8
(0054)  CS-0x01F  0x08559         || 		call draw_dot
(0055)  CS-0x020  0x2C801         || 		SUB R8, 0x01
(0056)  CS-0x021  0x080EB         || 		BRNE reset_loop
(0057)                            || 
(0058)  CS-0x022  0x04439         || 		MOV R4, R7
(0059)  CS-0x023  0x04541         || 		MOV R5, R8
(0060)  CS-0x024  0x08559         || 		call draw_dot
(0061)  CS-0x025  0x2C701         || 		SUB R7, 0x01
(0062)  CS-0x026  0x307FF         || 		CMP R7, 0xFF
(0063)  CS-0x027  0x080EB         || 		BRNE reset_loop
(0064)                            || 	
(0065)  CS-0x028  0x08591         || 		call pause
(0066)                            || 
(0067)  CS-0x029  0x37B1D         ||    MOV  R27, END_COL
(0068)  CS-0x02A  0x2DB01         || 	SUB R27, 0x01
(0069)  CS-0x02B  0x37C14         ||    MOV  R28, 0x14
(0070)  CS-0x02C  0x366FF         || 	MOV R6, 0xFF
(0071)  CS-0x02D  0x044D9         || 	MOV R4, R27
(0072)  CS-0x02E  0x045E1         || 	MOV R5, R28
(0073)  CS-0x02F  0x08559         || 	call draw_dot
(0074)                            || 
(0075)  CS-0x030  0x36700         ||    MOV  R7, 0x00
(0076)  CS-0x031  0x36800         ||    MOV  R8, 0x00 
(0077)  CS-0x032  0x36A4A         ||    MOV  R10, END_ROW_SHIP
(0078)  CS-0x033  0x36B01         || 	MOV R11, 0x01
(0079)  CS-0x034  0x36303         || 	MOV R3, 0x03
(0080)                            || 	
(0081)                     0x035  || start:
(0082)                            || 
(0083)  CS-0x035  0x04439         || 	MOV R4, R7
(0084)  CS-0x036  0x04541         || 	MOV R5, R8
(0085)  CS-0x037  0x084E9         || 	CALL draw_ship
(0086)  CS-0x038  0x02858         || 	ADD R8, R11
(0087)  CS-0x039  0x2C301         || 	SUB R3, 0x01
(0088)  CS-0x03A  0x081AB         || 	BRNE start
(0089)                            || 
(0090)  CS-0x03B  0x08591         || call pause
(0091)                     0x03C  || MAIN:       
(0092)                            || 
(0093)                     0x03C  || collision:
(0094)  CS-0x03C  0x04D38         || 			CMP R13, R7
(0095)  CS-0x03D  0x08243         || 			BRNE collision2
(0096)                            || 
(0097)  CS-0x03E  0x05D61         || 			MOV R29, R12
(0098)  CS-0x03F  0x03D58         || 			ADD R29, R11
(0099)  CS-0x040  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0100)  CS-0x041  0x08652         || 			BREQ win
(0101)                            || 
(0102)  CS-0x042  0x03D58         || 			ADD R29, R11
(0103)  CS-0x043  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0104)  CS-0x044  0x08652         || 			BREQ win
(0105)                            || 
(0106)  CS-0x045  0x03D58         || 			ADD R29, R11
(0107)  CS-0x046  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0108)  CS-0x047  0x08652         || 			BREQ win
(0109)                            || 
(0110)  CS-0x048  0x04F38  0x048  || collision2: CMP R15, R7
(0111)  CS-0x049  0x082A3         || 			BRNE collision3
(0112)                            || 
(0113)  CS-0x04A  0x05D71         || 			MOV R29, R14
(0114)  CS-0x04B  0x03D58         || 			ADD R29, R11
(0115)  CS-0x04C  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0116)  CS-0x04D  0x086D2         || 			BREQ win2
(0117)                            || 
(0118)  CS-0x04E  0x03D58         || 			ADD R29, R11
(0119)  CS-0x04F  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0120)  CS-0x050  0x086D2         || 			BREQ win2
(0121)                            || 
(0122)  CS-0x051  0x03D58         || 			ADD R29, R11
(0123)  CS-0x052  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0124)  CS-0x053  0x086D2         || 			BREQ win2
(0125)                     0x054  || collision3: 
(0126)  CS-0x054  0x05B38         || 			CMP R27, R7
(0127)  CS-0x055  0x082BB         || 			BRNE collision_end
(0128)                            || 			
(0129)  CS-0x056  0x08750         || 			BRN lose
(0130)                            || 			
(0131)                     0x057  || collision_end:
(0132)                            || 
(0133)                     0x057  || main_ship:
(0134)  CS-0x057  0x04439         ||             MOV  R4, R7   ;y coordin
(0135)  CS-0x058  0x04541         || 			MOV  R5, R8   ;x coordin
(0136)  CS-0x059  0x084E9         || 			call draw_ship  
(0137)                            || 			
(0138)                     0x05A  || p_bullet_1:
(0139)  CS-0x05A  0x04469         || 			MOV R4, R13
(0140)  CS-0x05B  0x04561         || 			MOV R5, R12
(0141)  CS-0x05C  0x36600         || 			MOV R6, 0x00
(0142)  CS-0x05D  0x08559         || 			call draw_dot
(0143)                            || 
(0144)  CS-0x05E  0x30D00         || 			CMP R13, 0x00
(0145)  CS-0x05F  0x0832A         || 			BREQ clear_bullet_1
(0146)                            || 
(0147)  CS-0x060  0x2CD01         || 			SUB R13, 0x01
(0148)  CS-0x061  0x04469         || 			MOV R4, R13
(0149)  CS-0x062  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0150)  CS-0x063  0x08559         || 			call draw_dot
(0151)  CS-0x064  0x08330         || 			brn p_bullet_2
(0152)                            || 
(0153)  CS-0x065  0x36CFF  0x065  || clear_bullet_1: MOV R12, 0xFF
(0154)                            || 
(0155)                     0x066  || p_bullet_2:
(0156)  CS-0x066  0x04479         || 			MOV R4, R15
(0157)  CS-0x067  0x04571         || 			MOV R5, R14
(0158)  CS-0x068  0x36600         || 			MOV R6, 0x00
(0159)  CS-0x069  0x08559         || 			call draw_dot
(0160)                            || 
(0161)  CS-0x06A  0x30F00         || 			CMP R15, 0x00
(0162)  CS-0x06B  0x08392         || 			BREQ clear_bullet_2
(0163)                            || 
(0164)  CS-0x06C  0x2CF01         || 			SUB R15, 0x01
(0165)  CS-0x06D  0x04571         || 			MOV R5, R14
(0166)  CS-0x06E  0x04479         || 			MOV R4, R15
(0167)  CS-0x06F  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0168)  CS-0x070  0x08559         || 			call draw_dot
(0169)  CS-0x071  0x08398         || 		    brn main_pause
(0170)                            || 
(0171)                     0x072  || clear_bullet_2:
(0172)  CS-0x072  0x36EFF         || 			MOV R14, 0xFF
(0173)                            || 
(0174)  CS-0x073  0x085F1  0x073  || main_pause:	call pause2
(0175)                            || 			
(0176)                            || 
(0177)                     0x074  || ret_pause:	
(0178)  CS-0x074  0x2CA01         || 			SUB R10, 0x01
(0179)  CS-0x075  0x30A00         || 			CMP R10, 0x00
(0180)  CS-0x076  0x0840A         || 			BREQ col
(0181)                            || 
(0182)                     0x077  || end_main:	
(0183)                            || 			
(0184)                            || 
(0185)  CS-0x077  0x2DF01         || 			SUB R31, 0x01
(0186)  CS-0x078  0x081E3         || 			BRNE MAIN
(0187)                            || 			
(0188)  CS-0x079  0x37F02         || 			MOV R31, 0x02
(0189)  CS-0x07A  0x02858         || 			ADD R8, R11
(0190)  CS-0x07B  0x081E0         || 			BRN MAIN
(0191)                            || 
(0192)                     0x07C  || clear_row:
(0193)                            ||    
(0194)  CS-0x07C  0x087D9         ||    CALL clear_square
(0195)  CS-0x07D  0x2C801         ||    SUB R8, 0x01
(0196)  CS-0x07E  0x308FF         ||    CMP R8, 0xFF
(0197)  CS-0x07F  0x083E3         ||    BRNE clear_row
(0198)  CS-0x080  0x18002         ||    RET
(0199)                            || 
(0200)  CS-0x081  0x28701  0x081  || col:		ADD R7, 0x01
(0201)  CS-0x082  0x36A4A         || 			MOV R10, END_ROW_SHIP
(0202)  CS-0x083  0x3071D         || 			CMP R7, END_COL
(0203)  CS-0x084  0x0858A         || 			BREQ DONE
(0204)                            || 			
(0205)  CS-0x085  0x30B01         || 			CMP R11, 0x01
(0206)  CS-0x086  0x08462         || 			BREQ set_neg
(0207)                            || 	
(0208)  CS-0x087  0x36B01         || 			MOV R11, 0x01
(0209)  CS-0x088  0x08489         || 			call clear_ship
(0210)  CS-0x089  0x36801         || 			MOV R8, 0x01
(0211)  CS-0x08A  0x36303         || 			MOV R3, 0x03
(0212)  CS-0x08B  0x081A8         || 			BRN start
(0213)                            || 
(0214)  CS-0x08C  0x36BFF  0x08C  || set_neg:	MOV R11, 0xFF
(0215)  CS-0x08D  0x08489         || 			CALL clear_ship
(0216)  CS-0x08E  0x36827         || 			MOV R8, 0x27
(0217)  CS-0x08F  0x36303         || 			MoV R3, 0x03
(0218)  CS-0x090  0x081A8         || 			brn start
(0219)                            || 
(0220)                     0x091  || clear_ship:
(0221)  CS-0x091  0x2C701         || 			SUB R7, 0x01
(0222)  CS-0x092  0x36303         || 			MOV R3, 0x03
(0223)  CS-0x093  0x36600         || 			MOV R6, 0x00
(0224)                     0x094  || clear_loop: 
(0225)  CS-0x094  0x04541         || 			MOV R5, R8
(0226)  CS-0x095  0x04439         || 			MOV R4, R7
(0227)  CS-0x096  0x08559         || 			call draw_dot
(0228)  CS-0x097  0x02858         || 			ADD R8, R11
(0229)  CS-0x098  0x2C301         || 			SUB R3, 0x01
(0230)  CS-0x099  0x30303         || 			CMP R3, 0x03
(0231)  CS-0x09A  0x084A3         || 			BRNE clear_loop
(0232)                            || 						
(0233)  CS-0x09B  0x28701         || 			ADD R7, 0x01
(0234)  CS-0x09C  0x18002         || 			ret
(0235)                            || 
(0236)                     0x09D  || draw_ship:
(0237)  CS-0x09D  0x04541         || 			MOV R5, R8
(0238)  CS-0x09E  0x04439         || 			MOV R4, R7
(0239)  CS-0x09F  0x36600         || 			MOV R6, 0x00
(0240)                            || 
(0241)                            || 
(0242)  CS-0x0A0  0x30BFF         || 			CMP R11, 0xFF
(0243)  CS-0x0A1  0x08522         || 			BREQ draw_neg
(0244)                            || 
(0245)  CS-0x0A2  0x2C503         || 			SUB R5, 0x03
(0246)  CS-0x0A3  0x08528         || 			brn rest
(0247)                            || 
(0248)  CS-0x0A4  0x28503  0x0A4  || draw_neg:	ADD R5, 0x03
(0249)                            || 
(0250)  CS-0x0A5  0x08559  0x0A5  || rest:		call draw_dot
(0251)                            || 
(0252)  CS-0x0A6  0x04541         || 			MOV R5, R8
(0253)  CS-0x0A7  0x04439         || 			MOV R4, R7
(0254)  CS-0x0A8  0x366E3         || 			MOV R6, SHIP_COLOR
(0255)  CS-0x0A9  0x08559         || 			call draw_dot
(0256)  CS-0x0AA  0x18002         || 			ret
(0257)                            || 
(0258)                     0x0AB  || draw_dot: 
(0259)  CS-0x0AB  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0260)  CS-0x0AC  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0261)                            || 
(0262)  CS-0x0AD  0x34591  0x0AD  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0263)  CS-0x0AE  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0264)  CS-0x0AF  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0265)  CS-0x0B0  0x18002         ||         RET
(0266)                            || 	   
(0267)  CS-0x0B1  0x08588  0x0B1  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0268)                            || 
(0269)                            || 
(0270)  CS-0x0B2  0x3712F  0x0B2  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0271)  CS-0x0B3  0x2D101  0x0B3  || outside_for0: 	SUB     R17, 0x01
(0272)                            || 
(0273)  CS-0x0B4  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0274)  CS-0x0B5  0x2D201  0x0B5  || middle_for0:  	SUB     R18, 0x01
(0275)                            ||              
(0276)  CS-0x0B6  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0277)  CS-0x0B7  0x2D301  0x0B7  || inside_for0:  	SUB     R19, 0x01
(0278)  CS-0x0B8  0x085BB         ||              	BRNE    inside_for0
(0279)                            ||              
(0280)  CS-0x0B9  0x23200         ||              	OR      R18, 0x00              
(0281)  CS-0x0BA  0x085AB         ||              	BRNE    middle_for0
(0282)                            ||              
(0283)  CS-0x0BB  0x23100         ||              	OR      R17, 0x00               
(0284)  CS-0x0BC  0x0859B         ||              	BRNE    outside_for0
(0285)  CS-0x0BD  0x18002         || 				ret
(0286)                            || 
(0287)  CS-0x0BE  0x3711F  0x0BE  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0288)  CS-0x0BF  0x2D101  0x0BF  || outside_for: 	SUB     R17, 0x01
(0289)                            || 
(0290)  CS-0x0C0  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0291)  CS-0x0C1  0x2D201  0x0C1  || middle_for:  	SUB     R18, 0x01
(0292)                            ||              
(0293)  CS-0x0C2  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0294)  CS-0x0C3  0x2D301  0x0C3  || inside_for:  	SUB     R19, 0x01
(0295)  CS-0x0C4  0x0861B         ||              	BRNE    inside_for
(0296)                            ||              
(0297)  CS-0x0C5  0x23200         ||              	or     R18, 0x00              
(0298)  CS-0x0C6  0x0860B         ||              	BRNE    middle_for
(0299)                            ||              
(0300)  CS-0x0C7  0x31100         ||              	CMP      R17, 0x00               
(0301)  CS-0x0C8  0x085FB         ||              	BRNE    outside_for
(0302)  CS-0x0C9  0x18002         || 				ret
(0303)                            || 
(0304)  CS-0x0CA  0x08591  0x0CA  || win:    call pause
(0305)  CS-0x0CB  0x36827         || 		MOV R8, END_ROW_PLAYER
(0306)  CS-0x0CC  0x3671D         || 		MOV R7, END_COL
(0307)  CS-0x0CD  0x3661C         || 		MOV R6, 0x1C ;GREEN SCREEN
(0308)                     0x0CE  || reset_loop2:
(0309)  CS-0x0CE  0x04439         || 		MOV R4, R7
(0310)  CS-0x0CF  0x04541         || 		MOV R5, R8
(0311)  CS-0x0D0  0x08559         || 		call draw_dot
(0312)  CS-0x0D1  0x2C801         || 		SUB R8, 0x01
(0313)  CS-0x0D2  0x08673         || 		BRNE reset_loop2
(0314)                            || 
(0315)  CS-0x0D3  0x04439         || 		MOV R4, R7
(0316)  CS-0x0D4  0x04541         || 		MOV R5, R8
(0317)  CS-0x0D5  0x08559         || 		call draw_dot
(0318)  CS-0x0D6  0x2C701         || 		SUB R7, 0x01
(0319)  CS-0x0D7  0x307FF         || 		CMP R7, 0xFF
(0320)  CS-0x0D8  0x08673         || 		BRNE reset_loop2
(0321)                            || 	
(0322)  CS-0x0D9  0x08588         || 	    brn done
(0323)  CS-0x0DA  0x08591  0x0DA  || win2:   call pause
(0324)  CS-0x0DB  0x36827         || 		MOV R8, END_ROW_PLAYER
(0325)  CS-0x0DC  0x3671D         || 		MOV R7, END_COL
(0326)  CS-0x0DD  0x366FC         || 		MOV R6, 0xFC ;YELLOW SCREEN
(0327)                     0x0DE  || reset_loop3:
(0328)  CS-0x0DE  0x04439         || 		MOV R4, R7
(0329)  CS-0x0DF  0x04541         || 		MOV R5, R8
(0330)  CS-0x0E0  0x08559         || 		call draw_dot
(0331)  CS-0x0E1  0x2C801         || 		SUB R8, 0x01
(0332)  CS-0x0E2  0x086F3         || 		BRNE reset_loop3
(0333)                            || 
(0334)  CS-0x0E3  0x04439         || 		MOV R4, R7
(0335)  CS-0x0E4  0x04541         || 		MOV R5, R8
(0336)  CS-0x0E5  0x08559         || 		call draw_dot
(0337)  CS-0x0E6  0x2C701         || 		SUB R7, 0x01
(0338)  CS-0x0E7  0x307FF         || 		CMP R7, 0xFF
(0339)  CS-0x0E8  0x086F3         || 		BRNE reset_loop3
(0340)  CS-0x0E9  0x08588         || 		brn done
(0341)                            || 
(0342)                     0x0EA  || lose:     
(0343)  CS-0x0EA  0x08591         || 		call pause
(0344)  CS-0x0EB  0x36827         || 		MOV R8, END_ROW_PLAYER
(0345)  CS-0x0EC  0x3671D         || 		MOV R7, END_COL
(0346)  CS-0x0ED  0x28801         || 		ADD R8, 0x01
(0347)  CS-0x0EE  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0348)                     0x0EF  || reset_loop4:
(0349)  CS-0x0EF  0x04439         || 		MOV R4, R7
(0350)  CS-0x0F0  0x04541         || 		MOV R5, R8
(0351)  CS-0x0F1  0x08559         || 		call draw_dot
(0352)  CS-0x0F2  0x2C801         || 		SUB R8, 0x01
(0353)  CS-0x0F3  0x0877B         || 		BRNE reset_loop4
(0354)                            || 
(0355)  CS-0x0F4  0x04439         || 		MOV R4, R7
(0356)  CS-0x0F5  0x04541         || 		MOV R5, R8
(0357)  CS-0x0F6  0x08559         || 		call draw_dot
(0358)  CS-0x0F7  0x2C701         || 		SUB R7, 0x01
(0359)  CS-0x0F8  0x307FF         || 		CMP R7, 0xFF
(0360)  CS-0x0F9  0x0877B         || 		BRNE reset_loop4
(0361)                            || 
(0362)  CS-0x0FA  0x08588         || 		brn done
(0363)                            || 
(0364)                     0x0FB  || clear_square:
(0365)                            || 
(0366)  CS-0x0FB  0x044D9         ||    MOV  R4, R27   ;y coordin
(0367)  CS-0x0FC  0x045E1         ||    MOV  R5, R28   ;x coordin
(0368)  CS-0x0FD  0x36600         ||    MOV  R6, 0x00
(0369)  CS-0x0FE  0x08559         ||    CALL draw_dot   ;clears dot at the origin
(0370)  CS-0x0FF  0x18002         ||    RET
(0371)                            || 
(0372)                     0x100  || ISR: 
(0373)  CS-0x100  0x33420         ||    	IN R20, INTERRUPT_ID
(0374)  CS-0x101  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0375)                            || 
(0376)  CS-0x102  0x31400         || 	cmp R20, 0x00
(0377)  CS-0x103  0x0886A         ||     breq testing0
(0378)                            || 
(0379)  CS-0x104  0x31403         || 	CMP R20, 0x03
(0380)  CS-0x105  0x088AA         || 	breq testing5
(0381)                            || 
(0382)  CS-0x106  0x31405         ||    CMP R20, 0x05
(0383)  CS-0x107  0x088EA         ||    BREQ shoot
(0384)                            || 
(0385)  CS-0x108  0x31402         ||    CMP R20, 0x02
(0386)  CS-0x109  0x08A02         ||    BREQ moveLeft   
(0387)                            || 
(0388)  CS-0x10A  0x31401         ||    CMP R20, 0x01  
(0389)  CS-0x10B  0x08A4A         ||    BREQ moveRight
(0390)                            || 
(0391)  CS-0x10C  0x08A90         ||    brn ISR_END
(0392)                            || 
(0393)                     0x10D  || testing0: 
(0394)  CS-0x10D  0x044D9         ||    MOV  R4, R27   ;y coordin
(0395)  CS-0x10E  0x045E1         ||    MOV  R5, R28   ;x coordin
(0396)                            || 
(0397)  CS-0x10F  0x36603         || 	mov r6, 0x03
(0398)  CS-0x110  0x08559         ||     call draw_dot
(0399)  CS-0x111  0x08591         || 	call pause
(0400)  CS-0x112  0x366FF         || 	mov r6, 0xff
(0401)  CS-0x113  0x08559         || 	call draw_dot
(0402)  CS-0x114  0x08A90         ||     brn isr_end
(0403)                            || 
(0404)                     0x115  || testing5: 
(0405)  CS-0x115  0x044D9         ||    MOV  R4, R27   ;y coordin
(0406)  CS-0x116  0x045E1         ||    MOV  R5, R28   ;x coordin
(0407)                            || 
(0408)  CS-0x117  0x3661C         || 	mov r6, 0x1c
(0409)  CS-0x118  0x08559         ||     call draw_dot
(0410)  CS-0x119  0x08591         || 	call pause
(0411)  CS-0x11A  0x366FF         || 	mov r6, 0xff
(0412)  CS-0x11B  0x08559         || 	call draw_dot
(0413)  CS-0x11C  0x08A90         ||     brn isr_end
(0414)                            || 
(0415)                     0x11D  || shoot: 
(0416)                            ||    
(0417)  CS-0x11D  0x31001         || 	CMP R16, 0x01
(0418)  CS-0x11E  0x08962         || 	BREQ second_bullet
(0419)                            || 
(0420)  CS-0x11F  0x04469         || 	MOV R4, R13
(0421)  CS-0x120  0x04561         || 	MOV R5, R12
(0422)  CS-0x121  0x36600         || 	MOV R6, 0x00
(0423)  CS-0x122  0x08559         || 	call draw_dot
(0424)                            || 
(0425)  CS-0x123  0x04DD9         ||    Mov R13, R27
(0426)  CS-0x124  0x2CD01         ||    SUB R13, 0x01
(0427)                            || 
(0428)  CS-0x125  0x04CE1         ||    MOV R12, R28
(0429)                            || 
(0430)  CS-0x126  0x04469         ||    MOV R4, R13
(0431)  CS-0x127  0x04561         ||    MOV R5, R12
(0432)  CS-0x128  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0433)  CS-0x129  0x08559         ||    call draw_dot
(0434)                            || 
(0435)  CS-0x12A  0x29001         ||    ADD R16, 0x01
(0436)                            ||    
(0437)  CS-0x12B  0x089C0         ||    BRN animation
(0438)                            || 
(0439)                     0x12C  || second_bullet:		   
(0440)  CS-0x12C  0x04479         || 	MOV R4, R15
(0441)  CS-0x12D  0x04571         || 	MOV R5, R14
(0442)  CS-0x12E  0x36600         || 	MOV R6, 0x00
(0443)  CS-0x12F  0x08559         || 	call draw_dot
(0444)                            || 
(0445)  CS-0x130  0x04FD9         || 	MOV R15, R27
(0446)  CS-0x131  0x2CF01         || 	SUB R15, 0x01
(0447)                            || 
(0448)  CS-0x132  0x04EE1         || 	MOV R14, R28	
(0449)                            || 
(0450)  CS-0x133  0x04479         ||    MOV R4, R15
(0451)  CS-0x134  0x04571         ||    MOV R5, R14
(0452)  CS-0x135  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0453)  CS-0x136  0x08559         ||    call draw_dot
(0454)                            || 
(0455)  CS-0x137  0x2D001         ||    SUB R16, 0x01
(0456)                            || 
(0457)                     0x138  || animation:
(0458)  CS-0x138  0x044D9         ||    MOV  R4, R27   ;y coordin
(0459)  CS-0x139  0x045E1         ||    MOV  R5, R28   ;x coordin
(0460)                            || 
(0461)  CS-0x13A  0x366E0         || 	  mov R6, 0xE0
(0462)  CS-0x13B  0x08559         || 	  call draw_dot
(0463)  CS-0x13C  0x085F1         ||       call pause2
(0464)  CS-0x13D  0x366FF         || 	  mov R6, 0xFF
(0465)  CS-0x13E  0x08559         ||       call draw_dot
(0466)  CS-0x13F  0x08A90         || 	  brn ISR_END
(0467)                            || 
(0468)                     0x140  || moveLeft:
(0469)  CS-0x140  0x31C00         || 	CMP R28, 0x00
(0470)  CS-0x141  0x08A92         || 	BREQ ISR_END
(0471)                            || 
(0472)  CS-0x142  0x087D9         ||    CALL clear_square
(0473)                            ||    
(0474)  CS-0x143  0x2DC01         ||    SUB  R28, 0x01  
(0475)                            || 
(0476)  CS-0x144  0x044D9         ||    MOV  R4, R27   ;y coordin
(0477)  CS-0x145  0x045E1         ||    MOV  R5, R28   ;x coordin
(0478)  CS-0x146  0x366FF         ||    MOV  R6, 0xFF
(0479)  CS-0x147  0x08559         ||    CALL draw_dot   ;draw red square at origin
(0480)  CS-0x148  0x08A90         ||    brn ISR_END
(0481)                            || 
(0482)                     0x149  || moveRight:
(0483)  CS-0x149  0x31C27         || 	CMP R28, END_ROW_PLAYER
(0484)  CS-0x14A  0x08A92         || 	BREQ ISR_END
(0485)                            || 
(0486)  CS-0x14B  0x087D9         ||    CALL clear_square
(0487)                            || 
(0488)                            ||    
(0489)  CS-0x14C  0x29C01         ||    ADD  R28, 0x01  
(0490)                            || 
(0491)                            || 
(0492)  CS-0x14D  0x044D9         ||    MOV  R4, R27   ;y coordin
(0493)  CS-0x14E  0x045E1         ||    MOV  R5, R28   ;x coordin
(0494)  CS-0x14F  0x366FF         ||    MOV  R6, 0xFF
(0495)  CS-0x150  0x08559         ||    CALL draw_dot   ;draw red square at origin
(0496)                            ||    
(0497)  CS-0x151  0x08A90         || 	brn ISR_END
(0498)                     0x152  || ISR_END:
(0499)  CS-0x152  0x1A003         || 		RETIE
(0500)                            || 
(0501)                            || .CSEG
(0502)                       1023  || .ORG 0x3FF
(0503)  CS-0x3FF  0x08800  0x3FF  || VECTOR:      BRN ISR
(0504)                            || 





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
ANIMATION      0x138   (0457)  ||  0437 
CLEAR_BULLET_1 0x065   (0153)  ||  0145 
CLEAR_BULLET_2 0x072   (0171)  ||  0162 
CLEAR_LOOP     0x094   (0224)  ||  0231 
CLEAR_ROW      0x07C   (0192)  ||  0047 0197 
CLEAR_SHIP     0x091   (0220)  ||  0209 0215 
CLEAR_SQUARE   0x0FB   (0364)  ||  0194 0472 0486 
COL            0x081   (0200)  ||  0180 
COLLISION      0x03C   (0093)  ||  
COLLISION2     0x048   (0110)  ||  0095 
COLLISION3     0x054   (0125)  ||  0111 
COLLISION_END  0x057   (0131)  ||  0127 
DD_OUT         0x0AD   (0262)  ||  
DONE           0x0B1   (0267)  ||  0203 0267 0322 0340 0362 
DRAW_DOT       0x0AB   (0258)  ||  0054 0060 0073 0142 0150 0159 0168 0227 0250 0255 
                               ||  0311 0317 0330 0336 0351 0357 0369 0398 0401 0409 
                               ||  0412 0423 0433 0443 0453 0462 0465 0479 0495 
DRAW_NEG       0x0A4   (0248)  ||  0243 
DRAW_SHIP      0x09D   (0236)  ||  0085 0136 
END_MAIN       0x077   (0182)  ||  
INSIDE_FOR     0x0C3   (0294)  ||  0295 
INSIDE_FOR0    0x0B7   (0277)  ||  0278 
ISR            0x100   (0372)  ||  0503 
ISR_END        0x152   (0498)  ||  0391 0402 0413 0466 0470 0480 0484 0497 
LOSE           0x0EA   (0342)  ||  0129 
MAIN           0x03C   (0091)  ||  0186 0190 
MAIN_PAUSE     0x073   (0174)  ||  0169 
MAIN_SHIP      0x057   (0133)  ||  
MIDDLE_FOR     0x0C1   (0291)  ||  0298 
MIDDLE_FOR0    0x0B5   (0274)  ||  0281 
MOVELEFT       0x140   (0468)  ||  0386 
MOVERIGHT      0x149   (0482)  ||  0389 
OUTSIDE_FOR    0x0BF   (0288)  ||  0301 
OUTSIDE_FOR0   0x0B3   (0271)  ||  0284 
PAUSE          0x0B2   (0270)  ||  0065 0090 0304 0323 0343 0399 0410 
PAUSE2         0x0BE   (0287)  ||  0174 0463 
P_BULLET_1     0x05A   (0138)  ||  
P_BULLET_2     0x066   (0155)  ||  0151 
RESET          0x019   (0046)  ||  
RESET_LOOP     0x01D   (0051)  ||  0056 0063 
RESET_LOOP2    0x0CE   (0308)  ||  0313 0320 
RESET_LOOP3    0x0DE   (0327)  ||  0332 0339 
RESET_LOOP4    0x0EF   (0348)  ||  0353 0360 
REST           0x0A5   (0250)  ||  0246 
RET_PAUSE      0x074   (0177)  ||  
SECOND_BULLET  0x12C   (0439)  ||  0418 
SET_NEG        0x08C   (0214)  ||  0206 
SHOOT          0x11D   (0415)  ||  0383 
START          0x035   (0081)  ||  0088 0212 0218 
TESTING0       0x10D   (0393)  ||  0377 
TESTING5       0x115   (0404)  ||  0380 
VECTOR         0x3FF   (0503)  ||  
WIN            0x0CA   (0304)  ||  0100 0104 0108 
WIN2           0x0DA   (0323)  ||  0116 0120 0124 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0018)  ||  0049 0067 0202 0306 0325 0345 
END_ROW_PLAYER 0x027   (0017)  ||  0048 0305 0324 0344 0483 
END_ROW_SHIP   0x04A   (0016)  ||  0077 0201 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0276 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0293 
INTERRUPT_ID   0x020   (0027)  ||  0373 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0273 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0290 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0270 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0287 
PLAYER_BULLET_COLOR 0x0FC   (0026)  ||  0149 0167 0432 0452 
SHIP_COLOR     0x0E3   (0019)  ||  0254 
SSEG_CNTR_ID   0x060   (0029)  ||  0039 
SSEG_VAL_ID    0x080   (0030)  ||  0374 
VGA_COLOR      0x092   (0006)  ||  0264 
VGA_HADD       0x090   (0004)  ||  0263 
VGA_LADD       0x091   (0005)  ||  0262 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
