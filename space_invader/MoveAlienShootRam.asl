

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
(0025)                       255  || .EQU PLAYER_COLOR = 0xFF
(0026)                       003  || .equ SHIP_BULLET_COLOR = 0x03
(0027)                       252  || .equ PLAYER_BULLET_COLOR = 0xFC
(0028)                            || 
(0029)                       018  || .equ SHIP_BULLET_RATE = 0x12
(0030)                            || 
(0031)                            || 
(0032)                       012  || .EQU SHIP_X_LOC = 0x0C
(0033)                       010  || .EQU SHIP_Y_LOC = 0x0A
(0034)                       011  || .EQU SHIP_COLOR_LOC = 0x0B
(0035)                            || 
(0036)                       016  || .EQU PLAYER_X_LOC = 0x10
(0037)                       015  || .EQU PLAYER_COLOR_LOC = 0x0F
(0038)                            || 
(0039)                       032  || .EQU SHIP_BULLETS_LOC = 0x20
(0040)                       064  || .EQU PLAYER_BULLETS_LOC = 0x40
(0041)                       074  || .EQU BULLETS_END_LOC = 0x4A
(0042)                            || 
(0043)                       032  || .EQU INTERRUPT_ID  = 0x20
(0044)                       096  || .equ SSEG_CNTR_ID = 0x60
(0045)                       128  || .equ SSEG_VAL_ID  = 0x80
(0046)                            || 
(0047)                            || .CSEG
(0048)                       016  || .ORG 0x10
(0049)                            || 
(0050)  CS-0x010  0x1A000         ||    SEI
(0051)                            || 
(0052)                            || 
(0053)  CS-0x011  0x36281         || MOV R2, 0x81
(0054)  CS-0x012  0x34260         || OUT R2, SSEG_CNTR_ID
(0055)  CS-0x013  0x37000         || 	MOV R16, 0x00	
(0056)  CS-0x014  0x37F02         ||     MOV R31, 0x02
(0057)  CS-0x015  0x37E12         || 	MOV R30, SHIP_BULLET_RATE
(0058)  CS-0x016  0x36A48         || 	MOV  R10, END_ROW_SHIP
(0059)  CS-0x017  0x36B01         || 	MOV R11, 0x01   
(0060)  CS-0x018  0x36303         || 	MOV R3, 0x03
(0061)                            || 	
(0062)                     0x019  || reset:
(0063)  CS-0x019  0x36827         || 		MOV R8, END_ROW_PLAYER
(0064)  CS-0x01A  0x3671D         || 		MOV R7, END_COL
(0065)  CS-0x01B  0x36600         || 		MOV R6, 0x00
(0066)                            || 
(0067)                     0x01C  || reset_loop:
(0068)  CS-0x01C  0x04439         || 		MOV R4, R7
(0069)  CS-0x01D  0x04541         || 		MOV R5, R8
(0070)  CS-0x01E  0x084B1         || 		call draw_dot
(0071)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0072)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0073)                            || 
(0074)  CS-0x021  0x04439         || 		MOV R4, R7
(0075)  CS-0x022  0x04541         || 		MOV R5, R8
(0076)  CS-0x023  0x084B1         || 		call draw_dot
(0077)  CS-0x024  0x36827         || 		MOV R8, END_ROW_PLAYER
(0078)  CS-0x025  0x2C701         || 		SUB R7, 0x01
(0079)  CS-0x026  0x307FF         || 		CMP R7, 0xFF
(0080)  CS-0x027  0x080E3         || 		BRNE reset_loop
(0081)                            || 
(0082)  CS-0x028  0x08189         || 		call reset_player
(0083)  CS-0x029  0x08421         || 		call reset_ship
(0084)  CS-0x02A  0x08471         || 		call reset_bullets
(0085)                            || 	
(0086)  CS-0x02B  0x084E9         || 		call pause
(0087)                            || 
(0088)  CS-0x02C  0x081D1         || 		call draw_player
(0089)  CS-0x02D  0x08371         || 		call draw_ship
(0090)                            || 
(0091)                     0x02E  || start:
(0092)  CS-0x02E  0x08321         || 		call move_ship
(0093)  CS-0x02F  0x084E9         || 		call pause
(0094)                            || 
(0095)  CS-0x030  0x084E0         || 		brn done
(0096)                            || ;---------------------------------------------------------------------
(0097)                            || ;							Reset Player
(0098)                            || ;
(0099)                            || ;	Sets the player location to the middle of the bottom row
(0100)                            || ;	does not draw the player
(0101)                            || ;---------------------------------------------------------------------
(0102)                            || 
(0103)                     0x031  || reset_player:
(0104)  CS-0x031  0x36914         || 			MOV R9, 0x14
(0105)  CS-0x032  0x37D10         || 			MOV R29, PLAYER_X_LOC
(0106)  CS-0x033  0x36303         || 			MOV R3, 0x03
(0107)                            || 
(0108)                     0x034  || reset_player_loop:
(0109)  CS-0x034  0x049EB         || 			ST R9, (R29)
(0110)  CS-0x035  0x28901         || 			ADD R9, 0x01
(0111)  CS-0x036  0x29D01         || 			ADD R29, 0x01
(0112)  CS-0x037  0x2C301         || 			SUB R3, 0x01
(0113)  CS-0x038  0x081A3         || 			BRNE reset_player_loop
(0114)                            || 
(0115)  CS-0x039  0x18002         || 			ret
(0116)                            || 
(0117)                            || 
(0118)                            || ;---------------------------------------------------------------------
(0119)                            || ;							Draw Player
(0120)                            || ;---------------------------------------------------------------------
(0121)                            || 
(0122)                     0x03A  || draw_player:
(0123)  CS-0x03A  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0124)  CS-0x03B  0x3641D         || 				MOV R4,  END_COL
(0125)  CS-0x03C  0x366FF         || 				MOV R6, PLAYER_COLOR
(0126)  CS-0x03D  0x36303         || 				MOV R3, 0x03
(0127)                            || 
(0128)                     0x03E  || draw_player_loop:
(0129)  CS-0x03E  0x045CA         || 				LD R5, (R25)
(0130)  CS-0x03F  0x084B1         || 				call draw_dot
(0131)                            || 
(0132)  CS-0x040  0x29901         || 				ADD R25, 0x01
(0133)  CS-0x041  0x2C301         || 				SUB R3, 0x01
(0134)  CS-0x042  0x081F3         || 				BRNE draw_player_loop
(0135)                            || 				
(0136)  CS-0x043  0x18002         || 				ret
(0137)                            || 
(0138)                            || 
(0139)                            || ;---------------------------------------------------------------------
(0140)                            || ;							Move Player
(0141)                            || ;---------------------------------------------------------------------
(0142)                            || 
(0143)                     0x044  || move_player:
(0144)  CS-0x044  0x082D1         || 				call clear_player
(0145)                            || 
(0146)  CS-0x045  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0147)  CS-0x046  0x3641D         || 				MOV R4,  END_COL
(0148)  CS-0x047  0x366FF         || 				MOV R6, PLAYER_COLOR
(0149)  CS-0x048  0x36303         || 				MOV R3, 0x03
(0150)                            || 
(0151)  CS-0x049  0x049CA         || 				LD R9, (R25)
(0152)  CS-0x04A  0x30C01         || 				CMP R12, 0x01
(0153)  CS-0x04B  0x0827B         || 				BRNE test_left_player
(0154)                            || 
(0155)                     0x04C  || test_right_player:
(0156)  CS-0x04C  0x30948         || 				CMP R9, END_ROW_SHIP
(0157)  CS-0x04D  0x0828B         || 				BRNE move_player_loop
(0158)  CS-0x04E  0x082C8         || 				brn end_move_player
(0159)                            || 
(0160)                     0x04F  || test_left_player:
(0161)  CS-0x04F  0x30900         || 				CMP R9, 0x00
(0162)  CS-0x050  0x082CA         || 				BREQ end_move_player
(0163)                            || 				
(0164)                     0x051  || move_player_loop:
(0165)  CS-0x051  0x049CA         || 				LD R9, (R25)
(0166)  CS-0x052  0x02960         || 				ADD R9, R12
(0167)  CS-0x053  0x049CB         || 				ST R9, (R25)
(0168)  CS-0x054  0x04549         || 				MOV R5, R9
(0169)  CS-0x055  0x084B1         || 				call draw_dot
(0170)                            || 
(0171)  CS-0x056  0x29901         || 				ADD R25, 0x01
(0172)  CS-0x057  0x2C301         || 				SUB R3, 0x01
(0173)  CS-0x058  0x0828B         || 				BRNE move_player_loop
(0174)                            || 				
(0175)                     0x059  || end_move_player:
(0176)  CS-0x059  0x18002         || 				ret
(0177)                            || 
(0178)                            || ;---------------------------------------------------------------------
(0179)                            || ;							Clear Player
(0180)                            || ;---------------------------------------------------------------------
(0181)                            || 
(0182)                     0x05A  || clear_player: 
(0183)  CS-0x05A  0x37910         || 				MOV R25, PLAYER_X_LOC
(0184)  CS-0x05B  0x3641D         || 				MOV R4, END_COL
(0185)  CS-0x05C  0x36600         || 				MOV R6, 0x00
(0186)                            || 
(0187)  CS-0x05D  0x36303         || 				MOV R3, 0x03
(0188)                            || 
(0189)                     0x05E  || clear_player_loop:
(0190)  CS-0x05E  0x045CA         || 				LD R5, (R25)
(0191)  CS-0x05F  0x084B1         || 				call draw_dot
(0192)                            || 
(0193)  CS-0x060  0x29901         || 				ADD R25, 0x01
(0194)  CS-0x061  0x2C301         || 				SUB R3, 0x01
(0195)  CS-0x062  0x082F3         || 				BRNE clear_player_loop
(0196)                            || 				
(0197)  CS-0x063  0x18002         || 				ret
(0198)                            || 
(0199)                            || 
(0200)                            || 
(0201)                            || 
(0202)                            || ;---------------------------------------------------------------------
(0203)                            || ;							Move Ship
(0204)                            || ;---------------------------------------------------------------------
(0205)                            || 
(0206)                            || 
(0207)                     0x064  || move_ship: 
(0208)  CS-0x064  0x083C9         || 				call clear_ship
(0209)  CS-0x065  0x3790C         || 				MOV R25, SHIP_X_LOC
(0210)  CS-0x066  0x36303         || 				MOV R3, 0x03
(0211)                            || 
(0212)                     0x067  || move_ship_loop:
(0213)  CS-0x067  0x049CA         || 				LD R9, (R25)
(0214)  CS-0x068  0x02958         || 				ADD R9, R11
(0215)                            || 				ST R9, (25)
            syntax error
            syntax error
            syntax error

