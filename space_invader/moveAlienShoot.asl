

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
(0016)                       036  || .equ END_ROW_SHIP = 0x24
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
(0041)  CS-0x014  0x36C00         || 	MOV R12, 0x00
(0042)  CS-0x015  0x36D00         || 	MOV R13, 0x00
(0043)  CS-0x016  0x36E00         || 	MOV R14, 0x00
(0044)  CS-0x017  0x36F00         || 	MOV R15, 0x00
(0045)                            || 
(0046)                     0x018  || reset:
(0047)  CS-0x018  0x08399         || 	    CALL clear_row
(0048)  CS-0x019  0x36827         || 		MOV R8, END_ROW_PLAYER
(0049)  CS-0x01A  0x3671D         || 		MOV R7, END_COL
(0050)  CS-0x01B  0x36600         || 		MOV R6, 0x00
(0051)                     0x01C  || reset_loop:
(0052)  CS-0x01C  0x04439         || 		MOV R4, R7
(0053)  CS-0x01D  0x04541         || 		MOV R5, R8
(0054)  CS-0x01E  0x08511         || 		call draw_dot
(0055)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0056)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0057)                            || 
(0058)  CS-0x021  0x2C701         || 		SUB R7, 0x01
(0059)  CS-0x022  0x307FF         || 		CMP R7, 0xFF
(0060)  CS-0x023  0x080E3         || 		BRNE reset_loop
(0061)                            || 	
(0062)  CS-0x024  0x08549         || 		call pause
(0063)                            || 
(0064)  CS-0x025  0x37B03         ||    MOV  R27, 0x03 ;END_COL
(0065)  CS-0x026  0x2DB01         || 	SUB R27, 0x01
(0066)  CS-0x027  0x37C14         ||    MOV  R28, 0x14
(0067)  CS-0x028  0x366FF         || 	MOV R6, 0xFF
(0068)  CS-0x029  0x044D9         || 	MOV R4, R27
(0069)  CS-0x02A  0x045E1         || 	MOV R5, R28
(0070)  CS-0x02B  0x08511         || 	call draw_dot
(0071)                            || 
(0072)  CS-0x02C  0x36700         ||    MOV  R7, 0x00
(0073)  CS-0x02D  0x36801         ||    MOV  R8, 0x01 
(0074)  CS-0x02E  0x36A24         ||    MOV  R10, END_ROW_SHIP
(0075)  CS-0x02F  0x36B01         || 	MOV R11, 0x01
(0076)  CS-0x030  0x36303         || 	MOV R3, 0x03
(0077)                            || 	
(0078)                     0x031  || start:
(0079)                            || 
(0080)  CS-0x031  0x04439         || 	MOV R4, R7
(0081)  CS-0x032  0x04541         || 	MOV R5, R8
(0082)  CS-0x033  0x084A1         || 	CALL draw_ship
(0083)  CS-0x034  0x02858         || 	ADD R8, R11
(0084)  CS-0x035  0x2C301         || 	SUB R3, 0x01
(0085)  CS-0x036  0x0818B         || 	BRNE start
(0086)                            || 
(0087)  CS-0x037  0x08549         || call pause
(0088)                     0x038  || MAIN:       
(0089)                            || 
(0090)                     0x038  || collision:
(0091)  CS-0x038  0x04D38         || 			CMP R13, R7
(0092)  CS-0x039  0x0821B         || 			BRNE collision2
(0093)                            || 
(0094)  CS-0x03A  0x05D61         || 			MOV R29, R12
(0095)  CS-0x03B  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0096)  CS-0x03C  0x0860A         || 			BREQ win
(0097)                            || 
(0098)  CS-0x03D  0x03D58         || 			ADD R29, R11
(0099)  CS-0x03E  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0100)  CS-0x03F  0x0860A         || 			BREQ win
(0101)                            || 
(0102)  CS-0x040  0x03D58         || 			ADD R29, R11
(0103)  CS-0x041  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0104)  CS-0x042  0x0860A         || 			BREQ win
(0105)                            || 
(0106)  CS-0x043  0x04F38  0x043  || collision2: CMP R15, R7
(0107)  CS-0x044  0x08273         || 			BRNE collision3
(0108)                            || 
(0109)  CS-0x045  0x05D71         || 			MOV R29, R14
(0110)  CS-0x046  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0111)  CS-0x047  0x08672         || 			BREQ win2
(0112)                            || 
(0113)  CS-0x048  0x03D58         || 			ADD R29, R11
(0114)  CS-0x049  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0115)  CS-0x04A  0x08672         || 			BREQ win2
(0116)                            || 
(0117)  CS-0x04B  0x03D58         || 			ADD R29, R11
(0118)  CS-0x04C  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0119)  CS-0x04D  0x08672         || 			BREQ win2
(0120)                     0x04E  || collision3: 
(0121)  CS-0x04E  0x05B38         || 			CMP R27, R7
(0122)  CS-0x04F  0x0828B         || 			BRNE collision_end
(0123)                            || 			
(0124)  CS-0x050  0x086D8         || 			BRN lose
(0125)                            || 			
(0126)                     0x051  || collision_end:
(0127)                            || 
(0128)                     0x051  || main_ship:
(0129)  CS-0x051  0x04439         ||             MOV  R4, R7   ;y coordin
(0130)  CS-0x052  0x04541         || 			MOV  R5, R8   ;x coordin
(0131)  CS-0x053  0x084A1         || 			call draw_ship  
(0132)                            || 			
(0133)                     0x054  || p_bullet_1:
(0134)  CS-0x054  0x04469         || 			MOV R4, R13
(0135)  CS-0x055  0x04561         || 			MOV R5, R12
(0136)  CS-0x056  0x36600         || 			MOV R6, 0x00
(0137)  CS-0x057  0x08511         || 			call draw_dot
(0138)                            || 
(0139)  CS-0x058  0x30D00         || 			CMP R13, 0x00
(0140)  CS-0x059  0x082FA         || 			BREQ clear_bullet_1
(0141)                            || 
(0142)  CS-0x05A  0x2CD01         || 			SUB R13, 0x01
(0143)  CS-0x05B  0x04469         || 			MOV R4, R13
(0144)  CS-0x05C  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0145)  CS-0x05D  0x08511         || 			call draw_dot
(0146)  CS-0x05E  0x08300         || 			brn p_bullet_2
(0147)                            || 
(0148)  CS-0x05F  0x36C00  0x05F  || clear_bullet_1: MOV R12, 0x00
(0149)                            || 
(0150)                     0x060  || p_bullet_2:
(0151)  CS-0x060  0x04479         || 			MOV R4, R15
(0152)  CS-0x061  0x04571         || 			MOV R5, R14
(0153)  CS-0x062  0x36600         || 			MOV R6, 0x00
(0154)  CS-0x063  0x08511         || 			call draw_dot
(0155)                            || 
(0156)  CS-0x064  0x30F00         || 			CMP R15, 0x00
(0157)  CS-0x065  0x08362         || 			BREQ clear_bullet_2
(0158)                            || 
(0159)  CS-0x066  0x2CF01         || 			SUB R15, 0x01
(0160)  CS-0x067  0x04571         || 			MOV R5, R14
(0161)  CS-0x068  0x04479         || 			MOV R4, R15
(0162)  CS-0x069  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0163)  CS-0x06A  0x08511         || 			call draw_dot
(0164)  CS-0x06B  0x08368         || 		    brn main_pause
(0165)                            || 
(0166)                     0x06C  || clear_bullet_2:
(0167)  CS-0x06C  0x36E00         || 			MOV R14, 0x00
(0168)                            || 
(0169)  CS-0x06D  0x08549  0x06D  || main_pause:	call pause
(0170)                            || 			
(0171)                            || 
(0172)  CS-0x06E  0x2CA01  0x06E  || ret_pause:	SUB R10, 0x01
(0173)  CS-0x06F  0x30A00         || 			CMP R10, 0x00
(0174)  CS-0x070  0x083C2         || 			BREQ col
(0175)                            || 
(0176)                            || 
(0177)  CS-0x071  0x02858  0x071  || end_main:	ADD R8, R11
(0178)  CS-0x072  0x081C0         || 			BRN MAIN
(0179)                            || 
(0180)                     0x073  || clear_row:
(0181)                            ||    
(0182)  CS-0x073  0x08741         ||    CALL clear_square
(0183)  CS-0x074  0x2C801         ||    SUB R8, 0x01
(0184)  CS-0x075  0x308FF         ||    CMP R8, 0xFF
(0185)  CS-0x076  0x0839B         ||    BRNE clear_row
(0186)  CS-0x077  0x18002         ||    RET
(0187)                            || 
(0188)  CS-0x078  0x28701  0x078  || col:		ADD R7, 0x01
(0189)  CS-0x079  0x36A24         || 			MOV R10, END_ROW_SHIP
(0190)  CS-0x07A  0x3071D         || 			CMP R7, END_COL
(0191)  CS-0x07B  0x08542         || 			BREQ DONE
(0192)                            || 			
(0193)  CS-0x07C  0x30B01         || 			CMP R11, 0x01
(0194)  CS-0x07D  0x0841A         || 			BREQ set_neg
(0195)                            || 	
(0196)  CS-0x07E  0x36B01         || 			MOV R11, 0x01
(0197)  CS-0x07F  0x08441         || 			call clear_ship
(0198)  CS-0x080  0x36801         || 			MOV R8, 0x01
(0199)  CS-0x081  0x36303         || 			MOV R3, 0x03
(0200)  CS-0x082  0x08188         || 			BRN start
(0201)                            || 
(0202)  CS-0x083  0x36BFF  0x083  || set_neg:	MOV R11, 0xFF
(0203)  CS-0x084  0x08441         || 			CALL clear_ship
(0204)  CS-0x085  0x36827         || 			MOV R8, 0x27
(0205)  CS-0x086  0x36303         || 			MoV R3, 0x03
(0206)  CS-0x087  0x08188         || 			brn start
(0207)                            || 
(0208)                     0x088  || clear_ship:
(0209)  CS-0x088  0x2C701         || 			SUB R7, 0x01
(0210)  CS-0x089  0x36303         || 			MOV R3, 0x03
(0211)  CS-0x08A  0x36600         || 			MOV R6, 0x00
(0212)                     0x08B  || clear_loop: 
(0213)  CS-0x08B  0x04541         || 			MOV R5, R8
(0214)  CS-0x08C  0x04439         || 			MOV R4, R7
(0215)  CS-0x08D  0x08511         || 			call draw_dot
(0216)  CS-0x08E  0x02858         || 			ADD R8, R11
(0217)  CS-0x08F  0x2C301         || 			SUB R3, 0x01
(0218)  CS-0x090  0x30303         || 			CMP R3, 0x03
(0219)  CS-0x091  0x0845B         || 			BRNE clear_loop
(0220)                            || 						
(0221)  CS-0x092  0x28701         || 			ADD R7, 0x01
(0222)  CS-0x093  0x18002         || 			ret
(0223)                            || 
(0224)                     0x094  || draw_ship:
(0225)  CS-0x094  0x04541         || 			MOV R5, R8
(0226)  CS-0x095  0x04439         || 			MOV R4, R7
(0227)  CS-0x096  0x36600         || 			MOV R6, 0x00
(0228)                            || 
(0229)                            || 
(0230)  CS-0x097  0x30BFF         || 			CMP R11, 0xFF
(0231)  CS-0x098  0x084DA         || 			BREQ draw_neg
(0232)                            || 
(0233)  CS-0x099  0x2C503         || 			SUB R5, 0x03
(0234)  CS-0x09A  0x084E0         || 			brn rest
(0235)                            || 
(0236)  CS-0x09B  0x28503  0x09B  || draw_neg:	ADD R5, 0x03
(0237)                            || 
(0238)  CS-0x09C  0x08511  0x09C  || rest:		call draw_dot
(0239)                            || 
(0240)  CS-0x09D  0x04541         || 			MOV R5, R8
(0241)  CS-0x09E  0x04439         || 			MOV R4, R7
(0242)  CS-0x09F  0x366E3         || 			MOV R6, SHIP_COLOR
(0243)  CS-0x0A0  0x08511         || 			call draw_dot
(0244)  CS-0x0A1  0x18002         || 			ret
(0245)                            || 
(0246)                     0x0A2  || draw_dot: 
(0247)  CS-0x0A2  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0248)  CS-0x0A3  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0249)                            || 
(0250)  CS-0x0A4  0x34591  0x0A4  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0251)  CS-0x0A5  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0252)  CS-0x0A6  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0253)  CS-0x0A7  0x18002         ||         RET
(0254)                            || 	   
(0255)  CS-0x0A8  0x08540  0x0A8  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0256)                            || 
(0257)                            || 
(0258)  CS-0x0A9  0x3712F  0x0A9  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0259)  CS-0x0AA  0x2D101  0x0AA  || outside_for0: 	SUB     R17, 0x01
(0260)                            || 
(0261)  CS-0x0AB  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0262)  CS-0x0AC  0x2D201  0x0AC  || middle_for0:  	SUB     R18, 0x01
(0263)                            ||              
(0264)  CS-0x0AD  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0265)  CS-0x0AE  0x2D301  0x0AE  || inside_for0:  	SUB     R19, 0x01
(0266)  CS-0x0AF  0x08573         ||              	BRNE    inside_for0
(0267)                            ||              
(0268)  CS-0x0B0  0x23200         ||              	OR      R18, 0x00              
(0269)  CS-0x0B1  0x08563         ||              	BRNE    middle_for0
(0270)                            ||              
(0271)  CS-0x0B2  0x23100         ||              	OR      R17, 0x00               
(0272)  CS-0x0B3  0x08553         ||              	BRNE    outside_for0
(0273)  CS-0x0B4  0x18002         || 				ret
(0274)                            || 
(0275)  CS-0x0B5  0x3711F  0x0B5  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0276)  CS-0x0B6  0x2D101  0x0B6  || outside_for: 	SUB     R17, 0x01
(0277)                            || 
(0278)  CS-0x0B7  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0279)  CS-0x0B8  0x2D201  0x0B8  || middle_for:  	SUB     R18, 0x01
(0280)                            ||              
(0281)  CS-0x0B9  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0282)  CS-0x0BA  0x2D301  0x0BA  || inside_for:  	SUB     R19, 0x01
(0283)  CS-0x0BB  0x085D3         ||              	BRNE    inside_for
(0284)                            ||              
(0285)  CS-0x0BC  0x23200         ||              	or     R18, 0x00              
(0286)  CS-0x0BD  0x085C3         ||              	BRNE    middle_for
(0287)                            ||              
(0288)  CS-0x0BE  0x31100         ||              	CMP      R17, 0x00               
(0289)  CS-0x0BF  0x085B3         ||              	BRNE    outside_for
(0290)  CS-0x0C0  0x18002         || 				ret
(0291)                            || 
(0292)  CS-0x0C1  0x08549  0x0C1  || win:    call pause
(0293)  CS-0x0C2  0x36827         || 		MOV R8, END_ROW_PLAYER
(0294)  CS-0x0C3  0x3671D         || 		MOV R7, END_COL
(0295)  CS-0x0C4  0x3661C         || 		MOV R6, 0x1C ;GREEN SCREEN
(0296)                     0x0C5  || reset_loop2:
(0297)  CS-0x0C5  0x04439         || 		MOV R4, R7
(0298)  CS-0x0C6  0x04541         || 		MOV R5, R8
(0299)  CS-0x0C7  0x08511         || 		call draw_dot
(0300)  CS-0x0C8  0x2C801         || 		SUB R8, 0x01
(0301)  CS-0x0C9  0x0862B         || 		BRNE reset_loop2
(0302)                            || 
(0303)  CS-0x0CA  0x2C701         || 		SUB R7, 0x01
(0304)  CS-0x0CB  0x307FF         || 		CMP R7, 0xFF
(0305)  CS-0x0CC  0x0862B         || 		BRNE reset_loop2
(0306)                            || 	
(0307)  CS-0x0CD  0x08540         || 	    brn done
(0308)  CS-0x0CE  0x08549  0x0CE  || win2:   call pause
(0309)  CS-0x0CF  0x36827         || 		MOV R8, END_ROW_PLAYER
(0310)  CS-0x0D0  0x3671D         || 		MOV R7, END_COL
(0311)  CS-0x0D1  0x366FC         || 		MOV R6, 0xFC ;YELLOW SCREEN
(0312)                     0x0D2  || reset_loop3:
(0313)  CS-0x0D2  0x04439         || 		MOV R4, R7
(0314)  CS-0x0D3  0x04541         || 		MOV R5, R8
(0315)  CS-0x0D4  0x08511         || 		call draw_dot
(0316)  CS-0x0D5  0x2C801         || 		SUB R8, 0x01
(0317)  CS-0x0D6  0x08693         || 		BRNE reset_loop3
(0318)                            || 
(0319)  CS-0x0D7  0x2C701         || 		SUB R7, 0x01
(0320)  CS-0x0D8  0x307FF         || 		CMP R7, 0xFF
(0321)  CS-0x0D9  0x08693         || 		BRNE reset_loop3
(0322)  CS-0x0DA  0x08540         || 		brn done
(0323)                            || 
(0324)                     0x0DB  || lose:     
(0325)  CS-0x0DB  0x08549         || 		call pause
(0326)  CS-0x0DC  0x36827         || 		MOV R8, END_ROW_PLAYER
(0327)  CS-0x0DD  0x3671D         || 		MOV R7, END_COL
(0328)  CS-0x0DE  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0329)                     0x0DF  || reset_loop4:
(0330)  CS-0x0DF  0x04439         || 		MOV R4, R7
(0331)  CS-0x0E0  0x04541         || 		MOV R5, R8
(0332)  CS-0x0E1  0x08511         || 		call draw_dot
(0333)  CS-0x0E2  0x2C801         || 		SUB R8, 0x01
(0334)  CS-0x0E3  0x086FB         || 		BRNE reset_loop4
(0335)                            || 
(0336)  CS-0x0E4  0x2C701         || 		SUB R7, 0x01
(0337)  CS-0x0E5  0x307FF         || 		CMP R7, 0xFF
(0338)  CS-0x0E6  0x086FB         || 		BRNE reset_loop4
(0339)                            || 
(0340)  CS-0x0E7  0x08540         || 		brn done
(0341)                            || 
(0342)                     0x0E8  || clear_square:
(0343)                            || 
(0344)  CS-0x0E8  0x044D9         ||    MOV  R4, R27   ;y coordin
(0345)  CS-0x0E9  0x045E1         ||    MOV  R5, R28   ;x coordin
(0346)  CS-0x0EA  0x36600         ||    MOV  R6, 0x00
(0347)  CS-0x0EB  0x08511         ||    CALL draw_dot   ;clears dot at the origin
(0348)  CS-0x0EC  0x18002         ||    RET
(0349)                            || 
(0350)                     0x0ED  || ISR: 
(0351)  CS-0x0ED  0x33420         ||    	IN R20, INTERRUPT_ID
(0352)  CS-0x0EE  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0353)                            || 
(0354)  CS-0x0EF  0x31400         || 	cmp R20, 0x00
(0355)  CS-0x0F0  0x087D2         ||     breq testing0
(0356)                            || 
(0357)  CS-0x0F1  0x31403         || 	CMP R20, 0x03
(0358)  CS-0x0F2  0x08812         || 	breq testing5
(0359)                            || 
(0360)  CS-0x0F3  0x31405         ||    CMP R20, 0x05
(0361)  CS-0x0F4  0x08852         ||    BREQ shoot
(0362)                            || 
(0363)  CS-0x0F5  0x31402         ||    CMP R20, 0x02
(0364)  CS-0x0F6  0x0896A         ||    BREQ moveLeft   
(0365)                            || 
(0366)  CS-0x0F7  0x31401         ||    CMP R20, 0x01  
(0367)  CS-0x0F8  0x089B2         ||    BREQ moveRight
(0368)                            || 
(0369)  CS-0x0F9  0x089F8         ||    brn ISR_END
(0370)                            || 
(0371)                     0x0FA  || testing0: 
(0372)  CS-0x0FA  0x044D9         ||    MOV  R4, R27   ;y coordin
(0373)  CS-0x0FB  0x045E1         ||    MOV  R5, R28   ;x coordin
(0374)                            || 
(0375)  CS-0x0FC  0x36603         || 	mov r6, 0x03
(0376)  CS-0x0FD  0x08511         ||     call draw_dot
(0377)  CS-0x0FE  0x08549         || 	call pause
(0378)  CS-0x0FF  0x366FF         || 	mov r6, 0xff
(0379)  CS-0x100  0x08511         || 	call draw_dot
(0380)  CS-0x101  0x089F8         ||     brn isr_end
(0381)                            || 
(0382)                     0x102  || testing5: 
(0383)  CS-0x102  0x044D9         ||    MOV  R4, R27   ;y coordin
(0384)  CS-0x103  0x045E1         ||    MOV  R5, R28   ;x coordin
(0385)                            || 
(0386)  CS-0x104  0x3661C         || 	mov r6, 0x1c
(0387)  CS-0x105  0x08511         ||     call draw_dot
(0388)  CS-0x106  0x08549         || 	call pause
(0389)  CS-0x107  0x366FF         || 	mov r6, 0xff
(0390)  CS-0x108  0x08511         || 	call draw_dot
(0391)  CS-0x109  0x089F8         ||     brn isr_end
(0392)                            || 
(0393)                     0x10A  || shoot: 
(0394)                            ||    
(0395)  CS-0x10A  0x31001         || 	CMP R16, 0x01
(0396)  CS-0x10B  0x088CA         || 	BREQ second_bullet
(0397)                            || 
(0398)  CS-0x10C  0x04469         || 	MOV R4, R13
(0399)  CS-0x10D  0x04561         || 	MOV R5, R12
(0400)  CS-0x10E  0x36600         || 	MOV R6, 0x00
(0401)  CS-0x10F  0x08511         || 	call draw_dot
(0402)                            || 
(0403)  CS-0x110  0x04DD9         ||    Mov R13, R27
(0404)  CS-0x111  0x2CD01         ||    SUB R13, 0x01
(0405)                            || 
(0406)  CS-0x112  0x04CE1         ||    MOV R12, R28
(0407)                            || 
(0408)  CS-0x113  0x04469         ||    MOV R4, R13
(0409)  CS-0x114  0x04561         ||    MOV R5, R12
(0410)  CS-0x115  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0411)  CS-0x116  0x08511         ||    call draw_dot
(0412)                            || 
(0413)  CS-0x117  0x29001         ||    ADD R16, 0x01
(0414)                            ||    
(0415)  CS-0x118  0x08928         ||    BRN animation
(0416)                            || 
(0417)                     0x119  || second_bullet:		   
(0418)  CS-0x119  0x04479         || 	MOV R4, R15
(0419)  CS-0x11A  0x04571         || 	MOV R5, R14
(0420)  CS-0x11B  0x36600         || 	MOV R6, 0x00
(0421)  CS-0x11C  0x08511         || 	call draw_dot
(0422)                            || 
(0423)  CS-0x11D  0x04FD9         || 	MOV R15, R27
(0424)  CS-0x11E  0x2CF01         || 	SUB R15, 0x01
(0425)                            || 
(0426)  CS-0x11F  0x04EE1         || 	MOV R14, R28	
(0427)                            || 
(0428)  CS-0x120  0x04479         ||    MOV R4, R15
(0429)  CS-0x121  0x04571         ||    MOV R5, R14
(0430)  CS-0x122  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0431)  CS-0x123  0x08511         ||    call draw_dot
(0432)                            || 
(0433)  CS-0x124  0x2D001         ||    SUB R16, 0x01
(0434)                            || 
(0435)                     0x125  || animation:
(0436)  CS-0x125  0x044D9         ||    MOV  R4, R27   ;y coordin
(0437)  CS-0x126  0x045E1         ||    MOV  R5, R28   ;x coordin
(0438)                            || 
(0439)  CS-0x127  0x366E0         || 	  mov R6, 0xE0
(0440)  CS-0x128  0x08511         || 	  call draw_dot
(0441)  CS-0x129  0x085A9         ||       call pause2
(0442)  CS-0x12A  0x366FF         || 	  mov R6, 0xFF
(0443)  CS-0x12B  0x08511         ||       call draw_dot
(0444)  CS-0x12C  0x089F8         || 	  brn ISR_END
(0445)                            || 
(0446)                     0x12D  || moveLeft:
(0447)  CS-0x12D  0x31C01         || 	CMP R28, 0x01
(0448)  CS-0x12E  0x089FA         || 	BREQ ISR_END
(0449)                            || 
(0450)  CS-0x12F  0x08741         ||    CALL clear_square
(0451)                            ||    
(0452)  CS-0x130  0x2DC01         ||    SUB  R28, 0x01  
(0453)                            || 
(0454)  CS-0x131  0x044D9         ||    MOV  R4, R27   ;y coordin
(0455)  CS-0x132  0x045E1         ||    MOV  R5, R28   ;x coordin
(0456)  CS-0x133  0x366FF         ||    MOV  R6, 0xFF
(0457)  CS-0x134  0x08511         ||    CALL draw_dot   ;draw red square at origin
(0458)  CS-0x135  0x089F8         ||    brn ISR_END
(0459)                            || 
(0460)                     0x136  || moveRight:
(0461)  CS-0x136  0x31C27         || 	CMP R28, END_ROW_PLAYER
(0462)  CS-0x137  0x089FA         || 	BREQ ISR_END
(0463)                            || 
(0464)  CS-0x138  0x08741         ||    CALL clear_square
(0465)                            || 
(0466)                            ||    
(0467)  CS-0x139  0x29C01         ||    ADD  R28, 0x01  
(0468)                            || 
(0469)                            || 
(0470)  CS-0x13A  0x044D9         ||    MOV  R4, R27   ;y coordin
(0471)  CS-0x13B  0x045E1         ||    MOV  R5, R28   ;x coordin
(0472)  CS-0x13C  0x366FF         ||    MOV  R6, 0xFF
(0473)  CS-0x13D  0x08511         ||    CALL draw_dot   ;draw red square at origin
(0474)                            ||    
(0475)  CS-0x13E  0x089F8         || 	brn ISR_END
(0476)                     0x13F  || ISR_END:
(0477)  CS-0x13F  0x1A003         || 		RETIE
(0478)                            || 
(0479)                            || .CSEG
(0480)                       1023  || .ORG 0x3FF
(0481)  CS-0x3FF  0x08768  0x3FF  || VECTOR:      BRN ISR
(0482)                            || 





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
ANIMATION      0x125   (0435)  ||  0415 
CLEAR_BULLET_1 0x05F   (0148)  ||  0140 
CLEAR_BULLET_2 0x06C   (0166)  ||  0157 
CLEAR_LOOP     0x08B   (0212)  ||  0219 
CLEAR_ROW      0x073   (0180)  ||  0047 0185 
CLEAR_SHIP     0x088   (0208)  ||  0197 0203 
CLEAR_SQUARE   0x0E8   (0342)  ||  0182 0450 0464 
COL            0x078   (0188)  ||  0174 
COLLISION      0x038   (0090)  ||  
COLLISION2     0x043   (0106)  ||  0092 
COLLISION3     0x04E   (0120)  ||  0107 
COLLISION_END  0x051   (0126)  ||  0122 
DD_OUT         0x0A4   (0250)  ||  
DONE           0x0A8   (0255)  ||  0191 0255 0307 0322 0340 
DRAW_DOT       0x0A2   (0246)  ||  0054 0070 0137 0145 0154 0163 0215 0238 0243 0299 
                               ||  0315 0332 0347 0376 0379 0387 0390 0401 0411 0421 
                               ||  0431 0440 0443 0457 0473 
