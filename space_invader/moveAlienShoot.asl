

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
(0016)                       072  || .equ END_ROW_SHIP = 0x48; the row length minus 3 times 2
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
(0047)  CS-0x019  0x083D1         || 	    CALL clear_row
(0048)  CS-0x01A  0x36827         || 		MOV R8, END_ROW_PLAYER
(0049)  CS-0x01B  0x3671D         || 		MOV R7, END_COL
(0050)  CS-0x01C  0x36600         || 		MOV R6, 0x00
(0051)                     0x01D  || reset_loop:
(0052)  CS-0x01D  0x04439         || 		MOV R4, R7
(0053)  CS-0x01E  0x04541         || 		MOV R5, R8
(0054)  CS-0x01F  0x08549         || 		call draw_dot
(0055)  CS-0x020  0x2C801         || 		SUB R8, 0x01
(0056)  CS-0x021  0x080EB         || 		BRNE reset_loop
(0057)                            || 
(0058)  CS-0x022  0x04439         || 		MOV R4, R7
(0059)  CS-0x023  0x04541         || 		MOV R5, R8
(0060)  CS-0x024  0x08549         || 		call draw_dot
(0061)  CS-0x025  0x2C701         || 		SUB R7, 0x01
(0062)  CS-0x026  0x307FF         || 		CMP R7, 0xFF
(0063)  CS-0x027  0x080EB         || 		BRNE reset_loop
(0064)                            || 	
(0065)  CS-0x028  0x08581         || 		call pause
(0066)                            || 
(0067)  CS-0x029  0x37B1D         ||    MOV  R27, END_COL
(0068)  CS-0x02A  0x2DB01         || 	SUB R27, 0x01
(0069)  CS-0x02B  0x37C14         ||    MOV  R28, 0x14
(0070)  CS-0x02C  0x366FF         || 	MOV R6, 0xFF
(0071)  CS-0x02D  0x044D9         || 	MOV R4, R27
(0072)  CS-0x02E  0x045E1         || 	MOV R5, R28
(0073)  CS-0x02F  0x08549         || 	call draw_dot
(0074)                            || 
(0075)  CS-0x030  0x36700         ||    MOV  R7, 0x00
(0076)  CS-0x031  0x36800         ||    MOV  R8, 0x00 
(0077)  CS-0x032  0x36A48         ||    MOV  R10, END_ROW_SHIP
(0078)  CS-0x033  0x36B01         || 	MOV R11, 0x01
(0079)  CS-0x034  0x36303         || 	MOV R3, 0x03
(0080)                            || 	
(0081)                     0x035  || start:
(0082)                            || 
(0083)  CS-0x035  0x04439         || 	MOV R4, R7
(0084)  CS-0x036  0x04541         || 	MOV R5, R8
(0085)  CS-0x037  0x084D9         || 	CALL draw_ship
(0086)  CS-0x038  0x02858         || 	ADD R8, R11
(0087)  CS-0x039  0x2C301         || 	SUB R3, 0x01
(0088)  CS-0x03A  0x081AB         || 	BRNE start
(0089)                            || 
(0090)  CS-0x03B  0x08581         || call pause
(0091)                     0x03C  || MAIN:       
(0092)                            || 
(0093)                     0x03C  || collision:
(0094)  CS-0x03C  0x04D38         || 			CMP R13, R7
(0095)  CS-0x03D  0x0823B         || 			BRNE collision2
(0096)                            || 
(0097)  CS-0x03E  0x05D61         || 			MOV R29, R12
(0098)  CS-0x03F  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0099)  CS-0x040  0x08642         || 			BREQ win
(0100)                            || 
(0101)  CS-0x041  0x03D58         || 			ADD R29, R11
(0102)  CS-0x042  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0103)  CS-0x043  0x08642         || 			BREQ win
(0104)                            || 
(0105)  CS-0x044  0x03D58         || 			ADD R29, R11
(0106)  CS-0x045  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0107)  CS-0x046  0x08642         || 			BREQ win
(0108)                            || 
(0109)  CS-0x047  0x04F38  0x047  || collision2: CMP R15, R7
(0110)  CS-0x048  0x08293         || 			BRNE collision3
(0111)                            || 
(0112)  CS-0x049  0x05D71         || 			MOV R29, R14
(0113)  CS-0x04A  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0114)  CS-0x04B  0x086C2         || 			BREQ win2
(0115)                            || 
(0116)  CS-0x04C  0x03D58         || 			ADD R29, R11
(0117)  CS-0x04D  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0118)  CS-0x04E  0x086C2         || 			BREQ win2
(0119)                            || 
(0120)  CS-0x04F  0x03D58         || 			ADD R29, R11
(0121)  CS-0x050  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0122)  CS-0x051  0x086C2         || 			BREQ win2
(0123)                     0x052  || collision3: 
(0124)  CS-0x052  0x05B38         || 			CMP R27, R7
(0125)  CS-0x053  0x082AB         || 			BRNE collision_end
(0126)                            || 			
(0127)  CS-0x054  0x08740         || 			BRN lose
(0128)                            || 			
(0129)                     0x055  || collision_end:
(0130)                            || 
(0131)                     0x055  || main_ship:
(0132)  CS-0x055  0x04439         ||             MOV  R4, R7   ;y coordin
(0133)  CS-0x056  0x04541         || 			MOV  R5, R8   ;x coordin
(0134)  CS-0x057  0x084D9         || 			call draw_ship  
(0135)                            || 			
(0136)                     0x058  || p_bullet_1:
(0137)  CS-0x058  0x04469         || 			MOV R4, R13
(0138)  CS-0x059  0x04561         || 			MOV R5, R12
(0139)  CS-0x05A  0x36600         || 			MOV R6, 0x00
(0140)  CS-0x05B  0x08549         || 			call draw_dot
(0141)                            || 
(0142)  CS-0x05C  0x30D00         || 			CMP R13, 0x00
(0143)  CS-0x05D  0x0831A         || 			BREQ clear_bullet_1
(0144)                            || 
(0145)  CS-0x05E  0x2CD01         || 			SUB R13, 0x01
(0146)  CS-0x05F  0x04469         || 			MOV R4, R13
(0147)  CS-0x060  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0148)  CS-0x061  0x08549         || 			call draw_dot
(0149)  CS-0x062  0x08320         || 			brn p_bullet_2
(0150)                            || 
(0151)  CS-0x063  0x36CFF  0x063  || clear_bullet_1: MOV R12, 0xFF
(0152)                            || 
(0153)                     0x064  || p_bullet_2:
(0154)  CS-0x064  0x04479         || 			MOV R4, R15
(0155)  CS-0x065  0x04571         || 			MOV R5, R14
(0156)  CS-0x066  0x36600         || 			MOV R6, 0x00
(0157)  CS-0x067  0x08549         || 			call draw_dot
(0158)                            || 
(0159)  CS-0x068  0x30F00         || 			CMP R15, 0x00
(0160)  CS-0x069  0x08382         || 			BREQ clear_bullet_2
(0161)                            || 
(0162)  CS-0x06A  0x2CF01         || 			SUB R15, 0x01
(0163)  CS-0x06B  0x04571         || 			MOV R5, R14
(0164)  CS-0x06C  0x04479         || 			MOV R4, R15
(0165)  CS-0x06D  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0166)  CS-0x06E  0x08549         || 			call draw_dot
(0167)  CS-0x06F  0x08388         || 		    brn main_pause
(0168)                            || 
(0169)                     0x070  || clear_bullet_2:
(0170)  CS-0x070  0x36EFF         || 			MOV R14, 0xFF
(0171)                            || 
(0172)  CS-0x071  0x085E1  0x071  || main_pause:	call pause2
(0173)                            || 			
(0174)                            || 
(0175)                     0x072  || ret_pause:	
(0176)  CS-0x072  0x2CA01         || 			SUB R10, 0x01
(0177)  CS-0x073  0x30A00         || 			CMP R10, 0x00
(0178)  CS-0x074  0x083FA         || 			BREQ col
(0179)                            || 
(0180)                     0x075  || end_main:	
(0181)                            || 			
(0182)                            || 
(0183)  CS-0x075  0x2DF01         || 			SUB R31, 0x01
(0184)  CS-0x076  0x081E3         || 			BRNE MAIN
(0185)                            || 			
(0186)  CS-0x077  0x37F02         || 			MOV R31, 0x02
(0187)  CS-0x078  0x02858         || 			ADD R8, R11
(0188)  CS-0x079  0x081E0         || 			BRN MAIN
(0189)                            || 
(0190)                     0x07A  || clear_row:
(0191)                            ||    
(0192)  CS-0x07A  0x087C9         ||    CALL clear_square
(0193)  CS-0x07B  0x2C801         ||    SUB R8, 0x01
(0194)  CS-0x07C  0x308FF         ||    CMP R8, 0xFF
(0195)  CS-0x07D  0x083D3         ||    BRNE clear_row
(0196)  CS-0x07E  0x18002         ||    RET
(0197)                            || 
(0198)  CS-0x07F  0x28701  0x07F  || col:		ADD R7, 0x01
(0199)  CS-0x080  0x36A48         || 			MOV R10, END_ROW_SHIP
(0200)  CS-0x081  0x3071D         || 			CMP R7, END_COL
(0201)  CS-0x082  0x0857A         || 			BREQ DONE
(0202)                            || 			
(0203)  CS-0x083  0x30B01         || 			CMP R11, 0x01
(0204)  CS-0x084  0x08452         || 			BREQ set_neg
(0205)                            || 	
(0206)  CS-0x085  0x36B01         || 			MOV R11, 0x01
(0207)  CS-0x086  0x08479         || 			call clear_ship
(0208)  CS-0x087  0x36801         || 			MOV R8, 0x01
(0209)  CS-0x088  0x36303         || 			MOV R3, 0x03
(0210)  CS-0x089  0x081A8         || 			BRN start
(0211)                            || 
(0212)  CS-0x08A  0x36BFF  0x08A  || set_neg:	MOV R11, 0xFF
(0213)  CS-0x08B  0x08479         || 			CALL clear_ship
(0214)  CS-0x08C  0x36827         || 			MOV R8, 0x27
(0215)  CS-0x08D  0x36303         || 			MoV R3, 0x03
(0216)  CS-0x08E  0x081A8         || 			brn start
(0217)                            || 
(0218)                     0x08F  || clear_ship:
(0219)  CS-0x08F  0x2C701         || 			SUB R7, 0x01
(0220)  CS-0x090  0x36303         || 			MOV R3, 0x03
(0221)  CS-0x091  0x36600         || 			MOV R6, 0x00
(0222)                     0x092  || clear_loop: 
(0223)  CS-0x092  0x04541         || 			MOV R5, R8
(0224)  CS-0x093  0x04439         || 			MOV R4, R7
(0225)  CS-0x094  0x08549         || 			call draw_dot
(0226)  CS-0x095  0x02858         || 			ADD R8, R11
(0227)  CS-0x096  0x2C301         || 			SUB R3, 0x01
(0228)  CS-0x097  0x30303         || 			CMP R3, 0x03
(0229)  CS-0x098  0x08493         || 			BRNE clear_loop
(0230)                            || 						
(0231)  CS-0x099  0x28701         || 			ADD R7, 0x01
(0232)  CS-0x09A  0x18002         || 			ret
(0233)                            || 
(0234)                     0x09B  || draw_ship:
(0235)  CS-0x09B  0x04541         || 			MOV R5, R8
(0236)  CS-0x09C  0x04439         || 			MOV R4, R7
(0237)  CS-0x09D  0x36600         || 			MOV R6, 0x00
(0238)                            || 
(0239)                            || 
(0240)  CS-0x09E  0x30BFF         || 			CMP R11, 0xFF
(0241)  CS-0x09F  0x08512         || 			BREQ draw_neg
(0242)                            || 
(0243)  CS-0x0A0  0x2C503         || 			SUB R5, 0x03
(0244)  CS-0x0A1  0x08518         || 			brn rest
(0245)                            || 
(0246)  CS-0x0A2  0x28503  0x0A2  || draw_neg:	ADD R5, 0x03
(0247)                            || 
(0248)  CS-0x0A3  0x08549  0x0A3  || rest:		call draw_dot
(0249)                            || 
(0250)  CS-0x0A4  0x04541         || 			MOV R5, R8
(0251)  CS-0x0A5  0x04439         || 			MOV R4, R7
(0252)  CS-0x0A6  0x366E3         || 			MOV R6, SHIP_COLOR
(0253)  CS-0x0A7  0x08549         || 			call draw_dot
(0254)  CS-0x0A8  0x18002         || 			ret
(0255)                            || 
(0256)                     0x0A9  || draw_dot: 
(0257)  CS-0x0A9  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0258)  CS-0x0AA  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0259)                            || 
(0260)  CS-0x0AB  0x34591  0x0AB  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0261)  CS-0x0AC  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0262)  CS-0x0AD  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0263)  CS-0x0AE  0x18002         ||         RET
(0264)                            || 	   
(0265)  CS-0x0AF  0x08578  0x0AF  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0266)                            || 
(0267)                            || 
(0268)  CS-0x0B0  0x3712F  0x0B0  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0269)  CS-0x0B1  0x2D101  0x0B1  || outside_for0: 	SUB     R17, 0x01
(0270)                            || 
(0271)  CS-0x0B2  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0272)  CS-0x0B3  0x2D201  0x0B3  || middle_for0:  	SUB     R18, 0x01
(0273)                            ||              
(0274)  CS-0x0B4  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0275)  CS-0x0B5  0x2D301  0x0B5  || inside_for0:  	SUB     R19, 0x01
(0276)  CS-0x0B6  0x085AB         ||              	BRNE    inside_for0
(0277)                            ||              
(0278)  CS-0x0B7  0x23200         ||              	OR      R18, 0x00              
(0279)  CS-0x0B8  0x0859B         ||              	BRNE    middle_for0
(0280)                            ||              
(0281)  CS-0x0B9  0x23100         ||              	OR      R17, 0x00               
(0282)  CS-0x0BA  0x0858B         ||              	BRNE    outside_for0
(0283)  CS-0x0BB  0x18002         || 				ret
(0284)                            || 
(0285)  CS-0x0BC  0x3711F  0x0BC  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0286)  CS-0x0BD  0x2D101  0x0BD  || outside_for: 	SUB     R17, 0x01
(0287)                            || 
(0288)  CS-0x0BE  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0289)  CS-0x0BF  0x2D201  0x0BF  || middle_for:  	SUB     R18, 0x01
(0290)                            ||              
(0291)  CS-0x0C0  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0292)  CS-0x0C1  0x2D301  0x0C1  || inside_for:  	SUB     R19, 0x01
(0293)  CS-0x0C2  0x0860B         ||              	BRNE    inside_for
(0294)                            ||              
(0295)  CS-0x0C3  0x23200         ||              	or     R18, 0x00              
(0296)  CS-0x0C4  0x085FB         ||              	BRNE    middle_for
(0297)                            ||              
(0298)  CS-0x0C5  0x31100         ||              	CMP      R17, 0x00               
(0299)  CS-0x0C6  0x085EB         ||              	BRNE    outside_for
(0300)  CS-0x0C7  0x18002         || 				ret
(0301)                            || 
(0302)  CS-0x0C8  0x08581  0x0C8  || win:    call pause
(0303)  CS-0x0C9  0x36827         || 		MOV R8, END_ROW_PLAYER
(0304)  CS-0x0CA  0x3671D         || 		MOV R7, END_COL
(0305)  CS-0x0CB  0x3661C         || 		MOV R6, 0x1C ;GREEN SCREEN
(0306)                     0x0CC  || reset_loop2:
(0307)  CS-0x0CC  0x04439         || 		MOV R4, R7
(0308)  CS-0x0CD  0x04541         || 		MOV R5, R8
(0309)  CS-0x0CE  0x08549         || 		call draw_dot
(0310)  CS-0x0CF  0x2C801         || 		SUB R8, 0x01
(0311)  CS-0x0D0  0x08663         || 		BRNE reset_loop2
(0312)                            || 
(0313)  CS-0x0D1  0x04439         || 		MOV R4, R7
(0314)  CS-0x0D2  0x04541         || 		MOV R5, R8
(0315)  CS-0x0D3  0x08549         || 		call draw_dot
(0316)  CS-0x0D4  0x2C701         || 		SUB R7, 0x01
(0317)  CS-0x0D5  0x307FF         || 		CMP R7, 0xFF
(0318)  CS-0x0D6  0x08663         || 		BRNE reset_loop2
(0319)                            || 	
(0320)  CS-0x0D7  0x08578         || 	    brn done
(0321)  CS-0x0D8  0x08581  0x0D8  || win2:   call pause
(0322)  CS-0x0D9  0x36827         || 		MOV R8, END_ROW_PLAYER
(0323)  CS-0x0DA  0x3671D         || 		MOV R7, END_COL
(0324)  CS-0x0DB  0x366FC         || 		MOV R6, 0xFC ;YELLOW SCREEN
(0325)                     0x0DC  || reset_loop3:
(0326)  CS-0x0DC  0x04439         || 		MOV R4, R7
(0327)  CS-0x0DD  0x04541         || 		MOV R5, R8
(0328)  CS-0x0DE  0x08549         || 		call draw_dot
(0329)  CS-0x0DF  0x2C801         || 		SUB R8, 0x01
(0330)  CS-0x0E0  0x086E3         || 		BRNE reset_loop3
(0331)                            || 
(0332)  CS-0x0E1  0x04439         || 		MOV R4, R7
(0333)  CS-0x0E2  0x04541         || 		MOV R5, R8
(0334)  CS-0x0E3  0x08549         || 		call draw_dot
(0335)  CS-0x0E4  0x2C701         || 		SUB R7, 0x01
(0336)  CS-0x0E5  0x307FF         || 		CMP R7, 0xFF
(0337)  CS-0x0E6  0x086E3         || 		BRNE reset_loop3
(0338)  CS-0x0E7  0x08578         || 		brn done
(0339)                            || 
(0340)                     0x0E8  || lose:     
(0341)  CS-0x0E8  0x08581         || 		call pause
(0342)  CS-0x0E9  0x36827         || 		MOV R8, END_ROW_PLAYER
(0343)  CS-0x0EA  0x3671D         || 		MOV R7, END_COL
(0344)  CS-0x0EB  0x28801         || 		ADD R8, 0x01
(0345)  CS-0x0EC  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0346)                     0x0ED  || reset_loop4:
(0347)  CS-0x0ED  0x04439         || 		MOV R4, R7
(0348)  CS-0x0EE  0x04541         || 		MOV R5, R8
(0349)  CS-0x0EF  0x08549         || 		call draw_dot
(0350)  CS-0x0F0  0x2C801         || 		SUB R8, 0x01
(0351)  CS-0x0F1  0x0876B         || 		BRNE reset_loop4
(0352)                            || 
(0353)  CS-0x0F2  0x04439         || 		MOV R4, R7
(0354)  CS-0x0F3  0x04541         || 		MOV R5, R8
(0355)  CS-0x0F4  0x08549         || 		call draw_dot
(0356)  CS-0x0F5  0x2C701         || 		SUB R7, 0x01
(0357)  CS-0x0F6  0x307FF         || 		CMP R7, 0xFF
(0358)  CS-0x0F7  0x0876B         || 		BRNE reset_loop4
(0359)                            || 
(0360)  CS-0x0F8  0x08578         || 		brn done
(0361)                            || 
(0362)                     0x0F9  || clear_square:
(0363)                            || 
(0364)  CS-0x0F9  0x044D9         ||    MOV  R4, R27   ;y coordin
(0365)  CS-0x0FA  0x045E1         ||    MOV  R5, R28   ;x coordin
(0366)  CS-0x0FB  0x36600         ||    MOV  R6, 0x00
(0367)  CS-0x0FC  0x08549         ||    CALL draw_dot   ;clears dot at the origin
(0368)  CS-0x0FD  0x18002         ||    RET
(0369)                            || 
(0370)                     0x0FE  || ISR: 
(0371)  CS-0x0FE  0x37E00         || 	MOV R30, 0x00
(0372)                            || 
(0373)  CS-0x0FF  0x33420         ||    	IN R20, INTERRUPT_ID
(0374)  CS-0x100  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0375)                            || 	
(0376)  CS-0x101  0x01EA1         || 	OR R30, R20
(0377)  CS-0x102  0x08852         ||     breq testing0
(0378)                            || 
(0379)                            || ;	MOV R30, 0x07
(0380)                            || ;	OR R20, 0x07
(0381)                            || ;	breq testing5
(0382)                            || 
(0383)  CS-0x103  0x11401         ||    LSR R20
(0384)  CS-0x104  0x0AA30         ||    BRCS moveRight
(0385)                            || 
(0386)  CS-0x105  0x11401         ||    LSR R20
(0387)  CS-0x106  0x0A8D0         ||    BRCS shoot   
(0388)                            || 
(0389)  CS-0x107  0x11401         ||    LSR R20  
(0390)  CS-0x108  0x089EA         ||    BREQ moveLeft
(0391)                            || 
(0392)  CS-0x109  0x08A78         ||    brn ISR_END
(0393)                            || 
(0394)                     0x10A  || testing0: 
(0395)  CS-0x10A  0x044D9         ||    MOV  R4, R27   ;y coordin
(0396)  CS-0x10B  0x045E1         ||    MOV  R5, R28   ;x coordin
(0397)                            || 
(0398)  CS-0x10C  0x36603         || 	mov r6, 0x03
(0399)  CS-0x10D  0x08549         ||     call draw_dot
(0400)  CS-0x10E  0x08581         || 	call pause
(0401)  CS-0x10F  0x366FF         || 	mov r6, 0xff
(0402)  CS-0x110  0x08549         || 	call draw_dot
(0403)  CS-0x111  0x08A78         ||     brn isr_end
(0404)                            || 
(0405)                     0x112  || testing5: 
(0406)  CS-0x112  0x044D9         ||    MOV  R4, R27   ;y coordin
(0407)  CS-0x113  0x045E1         ||    MOV  R5, R28   ;x coordin
(0408)                            || 
(0409)  CS-0x114  0x3661C         || 	mov r6, 0x1c
(0410)  CS-0x115  0x08549         ||     call draw_dot
(0411)  CS-0x116  0x08581         || 	call pause
(0412)  CS-0x117  0x366FF         || 	mov r6, 0xff
(0413)  CS-0x118  0x08549         || 	call draw_dot
(0414)  CS-0x119  0x08A78         ||     brn isr_end
(0415)                            || 
(0416)                     0x11A  || shoot: 
(0417)                            ||    
(0418)  CS-0x11A  0x31001         || 	CMP R16, 0x01
(0419)  CS-0x11B  0x0894A         || 	BREQ second_bullet
(0420)                            || 
(0421)  CS-0x11C  0x04469         || 	MOV R4, R13
(0422)  CS-0x11D  0x04561         || 	MOV R5, R12
(0423)  CS-0x11E  0x36600         || 	MOV R6, 0x00
(0424)  CS-0x11F  0x08549         || 	call draw_dot
(0425)                            || 
(0426)  CS-0x120  0x04DD9         ||    Mov R13, R27
(0427)  CS-0x121  0x2CD01         ||    SUB R13, 0x01
(0428)                            || 
(0429)  CS-0x122  0x04CE1         ||    MOV R12, R28
(0430)                            || 
(0431)  CS-0x123  0x04469         ||    MOV R4, R13
(0432)  CS-0x124  0x04561         ||    MOV R5, R12
(0433)  CS-0x125  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0434)  CS-0x126  0x08549         ||    call draw_dot
(0435)                            || 
(0436)  CS-0x127  0x29001         ||    ADD R16, 0x01
(0437)                            ||    
(0438)  CS-0x128  0x089A8         ||    BRN animation
(0439)                            || 
(0440)                     0x129  || second_bullet:		   
(0441)  CS-0x129  0x04479         || 	MOV R4, R15
(0442)  CS-0x12A  0x04571         || 	MOV R5, R14
(0443)  CS-0x12B  0x36600         || 	MOV R6, 0x00
(0444)  CS-0x12C  0x08549         || 	call draw_dot
(0445)                            || 
(0446)  CS-0x12D  0x04FD9         || 	MOV R15, R27
(0447)  CS-0x12E  0x2CF01         || 	SUB R15, 0x01
(0448)                            || 
(0449)  CS-0x12F  0x04EE1         || 	MOV R14, R28	
(0450)                            || 
(0451)  CS-0x130  0x04479         ||    MOV R4, R15
(0452)  CS-0x131  0x04571         ||    MOV R5, R14
(0453)  CS-0x132  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0454)  CS-0x133  0x08549         ||    call draw_dot
(0455)                            || 
(0456)  CS-0x134  0x2D001         ||    SUB R16, 0x01
(0457)                            || 
(0458)                     0x135  || animation:
(0459)  CS-0x135  0x044D9         ||    MOV  R4, R27   ;y coordin
(0460)  CS-0x136  0x045E1         ||    MOV  R5, R28   ;x coordin
(0461)                            || 
(0462)  CS-0x137  0x366E0         || 	  mov R6, 0xE0
(0463)  CS-0x138  0x08549         || 	  call draw_dot
(0464)  CS-0x139  0x085E1         ||       call pause2
(0465)  CS-0x13A  0x366FF         || 	  mov R6, 0xFF
(0466)  CS-0x13B  0x08549         ||       call draw_dot
(0467)  CS-0x13C  0x08A78         || 	  brn ISR_END
(0468)                            || 
(0469)                     0x13D  || moveLeft:
(0470)  CS-0x13D  0x31C00         || 	CMP R28, 0x00
(0471)  CS-0x13E  0x08A7A         || 	BREQ ISR_END
(0472)                            || 
(0473)  CS-0x13F  0x087C9         ||    CALL clear_square
(0474)                            ||    
(0475)  CS-0x140  0x2DC01         ||    SUB  R28, 0x01  
(0476)                            || 
(0477)  CS-0x141  0x044D9         ||    MOV  R4, R27   ;y coordin
(0478)  CS-0x142  0x045E1         ||    MOV  R5, R28   ;x coordin
(0479)  CS-0x143  0x366FF         ||    MOV  R6, 0xFF
(0480)  CS-0x144  0x08549         ||    CALL draw_dot   ;draw red square at origin
(0481)  CS-0x145  0x08A78         ||    brn ISR_END
(0482)                            || 
(0483)                     0x146  || moveRight:
(0484)  CS-0x146  0x31C27         || 	CMP R28, END_ROW_PLAYER
(0485)  CS-0x147  0x08A7A         || 	BREQ ISR_END
(0486)                            || 
(0487)  CS-0x148  0x087C9         ||    CALL clear_square
(0488)                            || 
(0489)                            ||    
(0490)  CS-0x149  0x29C01         ||    ADD  R28, 0x01  
(0491)                            || 
(0492)                            || 
(0493)  CS-0x14A  0x044D9         ||    MOV  R4, R27   ;y coordin
(0494)  CS-0x14B  0x045E1         ||    MOV  R5, R28   ;x coordin
(0495)  CS-0x14C  0x366FF         ||    MOV  R6, 0xFF
(0496)  CS-0x14D  0x08549         ||    CALL draw_dot   ;draw red square at origin
(0497)                            ||    
(0498)  CS-0x14E  0x08A78         || 	brn ISR_END
(0499)                     0x14F  || ISR_END:
(0500)  CS-0x14F  0x1A003         || 		RETIE
(0501)                            || 
(0502)                            || .CSEG
(0503)                       1023  || .ORG 0x3FF
(0504)  CS-0x3FF  0x087F0  0x3FF  || VECTOR:      BRN ISR
(0505)                            || 





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
ANIMATION      0x135   (0458)  ||  0438 
CLEAR_BULLET_1 0x063   (0151)  ||  0143 
CLEAR_BULLET_2 0x070   (0169)  ||  0160 
CLEAR_LOOP     0x092   (0222)  ||  0229 
CLEAR_ROW      0x07A   (0190)  ||  0047 0195 
CLEAR_SHIP     0x08F   (0218)  ||  0207 0213 
CLEAR_SQUARE   0x0F9   (0362)  ||  0192 0473 0487 
COL            0x07F   (0198)  ||  0178 
COLLISION      0x03C   (0093)  ||  
COLLISION2     0x047   (0109)  ||  0095 
COLLISION3     0x052   (0123)  ||  0110 
COLLISION_END  0x055   (0129)  ||  0125 
DD_OUT         0x0AB   (0260)  ||  
DONE           0x0AF   (0265)  ||  0201 0265 0320 0338 0360 
DRAW_DOT       0x0A9   (0256)  ||  0054 0060 0073 0140 0148 0157 0166 0225 0248 0253 
                               ||  0309 0315 0328 0334 0349 0355 0367 0399 0402 0410 
                               ||  0413 0424 0434 0444 0454 0463 0466 0480 0496 