(0216)  CS-0x069  0x29901         || 				ADD R25, 0x01
(0217)  CS-0x06A  0x2C301         || 				SUB R3, 0x01
(0218)  CS-0x06B  0x0833B         || 				BRNE move_ship_loop
(0219)                            || 
(0220)  CS-0x06C  0x08371         || 				call draw_ship
(0221)  CS-0x06D  0x18002         || 				ret
(0222)                            || 
(0223)                            || 
(0224)                            || ;---------------------------------------------------------------------
(0225)                            || ;							Draw Ship
(0226)                            || ;---------------------------------------------------------------------
(0227)                     0x06E  || draw_ship:
(0228)  CS-0x06E  0x3780A         || 			  	MOV R24, SHIP_Y_LOC
(0229)  CS-0x06F  0x3790C         || 				MOV R25, SHIP_X_LOC
(0230)  CS-0x070  0x366E3         || 				MOV R6, SHIP_COLOR
(0231)  CS-0x071  0x36303         || 				MOV R3, 0x03
(0232)                            || 
(0233)                     0x072  || draw_ship_loop:
(0234)  CS-0x072  0x044C2         || 				LD R4, (R24)
(0235)  CS-0x073  0x045CA         || 				LD R5, (R25)
(0236)  CS-0x074  0x084B1         || 				call draw_dot
(0237)                            || 
(0238)  CS-0x075  0x29901         || 				ADD R25, 0x01
(0239)  CS-0x076  0x2C301         || 				SUB R3, 0x01
(0240)  CS-0x077  0x08393         || 				BRNE draw_ship_loop
(0241)                            || 				
(0242)  CS-0x078  0x18002         || 				ret
(0243)                            || 
(0244)                            || ;---------------------------------------------------------------------
(0245)                            || ;							Clear Ship
(0246)                            || ;---------------------------------------------------------------------
(0247)                            || 
(0248)                     0x079  || clear_ship: 
(0249)  CS-0x079  0x3780A         || 				MOV R24, SHIP_Y_LOC
(0250)  CS-0x07A  0x3790C         || 				MOV R25, SHIP_X_LOC
(0251)  CS-0x07B  0x36600         || 				MOV R6, 0x00
(0252)                            || 
(0253)  CS-0x07C  0x36303         || 				MOV R3, 0x03
(0254)                            || 
(0255)                     0x07D  || clear_ship_loop:
(0256)  CS-0x07D  0x044C2         || 				LD R4, (R24)
(0257)  CS-0x07E  0x045CA         || 				LD R5, (R25)
(0258)  CS-0x07F  0x084B1         || 				call draw_dot
(0259)                            || 
(0260)  CS-0x080  0x29901         || 				ADD R25, 0x01
(0261)  CS-0x081  0x2C301         || 				SUB R3, 0x01
(0262)  CS-0x082  0x083EB         || 				BRNE clear_ship_loop
(0263)                            || 				
(0264)  CS-0x083  0x18002         || 				ret
(0265)                            || 
(0266)                            || ;---------------------------------------------------------------------
(0267)                            || ;							Reset Ship
(0268)                            || ;---------------------------------------------------------------------
(0269)                            || 
(0270)                     0x084  || reset_ship: 
(0271)  CS-0x084  0x36000         || 				MOV R0, 0x00	
(0272)  CS-0x085  0x3780C         || 				MOV R24, SHIP_X_LOC
(0273)  CS-0x086  0x3A00A         || 				ST R0, SHIP_Y_LOC
(0274)  CS-0x087  0x36303         || 				MOV R3, 0x03
(0275)                            || 
(0276)                     0x088  || reset_ship_loop:
(0277)  CS-0x088  0x040C3         || 				ST R0, (R24)
(0278)  CS-0x089  0x29801         || 				ADD R24, 0x01
(0279)  CS-0x08A  0x28001         || 				ADD R0, 0x01
(0280)  CS-0x08B  0x2C301         || 				SUB R3, 0x01
(0281)  CS-0x08C  0x08443         || 				BRNE reset_ship_loop
(0282)                            || 				
(0283)  CS-0x08D  0x18002         || 				ret
(0284)                            || 
(0285)                            || ;---------------------------------------------------------------------
(0286)                            || ;							Reset Bullets
(0287)                            || ;---------------------------------------------------------------------
(0288)                            || 
(0289)                     0x08E  || reset_bullets:  
(0290)  CS-0x08E  0x360FF         || 				MOV R0, 0xFF
(0291)  CS-0x08F  0x37820         || 				MOV R24, SHIP_BULLETS_LOC
(0292)                            || 
(0293)                     0x090  || reset_bullets_loop:
(0294)  CS-0x090  0x3184A         || 				CMP R24, BULLETS_END_LOC
(0295)  CS-0x091  0x084AA         || 				BREQ end_reset_bullets
(0296)                            || 				
(0297)  CS-0x092  0x040C3         || 				ST R0, (R24)
(0298)  CS-0x093  0x29801         || 				ADD R24, 0x01
(0299)  CS-0x094  0x08480         || 				BRN reset_bullets_loop
(0300)                            || 				
(0301)                     0x095  || end_reset_bullets:
(0302)  CS-0x095  0x18002         || 				ret
(0303)                            || 
(0304)                            || 
(0305)                            || ;---------------------------------------------------------------------
(0306)                            || ;							Draw Dot
(0307)                            || ;---------------------------------------------------------------------
(0308)                            || 
(0309)                     0x096  || draw_dot: 
(0310)  CS-0x096  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0311)  CS-0x097  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0312)                            || 
(0313)  CS-0x098  0x34591  0x098  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0314)  CS-0x099  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0315)  CS-0x09A  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0316)  CS-0x09B  0x18002         ||         RET
(0317)                            || 	   
(0318)                            || 
(0319)                            || ;---------------------------------------------------------------------
(0320)                            || ;							Done
(0321)                            || ;
(0322)                            || ; 	Don't do anything anymore
(0323)                            || ;---------------------------------------------------------------------
(0324)                            || 
(0325)  CS-0x09C  0x084E0  0x09C  || DONE:        BRN DONE
(0326)                            || 
(0327)                            || 
(0328)                            || ;---------------------------------------------------------------------
(0329)                            || ;							Pause
(0330)                            || ;
(0331)                            || ;	a long pause
(0332)                            || ;---------------------------------------------------------------------
(0333)                            || 
(0334)  CS-0x09D  0x3712F  0x09D  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0335)  CS-0x09E  0x2D101  0x09E  || outside_for0: 	SUB     R17, 0x01
(0336)                            || 
(0337)  CS-0x09F  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0338)  CS-0x0A0  0x2D201  0x0A0  || middle_for0:  	SUB     R18, 0x01
(0339)                            ||              
(0340)  CS-0x0A1  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0341)  CS-0x0A2  0x2D301  0x0A2  || inside_for0:  	SUB     R19, 0x01
(0342)  CS-0x0A3  0x08513         ||              	BRNE    inside_for0
(0343)                            ||              
(0344)  CS-0x0A4  0x23200         ||              	OR      R18, 0x00              
(0345)  CS-0x0A5  0x08503         ||              	BRNE    middle_for0
(0346)                            ||              
(0347)  CS-0x0A6  0x23100         ||              	OR      R17, 0x00               
(0348)  CS-0x0A7  0x084F3         ||              	BRNE    outside_for0
(0349)  CS-0x0A8  0x18002         || 				ret
(0350)                            || 
(0351)                            || ;---------------------------------------------------------------------
(0352)                            || ;							Pause2
(0353)                            || ;
(0354)                            || ;	a shorter pause
(0355)                            || ;---------------------------------------------------------------------
(0356)                            || 
(0357)                            || 
(0358)  CS-0x0A9  0x3711F  0x0A9  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0359)  CS-0x0AA  0x2D101  0x0AA  || outside_for: 	SUB     R17, 0x01
(0360)                            || 
(0361)  CS-0x0AB  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0362)  CS-0x0AC  0x2D201  0x0AC  || middle_for:  	SUB     R18, 0x01
(0363)                            ||              
(0364)  CS-0x0AD  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0365)  CS-0x0AE  0x2D301  0x0AE  || inside_for:  	SUB     R19, 0x01
(0366)  CS-0x0AF  0x08573         ||              	BRNE    inside_for
(0367)                            ||              
(0368)  CS-0x0B0  0x23200         ||              	or     R18, 0x00              
(0369)  CS-0x0B1  0x08563         ||              	BRNE    middle_for
(0370)                            ||              
(0371)  CS-0x0B2  0x31100         ||              	CMP      R17, 0x00               
(0372)  CS-0x0B3  0x08553         ||              	BRNE    outside_for
(0373)  CS-0x0B4  0x18002         || 				ret
(0374)                            || 
(0375)                            || 
(0376)                     0x0B5  || ISR: 
(0377)                            || 
(0378)  CS-0x0B5  0x33420         ||    	IN R20, INTERRUPT_ID
(0379)  CS-0x0B6  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0380)                            || 	
(0381)  CS-0x0B7  0x31400         || 	CMP R20, 0x00
(0382)  CS-0x0B8  0x08602         ||     breq testing0
(0383)                            || 
(0384)  CS-0x0B9  0x11401         ||    LSR R20
(0385)  CS-0x0BA  0x0A770         ||    BRCS moveRight
(0386)                            || 
(0387)  CS-0x0BB  0x11401         ||    LSR R20
(0388)  CS-0x0BC  0x0A640         ||    BRCS shoot   
(0389)                            || 
(0390)  CS-0x0BD  0x11401         ||    LSR R20  
(0391)  CS-0x0BE  0x0875A         ||    BREQ moveLeft
(0392)                            || 
(0393)  CS-0x0BF  0x08788         ||    brn ISR_END
(0394)                            || 
(0395)                     0x0C0  || testing0: 
(0396)  CS-0x0C0  0x044D9         ||    MOV  R4, R27   ;y coordin
(0397)  CS-0x0C1  0x045E1         ||    MOV  R5, R28   ;x coordin
(0398)                            || 
(0399)  CS-0x0C2  0x36603         || 	mov r6, 0x03
(0400)  CS-0x0C3  0x084B1         ||     call draw_dot
(0401)  CS-0x0C4  0x084E9         || 	call pause
(0402)  CS-0x0C5  0x366FF         || 	mov r6, 0xff
(0403)  CS-0x0C6  0x084B1         || 	call draw_dot
(0404)  CS-0x0C7  0x08788         ||     brn isr_end
(0405)                            || 
(0406)                     0x0C8  || shoot: 
(0407)                            ||    
(0408)  CS-0x0C8  0x31001         || 	CMP R16, 0x01
(0409)  CS-0x0C9  0x086BA         || 	BREQ second_bullet
(0410)                            || 
(0411)  CS-0x0CA  0x04469         || 	MOV R4, R13
(0412)  CS-0x0CB  0x04561         || 	MOV R5, R12
(0413)  CS-0x0CC  0x36600         || 	MOV R6, 0x00
(0414)  CS-0x0CD  0x084B1         || 	call draw_dot
(0415)                            || 
(0416)  CS-0x0CE  0x04DD9         ||    Mov R13, R27
(0417)  CS-0x0CF  0x2CD01         ||    SUB R13, 0x01
(0418)                            || 
(0419)  CS-0x0D0  0x04CE1         ||    MOV R12, R28
(0420)                            || 
(0421)  CS-0x0D1  0x04469         ||    MOV R4, R13
(0422)  CS-0x0D2  0x04561         ||    MOV R5, R12
(0423)  CS-0x0D3  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0424)  CS-0x0D4  0x084B1         ||    call draw_dot
(0425)                            || 
(0426)  CS-0x0D5  0x29001         ||    ADD R16, 0x01
(0427)                            ||    
(0428)  CS-0x0D6  0x08718         ||    BRN animation
(0429)                            || 
(0430)                     0x0D7  || second_bullet:		   
(0431)  CS-0x0D7  0x04479         || 	MOV R4, R15
(0432)  CS-0x0D8  0x04571         || 	MOV R5, R14
(0433)  CS-0x0D9  0x36600         || 	MOV R6, 0x00
(0434)  CS-0x0DA  0x084B1         || 	call draw_dot
(0435)                            || 
(0436)  CS-0x0DB  0x04FD9         || 	MOV R15, R27
(0437)  CS-0x0DC  0x2CF01         || 	SUB R15, 0x01
(0438)                            || 
(0439)  CS-0x0DD  0x04EE1         || 	MOV R14, R28	
(0440)                            || 
(0441)  CS-0x0DE  0x04479         ||    MOV R4, R15
(0442)  CS-0x0DF  0x04571         ||    MOV R5, R14
(0443)  CS-0x0E0  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0444)  CS-0x0E1  0x084B1         ||    call draw_dot
(0445)                            || 
(0446)  CS-0x0E2  0x2D001         ||    SUB R16, 0x01
(0447)                            || 
(0448)                     0x0E3  || animation:
(0449)  CS-0x0E3  0x044D9         ||    MOV  R4, R27   ;y coordin
(0450)  CS-0x0E4  0x045E1         ||    MOV  R5, R28   ;x coordin
(0451)                            || 
(0452)  CS-0x0E5  0x366E0         || 	  mov R6, 0xE0
(0453)  CS-0x0E6  0x084B1         || 	  call draw_dot
(0454)  CS-0x0E7  0x08549         ||       call pause2
(0455)  CS-0x0E8  0x366FF         || 	  mov R6, 0xFF
(0456)  CS-0x0E9  0x084B1         ||       call draw_dot
(0457)  CS-0x0EA  0x08788         || 	  brn ISR_END
(0458)                            || 
(0459)                     0x0EB  || moveLeft:
(0460)  CS-0x0EB  0x36CFF         ||     MOV R12, 0xFF
(0461)  CS-0x0EC  0x08221         || 	call move_player
(0462)                            || 
(0463)  CS-0x0ED  0x08788         || 	brn ISR_END
(0464)                            || 
(0465)                     0x0EE  || moveRight:
(0466)  CS-0x0EE  0x36C01         || 	MOV R12, 0x01
(0467)                            || 	
(0468)  CS-0x0EF  0x08221         || 	call move_player
(0469)                            || 
(0470)  CS-0x0F0  0x08788         || 	brn ISR_END
(0471)                     0x0F1  || ISR_END:
(0472)  CS-0x0F1  0x1A003         || 		RETIE
(0473)                            || 
(0474)                            || .CSEG
(0475)                       1023  || .ORG 0x3FF
(0476)  CS-0x3FF  0x085A8  0x3FF  || VECTOR:      BRN ISR
(0477)                            || 





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
ANIMATION      0x0E3   (0448)  ||  0428 
CLEAR_PLAYER   0x05A   (0182)  ||  0144 
CLEAR_PLAYER_LOOP 0x05E   (0189)  ||  0195 
CLEAR_SHIP     0x079   (0248)  ||  0208 
CLEAR_SHIP_LOOP 0x07D   (0255)  ||  0262 
DD_OUT         0x098   (0313)  ||  
DONE           0x09C   (0325)  ||  0095 0325 
DRAW_DOT       0x096   (0309)  ||  0070 0076 0130 0169 0191 0236 0258 0400 0403 0414 
                               ||  0424 0434 0444 0453 0456 
