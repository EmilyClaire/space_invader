

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
(0017)                       037  || .equ END_ROW_PLAYER = 0x25
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
(0029)                       011  || .equ SHIP_BULLET_RATE = 0x0B
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
(0049)                            || ;---------------------------------------------------------------------
(0050)                            || ;							The Beginning
(0051)                            || ; 
(0052)                            || ;	The Beginning of the program
(0053)                            || ;---------------------------------------------------------------------
(0054)                            || 
(0055)  CS-0x010  0x1A000         ||    SEI
(0056)                            || 
(0057)                            || 
(0058)  CS-0x011  0x36281         || 		MOV R2, 0x81
(0059)  CS-0x012  0x34260         || 		OUT R2, SSEG_CNTR_ID
(0060)  CS-0x013  0x37000         || 		MOV R16, 0x00	
(0061)  CS-0x014  0x37F02         || 		MOV R31, 0x02
(0062)  CS-0x015  0x37E0B         || 		MOV R30, SHIP_BULLET_RATE
(0063)  CS-0x016  0x36A4A         || 		MOV  R10, END_ROW_SHIP
(0064)  CS-0x017  0x36B01         || 		MOV R11, 0x01   
(0065)  CS-0x018  0x36303         || 		MOV R3, 0x03
(0066)  CS-0x019  0x37A00         || 		MOV R26, 0x00
(0067)  CS-0x01A  0x37000         || 		MOV R16, 0x00
(0068)                            || 
(0069)                            || ;---------------------------------------------------------------------
(0070)                            || ;							Clearing the screen
(0071)                            || ; 
(0072)                            || ;---------------------------------------------------------------------
(0073)                            || 		
(0074)                     0x01B  || reset:
(0075)  CS-0x01B  0x36827         || 		MOV R8, 0x27
(0076)  CS-0x01C  0x3671D         || 		MOV R7, END_COL
(0077)  CS-0x01D  0x36600         || 		MOV R6, 0x00
(0078)                            || 
(0079)                     0x01E  || reset_loop:
(0080)  CS-0x01E  0x04439         || 		MOV R4, R7
(0081)  CS-0x01F  0x04541         || 		MOV R5, R8
(0082)  CS-0x020  0x089B9         || 		call draw_dot
(0083)  CS-0x021  0x2C801         || 		SUB R8, 0x01
(0084)  CS-0x022  0x080F3         || 		BRNE reset_loop
(0085)                            || 
(0086)  CS-0x023  0x04439         || 		MOV R4, R7
(0087)  CS-0x024  0x04541         || 		MOV R5, R8
(0088)  CS-0x025  0x089B9         || 		call draw_dot
(0089)  CS-0x026  0x36827         || 		MOV R8, 0x27
(0090)  CS-0x027  0x2C701         || 		SUB R7, 0x01
(0091)  CS-0x028  0x307FF         || 		CMP R7, 0xFF
(0092)  CS-0x029  0x080F3         || 		BRNE reset_loop
(0093)                            || 
(0094)  CS-0x02A  0x081D9         || 		call reset_player
(0095)  CS-0x02B  0x08509         || 		call reset_ship
(0096)  CS-0x02C  0x08559         || 		call reset_bullets
(0097)                            || 
(0098)                            || 
(0099)                            || ;---------------------------------------------------------------------
(0100)                            || ;					Drawing the ship and the player
(0101)                            || ; 
(0102)                            || ;---------------------------------------------------------------------
(0103)                            || 	
(0104)  CS-0x02D  0x08AF9         || 		call pause
(0105)  CS-0x02E  0x08221         || 		call draw_player
(0106)  CS-0x02F  0x08459         || 		call draw_ship
(0107)  CS-0x030  0x08AF9         || 		call pause
(0108)                            || 
(0109)                            || 
(0110)                            || ;---------------------------------------------------------------------
(0111)                            || ;				The main code for the program
(0112)                            || ;---------------------------------------------------------------------
(0113)                            || 
(0114)                            || 
(0115)                     0x031  || start:
(0116)  CS-0x031  0x087E9         || 		call draw_player_bullets
(0117)                            || 
(0118)  CS-0x032  0x30A00         || 		CMP R10, 0x00
(0119)  CS-0x033  0x081B3         || 		BRNE move
(0120)                            || 		
(0121)  CS-0x034  0x36A4A         || 		MOV R10, END_ROW_SHIP
(0122)  CS-0x035  0x08381         || 		CALL down_ship
(0123)                            || 
(0124)                     0x036  || move:
(0125)  CS-0x036  0x083E9         || 		call move_ship
(0126)  CS-0x037  0x08761         || 		call draw_ship_bullets
(0127)  CS-0x038  0x2CA01         || 		SUB R10, 0x01
(0128)                            || 
(0129)  CS-0x039  0x08B59         || 		CALL pause2
(0130)  CS-0x03A  0x08188         || 		brn start
(0131)                            || 
(0132)                            || ;---------------------------------------------------------------------
(0133)                            || ;								FUNCTIONS 
(0134)                            || ;---------------------------------------------------------------------
(0135)                            || 
(0136)                            || 
(0137)                            || ;---------------------------------------------------------------------
(0138)                            || ;							Reset Player
(0139)                            || ;
(0140)                            || ;	Sets the player location to the middle of the bottom row
(0141)                            || ;	does not draw the player
(0142)                            || ;---------------------------------------------------------------------
(0143)                            || 
(0144)                     0x03B  || reset_player:
(0145)  CS-0x03B  0x36914         || 			MOV R9, 0x14
(0146)  CS-0x03C  0x37D10         || 			MOV R29, PLAYER_X_LOC
(0147)  CS-0x03D  0x36303         || 			MOV R3, 0x03
(0148)                            || 
(0149)                     0x03E  || reset_player_loop:
(0150)  CS-0x03E  0x049EB         || 			ST R9, (R29)
(0151)  CS-0x03F  0x28901         || 			ADD R9, 0x01
(0152)  CS-0x040  0x29D01         || 			ADD R29, 0x01
(0153)  CS-0x041  0x2C301         || 			SUB R3, 0x01
(0154)  CS-0x042  0x081F3         || 			BRNE reset_player_loop
(0155)                            || 
(0156)  CS-0x043  0x18002         || 			ret
(0157)                            || 
(0158)                            || 
(0159)                            || ;---------------------------------------------------------------------
(0160)                            || ;							Draw Player
(0161)                            || ;---------------------------------------------------------------------
(0162)                            || 
(0163)                     0x044  || draw_player:
(0164)  CS-0x044  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0165)  CS-0x045  0x3641D         || 				MOV R4,  END_COL
(0166)  CS-0x046  0x366FF         || 				MOV R6, PLAYER_COLOR
(0167)  CS-0x047  0x36303         || 				MOV R3, 0x03
(0168)                            || 
(0169)                     0x048  || draw_player_loop:
(0170)  CS-0x048  0x045CA         || 				LD R5, (R25)
(0171)  CS-0x049  0x089B9         || 				call draw_dot
(0172)                            || 
(0173)  CS-0x04A  0x29901         || 				ADD R25, 0x01
(0174)  CS-0x04B  0x2C301         || 				SUB R3, 0x01
(0175)  CS-0x04C  0x08243         || 				BRNE draw_player_loop
(0176)                            || 				
(0177)  CS-0x04D  0x18002         || 				ret
(0178)                            || 
(0179)                            || 
(0180)                            || ;---------------------------------------------------------------------
(0181)                            || ;							Move Player
(0182)                            || ;---------------------------------------------------------------------
(0183)                            || 
(0184)                     0x04E  || move_player:
(0185)  CS-0x04E  0x08331         || 				call clear_player
(0186)                            || 
(0187)  CS-0x04F  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0188)  CS-0x050  0x3641D         || 				MOV R4,  END_COL
(0189)  CS-0x051  0x366FF         || 				MOV R6, PLAYER_COLOR
(0190)  CS-0x052  0x36303         || 				MOV R3, 0x03
(0191)                            || 
(0192)  CS-0x053  0x049CA         || 				LD R9, (R25)
(0193)  CS-0x054  0x30C01         || 				CMP R12, 0x01
(0194)  CS-0x055  0x082CB         || 				BRNE test_left_player
(0195)                            || 
(0196)                     0x056  || test_right_player:
(0197)  CS-0x056  0x30925         || 				CMP R9, END_ROW_PLAYER
(0198)  CS-0x057  0x082DB         || 				BRNE move_player_loop
(0199)  CS-0x058  0x08320         || 				brn re_draw_player
(0200)                            || 
(0201)                     0x059  || test_left_player:
(0202)  CS-0x059  0x30900         || 				CMP R9, 0x00
(0203)  CS-0x05A  0x08322         || 				BREQ re_draw_player
(0204)                            || 				
(0205)                     0x05B  || move_player_loop:
(0206)  CS-0x05B  0x049CA         || 				LD R9, (R25)
(0207)  CS-0x05C  0x02960         || 				ADD R9, R12
(0208)  CS-0x05D  0x049CB         || 				ST R9, (R25)
(0209)  CS-0x05E  0x04549         || 				MOV R5, R9
(0210)  CS-0x05F  0x089B9         || 				call draw_dot
(0211)                            || 
(0212)  CS-0x060  0x29901         || 				ADD R25, 0x01
(0213)  CS-0x061  0x2C301         || 				SUB R3, 0x01
(0214)  CS-0x062  0x082DB         || 				BRNE move_player_loop
(0215)  CS-0x063  0x08328         || 				brn end_move_player
(0216)                            || 
(0217)  CS-0x064  0x08221  0x064  || re_draw_player: call draw_player
(0218)                            || 
(0219)                     0x065  || end_move_player:
(0220)  CS-0x065  0x18002         || 				ret
(0221)                            || 
(0222)                            || ;---------------------------------------------------------------------
(0223)                            || ;							Clear Player
(0224)                            || ;---------------------------------------------------------------------
(0225)                            || 
(0226)                     0x066  || clear_player: 
(0227)  CS-0x066  0x37910         || 				MOV R25, PLAYER_X_LOC
(0228)  CS-0x067  0x3641D         || 				MOV R4, END_COL
(0229)  CS-0x068  0x36600         || 				MOV R6, 0x00
(0230)                            || 
(0231)  CS-0x069  0x36303         || 				MOV R3, 0x03
(0232)                            || 
(0233)                     0x06A  || clear_player_loop:
(0234)  CS-0x06A  0x045CA         || 				LD R5, (R25)
(0235)  CS-0x06B  0x089B9         || 				call draw_dot
(0236)                            || 
(0237)  CS-0x06C  0x29901         || 				ADD R25, 0x01
(0238)  CS-0x06D  0x2C301         || 				SUB R3, 0x01
(0239)  CS-0x06E  0x08353         || 				BRNE clear_player_loop
(0240)                            || 				
(0241)  CS-0x06F  0x18002         || 				ret
(0242)                            || 
(0243)                            || 
(0244)                            || 
(0245)                            || ;---------------------------------------------------------------------
(0246)                            || ;							Down Ship
(0247)                            || ;
(0248)                            || ;	Moves the ship down one row and changes the ships direction
(0249)                            || ;---------------------------------------------------------------------
(0250)                            || 
(0251)                     0x070  || down_ship:		
(0252)  CS-0x070  0x084B1         || 				call clear_ship
(0253)  CS-0x071  0x3890A         || 				LD R9, SHIP_Y_LOC
(0254)                            || 				
(0255)  CS-0x072  0x28901         || 				ADD R9, 0x01
(0256)  CS-0x073  0x3091D         || 				CMP R9, END_COL
(0257)  CS-0x074  0x08A72         || 				BREQ lose
(0258)                            || 
(0259)  CS-0x075  0x3A90A         || 				ST R9, SHIP_Y_LOC
(0260)                            || 
(0261)  CS-0x076  0x30B01         || 				CMP R11, 0x01
(0262)  CS-0x077  0x083D2         || 				BREQ set_neg
(0263)                            || 		
(0264)  CS-0x078  0x36B01         || 				MOV R11, 0x01
(0265)  CS-0x079  0x083D8         || 				brn end_down_ship
(0266)                            || 					
(0267)  CS-0x07A  0x36BFF  0x07A  || set_neg:		MOV R11, 0xFF
(0268)                            || 				
(0269)                     0x07B  || end_down_ship:
(0270)  CS-0x07B  0x08459         || 				call draw_ship
(0271)  CS-0x07C  0x18002         || 				ret
(0272)                            || ;---------------------------------------------------------------------
(0273)                            || ;							Move Ship
(0274)                            || ;---------------------------------------------------------------------
(0275)                     0x07D  || move_ship:
(0276)  CS-0x07D  0x2DF01         || 				SUB R31, 0x01
(0277)  CS-0x07E  0x08453         || 				BRNE end_move_ship
(0278)                            || 			
(0279)  CS-0x07F  0x37F02         || 				MOV R31, 0x02
(0280)                            ||  
(0281)  CS-0x080  0x084B1         || 				call clear_ship
(0282)  CS-0x081  0x3790C         || 				MOV R25, SHIP_X_LOC
(0283)  CS-0x082  0x36303         || 				MOV R3, 0x03
(0284)                            || 
(0285)                     0x083  || move_ship_loop:
(0286)  CS-0x083  0x049CA         || 				LD R9, (R25)
(0287)  CS-0x084  0x02958         || 				ADD R9, R11
(0288)  CS-0x085  0x049CB         || 				ST R9, (R25)
(0289)  CS-0x086  0x29901         || 				ADD R25, 0x01
(0290)  CS-0x087  0x2C301         || 				SUB R3, 0x01
(0291)  CS-0x088  0x0841B         || 				BRNE move_ship_loop
(0292)                            || 
(0293)  CS-0x089  0x08459         || 				call draw_ship
(0294)                     0x08A  || end_move_ship:
(0295)  CS-0x08A  0x18002         || 				ret
(0296)                            || 
(0297)                            || 
(0298)                            || ;---------------------------------------------------------------------
(0299)                            || ;							Draw Ship
(0300)                            || ;---------------------------------------------------------------------
(0301)                     0x08B  || draw_ship:
(0302)  CS-0x08B  0x3780A         || 			  	MOV R24, SHIP_Y_LOC
(0303)  CS-0x08C  0x3790C         || 				MOV R25, SHIP_X_LOC
(0304)  CS-0x08D  0x366E3         || 				MOV R6, SHIP_COLOR
(0305)  CS-0x08E  0x36303         || 				MOV R3, 0x03
(0306)                            || 
(0307)                     0x08F  || draw_ship_loop:
(0308)  CS-0x08F  0x044C2         || 				LD R4, (R24)
(0309)  CS-0x090  0x045CA         || 				LD R5, (R25)
(0310)  CS-0x091  0x089B9         || 				call draw_dot
(0311)                            || 
(0312)  CS-0x092  0x29901         || 				ADD R25, 0x01
(0313)  CS-0x093  0x2C301         || 				SUB R3, 0x01
(0314)  CS-0x094  0x0847B         || 				BRNE draw_ship_loop
(0315)                            || 				
(0316)  CS-0x095  0x18002         || 				ret
(0317)                            || 
(0318)                            || ;---------------------------------------------------------------------
(0319)                            || ;							Clear Ship
(0320)                            || ;---------------------------------------------------------------------
(0321)                            || 
(0322)                     0x096  || clear_ship: 
(0323)  CS-0x096  0x3780A         || 				MOV R24, SHIP_Y_LOC
(0324)  CS-0x097  0x3790C         || 				MOV R25, SHIP_X_LOC
(0325)  CS-0x098  0x36600         || 				MOV R6, 0x00
(0326)                            || 
(0327)  CS-0x099  0x36303         || 				MOV R3, 0x03
(0328)                            || 
(0329)                     0x09A  || clear_ship_loop:
(0330)  CS-0x09A  0x044C2         || 				LD R4, (R24)
(0331)  CS-0x09B  0x045CA         || 				LD R5, (R25)
(0332)  CS-0x09C  0x089B9         || 				call draw_dot
(0333)                            || 
(0334)  CS-0x09D  0x29901         || 				ADD R25, 0x01
(0335)  CS-0x09E  0x2C301         || 				SUB R3, 0x01
(0336)  CS-0x09F  0x084D3         || 				BRNE clear_ship_loop
(0337)                            || 				
(0338)  CS-0x0A0  0x18002         || 				ret
(0339)                            || 
(0340)                            || ;---------------------------------------------------------------------
(0341)                            || ;							Reset Ship
(0342)                            || ;---------------------------------------------------------------------
(0343)                            || 
(0344)                     0x0A1  || reset_ship: 
(0345)  CS-0x0A1  0x36000         || 				MOV R0, 0x00	
(0346)  CS-0x0A2  0x3780C         || 				MOV R24, SHIP_X_LOC
(0347)  CS-0x0A3  0x3A00A         || 				ST R0, SHIP_Y_LOC
(0348)  CS-0x0A4  0x36303         || 				MOV R3, 0x03
(0349)                            || 
(0350)                     0x0A5  || reset_ship_loop:
(0351)  CS-0x0A5  0x040C3         || 				ST R0, (R24)
(0352)  CS-0x0A6  0x29801         || 				ADD R24, 0x01
(0353)  CS-0x0A7  0x28001         || 				ADD R0, 0x01
(0354)  CS-0x0A8  0x2C301         || 				SUB R3, 0x01
(0355)  CS-0x0A9  0x0852B         || 				BRNE reset_ship_loop
(0356)                            || 				
(0357)  CS-0x0AA  0x18002         || 				ret
(0358)                            || 
(0359)                            || ;---------------------------------------------------------------------
(0360)                            || ;							Reset Bullets
(0361)                            || ;---------------------------------------------------------------------
(0362)                            || 
(0363)                     0x0AB  || reset_bullets:  
(0364)  CS-0x0AB  0x360FF         || 				MOV R0, 0xFF
(0365)  CS-0x0AC  0x37820         || 				MOV R24, SHIP_BULLETS_LOC
(0366)                            || 
(0367)                     0x0AD  || reset_bullets_loop:
(0368)  CS-0x0AD  0x3184A         || 				CMP R24, BULLETS_END_LOC
(0369)  CS-0x0AE  0x08592         || 				BREQ end_reset_bullets
(0370)                            || 				
(0371)  CS-0x0AF  0x040C3         || 				ST R0, (R24)
(0372)  CS-0x0B0  0x29801         || 				ADD R24, 0x01
(0373)  CS-0x0B1  0x08568         || 				BRN reset_bullets_loop
(0374)                            || 				
(0375)                     0x0B2  || end_reset_bullets:
(0376)  CS-0x0B2  0x18002         || 				ret
(0377)                            || 
(0378)                            || 
(0379)                            || ;---------------------------------------------------------------------
(0380)                            || ;							Move Bullet
(0381)                            || ;---------------------------------------------------------------------
(0382)                     0x0B3  || move_bullet:	
(0383)                            || 
(0384)  CS-0x0B3  0x08699  0x0B3  || hit_ship:		call collision_ship
(0385)                            || 
(0386)                     0x0B4  || hit_player:		
(0387)                            || 
(0388)  CS-0x0B4  0x08621         || 				call collision_player
(0389)                            || 
(0390)  CS-0x0B5  0x08739         || 				call clear_bullet
(0391)  CS-0x0B6  0x049C2         || 				LD R9, (R24)
(0392)  CS-0x0B7  0x3091D         || 				CMP R9, END_COL
(0393)  CS-0x0B8  0x08602         || 				BREQ move_remove_bullet
(0394)                            || 
(0395)  CS-0x0B9  0x30900         || 				CMP R9, 0x00
(0396)  CS-0x0BA  0x08602         || 				BREQ move_remove_bullet
(0397)                            || 
(0398)  CS-0x0BB  0x029A8         || 				ADD R9, R21
(0399)  CS-0x0BC  0x049C3         || 				ST R9, (R24) 
(0400)  CS-0x0BD  0x04669         || 				MOV R6, R13
(0401)  CS-0x0BE  0x08711         || 				call draw_bullet
(0402)  CS-0x0BF  0x08618         || 				brn end_move_bullet
(0403)                            || 
(0404)                     0x0C0  || move_remove_bullet:
(0405)  CS-0x0C0  0x369FF         || 				MOV R9, 0xFF
(0406)  CS-0x0C1  0x049C3         || 				ST R9, (R24)
(0407)  CS-0x0C2  0x049CB         || 				ST R9, (R25)
(0408)                     0x0C3  || end_move_bullet:
(0409)  CS-0x0C3  0x18002         || 				ret
(0410)                            || 
(0411)                            || ;---------------------------------------------------------------------
(0412)                            || ;							Collision Player
(0413)                            || ;---------------------------------------------------------------------
(0414)                     0x0C4  || collision_player:
(0415)  CS-0x0C4  0x36710         || 				MOV R7, PLAYER_X_LOC
(0416)  CS-0x0C5  0x3681D         || 				MOV R8, END_COL
(0417)  CS-0x0C6  0x36303         || 				MOV R3, 0x03
(0418)  CS-0x0C7  0x04941         || 				MOV R9, R8
(0419)  CS-0x0C8  0x056C2         || 				LD R22, (R24)
(0420)  CS-0x0C9  0x049B0         || 				CMP R9, R22
(0421)  CS-0x0CA  0x08693         || 				BRNE end_collision_player
(0422)                     0x0CB  || test_player:
(0423)  CS-0x0CB  0x0493A         || 				LD R9, (R7)
(0424)  CS-0x0CC  0x056CA         || 				LD R22, (R25)
(0425)  CS-0x0CD  0x049B0         || 				CMP R9, R22
(0426)  CS-0x0CE  0x08A72         || 				BREQ lose
(0427)  CS-0x0CF  0x28701         || 				ADD R7, 0x01
(0428)  CS-0x0D0  0x2C301         || 				SUB R3, 0x01
(0429)  CS-0x0D1  0x0865B         || 				BRNE test_player
(0430)                            || 
(0431)                     0x0D2  || end_collision_player:
(0432)  CS-0x0D2  0x18002         || 				ret
(0433)                            || 				
(0434)                            || ;---------------------------------------------------------------------
(0435)                            || ;							Collision Ship
(0436)                            || ;---------------------------------------------------------------------
(0437)                     0x0D3  || collision_Ship:
(0438)  CS-0x0D3  0x3670C         || 				MOV R7, SHIP_X_LOC
(0439)  CS-0x0D4  0x3680A         || 				MOV R8, SHIP_Y_LOC
(0440)  CS-0x0D5  0x36303         || 				MOV R3, 0x03
(0441)  CS-0x0D6  0x04942         || 				LD R9, (R8)
(0442)  CS-0x0D7  0x056C2         || 				LD R22, (R24)
(0443)  CS-0x0D8  0x049B0         || 				CMP R9, R22
(0444)  CS-0x0D9  0x0870B         || 				BRNE end_collision_ship
(0445)                     0x0DA  || test_ship:
(0446)  CS-0x0DA  0x0493A         || 				LD R9, (R7)
(0447)  CS-0x0DB  0x056CA         || 				LD R22, (R25)
(0448)  CS-0x0DC  0x049B0         || 				CMP R9, R22
(0449)  CS-0x0DD  0x089F2         || 				BREQ win
(0450)  CS-0x0DE  0x28701         || 				ADD R7, 0x01
(0451)  CS-0x0DF  0x2C301         || 				SUB R3, 0x01
(0452)  CS-0x0E0  0x086D3         || 				BRNE test_ship
(0453)                            || 
(0454)                     0x0E1  || end_collision_ship:
(0455)  CS-0x0E1  0x18002         || 				ret
(0456)                            || 				
(0457)                            || 
(0458)                            || 
(0459)                            || 
(0460)                            || 
(0461)                            || ;---------------------------------------------------------------------
(0462)                            || ;							Draw Bullet
(0463)                            || ;---------------------------------------------------------------------
(0464)                     0x0E2  || draw_bullet:
(0465)  CS-0x0E2  0x04669         || 				MOV R6, R13
(0466)  CS-0x0E3  0x044C2         || 				LD R4, (R24)
(0467)  CS-0x0E4  0x045CA         || 				LD R5, (R25)
(0468)  CS-0x0E5  0x089B9         || 				call draw_dot
(0469)  CS-0x0E6  0x18002         || 				ret
(0470)                            || 
(0471)                            || ;---------------------------------------------------------------------
(0472)                            || ;							Clear Bullet
(0473)                            || ;---------------------------------------------------------------------
(0474)                            || 
(0475)                     0x0E7  || clear_bullet: 
(0476)                            || 				;R0, 0xFF
(0477)  CS-0x0E7  0x36600         || 				MOV R6, 0x00
(0478)                            || 
(0479)  CS-0x0E8  0x044C2         || 				LD R4, (R24)
(0480)  CS-0x0E9  0x045CA         || 				LD R5, (R25)
(0481)  CS-0x0EA  0x089B9         || 				call draw_dot
(0482)                            || 
(0483)                            || 				;ST R0, (R24)
(0484)                            || 				;ST R0, (R25)
(0485)  CS-0x0EB  0x18002         || 				ret
(0486)                            || 
(0487)                            || 
(0488)                            || ;---------------------------------------------------------------------
(0489)                            || ;							Draw Ship Bullets
(0490)                            || ;---------------------------------------------------------------------
(0491)                            || 
(0492)                     0x0EC  || draw_ship_bullets:
(0493)  CS-0x0EC  0x37920         || 				MOV R25, SHIP_BULLETS_LOC
(0494)  CS-0x0ED  0x36D03         || 				MOV R13, SHIP_BULLET_COLOR
(0495)  CS-0x0EE  0x058C9         || 				MOV R24, R25
(0496)  CS-0x0EF  0x29801         || 				ADD R24, 0x01
(0497)  CS-0x0F0  0x37501         || 				MOV R21, 0x01
(0498)  CS-0x0F1  0x36F00         || 				MOV R15, 0x00
(0499)                            || 
(0500)                     0x0F2  || draw_ship_bullets_loop:
(0501)  CS-0x0F2  0x08599         || 				call move_bullet
(0502)                            || 
(0503)  CS-0x0F3  0x29902         || 				ADD R25, 0x02
(0504)  CS-0x0F4  0x29802         || 				ADD R24, 0x02
(0505)  CS-0x0F5  0x28F02         || 				ADD R15, 0x02
(0506)  CS-0x0F6  0x30F0A         || 				CMP R15, 0x0A
(0507)  CS-0x0F7  0x08793         || 				BRNE draw_ship_bullets_loop
(0508)                            || 					
(0509)                     0x0F8  || draw_ship_bullets_check:
(0510)  CS-0x0F8  0x2DE01         || 				SUB R30, 0x01
(0511)  CS-0x0F9  0x087E3         || 				BRNE draw_ship_bullets_end
(0512)                            || 
(0513)  CS-0x0FA  0x37E0B         || 				MOV R30, SHIP_BULLET_RATE
(0514)  CS-0x0FB  0x08851         || 				call start_ship_bullet
(0515)                     0x0FC  || draw_ship_bullets_end:
(0516)  CS-0x0FC  0x18002         || 				ret
(0517)                            || 
(0518)                            || ;---------------------------------------------------------------------
(0519)                            || ;							Draw Player Bullets
(0520)                            || ;---------------------------------------------------------------------
(0521)                            || 
(0522)                     0x0FD  || draw_player_bullets:
(0523)  CS-0x0FD  0x37940         || 				MOV R25, PLAYER_BULLETS_LOC
(0524)  CS-0x0FE  0x36DFC         || 				MOV R13, PLAYER_BULLET_COLOR
(0525)  CS-0x0FF  0x058C9         || 				MOV R24, R25
(0526)  CS-0x100  0x29801         || 				ADD R24, 0x01
(0527)  CS-0x101  0x375FF         || 				MOV R21, 0xff
(0528)  CS-0x102  0x36F00         || 				MOV R15, 0x00
(0529)                            || 
(0530)                     0x103  || draw_player_bullets_loop:
(0531)  CS-0x103  0x08599         || 				call move_bullet
(0532)                            || 
(0533)  CS-0x104  0x29902         || 				ADD R25, 0x02
(0534)  CS-0x105  0x29802         || 				ADD R24, 0x02
(0535)  CS-0x106  0x28F02         || 				ADD R15, 0x02
(0536)  CS-0x107  0x30F0A         || 				CMP R15, 0x0A
(0537)  CS-0x108  0x0881B         || 				BRNE draw_player_bullets_loop
(0538)                            || 					
(0539)                     0x109  || draw_player_bullets_end:
(0540)  CS-0x109  0x18002         || 				ret
(0541)                            || 
(0542)                            || 
(0543)                            || 
(0544)                            || ;---------------------------------------------------------------------
(0545)                            || ;							Start Ship Bullet
(0546)                            || ;---------------------------------------------------------------------
(0547)                     0x10A  || start_ship_bullet:
(0548)  CS-0x10A  0x37920         || 				MOV R25, SHIP_BULLETS_LOC
(0549)  CS-0x10B  0x039D0         || 				ADD R25, R26
(0550)                            || 
(0551)  CS-0x10C  0x058C9         || 				MOV R24, R25
(0552)  CS-0x10D  0x29801         || 				ADD R24, 0x01
(0553)                            || 
(0554)  CS-0x10E  0x08739         || 				call clear_bullet
(0555)                            || 
(0556)                     0x10F  || start_ship_bullet_main:
(0557)  CS-0x10F  0x3690C         || 				MOV R9, SHIP_X_LOC
(0558)  CS-0x110  0x28901         || 				ADD R9, 0x01
(0559)  CS-0x111  0x0484A         || 			    LD R8, (R9)
(0560)  CS-0x112  0x048CB         || 				ST R8, (R25)
(0561)                            || 
(0562)  CS-0x113  0x3870A         || 				LD R7, SHIP_Y_LOC
(0563)  CS-0x114  0x28701         || 				ADD R7, 0x01
(0564)  CS-0x115  0x047C3         || 				ST R7, (R24)
(0565)                            || 				
(0566)  CS-0x116  0x36D03         || 				MOV R13, SHIP_BULLET_COLOR
(0567)  CS-0x117  0x08711         || 				call draw_bullet
(0568)                            || 
(0569)  CS-0x118  0x29A02         || 				ADD R26, 0x02
(0570)                            || 			
(0571)  CS-0x119  0x31A0A         || 				CMP R26, 0x0A
(0572)  CS-0x11A  0x088E3         || 				BRNE end_start_ship_bullet
(0573)                            || 
(0574)  CS-0x11B  0x37A00         || 				MOV R26, 0x00
(0575)                     0x11C  || end_start_ship_bullet:
(0576)  CS-0x11C  0x18002         || 				ret
(0577)                            || 
(0578)                            || 
(0579)                            || ;---------------------------------------------------------------------
(0580)                            || ;						Start Player Bullet
(0581)                            || ;---------------------------------------------------------------------
(0582)                     0x11D  || start_player_bullet:
(0583)  CS-0x11D  0x37940         || 				MOV R25, PLAYER_BULLETS_LOC
(0584)  CS-0x11E  0x03980         || 				ADD R25, R16
(0585)                            || 
(0586)  CS-0x11F  0x058C9         || 				MOV R24, R25
(0587)  CS-0x120  0x29801         || 				ADD R24, 0x01
(0588)                            || 
(0589)  CS-0x121  0x08739         || 				call clear_bullet
(0590)                            || 
(0591)                     0x122  || start_player_bullet_main:
(0592)  CS-0x122  0x36910         || 				MOV R9, PLAYER_X_LOC
(0593)  CS-0x123  0x28901         || 				ADD R9, 0x01
(0594)  CS-0x124  0x0484A         || 			    LD R8, (R9)
(0595)  CS-0x125  0x048CB         || 				ST R8, (R25)
(0596)                            || 
(0597)  CS-0x126  0x3671D         || 				MOV R7, END_COL
(0598)  CS-0x127  0x2C701         || 				SUB R7, 0x01
(0599)  CS-0x128  0x047C3         || 				ST R7, (R24)
(0600)                            || 				
(0601)  CS-0x129  0x36DFC         || 				MOV R13, PLAYER_BULLET_COLOR
(0602)  CS-0x12A  0x08711         || 				call draw_bullet
(0603)                            || 
(0604)  CS-0x12B  0x29002         || 				ADD R16, 0x02
(0605)                            || 			
(0606)                     0x12C  || animation:
(0607)  CS-0x12C  0x3641D         || 				MOV  R4, END_COL
(0608)  CS-0x12D  0x04541         || 				MOV  R5, R8   
(0609)                            || 
(0610)  CS-0x12E  0x366E0         || 				mov R6, 0xE0
(0611)  CS-0x12F  0x089B9         || 				call draw_dot
(0612)  CS-0x130  0x08B59         || 				call pause2
(0613)  CS-0x131  0x366FF         || 				mov R6, 0xFF
(0614)  CS-0x132  0x089B9         || 				call draw_dot
(0615)                            || 
(0616)  CS-0x133  0x3100A         || 				CMP R16, 0x0A
(0617)  CS-0x134  0x089B3         || 				BRNE end_start_player_bullet
(0618)                            || 
(0619)  CS-0x135  0x37000         || 				MOV R16, 0x00
(0620)                     0x136  || end_start_player_bullet:
(0621)  CS-0x136  0x18002         || 				ret
(0622)                            || 
(0623)                            || ;---------------------------------------------------------------------
(0624)                            || ;							Draw Dot
(0625)                            || ;---------------------------------------------------------------------
(0626)                            || 
(0627)                     0x137  || draw_dot: 
(0628)  CS-0x137  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0629)  CS-0x138  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0630)                            || 
(0631)  CS-0x139  0x34591  0x139  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0632)  CS-0x13A  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0633)  CS-0x13B  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0634)  CS-0x13C  0x18002         ||         RET
(0635)                            || 	   
(0636)                            || 
(0637)                            || ;---------------------------------------------------------------------
(0638)                            || ;							Done
(0639)                            || ;
(0640)                            || ; 	Don't do anything anymore
(0641)                            || ;---------------------------------------------------------------------
(0642)                            || 
(0643)  CS-0x13D  0x089E8  0x13D  || DONE:        BRN DONE
(0644)                            || 
(0645)                            || 
(0646)                            || ;---------------------------------------------------------------------
(0647)                            || ;							Win
(0648)                            || ;
(0649)                            || ; 	Turn the screen Green
(0650)                            || ;---------------------------------------------------------------------
(0651)                            || 
(0652)  CS-0x13E  0x08AF9  0x13E  || win:    call pause
(0653)  CS-0x13F  0x36827         || 		MOV R8, 0x27
(0654)  CS-0x140  0x3671D         || 		MOV R7, END_COL
(0655)  CS-0x141  0x3661C         || 		MOV R6, 0x1C ;GREEN SCREEN
(0656)                     0x142  || win_loop:
(0657)  CS-0x142  0x04439         || 		MOV R4, R7
(0658)  CS-0x143  0x04541         || 		MOV R5, R8
(0659)  CS-0x144  0x089B9         || 		call draw_dot
(0660)  CS-0x145  0x2C801         || 		SUB R8, 0x01
(0661)  CS-0x146  0x08A13         || 		BRNE win_loop
(0662)                            || 
(0663)  CS-0x147  0x04439         || 		MOV R4, R7
(0664)  CS-0x148  0x04541         || 		MOV R5, R8
(0665)  CS-0x149  0x089B9         || 		call draw_dot
(0666)  CS-0x14A  0x2C701         || 		SUB R7, 0x01
(0667)  CS-0x14B  0x307FF         || 		CMP R7, 0xFF
(0668)  CS-0x14C  0x08A13         || 		BRNE win_loop
(0669)                            || 	
(0670)  CS-0x14D  0x089E8         || 	    brn done
(0671)                            || 
(0672)                            || 
(0673)                            || ;---------------------------------------------------------------------
(0674)                            || ;							Lose
(0675)                            || ;
(0676)                            || ; 	Turn the screen red
(0677)                            || ;---------------------------------------------------------------------
(0678)                            || 
(0679)                     0x14E  || lose:     
(0680)  CS-0x14E  0x08AF9         || 		call pause
(0681)  CS-0x14F  0x36827         || 		MOV R8, 0x27
(0682)  CS-0x150  0x3671D         || 		MOV R7, END_COL
(0683)  CS-0x151  0x28801         || 		ADD R8, 0x01
(0684)  CS-0x152  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0685)                            || 
(0686)                     0x153  || lose_loop:
(0687)                            || 
(0688)  CS-0x153  0x04439         || 		MOV R4, R7
(0689)  CS-0x154  0x04541         || 		MOV R5, R8
(0690)  CS-0x155  0x089B9         || 		call draw_dot
(0691)  CS-0x156  0x2C801         || 		SUB R8, 0x01
(0692)  CS-0x157  0x08A9B         || 		BRNE lose_loop
(0693)                            || 
(0694)  CS-0x158  0x04439         || 		MOV R4, R7
(0695)  CS-0x159  0x04541         || 		MOV R5, R8
(0696)  CS-0x15A  0x089B9         || 		call draw_dot
(0697)  CS-0x15B  0x2C701         || 		SUB R7, 0x01
(0698)  CS-0x15C  0x307FF         || 		CMP R7, 0xFF
(0699)  CS-0x15D  0x08A9B         || 		BRNE lose_loop
(0700)  CS-0x15E  0x089E8         || 		brn done
(0701)                            || 
(0702)                            || 
(0703)                            || 
(0704)                            || ;---------------------------------------------------------------------
(0705)                            || ;							Pause
(0706)                            || ;
(0707)                            || ;	a long pause
(0708)                            || ;---------------------------------------------------------------------
(0709)                            || 
(0710)  CS-0x15F  0x3712F  0x15F  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0711)  CS-0x160  0x2D101  0x160  || outside_for0: 	SUB     R17, 0x01
(0712)                            || 
(0713)  CS-0x161  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0714)  CS-0x162  0x2D201  0x162  || middle_for0:  	SUB     R18, 0x01
(0715)                            ||              
(0716)  CS-0x163  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0717)  CS-0x164  0x2D301  0x164  || inside_for0:  	SUB     R19, 0x01
(0718)  CS-0x165  0x08B23         ||              	BRNE    inside_for0
(0719)                            ||              
(0720)  CS-0x166  0x23200         ||              	OR      R18, 0x00              
(0721)  CS-0x167  0x08B13         ||              	BRNE    middle_for0
(0722)                            ||              
(0723)  CS-0x168  0x23100         ||              	OR      R17, 0x00               
(0724)  CS-0x169  0x08B03         ||              	BRNE    outside_for0
(0725)  CS-0x16A  0x18002         || 				ret
(0726)                            || 
(0727)                            || ;---------------------------------------------------------------------
(0728)                            || ;							Pause2
(0729)                            || ;
(0730)                            || ;	a shorter pause
(0731)                            || ;---------------------------------------------------------------------
(0732)                            || 
(0733)                            || 
(0734)  CS-0x16B  0x3711F  0x16B  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0735)  CS-0x16C  0x2D101  0x16C  || outside_for: 	SUB     R17, 0x01
(0736)                            || 
(0737)  CS-0x16D  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0738)  CS-0x16E  0x2D201  0x16E  || middle_for:  	SUB     R18, 0x01
(0739)                            ||              
(0740)  CS-0x16F  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0741)  CS-0x170  0x2D301  0x170  || inside_for:  	SUB     R19, 0x01
(0742)  CS-0x171  0x08B83         ||              	BRNE    inside_for
(0743)                            ||              
(0744)  CS-0x172  0x23200         ||              	or     R18, 0x00              
(0745)  CS-0x173  0x08B73         ||              	BRNE    middle_for
(0746)                            ||              
(0747)  CS-0x174  0x31100         ||              	CMP      R17, 0x00               
(0748)  CS-0x175  0x08B63         ||              	BRNE    outside_for
(0749)  CS-0x176  0x18002         || 				ret
(0750)                            || 
(0751)                            || ;---------------------------------------------------------------------
(0752)                            || ;							INTERRUPTS
(0753)                            || ;---------------------------------------------------------------------
(0754)                            || 
(0755)                            || 
(0756)                     0x177  || ISR: 
(0757)                            || 
(0758)  CS-0x177  0x33420         ||    	IN R20, INTERRUPT_ID
(0759)  CS-0x178  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0760)                            || 	
(0761)  CS-0x179  0x31400         || 	CMP R20, 0x00
(0762)  CS-0x17A  0x08C12         ||     breq testing0
(0763)                            || 
(0764)  CS-0x17B  0x11401         ||    LSR R20
(0765)  CS-0x17C  0x0AC78         ||    BRCS moveRight
(0766)                            || 
(0767)  CS-0x17D  0x11401         ||    LSR R20
(0768)  CS-0x17E  0x0AC50         ||    BRCS shoot   
(0769)                            || 
(0770)  CS-0x17F  0x11401         ||    LSR R20  
(0771)  CS-0x180  0x08C62         ||    BREQ moveLeft
(0772)                            || 
(0773)  CS-0x181  0x08C90         ||    brn ISR_END
(0774)                            || 
(0775)                     0x182  || testing0: 
(0776)  CS-0x182  0x044D9         ||    MOV  R4, R27   ;y coordin
(0777)  CS-0x183  0x045E1         ||    MOV  R5, R28   ;x coordin
(0778)                            || 
(0779)  CS-0x184  0x36603         || 	mov r6, 0x03
(0780)  CS-0x185  0x089B9         ||     call draw_dot
(0781)  CS-0x186  0x08AF9         || 	call pause
(0782)  CS-0x187  0x366FF         || 	mov r6, 0xff
(0783)  CS-0x188  0x089B9         || 	call draw_dot
(0784)  CS-0x189  0x08C90         ||     brn isr_end
(0785)                            || 
(0786)                     0x18A  || shoot: 
(0787)                            || 	
(0788)  CS-0x18A  0x088E9         || 	  call start_player_bullet	
(0789)  CS-0x18B  0x08C90         || 	  brn ISR_END
(0790)                            || 
(0791)                     0x18C  || moveLeft:
(0792)  CS-0x18C  0x36CFF         ||     MOV R12, 0xFF
(0793)  CS-0x18D  0x08271         || 	call move_player
(0794)                            || 
(0795)  CS-0x18E  0x08C90         || 	brn ISR_END
(0796)                            || 
(0797)                     0x18F  || moveRight:
(0798)  CS-0x18F  0x36C01         || 	MOV R12, 0x01
(0799)                            || 	
(0800)  CS-0x190  0x08271         || 	call move_player
(0801)                            || 
(0802)  CS-0x191  0x08C90         || 	brn ISR_END
(0803)                     0x192  || ISR_END:
(0804)  CS-0x192  0x1A003         || 		RETIE
(0805)                            || 
(0806)                            || 
(0807)                            || ;---------------------------------------------------------------------
(0808)                            || ;							INTERRUPT VECTOR
(0809)                            || ;---------------------------------------------------------------------
(0810)                            || 
(0811)                            || .CSEG
(0812)                       1023  || .ORG 0x3FF
(0813)  CS-0x3FF  0x08BB8  0x3FF  || VECTOR:      BRN ISR
(0814)                            || 





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
ANIMATION      0x12C   (0606)  ||  
CLEAR_BULLET   0x0E7   (0475)  ||  0390 0554 0589 
CLEAR_PLAYER   0x066   (0226)  ||  0185 
CLEAR_PLAYER_LOOP 0x06A   (0233)  ||  0239 
CLEAR_SHIP     0x096   (0322)  ||  0252 0281 
CLEAR_SHIP_LOOP 0x09A   (0329)  ||  0336 
COLLISION_PLAYER 0x0C4   (0414)  ||  0388 
COLLISION_SHIP 0x0D3   (0437)  ||  0384 
DD_OUT         0x139   (0631)  ||  
DONE           0x13D   (0643)  ||  0643 0670 0700 
DOWN_SHIP      0x070   (0251)  ||  0122 
DRAW_BULLET    0x0E2   (0464)  ||  0401 0567 0602 
DRAW_DOT       0x137   (0627)  ||  0082 0088 0171 0210 0235 0310 0332 0468 0481 0611 
                               ||  0614 0659 0665 0690 0696 0780 0783 
