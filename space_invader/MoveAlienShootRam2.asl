

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
(0082)  CS-0x020  0x088B1         || 		call draw_dot
(0083)  CS-0x021  0x2C801         || 		SUB R8, 0x01
(0084)  CS-0x022  0x080F3         || 		BRNE reset_loop
(0085)                            || 
(0086)  CS-0x023  0x04439         || 		MOV R4, R7
(0087)  CS-0x024  0x04541         || 		MOV R5, R8
(0088)  CS-0x025  0x088B1         || 		call draw_dot
(0089)  CS-0x026  0x36827         || 		MOV R8, 0x27
(0090)  CS-0x027  0x2C701         || 		SUB R7, 0x01
(0091)  CS-0x028  0x307FF         || 		CMP R7, 0xFF
(0092)  CS-0x029  0x080F3         || 		BRNE reset_loop
(0093)                            || 
(0094)  CS-0x02A  0x081D1         || 		call reset_player
(0095)  CS-0x02B  0x08501         || 		call reset_ship
(0096)  CS-0x02C  0x08551         || 		call reset_bullets
(0097)                            || 
(0098)                            || 
(0099)                            || ;---------------------------------------------------------------------
(0100)                            || ;					Drawing the ship and the player
(0101)                            || ; 
(0102)                            || ;---------------------------------------------------------------------
(0103)                            || 	
(0104)  CS-0x02D  0x08971         || 		call pause
(0105)  CS-0x02E  0x08219         || 		call draw_player
(0106)  CS-0x02F  0x08451         || 		call draw_ship
(0107)                            || 
(0108)                            || 
(0109)                            || ;---------------------------------------------------------------------
(0110)                            || ;				The main code for the program
(0111)                            || ;---------------------------------------------------------------------
(0112)                            || 
(0113)                            || 
(0114)                     0x030  || start:
(0115)  CS-0x030  0x089D1         || 		CALL pause2
(0116)                            || 
(0117)  CS-0x031  0x30A00         || 		CMP R10, 0x00
(0118)  CS-0x032  0x081B3         || 		BRNE move
(0119)                            || 		
(0120)  CS-0x033  0x36A4A         || 		MOV R10, END_ROW_SHIP
(0121)  CS-0x034  0x08379         || 		CALL down_ship
(0122)  CS-0x035  0x081C0         || 		BRN move_bullets
(0123)                            || 
(0124)                     0x036  || move:
(0125)  CS-0x036  0x083E1         || 		call move_ship
(0126)  CS-0x037  0x2CA01         || 		SUB R10, 0x01
(0127)                            || 
(0128)                     0x038  || move_bullets:
(0129)  CS-0x038  0x086C9         || 		call draw_ship_bullets
(0130)                            || 
(0131)  CS-0x039  0x08180         || 		brn start
(0132)                            || 
(0133)                            || ;---------------------------------------------------------------------
(0134)                            || ;								FUNCTIONS 
(0135)                            || ;---------------------------------------------------------------------
(0136)                            || 
(0137)                            || 
(0138)                            || ;---------------------------------------------------------------------
(0139)                            || ;							Reset Player
(0140)                            || ;
(0141)                            || ;	Sets the player location to the middle of the bottom row
(0142)                            || ;	does not draw the player
(0143)                            || ;---------------------------------------------------------------------
(0144)                            || 
(0145)                     0x03A  || reset_player:
(0146)  CS-0x03A  0x36914         || 			MOV R9, 0x14
(0147)  CS-0x03B  0x37D10         || 			MOV R29, PLAYER_X_LOC
(0148)  CS-0x03C  0x36303         || 			MOV R3, 0x03
(0149)                            || 
(0150)                     0x03D  || reset_player_loop:
(0151)  CS-0x03D  0x049EB         || 			ST R9, (R29)
(0152)  CS-0x03E  0x28901         || 			ADD R9, 0x01
(0153)  CS-0x03F  0x29D01         || 			ADD R29, 0x01
(0154)  CS-0x040  0x2C301         || 			SUB R3, 0x01
(0155)  CS-0x041  0x081EB         || 			BRNE reset_player_loop
(0156)                            || 
(0157)  CS-0x042  0x18002         || 			ret
(0158)                            || 
(0159)                            || 
(0160)                            || ;---------------------------------------------------------------------
(0161)                            || ;							Draw Player
(0162)                            || ;---------------------------------------------------------------------
(0163)                            || 
(0164)                     0x043  || draw_player:
(0165)  CS-0x043  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0166)  CS-0x044  0x3641D         || 				MOV R4,  END_COL
(0167)  CS-0x045  0x366FF         || 				MOV R6, PLAYER_COLOR
(0168)  CS-0x046  0x36303         || 				MOV R3, 0x03
(0169)                            || 
(0170)                     0x047  || draw_player_loop:
(0171)  CS-0x047  0x045CA         || 				LD R5, (R25)
(0172)  CS-0x048  0x088B1         || 				call draw_dot
(0173)                            || 
(0174)  CS-0x049  0x29901         || 				ADD R25, 0x01
(0175)  CS-0x04A  0x2C301         || 				SUB R3, 0x01
(0176)  CS-0x04B  0x0823B         || 				BRNE draw_player_loop
(0177)                            || 				
(0178)  CS-0x04C  0x18002         || 				ret
(0179)                            || 
(0180)                            || 
(0181)                            || ;---------------------------------------------------------------------
(0182)                            || ;							Move Player
(0183)                            || ;---------------------------------------------------------------------
(0184)                            || 
(0185)                     0x04D  || move_player:
(0186)  CS-0x04D  0x08329         || 				call clear_player
(0187)                            || 
(0188)  CS-0x04E  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0189)  CS-0x04F  0x3641D         || 				MOV R4,  END_COL
(0190)  CS-0x050  0x366FF         || 				MOV R6, PLAYER_COLOR
(0191)  CS-0x051  0x36303         || 				MOV R3, 0x03
(0192)                            || 
(0193)  CS-0x052  0x049CA         || 				LD R9, (R25)
(0194)  CS-0x053  0x30C01         || 				CMP R12, 0x01
(0195)  CS-0x054  0x082C3         || 				BRNE test_left_player
(0196)                            || 
(0197)                     0x055  || test_right_player:
(0198)  CS-0x055  0x30925         || 				CMP R9, END_ROW_PLAYER
(0199)  CS-0x056  0x082D3         || 				BRNE move_player_loop
(0200)  CS-0x057  0x08318         || 				brn re_draw_player
(0201)                            || 
(0202)                     0x058  || test_left_player:
(0203)  CS-0x058  0x30900         || 				CMP R9, 0x00
(0204)  CS-0x059  0x0831A         || 				BREQ re_draw_player
(0205)                            || 				
(0206)                     0x05A  || move_player_loop:
(0207)  CS-0x05A  0x049CA         || 				LD R9, (R25)
(0208)  CS-0x05B  0x02960         || 				ADD R9, R12
(0209)  CS-0x05C  0x049CB         || 				ST R9, (R25)
(0210)  CS-0x05D  0x04549         || 				MOV R5, R9
(0211)  CS-0x05E  0x088B1         || 				call draw_dot
(0212)                            || 
(0213)  CS-0x05F  0x29901         || 				ADD R25, 0x01
(0214)  CS-0x060  0x2C301         || 				SUB R3, 0x01
(0215)  CS-0x061  0x082D3         || 				BRNE move_player_loop
(0216)  CS-0x062  0x08320         || 				brn end_move_player
(0217)                            || 
(0218)  CS-0x063  0x08219  0x063  || re_draw_player: call draw_player
(0219)                            || 
(0220)                     0x064  || end_move_player:
(0221)  CS-0x064  0x18002         || 				ret
(0222)                            || 
(0223)                            || ;---------------------------------------------------------------------
(0224)                            || ;							Clear Player
(0225)                            || ;---------------------------------------------------------------------
(0226)                            || 
(0227)                     0x065  || clear_player: 
(0228)  CS-0x065  0x37910         || 				MOV R25, PLAYER_X_LOC
(0229)  CS-0x066  0x3641D         || 				MOV R4, END_COL
(0230)  CS-0x067  0x36600         || 				MOV R6, 0x00
(0231)                            || 
(0232)  CS-0x068  0x36303         || 				MOV R3, 0x03
(0233)                            || 
(0234)                     0x069  || clear_player_loop:
(0235)  CS-0x069  0x045CA         || 				LD R5, (R25)
(0236)  CS-0x06A  0x088B1         || 				call draw_dot
(0237)                            || 
(0238)  CS-0x06B  0x29901         || 				ADD R25, 0x01
(0239)  CS-0x06C  0x2C301         || 				SUB R3, 0x01
(0240)  CS-0x06D  0x0834B         || 				BRNE clear_player_loop
(0241)                            || 				
(0242)  CS-0x06E  0x18002         || 				ret
(0243)                            || 
(0244)                            || 
(0245)                            || 
(0246)                            || ;---------------------------------------------------------------------
(0247)                            || ;							Down Ship
(0248)                            || ;
(0249)                            || ;	Moves the ship down one row and changes the ships direction
(0250)                            || ;---------------------------------------------------------------------
(0251)                            || 
(0252)                     0x06F  || down_ship:		
(0253)  CS-0x06F  0x084A9         || 				call clear_ship
(0254)  CS-0x070  0x3890A         || 				LD R9, SHIP_Y_LOC
(0255)                            || 				
(0256)  CS-0x071  0x28901         || 				ADD R9, 0x01
(0257)  CS-0x072  0x3091D         || 				CMP R9, END_COL
(0258)  CS-0x073  0x088EA         || 				BREQ lose
(0259)                            || 
(0260)  CS-0x074  0x3A90A         || 				ST R9, SHIP_Y_LOC
(0261)                            || 
(0262)  CS-0x075  0x30B01         || 				CMP R11, 0x01
(0263)  CS-0x076  0x083CA         || 				BREQ set_neg
(0264)                            || 		
(0265)  CS-0x077  0x36B01         || 				MOV R11, 0x01
(0266)  CS-0x078  0x083D0         || 				brn end_down_ship
(0267)                            || 					
(0268)  CS-0x079  0x36BFF  0x079  || set_neg:		MOV R11, 0xFF
(0269)                            || 				
(0270)                     0x07A  || end_down_ship:
(0271)  CS-0x07A  0x08451         || 				call draw_ship
(0272)  CS-0x07B  0x18002         || 				ret
(0273)                            || ;---------------------------------------------------------------------
(0274)                            || ;							Move Ship
(0275)                            || ;---------------------------------------------------------------------
(0276)                     0x07C  || move_ship:
(0277)  CS-0x07C  0x2DF01         || 				SUB R31, 0x01
(0278)  CS-0x07D  0x0844B         || 				BRNE end_move_ship
(0279)                            || 			
(0280)  CS-0x07E  0x37F02         || 				MOV R31, 0x02
(0281)                            ||  
(0282)  CS-0x07F  0x084A9         || 				call clear_ship
(0283)  CS-0x080  0x3790C         || 				MOV R25, SHIP_X_LOC
(0284)  CS-0x081  0x36303         || 				MOV R3, 0x03
(0285)                            || 
(0286)                     0x082  || move_ship_loop:
(0287)  CS-0x082  0x049CA         || 				LD R9, (R25)
(0288)  CS-0x083  0x02958         || 				ADD R9, R11
(0289)  CS-0x084  0x049CB         || 				ST R9, (R25)
(0290)  CS-0x085  0x29901         || 				ADD R25, 0x01
(0291)  CS-0x086  0x2C301         || 				SUB R3, 0x01
(0292)  CS-0x087  0x08413         || 				BRNE move_ship_loop
(0293)                            || 
(0294)  CS-0x088  0x08451         || 				call draw_ship
(0295)                     0x089  || end_move_ship:
(0296)  CS-0x089  0x18002         || 				ret
(0297)                            || 
(0298)                            || 
(0299)                            || ;---------------------------------------------------------------------
(0300)                            || ;							Draw Ship
(0301)                            || ;---------------------------------------------------------------------
(0302)                     0x08A  || draw_ship:
(0303)  CS-0x08A  0x3780A         || 			  	MOV R24, SHIP_Y_LOC
(0304)  CS-0x08B  0x3790C         || 				MOV R25, SHIP_X_LOC
(0305)  CS-0x08C  0x366E3         || 				MOV R6, SHIP_COLOR
(0306)  CS-0x08D  0x36303         || 				MOV R3, 0x03
(0307)                            || 
(0308)                     0x08E  || draw_ship_loop:
(0309)  CS-0x08E  0x044C2         || 				LD R4, (R24)
(0310)  CS-0x08F  0x045CA         || 				LD R5, (R25)
(0311)  CS-0x090  0x088B1         || 				call draw_dot
(0312)                            || 
(0313)  CS-0x091  0x29901         || 				ADD R25, 0x01
(0314)  CS-0x092  0x2C301         || 				SUB R3, 0x01
(0315)  CS-0x093  0x08473         || 				BRNE draw_ship_loop
(0316)                            || 				
(0317)  CS-0x094  0x18002         || 				ret
(0318)                            || 
(0319)                            || ;---------------------------------------------------------------------
(0320)                            || ;							Clear Ship
(0321)                            || ;---------------------------------------------------------------------
(0322)                            || 
(0323)                     0x095  || clear_ship: 
(0324)  CS-0x095  0x3780A         || 				MOV R24, SHIP_Y_LOC
(0325)  CS-0x096  0x3790C         || 				MOV R25, SHIP_X_LOC
(0326)  CS-0x097  0x36600         || 				MOV R6, 0x00
(0327)                            || 
(0328)  CS-0x098  0x36303         || 				MOV R3, 0x03
(0329)                            || 
(0330)                     0x099  || clear_ship_loop:
(0331)  CS-0x099  0x044C2         || 				LD R4, (R24)
(0332)  CS-0x09A  0x045CA         || 				LD R5, (R25)
(0333)  CS-0x09B  0x088B1         || 				call draw_dot
(0334)                            || 
(0335)  CS-0x09C  0x29901         || 				ADD R25, 0x01
(0336)  CS-0x09D  0x2C301         || 				SUB R3, 0x01
(0337)  CS-0x09E  0x084CB         || 				BRNE clear_ship_loop
(0338)                            || 				
(0339)  CS-0x09F  0x18002         || 				ret
(0340)                            || 
(0341)                            || ;---------------------------------------------------------------------
(0342)                            || ;							Reset Ship
(0343)                            || ;---------------------------------------------------------------------
(0344)                            || 
(0345)                     0x0A0  || reset_ship: 
(0346)  CS-0x0A0  0x36000         || 				MOV R0, 0x00	
(0347)  CS-0x0A1  0x3780C         || 				MOV R24, SHIP_X_LOC
(0348)  CS-0x0A2  0x3A00A         || 				ST R0, SHIP_Y_LOC
(0349)  CS-0x0A3  0x36303         || 				MOV R3, 0x03
(0350)                            || 
(0351)                     0x0A4  || reset_ship_loop:
(0352)  CS-0x0A4  0x040C3         || 				ST R0, (R24)
(0353)  CS-0x0A5  0x29801         || 				ADD R24, 0x01
(0354)  CS-0x0A6  0x28001         || 				ADD R0, 0x01
(0355)  CS-0x0A7  0x2C301         || 				SUB R3, 0x01
(0356)  CS-0x0A8  0x08523         || 				BRNE reset_ship_loop
(0357)                            || 				
(0358)  CS-0x0A9  0x18002         || 				ret
(0359)                            || 
(0360)                            || ;---------------------------------------------------------------------
(0361)                            || ;							Reset Bullets
(0362)                            || ;---------------------------------------------------------------------
(0363)                            || 
(0364)                     0x0AA  || reset_bullets:  
(0365)  CS-0x0AA  0x360FF         || 				MOV R0, 0xFF
(0366)  CS-0x0AB  0x37820         || 				MOV R24, SHIP_BULLETS_LOC
(0367)                            || 
(0368)                     0x0AC  || reset_bullets_loop:
(0369)  CS-0x0AC  0x3184A         || 				CMP R24, BULLETS_END_LOC
(0370)  CS-0x0AD  0x0858A         || 				BREQ end_reset_bullets
(0371)                            || 				
(0372)  CS-0x0AE  0x040C3         || 				ST R0, (R24)
(0373)  CS-0x0AF  0x29801         || 				ADD R24, 0x01
(0374)  CS-0x0B0  0x08560         || 				BRN reset_bullets_loop
(0375)                            || 				
(0376)                     0x0B1  || end_reset_bullets:
(0377)  CS-0x0B1  0x18002         || 				ret
(0378)                            || 
(0379)                            || 
(0380)                            || ;---------------------------------------------------------------------
(0381)                            || ;							Move Bullet
(0382)                            || ;---------------------------------------------------------------------
(0383)                     0x0B2  || move_bullet:	
(0384)                            || 
(0385)                     0x0B2  || hit_player:		
(0386)                            || 
(0387)  CS-0x0B2  0x08601         || 				call collision_player
(0388)                            || 
(0389)                            || 
(0390)                     0x0B3  || hit_ship:
(0391)  CS-0x0B3  0x086A1         || 				call clear_bullet
(0392)  CS-0x0B4  0x049C2         || 				LD R9, (R24)
(0393)  CS-0x0B5  0x3091D         || 				CMP R9, END_COL
(0394)  CS-0x0B6  0x085E2         || 				BREQ move_remove_bullet
(0395)                            || 
(0396)  CS-0x0B7  0x28901         || 				ADD R9, 0x01
(0397)  CS-0x0B8  0x049C3         || 				ST R9, (R24) 
(0398)  CS-0x0B9  0x04669         || 				MOV R6, R13
(0399)  CS-0x0BA  0x08679         || 				call draw_bullet
(0400)  CS-0x0BB  0x085F8         || 				brn end_move_bullet
(0401)                            || 
(0402)                     0x0BC  || move_remove_bullet:
(0403)  CS-0x0BC  0x369FF         || 				MOV R9, 0xFF
(0404)  CS-0x0BD  0x049C3         || 				ST R9, (R24)
(0405)  CS-0x0BE  0x049CB         || 				ST R9, (R25)
(0406)                     0x0BF  || end_move_bullet:
(0407)  CS-0x0BF  0x18002         || 				ret
(0408)                            || 
(0409)                            || ;---------------------------------------------------------------------
(0410)                            || ;							Collision 
(0411)                            || ;---------------------------------------------------------------------
(0412)                     0x0C0  || collision_player:
(0413)  CS-0x0C0  0x36710         || 				MOV R7, PLAYER_X_LOC
(0414)  CS-0x0C1  0x3681D         || 				MOV R8, END_COL
(0415)  CS-0x0C2  0x36303         || 				MOV R3, 0x03
(0416)  CS-0x0C3  0x04941         || 				MOV R9, R8
(0417)  CS-0x0C4  0x056C2         || 				LD R22, (R24)
(0418)  CS-0x0C5  0x049B0         || 				CMP R9, R22
(0419)  CS-0x0C6  0x08673         || 				BRNE end_collision_player
(0420)                     0x0C7  || test_player:
(0421)  CS-0x0C7  0x0493A         || 				LD R9, (R7)
(0422)  CS-0x0C8  0x056CA         || 				LD R22, (R25)
(0423)  CS-0x0C9  0x049B0         || 				CMP R9, R22
(0424)  CS-0x0CA  0x088EA         || 				BREQ lose
(0425)  CS-0x0CB  0x28701         || 				ADD R7, 0x01
(0426)  CS-0x0CC  0x2C301         || 				SUB R3, 0x01
(0427)  CS-0x0CD  0x0863B         || 				BRNE test_player
(0428)                            || 
(0429)                     0x0CE  || end_collision_player:
(0430)  CS-0x0CE  0x18002         || 				ret
(0431)                            || 				
(0432)                            || 
(0433)                            || 
(0434)                            || 
(0435)                            || ;---------------------------------------------------------------------
(0436)                            || ;							Draw Bullet
(0437)                            || ;---------------------------------------------------------------------
(0438)                     0x0CF  || draw_bullet:
(0439)  CS-0x0CF  0x04669         || 				MOV R6, R13
(0440)  CS-0x0D0  0x044C2         || 				LD R4, (R24)
(0441)  CS-0x0D1  0x045CA         || 				LD R5, (R25)
(0442)  CS-0x0D2  0x088B1         || 				call draw_dot
(0443)  CS-0x0D3  0x18002         || 				ret
(0444)                            || 
(0445)                            || ;---------------------------------------------------------------------
(0446)                            || ;							Clear Bullet
(0447)                            || ;---------------------------------------------------------------------
(0448)                            || 
(0449)                     0x0D4  || clear_bullet: 
(0450)                            || 				;R0, 0xFF
(0451)  CS-0x0D4  0x36600         || 				MOV R6, 0x00
(0452)                            || 
(0453)  CS-0x0D5  0x044C2         || 				LD R4, (R24)
(0454)  CS-0x0D6  0x045CA         || 				LD R5, (R25)
(0455)  CS-0x0D7  0x088B1         || 				call draw_dot
(0456)                            || 
(0457)                            || 				;ST R0, (R24)
(0458)                            || 				;ST R0, (R25)
(0459)  CS-0x0D8  0x18002         || 				ret
(0460)                            || 
(0461)                            || 
(0462)                            || ;---------------------------------------------------------------------
(0463)                            || ;							Draw Ship Bullets
(0464)                            || ;---------------------------------------------------------------------
(0465)                            || 
(0466)                     0x0D9  || draw_ship_bullets:
(0467)  CS-0x0D9  0x37920         || 				MOV R25, SHIP_BULLETS_LOC
(0468)  CS-0x0DA  0x36D03         || 				MOV R13, SHIP_BULLET_COLOR
(0469)  CS-0x0DB  0x058C9         || 				MOV R24, R25
(0470)  CS-0x0DC  0x29801         || 				ADD R24, 0x01
(0471)                            || 
(0472)  CS-0x0DD  0x36F00         || 				MOV R15, 0x00
(0473)                            || 
(0474)                     0x0DE  || draw_ship_bullets_loop:
(0475)  CS-0x0DE  0x08591         || 				call move_bullet
(0476)                            || 
(0477)  CS-0x0DF  0x29902         || 				ADD R25, 0x02
(0478)  CS-0x0E0  0x29802         || 				ADD R24, 0x02
(0479)  CS-0x0E1  0x28F02         || 				ADD R15, 0x02
(0480)  CS-0x0E2  0x30F0A         || 				CMP R15, 0x0A
(0481)  CS-0x0E3  0x086F3         || 				BRNE draw_ship_bullets_loop
(0482)                            || 					
(0483)                     0x0E4  || draw_ship_bullets_check:
(0484)  CS-0x0E4  0x2DE01         || 				SUB R30, 0x01
(0485)  CS-0x0E5  0x08743         || 				BRNE draw_ship_bullets_end
(0486)                            || 
(0487)  CS-0x0E6  0x37E0B         || 				MOV R30, SHIP_BULLET_RATE
(0488)  CS-0x0E7  0x08749         || 				call start_ship_bullet
(0489)                     0x0E8  || draw_ship_bullets_end:
(0490)  CS-0x0E8  0x18002         || 				ret
(0491)                            || 
(0492)                            || 
(0493)                            || ;---------------------------------------------------------------------
(0494)                            || ;							Start Ship Bullet
(0495)                            || ;---------------------------------------------------------------------
(0496)                     0x0E9  || start_ship_bullet:
(0497)  CS-0x0E9  0x37920         || 				MOV R25, SHIP_BULLETS_LOC
(0498)  CS-0x0EA  0x039D0         || 				ADD R25, R26
(0499)                            || 
(0500)  CS-0x0EB  0x058C9         || 				MOV R24, R25
(0501)  CS-0x0EC  0x29801         || 				ADD R24, 0x01
(0502)                            || 
(0503)  CS-0x0ED  0x086A1         || 				call clear_bullet
(0504)                            || 
(0505)                     0x0EE  || start_ship_bullet_main:
(0506)  CS-0x0EE  0x3690C         || 				MOV R9, SHIP_X_LOC
(0507)  CS-0x0EF  0x28901         || 				ADD R9, 0x01
(0508)  CS-0x0F0  0x0484A         || 			    LD R8, (R9)
(0509)  CS-0x0F1  0x048CB         || 				ST R8, (R25)
(0510)                            || 
(0511)  CS-0x0F2  0x3870A         || 				LD R7, SHIP_Y_LOC
(0512)  CS-0x0F3  0x28701         || 				ADD R7, 0x01
(0513)  CS-0x0F4  0x047C3         || 				ST R7, (R24)
(0514)                            || 				
(0515)  CS-0x0F5  0x36D03         || 				MOV R13, SHIP_BULLET_COLOR
(0516)  CS-0x0F6  0x08679         || 				call draw_bullet
(0517)                            || 
(0518)  CS-0x0F7  0x29A02         || 				ADD R26, 0x02
(0519)                            || 			
(0520)  CS-0x0F8  0x31A0A         || 				CMP R26, 0x0A
(0521)  CS-0x0F9  0x087DB         || 				BRNE end_start_ship_bullet
(0522)                            || 
(0523)  CS-0x0FA  0x37A00         || 				MOV R26, 0x00
(0524)                     0x0FB  || end_start_ship_bullet:
(0525)  CS-0x0FB  0x18002         || 				ret
(0526)                            || 
(0527)                            || 
(0528)                            || ;---------------------------------------------------------------------
(0529)                            || ;						Start Player Bullet
(0530)                            || ;---------------------------------------------------------------------
(0531)                     0x0FC  || start_player_bullet:
(0532)  CS-0x0FC  0x37940         || 				MOV R25, PLAYER_BULLETS_LOC
(0533)  CS-0x0FD  0x03980         || 				ADD R25, R16
(0534)                            || 
(0535)  CS-0x0FE  0x058C9         || 				MOV R24, R25
(0536)  CS-0x0FF  0x29801         || 				ADD R24, 0x01
(0537)                            || 
(0538)  CS-0x100  0x086A1         || 				call clear_bullet
(0539)                            || 
(0540)                     0x101  || start_player_bullet_main:
(0541)  CS-0x101  0x36910         || 				MOV R9, PLAYER_X_LOC
(0542)  CS-0x102  0x28901         || 				ADD R9, 0x01
(0543)  CS-0x103  0x0484A         || 			    LD R8, (R9)
(0544)  CS-0x104  0x048CB         || 				ST R8, (R25)
(0545)                            || 
(0546)  CS-0x105  0x3671D         || 				MOV R7, END_COL
(0547)  CS-0x106  0x2C701         || 				SUB R7, 0x01
(0548)  CS-0x107  0x047C3         || 				ST R7, (R24)
(0549)                            || 				
(0550)  CS-0x108  0x36DFC         || 				MOV R13, PLAYER_BULLET_COLOR
(0551)  CS-0x109  0x08679         || 				call draw_bullet
(0552)                            || 
(0553)  CS-0x10A  0x29002         || 				ADD R16, 0x02
(0554)                            || 			
(0555)                     0x10B  || animation:
(0556)  CS-0x10B  0x3641D         || 				MOV  R4, END_COL
(0557)  CS-0x10C  0x04541         || 				MOV  R5, R8   
(0558)                            || 
(0559)  CS-0x10D  0x366E0         || 				mov R6, 0xE0
(0560)  CS-0x10E  0x088B1         || 				call draw_dot
(0561)  CS-0x10F  0x089D1         || 				call pause2
(0562)  CS-0x110  0x366FF         || 				mov R6, 0xFF
(0563)  CS-0x111  0x088B1         || 				call draw_dot
(0564)                            || 
(0565)  CS-0x112  0x3100A         || 				CMP R16, 0x0A
(0566)  CS-0x113  0x088AB         || 				BRNE end_start_player_bullet
(0567)                            || 
(0568)  CS-0x114  0x37000         || 				MOV R16, 0x00
(0569)                     0x115  || end_start_player_bullet:
(0570)  CS-0x115  0x18002         || 				ret
(0571)                            || 
(0572)                            || ;---------------------------------------------------------------------
(0573)                            || ;							Draw Dot
(0574)                            || ;---------------------------------------------------------------------
(0575)                            || 
(0576)                     0x116  || draw_dot: 
(0577)  CS-0x116  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0578)  CS-0x117  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0579)                            || 
(0580)  CS-0x118  0x34591  0x118  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0581)  CS-0x119  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0582)  CS-0x11A  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0583)  CS-0x11B  0x18002         ||         RET
(0584)                            || 	   
(0585)                            || 
(0586)                            || ;---------------------------------------------------------------------
(0587)                            || ;							Done
(0588)                            || ;
(0589)                            || ; 	Don't do anything anymore
(0590)                            || ;---------------------------------------------------------------------
(0591)                            || 
(0592)  CS-0x11C  0x088E0  0x11C  || DONE:        BRN DONE
(0593)                            || 
(0594)                            || ;---------------------------------------------------------------------
(0595)                            || ;							Lose
(0596)                            || ;
(0597)                            || ; 	Turn the screen red
(0598)                            || ;---------------------------------------------------------------------
(0599)                            || 
(0600)                     0x11D  || lose:     
(0601)  CS-0x11D  0x08971         || 		call pause
(0602)  CS-0x11E  0x36827         || 		MOV R8, 0x27
(0603)  CS-0x11F  0x3671D         || 		MOV R7, END_COL
(0604)  CS-0x120  0x28801         || 		ADD R8, 0x01
(0605)  CS-0x121  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0606)                            || 
(0607)                     0x122  || lose_loop:
(0608)                            || 
(0609)  CS-0x122  0x04439         || 		MOV R4, R7
(0610)  CS-0x123  0x04541         || 		MOV R5, R8
(0611)  CS-0x124  0x088B1         || 		call draw_dot
(0612)  CS-0x125  0x2C801         || 		SUB R8, 0x01
(0613)  CS-0x126  0x08913         || 		BRNE lose_loop
(0614)                            || 
(0615)  CS-0x127  0x04439         || 		MOV R4, R7
(0616)  CS-0x128  0x04541         || 		MOV R5, R8
(0617)  CS-0x129  0x088B1         || 		call draw_dot
(0618)  CS-0x12A  0x2C701         || 		SUB R7, 0x01
(0619)  CS-0x12B  0x307FF         || 		CMP R7, 0xFF
(0620)  CS-0x12C  0x08913         || 		BRNE lose_loop
(0621)  CS-0x12D  0x088E0         || 		brn done
(0622)                            || 
(0623)                            || 
(0624)                            || 
(0625)                            || ;---------------------------------------------------------------------
(0626)                            || ;							Pause
(0627)                            || ;
(0628)                            || ;	a long pause
(0629)                            || ;---------------------------------------------------------------------
(0630)                            || 
(0631)  CS-0x12E  0x3712F  0x12E  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0632)  CS-0x12F  0x2D101  0x12F  || outside_for0: 	SUB     R17, 0x01
(0633)                            || 
(0634)  CS-0x130  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0635)  CS-0x131  0x2D201  0x131  || middle_for0:  	SUB     R18, 0x01
(0636)                            ||              
(0637)  CS-0x132  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0638)  CS-0x133  0x2D301  0x133  || inside_for0:  	SUB     R19, 0x01
(0639)  CS-0x134  0x0899B         ||              	BRNE    inside_for0
(0640)                            ||              
(0641)  CS-0x135  0x23200         ||              	OR      R18, 0x00              
(0642)  CS-0x136  0x0898B         ||              	BRNE    middle_for0
(0643)                            ||              
(0644)  CS-0x137  0x23100         ||              	OR      R17, 0x00               
(0645)  CS-0x138  0x0897B         ||              	BRNE    outside_for0
(0646)  CS-0x139  0x18002         || 				ret
(0647)                            || 
(0648)                            || ;---------------------------------------------------------------------
(0649)                            || ;							Pause2
(0650)                            || ;
(0651)                            || ;	a shorter pause
(0652)                            || ;---------------------------------------------------------------------
(0653)                            || 
(0654)                            || 
(0655)  CS-0x13A  0x3711F  0x13A  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0656)  CS-0x13B  0x2D101  0x13B  || outside_for: 	SUB     R17, 0x01
(0657)                            || 
(0658)  CS-0x13C  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0659)  CS-0x13D  0x2D201  0x13D  || middle_for:  	SUB     R18, 0x01
(0660)                            ||              
(0661)  CS-0x13E  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0662)  CS-0x13F  0x2D301  0x13F  || inside_for:  	SUB     R19, 0x01
(0663)  CS-0x140  0x089FB         ||              	BRNE    inside_for
(0664)                            ||              
(0665)  CS-0x141  0x23200         ||              	or     R18, 0x00              
(0666)  CS-0x142  0x089EB         ||              	BRNE    middle_for
(0667)                            ||              
(0668)  CS-0x143  0x31100         ||              	CMP      R17, 0x00               
(0669)  CS-0x144  0x089DB         ||              	BRNE    outside_for
(0670)  CS-0x145  0x18002         || 				ret
(0671)                            || 
(0672)                            || ;---------------------------------------------------------------------
(0673)                            || ;							INTERRUPTS
(0674)                            || ;---------------------------------------------------------------------
(0675)                            || 
(0676)                            || 
(0677)                     0x146  || ISR: 
(0678)                            || 
(0679)  CS-0x146  0x33420         ||    	IN R20, INTERRUPT_ID
(0680)  CS-0x147  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0681)                            || 	
(0682)  CS-0x148  0x31400         || 	CMP R20, 0x00
(0683)  CS-0x149  0x08A8A         ||     breq testing0
(0684)                            || 
(0685)  CS-0x14A  0x11401         ||    LSR R20
(0686)  CS-0x14B  0x0AAF0         ||    BRCS moveRight
(0687)                            || 
(0688)  CS-0x14C  0x11401         ||    LSR R20
(0689)  CS-0x14D  0x0AAC8         ||    BRCS shoot   
(0690)                            || 
(0691)  CS-0x14E  0x11401         ||    LSR R20  
(0692)  CS-0x14F  0x08ADA         ||    BREQ moveLeft
(0693)                            || 
(0694)  CS-0x150  0x08B08         ||    brn ISR_END
(0695)                            || 
(0696)                     0x151  || testing0: 
(0697)  CS-0x151  0x044D9         ||    MOV  R4, R27   ;y coordin
(0698)  CS-0x152  0x045E1         ||    MOV  R5, R28   ;x coordin
(0699)                            || 
(0700)  CS-0x153  0x36603         || 	mov r6, 0x03
(0701)  CS-0x154  0x088B1         ||     call draw_dot
(0702)  CS-0x155  0x08971         || 	call pause
(0703)  CS-0x156  0x366FF         || 	mov r6, 0xff
(0704)  CS-0x157  0x088B1         || 	call draw_dot
(0705)  CS-0x158  0x08B08         ||     brn isr_end
(0706)                            || 
(0707)                     0x159  || shoot: 
(0708)                            || 	
(0709)  CS-0x159  0x087E1         || 	  call start_player_bullet	
(0710)  CS-0x15A  0x08B08         || 	  brn ISR_END
(0711)                            || 
(0712)                     0x15B  || moveLeft:
(0713)  CS-0x15B  0x36CFF         ||     MOV R12, 0xFF
(0714)  CS-0x15C  0x08269         || 	call move_player
(0715)                            || 
(0716)  CS-0x15D  0x08B08         || 	brn ISR_END
(0717)                            || 
(0718)                     0x15E  || moveRight:
(0719)  CS-0x15E  0x36C01         || 	MOV R12, 0x01
(0720)                            || 	
(0721)  CS-0x15F  0x08269         || 	call move_player
(0722)                            || 
(0723)  CS-0x160  0x08B08         || 	brn ISR_END
(0724)                     0x161  || ISR_END:
(0725)  CS-0x161  0x1A003         || 		RETIE
(0726)                            || 
(0727)                            || 
(0728)                            || ;---------------------------------------------------------------------
(0729)                            || ;							INTERRUPT VECTOR
(0730)                            || ;---------------------------------------------------------------------
(0731)                            || 
(0732)                            || .CSEG
(0733)                       1023  || .ORG 0x3FF
(0734)  CS-0x3FF  0x08A30  0x3FF  || VECTOR:      BRN ISR
(0735)                            || 





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
ANIMATION      0x10B   (0555)  ||  
CLEAR_BULLET   0x0D4   (0449)  ||  0391 0503 0538 
CLEAR_PLAYER   0x065   (0227)  ||  0186 
CLEAR_PLAYER_LOOP 0x069   (0234)  ||  0240 
CLEAR_SHIP     0x095   (0323)  ||  0253 0282 
CLEAR_SHIP_LOOP 0x099   (0330)  ||  0337 
COLLISION_PLAYER 0x0C0   (0412)  ||  0387 
DD_OUT         0x118   (0580)  ||  
DONE           0x11C   (0592)  ||  0592 0621 
DOWN_SHIP      0x06F   (0252)  ||  0121 
DRAW_BULLET    0x0CF   (0438)  ||  0399 0516 0551 
DRAW_DOT       0x116   (0576)  ||  0082 0088 0172 0211 0236 0311 0333 0442 0455 0560 
                               ||  0563 0611 0617 0701 0704 