DRAW_PLAYER    0x03A   (0122)  ||  0088 
DRAW_PLAYER_LOOP 0x03E   (0128)  ||  0134 
DRAW_SHIP      0x06E   (0227)  ||  0089 0220 
DRAW_SHIP_LOOP 0x072   (0233)  ||  0240 
END_MOVE_PLAYER 0x059   (0175)  ||  0158 0162 
END_RESET_BULLETS 0x095   (0301)  ||  0295 
INSIDE_FOR     0x0AE   (0365)  ||  0366 
INSIDE_FOR0    0x0A2   (0341)  ||  0342 
ISR            0x0B5   (0376)  ||  0476 
ISR_END        0x0F1   (0471)  ||  0393 0404 0457 0463 0470 
MIDDLE_FOR     0x0AC   (0362)  ||  0369 
MIDDLE_FOR0    0x0A0   (0338)  ||  0345 
MOVELEFT       0x0EB   (0459)  ||  0391 
MOVERIGHT      0x0EE   (0465)  ||  0385 
MOVE_PLAYER    0x044   (0143)  ||  0461 0468 
MOVE_PLAYER_LOOP 0x051   (0164)  ||  0157 0173 
MOVE_SHIP      0x064   (0207)  ||  0092 
MOVE_SHIP_LOOP 0x067   (0212)  ||  0218 
OUTSIDE_FOR    0x0AA   (0359)  ||  0372 
OUTSIDE_FOR0   0x09E   (0335)  ||  0348 
PAUSE          0x09D   (0334)  ||  0086 0093 0401 
PAUSE2         0x0A9   (0358)  ||  0454 
RESET          0x019   (0062)  ||  
RESET_BULLETS  0x08E   (0289)  ||  0084 
RESET_BULLETS_LOOP 0x090   (0293)  ||  0299 
RESET_LOOP     0x01C   (0067)  ||  0072 0080 
RESET_PLAYER   0x031   (0103)  ||  0082 
RESET_PLAYER_LOOP 0x034   (0108)  ||  0113 
RESET_SHIP     0x084   (0270)  ||  0083 
RESET_SHIP_LOOP 0x088   (0276)  ||  0281 
SECOND_BULLET  0x0D7   (0430)  ||  0409 
SHOOT          0x0C8   (0406)  ||  0388 
START          0x02E   (0091)  ||  
TESTING0       0x0C0   (0395)  ||  0382 
TEST_LEFT_PLAYER 0x04F   (0160)  ||  0153 
TEST_RIGHT_PLAYER 0x04C   (0155)  ||  
VECTOR         0x3FF   (0476)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BULLETS_END_LOC 0x04A   (0041)  ||  0294 
END_COL        0x01D   (0018)  ||  0064 0124 0147 0184 
END_ROW_PLAYER 0x027   (0017)  ||  0063 0077 
END_ROW_SHIP   0x048   (0016)  ||  0058 0156 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0340 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0364 
INTERRUPT_ID   0x020   (0043)  ||  0378 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0337 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0361 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0334 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0358 
PLAYER_BULLETS_LOC 0x040   (0040)  ||  
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0423 0443 
PLAYER_COLOR   0x0FF   (0025)  ||  0125 0148 
PLAYER_COLOR_LOC 0x00F   (0037)  ||  
PLAYER_X_LOC   0x010   (0036)  ||  0105 0123 0146 0183 
SHIP_BULLETS_LOC 0x020   (0039)  ||  0291 
SHIP_BULLET_COLOR 0x003   (0026)  ||  
SHIP_BULLET_RATE 0x012   (0029)  ||  0057 
SHIP_COLOR     0x0E3   (0019)  ||  0230 
SHIP_COLOR_LOC 0x00B   (0034)  ||  
SHIP_X_LOC     0x00C   (0032)  ||  0209 0229 0250 0272 
SHIP_Y_LOC     0x00A   (0033)  ||  0228 0249 0273 
SSEG_CNTR_ID   0x060   (0044)  ||  0054 
SSEG_VAL_ID    0x080   (0045)  ||  0379 
VGA_COLOR      0x092   (0006)  ||  0315 
VGA_HADD       0x090   (0004)  ||  0314 
VGA_LADD       0x091   (0005)  ||  0313 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