DRAW_NEG       0x0A2   (0246)  ||  0241 
DRAW_SHIP      0x09B   (0234)  ||  0085 0134 
END_MAIN       0x075   (0180)  ||  
INSIDE_FOR     0x0C1   (0292)  ||  0293 
INSIDE_FOR0    0x0B5   (0275)  ||  0276 
ISR            0x0FE   (0370)  ||  0504 
ISR_END        0x14F   (0499)  ||  0392 0403 0414 0467 0471 0481 0485 0498 
LOSE           0x0E8   (0340)  ||  0127 
MAIN           0x03C   (0091)  ||  0184 0188 
MAIN_PAUSE     0x071   (0172)  ||  0167 
MAIN_SHIP      0x055   (0131)  ||  
MIDDLE_FOR     0x0BF   (0289)  ||  0296 
MIDDLE_FOR0    0x0B3   (0272)  ||  0279 
MOVELEFT       0x13D   (0469)  ||  0390 
MOVERIGHT      0x146   (0483)  ||  0384 
OUTSIDE_FOR    0x0BD   (0286)  ||  0299 
OUTSIDE_FOR0   0x0B1   (0269)  ||  0282 
PAUSE          0x0B0   (0268)  ||  0065 0090 0302 0321 0341 0400 0411 
PAUSE2         0x0BC   (0285)  ||  0172 0464 
P_BULLET_1     0x058   (0136)  ||  
P_BULLET_2     0x064   (0153)  ||  0149 
RESET          0x019   (0046)  ||  
RESET_LOOP     0x01D   (0051)  ||  0056 0063 
RESET_LOOP2    0x0CC   (0306)  ||  0311 0318 
RESET_LOOP3    0x0DC   (0325)  ||  0330 0337 
RESET_LOOP4    0x0ED   (0346)  ||  0351 0358 
REST           0x0A3   (0248)  ||  0244 
RET_PAUSE      0x072   (0175)  ||  
SECOND_BULLET  0x129   (0440)  ||  0419 
SET_NEG        0x08A   (0212)  ||  0204 
SHOOT          0x11A   (0416)  ||  0387 
START          0x035   (0081)  ||  0088 0210 0216 
TESTING0       0x10A   (0394)  ||  0377 
TESTING5       0x112   (0405)  ||  
VECTOR         0x3FF   (0504)  ||  
WIN            0x0C8   (0302)  ||  0099 0103 0107 
WIN2           0x0D8   (0321)  ||  0114 0118 0122 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0018)  ||  0049 0067 0200 0304 0323 0343 
END_ROW_PLAYER 0x027   (0017)  ||  0048 0303 0322 0342 0484 
END_ROW_SHIP   0x048   (0016)  ||  0077 0199 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0274 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0291 
INTERRUPT_ID   0x020   (0027)  ||  0373 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0271 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0288 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0268 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0285 
PLAYER_BULLET_COLOR 0x0FC   (0026)  ||  0147 0165 0433 0453 
SHIP_COLOR     0x0E3   (0019)  ||  0252 
SSEG_CNTR_ID   0x060   (0029)  ||  0039 
SSEG_VAL_ID    0x080   (0030)  ||  0374 
VGA_COLOR      0x092   (0006)  ||  0262 
VGA_HADD       0x090   (0004)  ||  0261 
VGA_LADD       0x091   (0005)  ||  0260 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