DRAW_PLAYER    0x044   (0163)  ||  0105 0217 
DRAW_PLAYER_BULLETS 0x0FD   (0522)  ||  0116 
DRAW_PLAYER_BULLETS_END 0x109   (0539)  ||  
DRAW_PLAYER_BULLETS_LOOP 0x103   (0530)  ||  0537 
DRAW_PLAYER_LOOP 0x048   (0169)  ||  0175 
DRAW_SHIP      0x08B   (0301)  ||  0106 0270 0293 
DRAW_SHIP_BULLETS 0x0EC   (0492)  ||  0126 
DRAW_SHIP_BULLETS_CHECK 0x0F8   (0509)  ||  
DRAW_SHIP_BULLETS_END 0x0FC   (0515)  ||  0511 
DRAW_SHIP_BULLETS_LOOP 0x0F2   (0500)  ||  0507 
DRAW_SHIP_LOOP 0x08F   (0307)  ||  0314 
END_COLLISION_PLAYER 0x0D2   (0431)  ||  0421 
END_COLLISION_SHIP 0x0E1   (0454)  ||  0444 
END_DOWN_SHIP  0x07B   (0269)  ||  0265 
END_MOVE_BULLET 0x0C3   (0408)  ||  0402 
END_MOVE_PLAYER 0x065   (0219)  ||  0215 
END_MOVE_SHIP  0x08A   (0294)  ||  0277 
END_RESET_BULLETS 0x0B2   (0375)  ||  0369 
END_START_PLAYER_BULLET 0x136   (0620)  ||  0617 
END_START_SHIP_BULLET 0x11C   (0575)  ||  0572 
HIT_PLAYER     0x0B4   (0386)  ||  
HIT_SHIP       0x0B3   (0384)  ||  
INSIDE_FOR     0x170   (0741)  ||  0742 
INSIDE_FOR0    0x164   (0717)  ||  0718 
ISR            0x177   (0756)  ||  0813 
ISR_END        0x192   (0803)  ||  0773 0784 0789 0795 0802 
LOSE           0x14E   (0679)  ||  0257 0426 
LOSE_LOOP      0x153   (0686)  ||  0692 0699 
MIDDLE_FOR     0x16E   (0738)  ||  0745 
MIDDLE_FOR0    0x162   (0714)  ||  0721 
MOVE           0x036   (0124)  ||  0119 
MOVELEFT       0x18C   (0791)  ||  0771 
MOVERIGHT      0x18F   (0797)  ||  0765 
MOVE_BULLET    0x0B3   (0382)  ||  0501 0531 
MOVE_PLAYER    0x04E   (0184)  ||  0793 0800 
MOVE_PLAYER_LOOP 0x05B   (0205)  ||  0198 0214 
MOVE_REMOVE_BULLET 0x0C0   (0404)  ||  0393 0396 
MOVE_SHIP      0x07D   (0275)  ||  0125 
MOVE_SHIP_LOOP 0x083   (0285)  ||  0291 
OUTSIDE_FOR    0x16C   (0735)  ||  0748 
OUTSIDE_FOR0   0x160   (0711)  ||  0724 
PAUSE          0x15F   (0710)  ||  0104 0107 0652 0680 0781 
PAUSE2         0x16B   (0734)  ||  0129 0612 
RESET          0x01B   (0074)  ||  
RESET_BULLETS  0x0AB   (0363)  ||  0096 
RESET_BULLETS_LOOP 0x0AD   (0367)  ||  0373 
RESET_LOOP     0x01E   (0079)  ||  0084 0092 
RESET_PLAYER   0x03B   (0144)  ||  0094 
RESET_PLAYER_LOOP 0x03E   (0149)  ||  0154 
RESET_SHIP     0x0A1   (0344)  ||  0095 
RESET_SHIP_LOOP 0x0A5   (0350)  ||  0355 
RE_DRAW_PLAYER 0x064   (0217)  ||  0199 0203 
SET_NEG        0x07A   (0267)  ||  0262 
SHOOT          0x18A   (0786)  ||  0768 
START          0x031   (0115)  ||  0130 
START_PLAYER_BULLET 0x11D   (0582)  ||  0788 
START_PLAYER_BULLET_MAIN 0x122   (0591)  ||  
START_SHIP_BULLET 0x10A   (0547)  ||  0514 
START_SHIP_BULLET_MAIN 0x10F   (0556)  ||  
TESTING0       0x182   (0775)  ||  0762 
TEST_LEFT_PLAYER 0x059   (0201)  ||  0194 
TEST_PLAYER    0x0CB   (0422)  ||  0429 
TEST_RIGHT_PLAYER 0x056   (0196)  ||  
TEST_SHIP      0x0DA   (0445)  ||  0452 
VECTOR         0x3FF   (0813)  ||  
WIN            0x13E   (0652)  ||  0449 
WIN_LOOP       0x142   (0656)  ||  0661 0668 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BULLETS_END_LOC 0x04A   (0041)  ||  0368 
END_COL        0x01D   (0018)  ||  0076 0165 0188 0228 0256 0392 0416 0597 0607 0654 
                               ||  0682 
