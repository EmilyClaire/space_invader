

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
(0025)                       003  || .equ SHIP_BULLET_COLOR = 0x03
(0026)                       022  || .equ SHIP_BULLET_RATE = 0x16
(0027)                       252  || .equ PLAYER_BULLET_COLOR = 0xFC
(0028)                       032  || .EQU INTERRUPT_ID  = 0x20
(0029)                            || 
(0030)                       096  || .equ SSEG_CNTR_ID = 0x60
(0031)                       128  || .equ SSEG_VAL_ID  = 0x80
(0032)                            || 
(0033)                            || .CSEG
(0034)                       016  || .ORG 0x10
(0035)                            || 
(0036)  CS-0x010  0x1A000         ||    SEI
(0037)                            || 
(0038)                            || 
(0039)  CS-0x011  0x36281         || MOV R2, 0x81
(0040)  CS-0x012  0x34260         || OUT R2, SSEG_CNTR_ID
(0041)  CS-0x013  0x37000         || 	MOV R16, 0x00	
(0042)  CS-0x014  0x36CFF         || 	MOV R12, 0xFF
(0043)  CS-0x015  0x36DFF         || 	MOV R13, 0xFF
(0044)  CS-0x016  0x36EFF         || 	MOV R14, 0xFF
(0045)  CS-0x017  0x36FFF         || 	MOV R15, 0xFF
(0046)  CS-0x018  0x37F02         ||     MOV R31, 0x02
(0047)                            || 
(0048)  CS-0x019  0x37E16         || 	MOV R30, SHIP_BULLET_RATE
(0049)  CS-0x01A  0x375FF         || 	MOV R21, 0xFF
(0050)  CS-0x01B  0x376FF         || 	MOV R22, 0xFF
(0051)  CS-0x01C  0x377FF         || 	MOV R23, 0xFF
(0052)  CS-0x01D  0x378FF         || 	MOV R24, 0xFF
(0053)  CS-0x01E  0x379FF         || 	MOV R25, 0xFF
(0054)  CS-0x01F  0x37AFF         || 	MOV R26, 0xFF
(0055)  CS-0x020  0x369FF         || 	MOV R9, 0xFF
(0056)                            || 
(0057)                     0x021  || reset:
(0058)  CS-0x021  0x08741         || 	    CALL clear_row
(0059)  CS-0x022  0x36827         || 		MOV R8, END_ROW_PLAYER
(0060)  CS-0x023  0x3671D         || 		MOV R7, END_COL
(0061)  CS-0x024  0x36600         || 		MOV R6, 0x00
(0062)                     0x025  || reset_loop:
(0063)  CS-0x025  0x04439         || 		MOV R4, R7
(0064)  CS-0x026  0x04541         || 		MOV R5, R8
(0065)  CS-0x027  0x088B9         || 		call draw_dot
(0066)  CS-0x028  0x2C801         || 		SUB R8, 0x01
(0067)  CS-0x029  0x0812B         || 		BRNE reset_loop
(0068)                            || 
(0069)  CS-0x02A  0x04439         || 		MOV R4, R7
(0070)  CS-0x02B  0x04541         || 		MOV R5, R8
(0071)  CS-0x02C  0x088B9         || 		call draw_dot
(0072)  CS-0x02D  0x2C701         || 		SUB R7, 0x01
(0073)  CS-0x02E  0x307FF         || 		CMP R7, 0xFF
(0074)  CS-0x02F  0x0812B         || 		BRNE reset_loop
(0075)                            || 	
(0076)  CS-0x030  0x088F1         || 		call pause
(0077)                            || 
(0078)  CS-0x031  0x37B1D         ||    MOV  R27, END_COL
(0079)  CS-0x032  0x37C14         ||    MOV  R28, 0x14
(0080)  CS-0x033  0x366FF         || 	MOV R6, 0xFF
(0081)  CS-0x034  0x044D9         || 	MOV R4, R27
(0082)  CS-0x035  0x045E1         || 	MOV R5, R28
(0083)  CS-0x036  0x088B9         || 	call draw_dot
(0084)                            || 
(0085)  CS-0x037  0x36700         ||    MOV  R7, 0x00
(0086)  CS-0x038  0x36800         ||    MOV  R8, 0x00 
(0087)  CS-0x039  0x36A48         ||    MOV  R10, END_ROW_SHIP
(0088)  CS-0x03A  0x36B01         || 	MOV R11, 0x01
(0089)  CS-0x03B  0x36303         || 	MOV R3, 0x03
(0090)                            || 	
(0091)                     0x03C  || start:
(0092)                            || 
(0093)  CS-0x03C  0x04439         || 	MOV R4, R7
(0094)  CS-0x03D  0x04541         || 	MOV R5, R8
(0095)  CS-0x03E  0x08849         || 	CALL draw_ship
(0096)  CS-0x03F  0x02858         || 	ADD R8, R11
(0097)  CS-0x040  0x2C301         || 	SUB R3, 0x01
(0098)  CS-0x041  0x081E3         || 	BRNE start
(0099)                            || 
(0100)  CS-0x042  0x088F1         || call pause
(0101)                     0x043  || MAIN:       
(0102)                            || 
(0103)                     0x043  || collision:
(0104)  CS-0x043  0x04D38         || 			CMP R13, R7
(0105)  CS-0x044  0x08273         || 			BRNE collision2
(0106)                            || 
(0107)  CS-0x045  0x05D61         || 			MOV R29, R12
(0108)  CS-0x046  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0109)  CS-0x047  0x089B2         || 			BREQ win
(0110)                            || 
(0111)  CS-0x048  0x03D58         || 			ADD R29, R11
(0112)  CS-0x049  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0113)  CS-0x04A  0x089B2         || 			BREQ win
(0114)                            || 
(0115)  CS-0x04B  0x03D58         || 			ADD R29, R11
(0116)  CS-0x04C  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0117)  CS-0x04D  0x089B2         || 			BREQ win
(0118)                            || 
(0119)  CS-0x04E  0x04F38  0x04E  || collision2: CMP R15, R7
(0120)  CS-0x04F  0x082CB         || 			BRNE collision3
(0121)                            || 
(0122)  CS-0x050  0x05D71         || 			MOV R29, R14
(0123)  CS-0x051  0x05D40         || 			CMP R29, R8  ; check the front of the ship
(0124)  CS-0x052  0x08A32         || 			BREQ win2
(0125)                            || 
(0126)  CS-0x053  0x03D58         || 			ADD R29, R11
(0127)  CS-0x054  0x05D40         || 			CMP R29, R8		; check the middle of the ship
(0128)  CS-0x055  0x08A32         || 			BREQ win2
(0129)                            || 
(0130)  CS-0x056  0x03D58         || 			ADD R29, R11
(0131)  CS-0x057  0x05D40         || 			CMP R29, R8		; check the end of the ship
(0132)  CS-0x058  0x08A32         || 			BREQ win2
(0133)                     0x059  || collision3: 
(0134)  CS-0x059  0x05B38         || 			CMP R27, R7
(0135)  CS-0x05A  0x082E3         || 			BRNE collision_end
(0136)                            || 			
(0137)  CS-0x05B  0x08AB0         || 			BRN lose
(0138)                            || 			
(0139)                     0x05C  || collision_end:
(0140)                            || 
(0141)                     0x05C  || main_ship:
(0142)  CS-0x05C  0x04439         ||             MOV  R4, R7   ;y coordin
(0143)  CS-0x05D  0x04541         || 			MOV  R5, R8   ;x coordin
(0144)  CS-0x05E  0x08849         || 			call draw_ship  
(0145)                            || 
(0146)                     0x05F  || s_bullets_start:
(0147)  CS-0x05F  0x2DE01         || 			SUB R30, 0x01
(0148)  CS-0x060  0x084A3         || 			BRNE s_bullet_1
(0149)                            || 			
(0150)  CS-0x061  0x28901         || 			ADD R9, 0x01
(0151)                            || 
(0152)  CS-0x062  0x30900         || 			CMP R9, 0x00
(0153)  CS-0x063  0x0834A         || 			BREQ start_bullet_1
(0154)                            || 
(0155)  CS-0x064  0x30901         || 			CMP R9, 0x01
(0156)  CS-0x065  0x083BA         || 			BREQ start_bullet_2
(0157)                            || 
(0158)  CS-0x066  0x30902         || 			CMP R9, 0x02
(0159)  CS-0x067  0x0842A         || 			BREQ start_bullet_3
(0160)                            || 			
(0161)  CS-0x068  0x084A0         || 			brn s_bullet_1
(0162)                            || 
(0163)                     0x069  || start_bullet_1:
(0164)  CS-0x069  0x044B1         || 			MOV R4, R22
(0165)  CS-0x06A  0x045A9         || 			MOV R5, R21
(0166)  CS-0x06B  0x36600         || 			MOV R6, 0x00
(0167)  CS-0x06C  0x088B9         || 			call draw_dot
(0168)                            || 			 
(0169)  CS-0x06D  0x37E16         || 			MOV R30, SHIP_BULLET_RATE
(0170)  CS-0x06E  0x05541         || 			MOV R21, R8
(0171)  CS-0x06F  0x0355A         || 			SUB R21, R11
(0172)                            || 
(0173)  CS-0x070  0x05639         || 			MOV R22, R7
(0174)  CS-0x071  0x29601         || 			ADD R22, 0x01
(0175)                            || 			
(0176)  CS-0x072  0x36603         || 			MOV R6, SHIP_BULLET_COLOR
(0177)  CS-0x073  0x045A9         || 			MOV R5, R21
(0178)  CS-0x074  0x044B1         || 			MOV R4, R22
(0179)  CS-0x075  0x088B9         || 			call draw_dot
(0180)                            || 			
(0181)  CS-0x076  0x084A0         || 			brn s_bullet_1
(0182)                            || 
(0183)                            || 
(0184)                     0x077  || start_bullet_2: 
(0185)  CS-0x077  0x044C1         || 			MOV R4, R24
(0186)  CS-0x078  0x045B9         || 			MOV R5, R23
(0187)  CS-0x079  0x36600         || 			MOV R6, 0x00
(0188)  CS-0x07A  0x088B9         || 			call draw_dot
(0189)                            || 
(0190)  CS-0x07B  0x37E16         || 			MOV R30, SHIP_BULLET_RATE
(0191)  CS-0x07C  0x05741         || 			MOV R23, R8
(0192)  CS-0x07D  0x0375A         || 			SUB R23, R11
(0193)                            || 
(0194)  CS-0x07E  0x05839         || 			MOV R24, R7
(0195)  CS-0x07F  0x29801         || 			ADD R24, 0x01
(0196)                            || 			
(0197)  CS-0x080  0x366E0         || 			MOV R6, 0xe0 ;SHIP_BULLET_COLOR
(0198)  CS-0x081  0x045C1         || 			MOV R5, R24
(0199)  CS-0x082  0x044C1         || 			MOV R4, R24
(0200)  CS-0x083  0x088B9         || 			call draw_dot
(0201)                            || 			
(0202)  CS-0x084  0x084A0         || 			brn s_bullet_1
(0203)                            || 
(0204)                            || 
(0205)                     0x085  || start_bullet_3: 
(0206)  CS-0x085  0x044D1         || 			MOV R4, R26
(0207)  CS-0x086  0x045C9         || 			MOV R5, R25
(0208)  CS-0x087  0x36600         || 			MOV R6, 0x00
(0209)  CS-0x088  0x088B9         || 			call draw_dot
(0210)                            || 
(0211)  CS-0x089  0x37E16         || 			MOV R30, SHIP_BULLET_RATE
(0212)  CS-0x08A  0x05941         || 			MOV R25, R8
(0213)  CS-0x08B  0x0395A         || 			SUB R25, R11
(0214)                            || 
(0215)  CS-0x08C  0x05A39         || 			MOV R26, R7
(0216)  CS-0x08D  0x29A01         || 			ADD R26, 0x01
(0217)                            || 			
(0218)  CS-0x08E  0x3661C         || 			MOV R6, 0x1C ;SHIP_BULLET_COLOR
(0219)  CS-0x08F  0x045C9         || 			MOV R5, R25
(0220)  CS-0x090  0x044D1         || 			MOV R4, R26
(0221)  CS-0x091  0x088B9         || 			call draw_dot
(0222)                            || 			
(0223)  CS-0x092  0x369FF         || 			MOV R9, 0xFF
(0224)  CS-0x093  0x084A0         || 			brn s_bullet_1
(0225)                            || 
(0226)                            || 
(0227)                     0x094  || s_bullet_1: 
(0228)                            || 
(0229)  CS-0x094  0x31E16         || 			CMP R30, SHIP_BULLET_RATE
(0230)  CS-0x095  0x084C3         || 			BRNE draw_s_bullet_1
(0231)                            || 
(0232)  CS-0x096  0x30900         || 			CMP R9, 0x00
(0233)  CS-0x097  0x08532         || 			BREQ s_bullet_2
(0234)                            || 
(0235)                     0x098  || draw_s_bullet_1:
(0236)  CS-0x098  0x044B1         || 			MOV R4, R22
(0237)  CS-0x099  0x045A9         || 			MOV R5, R21
(0238)  CS-0x09A  0x36600         || 			MOV R6, 0x00
(0239)  CS-0x09B  0x088B9         || 			call draw_dot
(0240)                            || 			
(0241)  CS-0x09C  0x3161D         || 			CMP R22, END_COL
(0242)  CS-0x09D  0x08522         || 			BREQ clear_s_bullet_1
(0243)                            || 
(0244)  CS-0x09E  0x29601         || 			ADD R22, 0x01
(0245)  CS-0x09F  0x044B1         || 			MOV R4, R22
(0246)  CS-0x0A0  0x045A9         || 			MOV R5, R21
(0247)  CS-0x0A1  0x36603         || 			MOV R6, SHIP_BULLET_COLOR
(0248)  CS-0x0A2  0x088B9         || 			call draw_dot
(0249)  CS-0x0A3  0x08530         || 			brn s_bullet_2
(0250)                            || 
(0251)  CS-0x0A4  0x375FF  0x0A4  || clear_s_bullet_1: MOV R21, 0xFF
(0252)  CS-0x0A5  0x08530         || 				brn s_bullet_2
(0253)                            || 
(0254)                     0x0A6  || s_bullet_2:	
(0255)  CS-0x0A6  0x31E16         || 			CMP R30, SHIP_BULLET_RATE
(0256)  CS-0x0A7  0x08553         || 			BRNE draw_s_bullet_2
(0257)                            || 
(0258)  CS-0x0A8  0x30901         || 			CMP R9, 0x01
(0259)  CS-0x0A9  0x085BA         || 			BREQ s_bullet_3
(0260)                            || 
(0261)                     0x0AA  || draw_s_bullet_2:
(0262)                            || 
(0263)  CS-0x0AA  0x044C1         || 			MOV R4, R24
(0264)  CS-0x0AB  0x045B9         || 			MOV R5, R23
(0265)  CS-0x0AC  0x36600         || 			MOV R6, 0x00
(0266)  CS-0x0AD  0x088B9         || 			call draw_dot
(0267)                            || 			
(0268)  CS-0x0AE  0x3181D         || 			CMP R24, END_COL
(0269)  CS-0x0AF  0x08632         || 			BREQ clear_s_bullet_3
(0270)                            || 
(0271)  CS-0x0B0  0x29801         || 			ADD R24, 0x01
(0272)  CS-0x0B1  0x044C1         || 			MOV R4, R24
(0273)  CS-0x0B2  0x366E1         || 			MOV R6, 0xE1;SHIP_BULLET_COLOR
(0274)  CS-0x0B3  0x088B9         || 			call draw_dot
(0275)  CS-0x0B4  0x085B8         || 			brn s_bullet_3
(0276)                            || 
(0277)  CS-0x0B5  0x377FF  0x0B5  || clear_s_bullet_2: MOV R23, 0xFF
(0278)  CS-0x0B6  0x085B8         || 				brn s_bullet_3
(0279)                            || 
(0280)                     0x0B7  || s_bullet_3:
(0281)  CS-0x0B7  0x31E16         || 			CMP R30, SHIP_BULLET_RATE
(0282)  CS-0x0B8  0x085DB         || 			BRNE draw_s_bullet_3
(0283)                            || 
(0284)  CS-0x0B9  0x309FF         || 			CMP R9, 0xFF
(0285)  CS-0x0BA  0x08642         || 			BREQ p_bullet_1
(0286)                            || 
(0287)                     0x0BB  || draw_s_bullet_3:
(0288)                            || 
(0289)  CS-0x0BB  0x044D1         || 			MOV R4, R26
(0290)  CS-0x0BC  0x045C9         || 			MOV R5, R25
(0291)  CS-0x0BD  0x36600         || 			MOV R6, 0x00
(0292)  CS-0x0BE  0x088B9         || 			call draw_dot
(0293)                            || 			
(0294)  CS-0x0BF  0x31A1D         || 			CMP R26, END_COL
(0295)  CS-0x0C0  0x08632         || 			BREQ clear_s_bullet_3
(0296)                            || 
(0297)  CS-0x0C1  0x29A01         || 			ADD R26, 0x01
(0298)  CS-0x0C2  0x044D1         || 			MOV R4, R26
(0299)  CS-0x0C3  0x3661C         || 			MOV R6, 0x1C;SHIP_BULLET_COLOR
(0300)  CS-0x0C4  0x088B9         || 			call draw_dot
(0301)  CS-0x0C5  0x08640         || 			brn p_bullet_1
(0302)                            || 
(0303)  CS-0x0C6  0x379FF  0x0C6  || clear_s_bullet_3: MOV R25, 0xFF
(0304)  CS-0x0C7  0x08640         || 				brn p_bullet_1
(0305)                            || 
(0306)                     0x0C8  || p_bullet_1:
(0307)  CS-0x0C8  0x04469         || 			MOV R4, R13
(0308)  CS-0x0C9  0x04561         || 			MOV R5, R12
(0309)  CS-0x0CA  0x36600         || 			MOV R6, 0x00
(0310)  CS-0x0CB  0x088B9         || 			call draw_dot
(0311)                            || 
(0312)  CS-0x0CC  0x2CD01         || 			SUB R13, 0x01
(0313)  CS-0x0CD  0x04469         || 			MOV R4, R13
(0314)  CS-0x0CE  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0315)  CS-0x0CF  0x088B9         || 			call draw_dot
(0316)  CS-0x0D0  0x08690         || 			brn p_bullet_2
(0317)                            || 
(0318)  CS-0x0D1  0x36CFF  0x0D1  || clear_bullet_1: MOV R12, 0xFF
(0319)                            || 
(0320)                     0x0D2  || p_bullet_2:
(0321)  CS-0x0D2  0x04479         || 			MOV R4, R15
(0322)  CS-0x0D3  0x04571         || 			MOV R5, R14
(0323)  CS-0x0D4  0x36600         || 			MOV R6, 0x00
(0324)  CS-0x0D5  0x088B9         || 			call draw_dot
(0325)                            || 
(0326)  CS-0x0D6  0x30F00         || 			CMP R15, 0x00
(0327)  CS-0x0D7  0x086F2         || 			BREQ clear_bullet_2
(0328)                            || 
(0329)  CS-0x0D8  0x2CF01         || 			SUB R15, 0x01
(0330)  CS-0x0D9  0x04571         || 			MOV R5, R14
(0331)  CS-0x0DA  0x04479         || 			MOV R4, R15
(0332)  CS-0x0DB  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0333)  CS-0x0DC  0x088B9         || 			call draw_dot
(0334)  CS-0x0DD  0x086F8         || 		    brn main_pause
(0335)                            || 
(0336)                     0x0DE  || clear_bullet_2:
(0337)  CS-0x0DE  0x36EFF         || 			MOV R14, 0xFF
(0338)                            || 
(0339)  CS-0x0DF  0x08951  0x0DF  || main_pause:	call pause2
(0340)                            || 			
(0341)                            || 
(0342)                     0x0E0  || ret_pause:	
(0343)  CS-0x0E0  0x2CA01         || 			SUB R10, 0x01
(0344)  CS-0x0E1  0x30A00         || 			CMP R10, 0x00
(0345)  CS-0x0E2  0x0876A         || 			BREQ col
(0346)                            || 
(0347)                     0x0E3  || end_main:	
(0348)  CS-0x0E3  0x2DF01         || 			SUB R31, 0x01
(0349)  CS-0x0E4  0x0821B         || 			BRNE MAIN
(0350)                            || 			
(0351)  CS-0x0E5  0x37F02         || 			MOV R31, 0x02
(0352)  CS-0x0E6  0x02858         || 			ADD R8, R11
(0353)  CS-0x0E7  0x08218         || 			BRN MAIN
(0354)                            || 
(0355)                     0x0E8  || clear_row:
(0356)                            ||    
(0357)  CS-0x0E8  0x08B39         ||    CALL clear_square
(0358)  CS-0x0E9  0x2C801         ||    SUB R8, 0x01
(0359)  CS-0x0EA  0x308FF         ||    CMP R8, 0xFF
(0360)  CS-0x0EB  0x08743         ||    BRNE clear_row
(0361)  CS-0x0EC  0x18002         ||    RET
(0362)                            || 
(0363)  CS-0x0ED  0x28701  0x0ED  || col:		ADD R7, 0x01
(0364)  CS-0x0EE  0x36A48         || 			MOV R10, END_ROW_SHIP
(0365)  CS-0x0EF  0x3071D         || 			CMP R7, END_COL
(0366)  CS-0x0F0  0x088EA         || 			BREQ DONE
(0367)                            || 			
(0368)  CS-0x0F1  0x30B01         || 			CMP R11, 0x01
(0369)  CS-0x0F2  0x087C2         || 			BREQ set_neg
(0370)                            || 	
(0371)  CS-0x0F3  0x36B01         || 			MOV R11, 0x01
(0372)  CS-0x0F4  0x087E9         || 			call clear_ship
(0373)  CS-0x0F5  0x36801         || 			MOV R8, 0x01
(0374)  CS-0x0F6  0x36303         || 			MOV R3, 0x03
(0375)  CS-0x0F7  0x081E0         || 			BRN start
(0376)                            || 
(0377)  CS-0x0F8  0x36BFF  0x0F8  || set_neg:	MOV R11, 0xFF
(0378)  CS-0x0F9  0x087E9         || 			CALL clear_ship
(0379)  CS-0x0FA  0x36827         || 			MOV R8, 0x27
(0380)  CS-0x0FB  0x36303         || 			MoV R3, 0x03
(0381)  CS-0x0FC  0x081E0         || 			brn start
(0382)                            || 
(0383)                     0x0FD  || clear_ship:
(0384)  CS-0x0FD  0x2C701         || 			SUB R7, 0x01
(0385)  CS-0x0FE  0x36303         || 			MOV R3, 0x03
(0386)  CS-0x0FF  0x36600         || 			MOV R6, 0x00
(0387)                     0x100  || clear_loop: 
(0388)  CS-0x100  0x04541         || 			MOV R5, R8
(0389)  CS-0x101  0x04439         || 			MOV R4, R7
(0390)  CS-0x102  0x088B9         || 			call draw_dot
(0391)  CS-0x103  0x02858         || 			ADD R8, R11
(0392)  CS-0x104  0x2C301         || 			SUB R3, 0x01
(0393)  CS-0x105  0x30303         || 			CMP R3, 0x03
(0394)  CS-0x106  0x08803         || 			BRNE clear_loop
(0395)                            || 						
(0396)  CS-0x107  0x28701         || 			ADD R7, 0x01
(0397)  CS-0x108  0x18002         || 			ret
(0398)                            || 
(0399)                     0x109  || draw_ship:
(0400)  CS-0x109  0x04541         || 			MOV R5, R8
(0401)  CS-0x10A  0x04439         || 			MOV R4, R7
(0402)  CS-0x10B  0x36600         || 			MOV R6, 0x00
(0403)                            || 
(0404)                            || 
(0405)  CS-0x10C  0x30BFF         || 			CMP R11, 0xFF
(0406)  CS-0x10D  0x08882         || 			BREQ draw_neg
(0407)                            || 
(0408)  CS-0x10E  0x2C503         || 			SUB R5, 0x03
(0409)  CS-0x10F  0x08888         || 			brn rest
(0410)                            || 
(0411)  CS-0x110  0x28503  0x110  || draw_neg:	ADD R5, 0x03
(0412)                            || 
(0413)  CS-0x111  0x088B9  0x111  || rest:		call draw_dot
(0414)                            || 
(0415)  CS-0x112  0x04541         || 			MOV R5, R8
(0416)  CS-0x113  0x04439         || 			MOV R4, R7
(0417)  CS-0x114  0x366E3         || 			MOV R6, SHIP_COLOR
(0418)  CS-0x115  0x088B9         || 			call draw_dot
(0419)  CS-0x116  0x18002         || 			ret
(0420)                            || 
(0421)                     0x117  || draw_dot: 
(0422)  CS-0x117  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0423)  CS-0x118  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0424)                            || 
(0425)  CS-0x119  0x34591  0x119  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0426)  CS-0x11A  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0427)  CS-0x11B  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0428)  CS-0x11C  0x18002         ||         RET
(0429)                            || 	   
(0430)  CS-0x11D  0x088E8  0x11D  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0431)                            || 
(0432)                            || 
(0433)  CS-0x11E  0x3712F  0x11E  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0434)  CS-0x11F  0x2D101  0x11F  || outside_for0: 	SUB     R17, 0x01
(0435)                            || 
(0436)  CS-0x120  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0437)  CS-0x121  0x2D201  0x121  || middle_for0:  	SUB     R18, 0x01
(0438)                            ||              
(0439)  CS-0x122  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0440)  CS-0x123  0x2D301  0x123  || inside_for0:  	SUB     R19, 0x01
(0441)  CS-0x124  0x0891B         ||              	BRNE    inside_for0
(0442)                            ||              
(0443)  CS-0x125  0x23200         ||              	OR      R18, 0x00              
(0444)  CS-0x126  0x0890B         ||              	BRNE    middle_for0
(0445)                            ||              
(0446)  CS-0x127  0x23100         ||              	OR      R17, 0x00               
(0447)  CS-0x128  0x088FB         ||              	BRNE    outside_for0
(0448)  CS-0x129  0x18002         || 				ret
(0449)                            || 
(0450)  CS-0x12A  0x3711F  0x12A  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0451)  CS-0x12B  0x2D101  0x12B  || outside_for: 	SUB     R17, 0x01
(0452)                            || 
(0453)  CS-0x12C  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0454)  CS-0x12D  0x2D201  0x12D  || middle_for:  	SUB     R18, 0x01
(0455)                            ||              
(0456)  CS-0x12E  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0457)  CS-0x12F  0x2D301  0x12F  || inside_for:  	SUB     R19, 0x01
(0458)  CS-0x130  0x0897B         ||              	BRNE    inside_for
(0459)                            ||              
(0460)  CS-0x131  0x23200         ||              	or     R18, 0x00              
(0461)  CS-0x132  0x0896B         ||              	BRNE    middle_for
(0462)                            ||              
(0463)  CS-0x133  0x31100         ||              	CMP      R17, 0x00               
(0464)  CS-0x134  0x0895B         ||              	BRNE    outside_for
(0465)  CS-0x135  0x18002         || 				ret
(0466)                            || 
(0467)  CS-0x136  0x088F1  0x136  || win:    call pause
(0468)  CS-0x137  0x36827         || 		MOV R8, END_ROW_PLAYER
(0469)  CS-0x138  0x3671D         || 		MOV R7, END_COL
(0470)  CS-0x139  0x3661C         || 		MOV R6, 0x1C ;GREEN SCREEN
(0471)                     0x13A  || reset_loop2:
(0472)  CS-0x13A  0x04439         || 		MOV R4, R7
(0473)  CS-0x13B  0x04541         || 		MOV R5, R8
(0474)  CS-0x13C  0x088B9         || 		call draw_dot
(0475)  CS-0x13D  0x2C801         || 		SUB R8, 0x01
(0476)  CS-0x13E  0x089D3         || 		BRNE reset_loop2
(0477)                            || 
(0478)  CS-0x13F  0x04439         || 		MOV R4, R7
(0479)  CS-0x140  0x04541         || 		MOV R5, R8
(0480)  CS-0x141  0x088B9         || 		call draw_dot
(0481)  CS-0x142  0x2C701         || 		SUB R7, 0x01
(0482)  CS-0x143  0x307FF         || 		CMP R7, 0xFF
(0483)  CS-0x144  0x089D3         || 		BRNE reset_loop2
(0484)                            || 	
(0485)  CS-0x145  0x088E8         || 	    brn done
(0486)  CS-0x146  0x088F1  0x146  || win2:   call pause
(0487)  CS-0x147  0x36827         || 		MOV R8, END_ROW_PLAYER
(0488)  CS-0x148  0x3671D         || 		MOV R7, END_COL
(0489)  CS-0x149  0x366FC         || 		MOV R6, 0xFC ;YELLOW SCREEN
(0490)                     0x14A  || reset_loop3:
(0491)  CS-0x14A  0x04439         || 		MOV R4, R7
(0492)  CS-0x14B  0x04541         || 		MOV R5, R8
(0493)  CS-0x14C  0x088B9         || 		call draw_dot
(0494)  CS-0x14D  0x2C801         || 		SUB R8, 0x01
(0495)  CS-0x14E  0x08A53         || 		BRNE reset_loop3
(0496)                            || 
(0497)  CS-0x14F  0x04439         || 		MOV R4, R7
(0498)  CS-0x150  0x04541         || 		MOV R5, R8
(0499)  CS-0x151  0x088B9         || 		call draw_dot
(0500)  CS-0x152  0x2C701         || 		SUB R7, 0x01
(0501)  CS-0x153  0x307FF         || 		CMP R7, 0xFF
(0502)  CS-0x154  0x08A53         || 		BRNE reset_loop3
(0503)  CS-0x155  0x088E8         || 		brn done
(0504)                            || 
(0505)                     0x156  || lose:     
(0506)  CS-0x156  0x088F1         || 		call pause
(0507)  CS-0x157  0x36827         || 		MOV R8, END_ROW_PLAYER
(0508)  CS-0x158  0x3671D         || 		MOV R7, END_COL
(0509)  CS-0x159  0x28801         || 		ADD R8, 0x01
(0510)  CS-0x15A  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0511)                     0x15B  || reset_loop4:
(0512)  CS-0x15B  0x04439         || 		MOV R4, R7
(0513)  CS-0x15C  0x04541         || 		MOV R5, R8
(0514)  CS-0x15D  0x088B9         || 		call draw_dot
(0515)  CS-0x15E  0x2C801         || 		SUB R8, 0x01
(0516)  CS-0x15F  0x08ADB         || 		BRNE reset_loop4
(0517)                            || 
(0518)  CS-0x160  0x04439         || 		MOV R4, R7
(0519)  CS-0x161  0x04541         || 		MOV R5, R8
(0520)  CS-0x162  0x088B9         || 		call draw_dot
(0521)  CS-0x163  0x2C701         || 		SUB R7, 0x01
(0522)  CS-0x164  0x307FF         || 		CMP R7, 0xFF
(0523)  CS-0x165  0x08ADB         || 		BRNE reset_loop4
(0524)                            || 
(0525)  CS-0x166  0x088E8         || 		brn done
(0526)                            || 
(0527)                     0x167  || clear_square:
(0528)                            || 
(0529)  CS-0x167  0x044D9         ||    MOV  R4, R27   ;y coordin
(0530)  CS-0x168  0x045E1         ||    MOV  R5, R28   ;x coordin
(0531)  CS-0x169  0x36600         ||    MOV  R6, 0x00
(0532)  CS-0x16A  0x088B9         ||    CALL draw_dot   ;clears dot at the origin
(0533)  CS-0x16B  0x18002         ||    RET
(0534)                            || 
(0535)                     0x16C  || ISR: 
(0536)                            || 
(0537)  CS-0x16C  0x33420         ||    	IN R20, INTERRUPT_ID
(0538)  CS-0x16D  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0539)                            || 	
(0540)  CS-0x16E  0x31400         || 	CMP R20, 0x00
(0541)  CS-0x16F  0x08BBA         ||     breq testing0
(0542)                            || 
(0543)  CS-0x170  0x11401         ||    LSR R20
(0544)  CS-0x171  0x0AD58         ||    BRCS moveRight
(0545)                            || 
(0546)  CS-0x172  0x11401         ||    LSR R20
(0547)  CS-0x173  0x0ABF8         ||    BRCS shoot   
(0548)                            || 
(0549)  CS-0x174  0x11401         ||    LSR R20  
(0550)  CS-0x175  0x08D12         ||    BREQ moveLeft
(0551)                            || 
(0552)  CS-0x176  0x08DA0         ||    brn ISR_END
(0553)                            || 
(0554)                     0x177  || testing0: 
(0555)  CS-0x177  0x044D9         ||    MOV  R4, R27   ;y coordin
(0556)  CS-0x178  0x045E1         ||    MOV  R5, R28   ;x coordin
(0557)                            || 
(0558)  CS-0x179  0x36603         || 	mov r6, 0x03
(0559)  CS-0x17A  0x088B9         ||     call draw_dot
(0560)  CS-0x17B  0x088F1         || 	call pause
(0561)  CS-0x17C  0x366FF         || 	mov r6, 0xff
(0562)  CS-0x17D  0x088B9         || 	call draw_dot
(0563)  CS-0x17E  0x08DA0         ||     brn isr_end
(0564)                            || 
(0565)                     0x17F  || shoot: 
(0566)                            ||    
(0567)  CS-0x17F  0x31001         || 	CMP R16, 0x01
(0568)  CS-0x180  0x08C72         || 	BREQ second_bullet
(0569)                            || 
(0570)  CS-0x181  0x04469         || 	MOV R4, R13
(0571)  CS-0x182  0x04561         || 	MOV R5, R12
(0572)  CS-0x183  0x36600         || 	MOV R6, 0x00
(0573)  CS-0x184  0x088B9         || 	call draw_dot
(0574)                            || 
(0575)  CS-0x185  0x04DD9         ||    Mov R13, R27
(0576)  CS-0x186  0x2CD01         ||    SUB R13, 0x01
(0577)                            || 
(0578)  CS-0x187  0x04CE1         ||    MOV R12, R28
(0579)                            || 
(0580)  CS-0x188  0x04469         ||    MOV R4, R13
(0581)  CS-0x189  0x04561         ||    MOV R5, R12
(0582)  CS-0x18A  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0583)  CS-0x18B  0x088B9         ||    call draw_dot
(0584)                            || 
(0585)  CS-0x18C  0x29001         ||    ADD R16, 0x01
(0586)                            ||    
(0587)  CS-0x18D  0x08CD0         ||    BRN animation
(0588)                            || 
(0589)                     0x18E  || second_bullet:		   
(0590)  CS-0x18E  0x04479         || 	MOV R4, R15
(0591)  CS-0x18F  0x04571         || 	MOV R5, R14
(0592)  CS-0x190  0x36600         || 	MOV R6, 0x00
(0593)  CS-0x191  0x088B9         || 	call draw_dot
(0594)                            || 
(0595)  CS-0x192  0x04FD9         || 	MOV R15, R27
(0596)  CS-0x193  0x2CF01         || 	SUB R15, 0x01
(0597)                            || 
(0598)  CS-0x194  0x04EE1         || 	MOV R14, R28	
(0599)                            || 
(0600)  CS-0x195  0x04479         ||    MOV R4, R15
(0601)  CS-0x196  0x04571         ||    MOV R5, R14
(0602)  CS-0x197  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0603)  CS-0x198  0x088B9         ||    call draw_dot
(0604)                            || 
(0605)  CS-0x199  0x2D001         ||    SUB R16, 0x01
(0606)                            || 
(0607)                     0x19A  || animation:
(0608)  CS-0x19A  0x044D9         ||    MOV  R4, R27   ;y coordin
(0609)  CS-0x19B  0x045E1         ||    MOV  R5, R28   ;x coordin
(0610)                            || 
(0611)  CS-0x19C  0x366E0         || 	  mov R6, 0xE0
(0612)  CS-0x19D  0x088B9         || 	  call draw_dot
(0613)  CS-0x19E  0x08951         ||       call pause2
(0614)  CS-0x19F  0x366FF         || 	  mov R6, 0xFF
(0615)  CS-0x1A0  0x088B9         ||       call draw_dot
(0616)  CS-0x1A1  0x08DA0         || 	  brn ISR_END
(0617)                            || 
(0618)                     0x1A2  || moveLeft:
(0619)  CS-0x1A2  0x31C00         || 	CMP R28, 0x00
(0620)  CS-0x1A3  0x08DA2         || 	BREQ ISR_END
(0621)                            || 
(0622)  CS-0x1A4  0x08B39         ||    CALL clear_square
(0623)                            ||    
(0624)  CS-0x1A5  0x2DC01         ||    SUB  R28, 0x01  
(0625)                            || 
(0626)  CS-0x1A6  0x044D9         ||    MOV  R4, R27   ;y coordin
(0627)  CS-0x1A7  0x045E1         ||    MOV  R5, R28   ;x coordin
(0628)  CS-0x1A8  0x366FF         ||    MOV  R6, 0xFF
(0629)  CS-0x1A9  0x088B9         ||    CALL draw_dot   ;draw red square at origin
(0630)  CS-0x1AA  0x08DA0         ||    brn ISR_END
(0631)                            || 
(0632)                     0x1AB  || moveRight:
(0633)  CS-0x1AB  0x31C27         || 	CMP R28, END_ROW_PLAYER
(0634)  CS-0x1AC  0x08DA2         || 	BREQ ISR_END
(0635)                            || 
(0636)  CS-0x1AD  0x08B39         ||    CALL clear_square
(0637)                            || 
(0638)                            ||    
(0639)  CS-0x1AE  0x29C01         ||    ADD  R28, 0x01  
(0640)                            || 
(0641)                            || 
(0642)  CS-0x1AF  0x044D9         ||    MOV  R4, R27   ;y coordin
(0643)  CS-0x1B0  0x045E1         ||    MOV  R5, R28   ;x coordin
(0644)  CS-0x1B1  0x366FF         ||    MOV  R6, 0xFF
(0645)  CS-0x1B2  0x088B9         ||    CALL draw_dot   ;draw red square at origin
(0646)                            ||    
(0647)  CS-0x1B3  0x08DA0         || 	brn ISR_END
(0648)                     0x1B4  || ISR_END:
(0649)  CS-0x1B4  0x1A003         || 		RETIE
(0650)                            || 
(0651)                            || .CSEG
(0652)                       1023  || .ORG 0x3FF
(0653)  CS-0x3FF  0x08B60  0x3FF  || VECTOR:      BRN ISR
(0654)                            || 





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
ANIMATION      0x19A   (0607)  ||  0587 
CLEAR_BULLET_1 0x0D1   (0318)  ||  
CLEAR_BULLET_2 0x0DE   (0336)  ||  0327 
CLEAR_LOOP     0x100   (0387)  ||  0394 
CLEAR_ROW      0x0E8   (0355)  ||  0058 0360 
CLEAR_SHIP     0x0FD   (0383)  ||  0372 0378 
CLEAR_SQUARE   0x167   (0527)  ||  0357 0622 0636 
CLEAR_S_BULLET_1 0x0A4   (0251)  ||  0242 
CLEAR_S_BULLET_2 0x0B5   (0277)  ||  
CLEAR_S_BULLET_3 0x0C6   (0303)  ||  0269 0295 
COL            0x0ED   (0363)  ||  0345 
COLLISION      0x043   (0103)  ||  
COLLISION2     0x04E   (0119)  ||  0105 
COLLISION3     0x059   (0133)  ||  0120 
COLLISION_END  0x05C   (0139)  ||  0135 
DD_OUT         0x119   (0425)  ||  
DONE           0x11D   (0430)  ||  0366 0430 0485 0503 0525 
DRAW_DOT       0x117   (0421)  ||  0065 0071 0083 0167 0179 0188 0200 0209 0221 0239 
                               ||  0248 0266 0274 0292 0300 0310 0315 0324 0333 0390 
                               ||  0413 0418 0474 0480 0493 0499 0514 0520 0532 0559 
                               ||  0562 0573 0583 0593 0603 0612 0615 0629 0645 