DRAW_PLAYER    0x043   (0164)  ||  0105 0218 
DRAW_PLAYER_LOOP 0x047   (0170)  ||  0176 
DRAW_SHIP      0x08A   (0302)  ||  0106 0271 0294 
DRAW_SHIP_BULLETS 0x0D9   (0466)  ||  0129 
DRAW_SHIP_BULLETS_CHECK 0x0E4   (0483)  ||  
DRAW_SHIP_BULLETS_END 0x0E8   (0489)  ||  0485 
DRAW_SHIP_BULLETS_LOOP 0x0DE   (0474)  ||  0481 
DRAW_SHIP_LOOP 0x08E   (0308)  ||  0315 
END_COLLISION_PLAYER 0x0CE   (0429)  ||  0419 
END_DOWN_SHIP  0x07A   (0270)  ||  0266 
END_MOVE_BULLET 0x0BF   (0406)  ||  0400 
END_MOVE_PLAYER 0x064   (0220)  ||  0216 
END_MOVE_SHIP  0x089   (0295)  ||  0278 
END_RESET_BULLETS 0x0B1   (0376)  ||  0370 
END_START_PLAYER_BULLET 0x115   (0569)  ||  0566 
END_START_SHIP_BULLET 0x0FB   (0524)  ||  0521 
HIT_PLAYER     0x0B2   (0385)  ||  
HIT_SHIP       0x0B3   (0390)  ||  
INSIDE_FOR     0x13F   (0662)  ||  0663 
INSIDE_FOR0    0x133   (0638)  ||  0639 
ISR            0x146   (0677)  ||  0734 
ISR_END        0x161   (0724)  ||  0694 0705 0710 0716 0723 
LOSE           0x11D   (0600)  ||  0258 0424 
LOSE_LOOP      0x122   (0607)  ||  0613 0620 
MIDDLE_FOR     0x13D   (0659)  ||  0666 
MIDDLE_FOR0    0x131   (0635)  ||  0642 
MOVE           0x036   (0124)  ||  0118 
MOVELEFT       0x15B   (0712)  ||  0692 
MOVERIGHT      0x15E   (0718)  ||  0686 
MOVE_BULLET    0x0B2   (0383)  ||  0475 
MOVE_BULLETS   0x038   (0128)  ||  0122 
MOVE_PLAYER    0x04D   (0185)  ||  0714 0721 
MOVE_PLAYER_LOOP 0x05A   (0206)  ||  0199 0215 
MOVE_REMOVE_BULLET 0x0BC   (0402)  ||  0394 
MOVE_SHIP      0x07C   (0276)  ||  0125 
MOVE_SHIP_LOOP 0x082   (0286)  ||  0292 
OUTSIDE_FOR    0x13B   (0656)  ||  0669 
OUTSIDE_FOR0   0x12F   (0632)  ||  0645 
PAUSE          0x12E   (0631)  ||  0104 0601 0702 
PAUSE2         0x13A   (0655)  ||  0115 0561 
RESET          0x01B   (0074)  ||  
RESET_BULLETS  0x0AA   (0364)  ||  0096 
RESET_BULLETS_LOOP 0x0AC   (0368)  ||  0374 
RESET_LOOP     0x01E   (0079)  ||  0084 0092 
RESET_PLAYER   0x03A   (0145)  ||  0094 
RESET_PLAYER_LOOP 0x03D   (0150)  ||  0155 
RESET_SHIP     0x0A0   (0345)  ||  0095 
RESET_SHIP_LOOP 0x0A4   (0351)  ||  0356 
RE_DRAW_PLAYER 0x063   (0218)  ||  0200 0204 
SET_NEG        0x079   (0268)  ||  0263 
SHOOT          0x159   (0707)  ||  0689 
START          0x030   (0114)  ||  0131 
START_PLAYER_BULLET 0x0FC   (0531)  ||  0709 
START_PLAYER_BULLET_MAIN 0x101   (0540)  ||  
START_SHIP_BULLET 0x0E9   (0496)  ||  0488 
START_SHIP_BULLET_MAIN 0x0EE   (0505)  ||  
TESTING0       0x151   (0696)  ||  0683 
TEST_LEFT_PLAYER 0x058   (0202)  ||  0195 
TEST_PLAYER    0x0C7   (0420)  ||  0427 
TEST_RIGHT_PLAYER 0x055   (0197)  ||  
VECTOR         0x3FF   (0734)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BULLETS_END_LOC 0x04A   (0041)  ||  0369 
END_COL        0x01D   (0018)  ||  0076 0166 0189 0229 0257 0393 0414 0546 0556 0603 
END_ROW_PLAYER 0x025   (0017)  ||  0198 
END_ROW_SHIP   0x04A   (0016)  ||  0063 0120 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0637 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0661 
INTERRUPT_ID   0x020   (0043)  ||  0679 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0634 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0658 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0631 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0655 
PLAYER_BULLETS_LOC 0x040   (0040)  ||  0532 
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0550 
PLAYER_COLOR   0x0FF   (0025)  ||  0167 0190 
PLAYER_COLOR_LOC 0x00F   (0037)  ||  
PLAYER_X_LOC   0x010   (0036)  ||  0147 0165 0188 0228 0413 0541 
SHIP_BULLETS_LOC 0x020   (0039)  ||  0366 0467 0497 
SHIP_BULLET_COLOR 0x003   (0026)  ||  0468 0515 
SHIP_BULLET_RATE 0x00B   (0029)  ||  0062 0487 
SHIP_COLOR     0x0E3   (0019)  ||  0305 
SHIP_COLOR_LOC 0x00B   (0034)  ||  
SHIP_X_LOC     0x00C   (0032)  ||  0283 0304 0325 0347 0506 
SHIP_Y_LOC     0x00A   (0033)  ||  0254 0260 0303 0324 0348 0511 
SSEG_CNTR_ID   0x060   (0044)  ||  0059 
SSEG_VAL_ID    0x080   (0045)  ||  0680 
VGA_COLOR      0x092   (0006)  ||  0582 
VGA_HADD       0x090   (0004)  ||  0581 
VGA_LADD       0x091   (0005)  ||  0580 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