END_ROW_PLAYER 0x025   (0017)  ||  0197 
END_ROW_SHIP   0x04A   (0016)  ||  0063 0121 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0716 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0740 
INTERRUPT_ID   0x020   (0043)  ||  0758 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0713 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0737 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0710 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0734 
PLAYER_BULLETS_LOC 0x040   (0040)  ||  0523 0583 
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0524 0601 
PLAYER_COLOR   0x0FF   (0025)  ||  0166 0189 
PLAYER_COLOR_LOC 0x00F   (0037)  ||  
PLAYER_X_LOC   0x010   (0036)  ||  0146 0164 0187 0227 0415 0592 
SHIP_BULLETS_LOC 0x020   (0039)  ||  0365 0493 0548 
SHIP_BULLET_COLOR 0x003   (0026)  ||  0494 0566 
SHIP_BULLET_RATE 0x00B   (0029)  ||  0062 0513 
SHIP_COLOR     0x0E3   (0019)  ||  0304 
SHIP_COLOR_LOC 0x00B   (0034)  ||  
SHIP_X_LOC     0x00C   (0032)  ||  0282 0303 0324 0346 0438 0557 
SHIP_Y_LOC     0x00A   (0033)  ||  0253 0259 0302 0323 0347 0439 0562 
SSEG_CNTR_ID   0x060   (0044)  ||  0059 
SSEG_VAL_ID    0x080   (0045)  ||  0759 
VGA_COLOR      0x092   (0006)  ||  0633 
VGA_HADD       0x090   (0004)  ||  0632 
VGA_LADD       0x091   (0005)  ||  0631 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