DRAW_NEG       0x110   (0411)  ||  0406 
DRAW_SHIP      0x109   (0399)  ||  0095 0144 
DRAW_S_BULLET_1 0x098   (0235)  ||  0230 
DRAW_S_BULLET_2 0x0AA   (0261)  ||  0256 
DRAW_S_BULLET_3 0x0BB   (0287)  ||  0282 
END_MAIN       0x0E3   (0347)  ||  
INSIDE_FOR     0x12F   (0457)  ||  0458 
INSIDE_FOR0    0x123   (0440)  ||  0441 
ISR            0x16C   (0535)  ||  0653 
ISR_END        0x1B4   (0648)  ||  0552 0563 0616 0620 0630 0634 0647 
LOSE           0x156   (0505)  ||  0137 
MAIN           0x043   (0101)  ||  0349 0353 
MAIN_PAUSE     0x0DF   (0339)  ||  0334 
MAIN_SHIP      0x05C   (0141)  ||  
MIDDLE_FOR     0x12D   (0454)  ||  0461 
MIDDLE_FOR0    0x121   (0437)  ||  0444 
MOVELEFT       0x1A2   (0618)  ||  0550 
MOVERIGHT      0x1AB   (0632)  ||  0544 
OUTSIDE_FOR    0x12B   (0451)  ||  0464 
OUTSIDE_FOR0   0x11F   (0434)  ||  0447 
PAUSE          0x11E   (0433)  ||  0076 0100 0467 0486 0506 0560 
PAUSE2         0x12A   (0450)  ||  0339 0613 
P_BULLET_1     0x0C8   (0306)  ||  0285 0301 0304 
P_BULLET_2     0x0D2   (0320)  ||  0316 
RESET          0x021   (0057)  ||  
RESET_LOOP     0x025   (0062)  ||  0067 0074 
RESET_LOOP2    0x13A   (0471)  ||  0476 0483 
RESET_LOOP3    0x14A   (0490)  ||  0495 0502 
RESET_LOOP4    0x15B   (0511)  ||  0516 0523 
REST           0x111   (0413)  ||  0409 
RET_PAUSE      0x0E0   (0342)  ||  
SECOND_BULLET  0x18E   (0589)  ||  0568 
SET_NEG        0x0F8   (0377)  ||  0369 
SHOOT          0x17F   (0565)  ||  0547 
START          0x03C   (0091)  ||  0098 0375 0381 
START_BULLET_1 0x069   (0163)  ||  0153 
START_BULLET_2 0x077   (0184)  ||  0156 
START_BULLET_3 0x085   (0205)  ||  0159 
S_BULLETS_START 0x05F   (0146)  ||  
S_BULLET_1     0x094   (0227)  ||  0148 0161 0181 0202 0224 
S_BULLET_2     0x0A6   (0254)  ||  0233 0249 0252 
S_BULLET_3     0x0B7   (0280)  ||  0259 0275 0278 
TESTING0       0x177   (0554)  ||  0541 
VECTOR         0x3FF   (0653)  ||  
WIN            0x136   (0467)  ||  0109 0113 0117 
WIN2           0x146   (0486)  ||  0124 0128 0132 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0018)  ||  0060 0078 0241 0268 0294 0365 0469 0488 0508 
END_ROW_PLAYER 0x027   (0017)  ||  0059 0468 0487 0507 0633 
END_ROW_SHIP   0x048   (0016)  ||  0087 0364 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0439 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0456 
INTERRUPT_ID   0x020   (0028)  ||  0537 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0436 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0453 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0433 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0450 
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0314 0332 0582 0602 
SHIP_BULLET_COLOR 0x003   (0025)  ||  0176 0247 
SHIP_BULLET_RATE 0x016   (0026)  ||  0048 0169 0190 0211 0229 0255 0281 
SHIP_COLOR     0x0E3   (0019)  ||  0417 
SSEG_CNTR_ID   0x060   (0030)  ||  0040 
SSEG_VAL_ID    0x080   (0031)  ||  0538 
VGA_COLOR      0x092   (0006)  ||  0427 
VGA_HADD       0x090   (0004)  ||  0426 
VGA_LADD       0x091   (0005)  ||  0425 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