DRAW_NEG       0x09B   (0236)  ||  0231 
DRAW_SHIP      0x094   (0224)  ||  0082 0131 
END_MAIN       0x071   (0177)  ||  
INSIDE_FOR     0x0BA   (0282)  ||  0283 
INSIDE_FOR0    0x0AE   (0265)  ||  0266 
ISR            0x0ED   (0350)  ||  0481 
ISR_END        0x13F   (0476)  ||  0369 0380 0391 0444 0448 0458 0462 0475 
LOSE           0x0DB   (0324)  ||  0124 
MAIN           0x038   (0088)  ||  0178 
MAIN_PAUSE     0x06D   (0169)  ||  0164 
MAIN_SHIP      0x051   (0128)  ||  
MIDDLE_FOR     0x0B8   (0279)  ||  0286 
MIDDLE_FOR0    0x0AC   (0262)  ||  0269 
MOVELEFT       0x12D   (0446)  ||  0364 
MOVERIGHT      0x136   (0460)  ||  0367 
OUTSIDE_FOR    0x0B6   (0276)  ||  0289 
OUTSIDE_FOR0   0x0AA   (0259)  ||  0272 
PAUSE          0x0A9   (0258)  ||  0062 0087 0169 0292 0308 0325 0377 0388 
PAUSE2         0x0B5   (0275)  ||  0441 
P_BULLET_1     0x054   (0133)  ||  
P_BULLET_2     0x060   (0150)  ||  0146 
RESET          0x018   (0046)  ||  
RESET_LOOP     0x01C   (0051)  ||  0056 0060 
RESET_LOOP2    0x0C5   (0296)  ||  0301 0305 
RESET_LOOP3    0x0D2   (0312)  ||  0317 0321 
RESET_LOOP4    0x0DF   (0329)  ||  0334 0338 
REST           0x09C   (0238)  ||  0234 
RET_PAUSE      0x06E   (0172)  ||  
SECOND_BULLET  0x119   (0417)  ||  0396 
SET_NEG        0x083   (0202)  ||  0194 
SHOOT          0x10A   (0393)  ||  0361 
START          0x031   (0078)  ||  0085 0200 0206 
TESTING0       0x0FA   (0371)  ||  0355 
TESTING5       0x102   (0382)  ||  0358 
VECTOR         0x3FF   (0481)  ||  
WIN            0x0C1   (0292)  ||  0096 0100 0104 
WIN2           0x0CE   (0308)  ||  0111 0115 0119 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0018)  ||  0049 0190 0294 0310 0327 
END_ROW_PLAYER 0x027   (0017)  ||  0048 0293 0309 0326 0461 
END_ROW_SHIP   0x024   (0016)  ||  0074 0189 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0264 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0281 
INTERRUPT_ID   0x020   (0027)  ||  0351 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0261 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0278 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0258 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0275 
PLAYER_BULLET_COLOR 0x0FC   (0026)  ||  0144 0162 0410 0430 
SHIP_COLOR     0x0E3   (0019)  ||  0242 
SSEG_CNTR_ID   0x060   (0029)  ||  0039 
SSEG_VAL_ID    0x080   (0030)  ||  0352 
VGA_COLOR      0x092   (0006)  ||  0252 
VGA_HADD       0x090   (0004)  ||  0251 
VGA_LADD       0x091   (0005)  ||  0250 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
