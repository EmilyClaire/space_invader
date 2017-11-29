

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
(0067)                            || 
(0068)                            || ;---------------------------------------------------------------------
(0069)                            || ;							Clearing the screen
(0070)                            || ; 
(0071)                            || ;---------------------------------------------------------------------
(0072)                            || 		
(0073)                     0x01A  || reset:
(0074)  CS-0x01A  0x36827         || 		MOV R8, 0x27
(0075)  CS-0x01B  0x3671D         || 		MOV R7, END_COL
(0076)  CS-0x01C  0x36600         || 		MOV R6, 0x00
(0077)                            || 
(0078)                     0x01D  || reset_loop:
(0079)  CS-0x01D  0x04439         || 		MOV R4, R7
(0080)  CS-0x01E  0x04541         || 		MOV R5, R8
(0081)  CS-0x01F  0x087D9         || 		call draw_dot
(0082)  CS-0x020  0x2C801         || 		SUB R8, 0x01
(0083)  CS-0x021  0x080EB         || 		BRNE reset_loop
(0084)                            || 
(0085)  CS-0x022  0x04439         || 		MOV R4, R7
(0086)  CS-0x023  0x04541         || 		MOV R5, R8
(0087)  CS-0x024  0x087D9         || 		call draw_dot
(0088)  CS-0x025  0x36827         || 		MOV R8, 0x27
(0089)  CS-0x026  0x2C701         || 		SUB R7, 0x01
(0090)  CS-0x027  0x307FF         || 		CMP R7, 0xFF
(0091)  CS-0x028  0x080EB         || 		BRNE reset_loop
(0092)                            || 
(0093)  CS-0x029  0x081C9         || 		call reset_player
(0094)  CS-0x02A  0x084F9         || 		call reset_ship
(0095)  CS-0x02B  0x08549         || 		call reset_bullets
(0096)                            || 
(0097)                            || 
(0098)                            || ;---------------------------------------------------------------------
(0099)                            || ;					Drawing the ship and the player
(0100)                            || ; 
(0101)                            || ;---------------------------------------------------------------------
(0102)                            || 	
(0103)  CS-0x02C  0x08899         || 		call pause
(0104)  CS-0x02D  0x08211         || 		call draw_player
(0105)  CS-0x02E  0x08449         || 		call draw_ship
(0106)                            || 
(0107)                            || 
(0108)                            || ;---------------------------------------------------------------------
(0109)                            || ;				The main code for the program
(0110)                            || ;---------------------------------------------------------------------
(0111)                            || 
(0112)                            || 
(0113)                     0x02F  || start:
(0114)  CS-0x02F  0x088F9         || 		CALL pause2
(0115)                            || 
(0116)  CS-0x030  0x30A00         || 		CMP R10, 0x00
(0117)  CS-0x031  0x081AB         || 		BRNE move
(0118)                            || 		
(0119)  CS-0x032  0x36A4A         || 		MOV R10, END_ROW_SHIP
(0120)  CS-0x033  0x08371         || 		CALL down_ship
(0121)  CS-0x034  0x081B8         || 		BRN move_bullets
(0122)                            || 
(0123)                     0x035  || move:
(0124)  CS-0x035  0x083D9         || 		call move_ship
(0125)  CS-0x036  0x2CA01         || 		SUB R10, 0x01
(0126)                            || 
(0127)                     0x037  || move_bullets:
(0128)  CS-0x037  0x086C1         || 		call draw_ship_bullets
(0129)                            || 
(0130)  CS-0x038  0x08178         || 		brn start
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
(0144)                     0x039  || reset_player:
(0145)  CS-0x039  0x36914         || 			MOV R9, 0x14
(0146)  CS-0x03A  0x37D10         || 			MOV R29, PLAYER_X_LOC
(0147)  CS-0x03B  0x36303         || 			MOV R3, 0x03
(0148)                            || 
(0149)                     0x03C  || reset_player_loop:
(0150)  CS-0x03C  0x049EB         || 			ST R9, (R29)
(0151)  CS-0x03D  0x28901         || 			ADD R9, 0x01
(0152)  CS-0x03E  0x29D01         || 			ADD R29, 0x01
(0153)  CS-0x03F  0x2C301         || 			SUB R3, 0x01
(0154)  CS-0x040  0x081E3         || 			BRNE reset_player_loop
(0155)                            || 
(0156)  CS-0x041  0x18002         || 			ret
(0157)                            || 
(0158)                            || 
(0159)                            || ;---------------------------------------------------------------------
(0160)                            || ;							Draw Player
(0161)                            || ;---------------------------------------------------------------------
(0162)                            || 
(0163)                     0x042  || draw_player:
(0164)  CS-0x042  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0165)  CS-0x043  0x3641D         || 				MOV R4,  END_COL
(0166)  CS-0x044  0x366FF         || 				MOV R6, PLAYER_COLOR
(0167)  CS-0x045  0x36303         || 				MOV R3, 0x03
(0168)                            || 
(0169)                     0x046  || draw_player_loop:
(0170)  CS-0x046  0x045CA         || 				LD R5, (R25)
(0171)  CS-0x047  0x087D9         || 				call draw_dot
(0172)                            || 
(0173)  CS-0x048  0x29901         || 				ADD R25, 0x01
(0174)  CS-0x049  0x2C301         || 				SUB R3, 0x01
(0175)  CS-0x04A  0x08233         || 				BRNE draw_player_loop
(0176)                            || 				
(0177)  CS-0x04B  0x18002         || 				ret
(0178)                            || 
(0179)                            || 
(0180)                            || ;---------------------------------------------------------------------
(0181)                            || ;							Move Player
(0182)                            || ;---------------------------------------------------------------------
(0183)                            || 
(0184)                     0x04C  || move_player:
(0185)  CS-0x04C  0x08321         || 				call clear_player
(0186)                            || 
(0187)  CS-0x04D  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0188)  CS-0x04E  0x3641D         || 				MOV R4,  END_COL
(0189)  CS-0x04F  0x366FF         || 				MOV R6, PLAYER_COLOR
(0190)  CS-0x050  0x36303         || 				MOV R3, 0x03
(0191)                            || 
(0192)  CS-0x051  0x049CA         || 				LD R9, (R25)
(0193)  CS-0x052  0x30C01         || 				CMP R12, 0x01
(0194)  CS-0x053  0x082BB         || 				BRNE test_left_player
(0195)                            || 
(0196)                     0x054  || test_right_player:
(0197)  CS-0x054  0x30925         || 				CMP R9, END_ROW_PLAYER
(0198)  CS-0x055  0x082CB         || 				BRNE move_player_loop
(0199)  CS-0x056  0x08310         || 				brn re_draw_player
(0200)                            || 
(0201)                     0x057  || test_left_player:
(0202)  CS-0x057  0x30900         || 				CMP R9, 0x00
(0203)  CS-0x058  0x08312         || 				BREQ re_draw_player
(0204)                            || 				
(0205)                     0x059  || move_player_loop:
(0206)  CS-0x059  0x049CA         || 				LD R9, (R25)
(0207)  CS-0x05A  0x02960         || 				ADD R9, R12
(0208)  CS-0x05B  0x049CB         || 				ST R9, (R25)
(0209)  CS-0x05C  0x04549         || 				MOV R5, R9
(0210)  CS-0x05D  0x087D9         || 				call draw_dot
(0211)                            || 
(0212)  CS-0x05E  0x29901         || 				ADD R25, 0x01
(0213)  CS-0x05F  0x2C301         || 				SUB R3, 0x01
(0214)  CS-0x060  0x082CB         || 				BRNE move_player_loop
(0215)  CS-0x061  0x08318         || 				brn end_move_player
(0216)                            || 
(0217)  CS-0x062  0x08211  0x062  || re_draw_player: call draw_player
(0218)                            || 
(0219)                     0x063  || end_move_player:
(0220)  CS-0x063  0x18002         || 				ret
(0221)                            || 
(0222)                            || ;---------------------------------------------------------------------
(0223)                            || ;							Clear Player
(0224)                            || ;---------------------------------------------------------------------
(0225)                            || 
(0226)                     0x064  || clear_player: 
(0227)  CS-0x064  0x37910         || 				MOV R25, PLAYER_X_LOC
(0228)  CS-0x065  0x3641D         || 				MOV R4, END_COL
(0229)  CS-0x066  0x36600         || 				MOV R6, 0x00
(0230)                            || 
(0231)  CS-0x067  0x36303         || 				MOV R3, 0x03
(0232)                            || 
(0233)                     0x068  || clear_player_loop:
(0234)  CS-0x068  0x045CA         || 				LD R5, (R25)
(0235)  CS-0x069  0x087D9         || 				call draw_dot
(0236)                            || 
(0237)  CS-0x06A  0x29901         || 				ADD R25, 0x01
(0238)  CS-0x06B  0x2C301         || 				SUB R3, 0x01
(0239)  CS-0x06C  0x08343         || 				BRNE clear_player_loop
(0240)                            || 				
(0241)  CS-0x06D  0x18002         || 				ret
(0242)                            || 
(0243)                            || 
(0244)                            || 
(0245)                            || ;---------------------------------------------------------------------
(0246)                            || ;							Down Ship
(0247)                            || ;
(0248)                            || ;	Moves the ship down one row and changes the ships direction
(0249)                            || ;---------------------------------------------------------------------
(0250)                            || 
(0251)                     0x06E  || down_ship:		
(0252)  CS-0x06E  0x084A1         || 				call clear_ship
(0253)  CS-0x06F  0x3890A         || 				LD R9, SHIP_Y_LOC
(0254)                            || 				
(0255)  CS-0x070  0x28901         || 				ADD R9, 0x01
(0256)  CS-0x071  0x3091D         || 				CMP R9, END_COL
(0257)  CS-0x072  0x08812         || 				BREQ lose
(0258)                            || 
(0259)  CS-0x073  0x3A90A         || 				ST R9, SHIP_Y_LOC
(0260)                            || 
(0261)  CS-0x074  0x30B01         || 				CMP R11, 0x01
(0262)  CS-0x075  0x083C2         || 				BREQ set_neg
(0263)                            || 		
(0264)  CS-0x076  0x36B01         || 				MOV R11, 0x01
(0265)  CS-0x077  0x083C8         || 				brn end_down_ship
(0266)                            || 					
(0267)  CS-0x078  0x36BFF  0x078  || set_neg:		MOV R11, 0xFF
(0268)                            || 				
(0269)                     0x079  || end_down_ship:
(0270)  CS-0x079  0x08449         || 				call draw_ship
(0271)  CS-0x07A  0x18002         || 				ret
(0272)                            || ;---------------------------------------------------------------------
(0273)                            || ;							Move Ship
(0274)                            || ;---------------------------------------------------------------------
(0275)                     0x07B  || move_ship:
(0276)  CS-0x07B  0x2DF01         || 				SUB R31, 0x01
(0277)  CS-0x07C  0x08443         || 				BRNE end_move_ship
(0278)                            || 			
(0279)  CS-0x07D  0x37F02         || 				MOV R31, 0x02
(0280)                            ||  
(0281)  CS-0x07E  0x084A1         || 				call clear_ship
(0282)  CS-0x07F  0x3790C         || 				MOV R25, SHIP_X_LOC
(0283)  CS-0x080  0x36303         || 				MOV R3, 0x03
(0284)                            || 
(0285)                     0x081  || move_ship_loop:
(0286)  CS-0x081  0x049CA         || 				LD R9, (R25)
(0287)  CS-0x082  0x02958         || 				ADD R9, R11
(0288)  CS-0x083  0x049CB         || 				ST R9, (R25)
(0289)  CS-0x084  0x29901         || 				ADD R25, 0x01
(0290)  CS-0x085  0x2C301         || 				SUB R3, 0x01
(0291)  CS-0x086  0x0840B         || 				BRNE move_ship_loop
(0292)                            || 
(0293)  CS-0x087  0x08449         || 				call draw_ship
(0294)                     0x088  || end_move_ship:
(0295)  CS-0x088  0x18002         || 				ret
(0296)                            || 
(0297)                            || 
(0298)                            || ;---------------------------------------------------------------------
(0299)                            || ;							Draw Ship
(0300)                            || ;---------------------------------------------------------------------
(0301)                     0x089  || draw_ship:
(0302)  CS-0x089  0x3780A         || 			  	MOV R24, SHIP_Y_LOC
(0303)  CS-0x08A  0x3790C         || 				MOV R25, SHIP_X_LOC
(0304)  CS-0x08B  0x366E3         || 				MOV R6, SHIP_COLOR
(0305)  CS-0x08C  0x36303         || 				MOV R3, 0x03
(0306)                            || 
(0307)                     0x08D  || draw_ship_loop:
(0308)  CS-0x08D  0x044C2         || 				LD R4, (R24)
(0309)  CS-0x08E  0x045CA         || 				LD R5, (R25)
(0310)  CS-0x08F  0x087D9         || 				call draw_dot
(0311)                            || 
(0312)  CS-0x090  0x29901         || 				ADD R25, 0x01
(0313)  CS-0x091  0x2C301         || 				SUB R3, 0x01
(0314)  CS-0x092  0x0846B         || 				BRNE draw_ship_loop
(0315)                            || 				
(0316)  CS-0x093  0x18002         || 				ret
(0317)                            || 
(0318)                            || ;---------------------------------------------------------------------
(0319)                            || ;							Clear Ship
(0320)                            || ;---------------------------------------------------------------------
(0321)                            || 
(0322)                     0x094  || clear_ship: 
(0323)  CS-0x094  0x3780A         || 				MOV R24, SHIP_Y_LOC
(0324)  CS-0x095  0x3790C         || 				MOV R25, SHIP_X_LOC
(0325)  CS-0x096  0x36600         || 				MOV R6, 0x00
(0326)                            || 
(0327)  CS-0x097  0x36303         || 				MOV R3, 0x03
(0328)                            || 
(0329)                     0x098  || clear_ship_loop:
(0330)  CS-0x098  0x044C2         || 				LD R4, (R24)
(0331)  CS-0x099  0x045CA         || 				LD R5, (R25)
(0332)  CS-0x09A  0x087D9         || 				call draw_dot
(0333)                            || 
(0334)  CS-0x09B  0x29901         || 				ADD R25, 0x01
(0335)  CS-0x09C  0x2C301         || 				SUB R3, 0x01
(0336)  CS-0x09D  0x084C3         || 				BRNE clear_ship_loop
(0337)                            || 				
(0338)  CS-0x09E  0x18002         || 				ret
(0339)                            || 
(0340)                            || ;---------------------------------------------------------------------
(0341)                            || ;							Reset Ship
(0342)                            || ;---------------------------------------------------------------------
(0343)                            || 
(0344)                     0x09F  || reset_ship: 
(0345)  CS-0x09F  0x36000         || 				MOV R0, 0x00	
(0346)  CS-0x0A0  0x3780C         || 				MOV R24, SHIP_X_LOC
(0347)  CS-0x0A1  0x3A00A         || 				ST R0, SHIP_Y_LOC
(0348)  CS-0x0A2  0x36303         || 				MOV R3, 0x03
(0349)                            || 
(0350)                     0x0A3  || reset_ship_loop:
(0351)  CS-0x0A3  0x040C3         || 				ST R0, (R24)
(0352)  CS-0x0A4  0x29801         || 				ADD R24, 0x01
(0353)  CS-0x0A5  0x28001         || 				ADD R0, 0x01
(0354)  CS-0x0A6  0x2C301         || 				SUB R3, 0x01
(0355)  CS-0x0A7  0x0851B         || 				BRNE reset_ship_loop
(0356)                            || 				
(0357)  CS-0x0A8  0x18002         || 				ret
(0358)                            || 
(0359)                            || ;---------------------------------------------------------------------
(0360)                            || ;							Reset Bullets
(0361)                            || ;---------------------------------------------------------------------
(0362)                            || 
(0363)                     0x0A9  || reset_bullets:  
(0364)  CS-0x0A9  0x360FF         || 				MOV R0, 0xFF
(0365)  CS-0x0AA  0x37820         || 				MOV R24, SHIP_BULLETS_LOC
(0366)                            || 
(0367)                     0x0AB  || reset_bullets_loop:
(0368)  CS-0x0AB  0x3184A         || 				CMP R24, BULLETS_END_LOC
(0369)  CS-0x0AC  0x08582         || 				BREQ end_reset_bullets
(0370)                            || 				
(0371)  CS-0x0AD  0x040C3         || 				ST R0, (R24)
(0372)  CS-0x0AE  0x29801         || 				ADD R24, 0x01
(0373)  CS-0x0AF  0x08558         || 				BRN reset_bullets_loop
(0374)                            || 				
(0375)                     0x0B0  || end_reset_bullets:
(0376)  CS-0x0B0  0x18002         || 				ret
(0377)                            || 
(0378)                            || 
(0379)                            || ;---------------------------------------------------------------------
(0380)                            || ;							Move Bullet
(0381)                            || ;---------------------------------------------------------------------
(0382)                     0x0B1  || move_bullet:	
(0383)                            || 
(0384)                     0x0B1  || hit_player:		
(0385)                            || 
(0386)  CS-0x0B1  0x085F9         || 				call collision_player
(0387)                            || 
(0388)                            || 
(0389)                     0x0B2  || hit_ship:
(0390)  CS-0x0B2  0x08699         || 				call clear_bullet
(0391)  CS-0x0B3  0x049C2         || 				LD R9, (R24)
(0392)  CS-0x0B4  0x3091D         || 				CMP R9, END_COL
(0393)  CS-0x0B5  0x085DA         || 				BREQ move_remove_bullet
(0394)                            || 
(0395)  CS-0x0B6  0x28901         || 				ADD R9, 0x01
(0396)  CS-0x0B7  0x049C3         || 				ST R9, (R24) 
(0397)  CS-0x0B8  0x04669         || 				MOV R6, R13
(0398)  CS-0x0B9  0x08671         || 				call draw_bullet
(0399)  CS-0x0BA  0x085F0         || 				brn end_move_bullet
(0400)                            || 
(0401)                     0x0BB  || move_remove_bullet:
(0402)  CS-0x0BB  0x369FF         || 				MOV R9, 0xFF
(0403)  CS-0x0BC  0x049C3         || 				ST R9, (R24)
(0404)  CS-0x0BD  0x049CB         || 				ST R9, (R25)
(0405)                     0x0BE  || end_move_bullet:
(0406)  CS-0x0BE  0x18002         || 				ret
(0407)                            || 
(0408)                            || ;---------------------------------------------------------------------
(0409)                            || ;							Collision 
(0410)                            || ;---------------------------------------------------------------------
(0411)                     0x0BF  || collision_player:
(0412)  CS-0x0BF  0x36710         || 				MOV R7, PLAYER_X_LOC
(0413)  CS-0x0C0  0x3681D         || 				MOV R8, END_COL
(0414)  CS-0x0C1  0x36303         || 				MOV R3, 0x03
(0415)  CS-0x0C2  0x04941         || 				MOV R9, R8
(0416)  CS-0x0C3  0x056C2         || 				LD R22, (R24)
(0417)  CS-0x0C4  0x049B0         || 				CMP R9, R22
(0418)  CS-0x0C5  0x0866B         || 				BRNE end_collision_player
(0419)                     0x0C6  || test_player:
(0420)  CS-0x0C6  0x0493A         || 				LD R9, (R7)
(0421)  CS-0x0C7  0x056CA         || 				LD R22, (R25)
(0422)  CS-0x0C8  0x049B0         || 				CMP R9, R22
(0423)  CS-0x0C9  0x08812         || 				BREQ lose
(0424)  CS-0x0CA  0x28701         || 				ADD R7, 0x01
(0425)  CS-0x0CB  0x2C301         || 				SUB R3, 0x01
(0426)  CS-0x0CC  0x08633         || 				BRNE test_player
(0427)                            || 
(0428)                     0x0CD  || end_collision_player:
(0429)  CS-0x0CD  0x18002         || 				ret
(0430)                            || 				
(0431)                            || 
(0432)                            || 
(0433)                            || 
(0434)                            || ;---------------------------------------------------------------------
(0435)                            || ;							Draw Bullet
(0436)                            || ;---------------------------------------------------------------------
(0437)                     0x0CE  || draw_bullet:
(0438)  CS-0x0CE  0x04669         || 				MOV R6, R13
(0439)  CS-0x0CF  0x044C2         || 				LD R4, (R24)
(0440)  CS-0x0D0  0x045CA         || 				LD R5, (R25)
(0441)  CS-0x0D1  0x087D9         || 				call draw_dot
(0442)  CS-0x0D2  0x18002         || 				ret
(0443)                            || 
(0444)                            || ;---------------------------------------------------------------------
(0445)                            || ;							Clear Bullet
(0446)                            || ;---------------------------------------------------------------------
(0447)                            || 
(0448)                     0x0D3  || clear_bullet: 
(0449)                            || 				;R0, 0xFF
(0450)  CS-0x0D3  0x36600         || 				MOV R6, 0x00
(0451)                            || 
(0452)  CS-0x0D4  0x044C2         || 				LD R4, (R24)
(0453)  CS-0x0D5  0x045CA         || 				LD R5, (R25)
(0454)  CS-0x0D6  0x087D9         || 				call draw_dot
(0455)                            || 
(0456)                            || 				;ST R0, (R24)
(0457)                            || 				;ST R0, (R25)
(0458)  CS-0x0D7  0x18002         || 				ret
(0459)                            || 
(0460)                            || 
(0461)                            || ;---------------------------------------------------------------------
(0462)                            || ;							Draw Ship Bullets
(0463)                            || ;---------------------------------------------------------------------
(0464)                            || 
(0465)                     0x0D8  || draw_ship_bullets:
(0466)  CS-0x0D8  0x37920         || 				MOV R25, SHIP_BULLETS_LOC
(0467)  CS-0x0D9  0x36D03         || 				MOV R13, SHIP_BULLET_COLOR
(0468)  CS-0x0DA  0x058C9         || 				MOV R24, R25
(0469)  CS-0x0DB  0x29801         || 				ADD R24, 0x01
(0470)                            || 
(0471)  CS-0x0DC  0x36F00         || 				MOV R15, 0x00
(0472)                            || 
(0473)                     0x0DD  || draw_ship_bullets_loop:
(0474)  CS-0x0DD  0x08589         || 				call move_bullet
(0475)                            || 
(0476)  CS-0x0DE  0x29902         || 				ADD R25, 0x02
(0477)  CS-0x0DF  0x29802         || 				ADD R24, 0x02
(0478)  CS-0x0E0  0x28F02         || 				ADD R15, 0x02
(0479)  CS-0x0E1  0x30F0A         || 				CMP R15, 0x0A
(0480)  CS-0x0E2  0x086EB         || 				BRNE draw_ship_bullets_loop
(0481)                            || 					
(0482)                     0x0E3  || draw_ship_bullets_check:
(0483)  CS-0x0E3  0x2DE01         || 				SUB R30, 0x01
(0484)  CS-0x0E4  0x0873B         || 				BRNE draw_ship_bullets_end
(0485)                            || 
(0486)  CS-0x0E5  0x37E0B         || 				MOV R30, SHIP_BULLET_RATE
(0487)  CS-0x0E6  0x08741         || 				call start_ship_bullet
(0488)                     0x0E7  || draw_ship_bullets_end:
(0489)  CS-0x0E7  0x18002         || 				ret
(0490)                            || 
(0491)                            || 
(0492)                            || ;---------------------------------------------------------------------
(0493)                            || ;							Start Ship Bullet
(0494)                            || ;---------------------------------------------------------------------
(0495)                     0x0E8  || start_ship_bullet:
(0496)  CS-0x0E8  0x37920         || 				MOV R25, SHIP_BULLETS_LOC
(0497)  CS-0x0E9  0x039D0         || 				ADD R25, R26
(0498)                            || 
(0499)  CS-0x0EA  0x058C9         || 				MOV R24, R25
(0500)  CS-0x0EB  0x29801         || 				ADD R24, 0x01
(0501)                            || 
(0502)  CS-0x0EC  0x08699         || 				call clear_bullet
(0503)                            || 
(0504)                     0x0ED  || start_ship_bullet_main:
(0505)  CS-0x0ED  0x3690C         || 				MOV R9, SHIP_X_LOC
(0506)  CS-0x0EE  0x28901         || 				ADD R9, 0x01
(0507)  CS-0x0EF  0x0484A         || 			    LD R8, (R9)
(0508)  CS-0x0F0  0x048CB         || 				ST R8, (R25)
(0509)                            || 
(0510)  CS-0x0F1  0x3870A         || 				LD R7, SHIP_Y_LOC
(0511)  CS-0x0F2  0x28701         || 				ADD R7, 0x01
(0512)  CS-0x0F3  0x047C3         || 				ST R7, (R24)
(0513)                            || 				
(0514)  CS-0x0F4  0x36D03         || 				MOV R13, SHIP_BULLET_COLOR
(0515)  CS-0x0F5  0x08671         || 				call draw_bullet
(0516)                            || 
(0517)  CS-0x0F6  0x29A02         || 				ADD R26, 0x02
(0518)                            || 			
(0519)  CS-0x0F7  0x31A0A         || 				CMP R26, 0x0A
(0520)  CS-0x0F8  0x087D3         || 				BRNE end_start_ship_bullet
(0521)                            || 
(0522)  CS-0x0F9  0x37A00         || 				MOV R26, 0x00
(0523)                     0x0FA  || end_start_ship_bullet:
(0524)  CS-0x0FA  0x18002         || 				ret
(0525)                            || 
(0526)                            || 
(0527)                            || 
(0528)                            || ;---------------------------------------------------------------------
(0529)                            || ;							Draw Dot
(0530)                            || ;---------------------------------------------------------------------
(0531)                            || 
(0532)                     0x0FB  || draw_dot: 
(0533)  CS-0x0FB  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0534)  CS-0x0FC  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0535)                            || 
(0536)  CS-0x0FD  0x34591  0x0FD  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0537)  CS-0x0FE  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0538)  CS-0x0FF  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0539)  CS-0x100  0x18002         ||         RET
(0540)                            || 	   
(0541)                            || 
(0542)                            || ;---------------------------------------------------------------------
(0543)                            || ;							Done
(0544)                            || ;
(0545)                            || ; 	Don't do anything anymore
(0546)                            || ;---------------------------------------------------------------------
(0547)                            || 
(0548)  CS-0x101  0x08808  0x101  || DONE:        BRN DONE
(0549)                            || 
(0550)                            || ;---------------------------------------------------------------------
(0551)                            || ;							Lose
(0552)                            || ;
(0553)                            || ; 	Turn the screen red
(0554)                            || ;---------------------------------------------------------------------
(0555)                            || 
(0556)                     0x102  || lose:     
(0557)  CS-0x102  0x08899         || 		call pause
(0558)  CS-0x103  0x36827         || 		MOV R8, 0x27
(0559)  CS-0x104  0x3671D         || 		MOV R7, END_COL
(0560)  CS-0x105  0x28801         || 		ADD R8, 0x01
(0561)  CS-0x106  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0562)                            || 
(0563)                     0x107  || lose_loop:
(0564)                            || 
(0565)  CS-0x107  0x04439         || 		MOV R4, R7
(0566)  CS-0x108  0x04541         || 		MOV R5, R8
(0567)  CS-0x109  0x087D9         || 		call draw_dot
(0568)  CS-0x10A  0x2C801         || 		SUB R8, 0x01
(0569)  CS-0x10B  0x0883B         || 		BRNE lose_loop
(0570)                            || 
(0571)  CS-0x10C  0x04439         || 		MOV R4, R7
(0572)  CS-0x10D  0x04541         || 		MOV R5, R8
(0573)  CS-0x10E  0x087D9         || 		call draw_dot
(0574)  CS-0x10F  0x2C701         || 		SUB R7, 0x01
(0575)  CS-0x110  0x307FF         || 		CMP R7, 0xFF
(0576)  CS-0x111  0x0883B         || 		BRNE lose_loop
(0577)  CS-0x112  0x08808         || 		brn done
(0578)                            || 
(0579)                            || 
(0580)                            || 
(0581)                            || ;---------------------------------------------------------------------
(0582)                            || ;							Pause
(0583)                            || ;
(0584)                            || ;	a long pause
(0585)                            || ;---------------------------------------------------------------------
(0586)                            || 
(0587)  CS-0x113  0x3712F  0x113  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0588)  CS-0x114  0x2D101  0x114  || outside_for0: 	SUB     R17, 0x01
(0589)                            || 
(0590)  CS-0x115  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0591)  CS-0x116  0x2D201  0x116  || middle_for0:  	SUB     R18, 0x01
(0592)                            ||              
(0593)  CS-0x117  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0594)  CS-0x118  0x2D301  0x118  || inside_for0:  	SUB     R19, 0x01
(0595)  CS-0x119  0x088C3         ||              	BRNE    inside_for0
(0596)                            ||              
(0597)  CS-0x11A  0x23200         ||              	OR      R18, 0x00              
(0598)  CS-0x11B  0x088B3         ||              	BRNE    middle_for0
(0599)                            ||              
(0600)  CS-0x11C  0x23100         ||              	OR      R17, 0x00               
(0601)  CS-0x11D  0x088A3         ||              	BRNE    outside_for0
(0602)  CS-0x11E  0x18002         || 				ret
(0603)                            || 
(0604)                            || ;---------------------------------------------------------------------
(0605)                            || ;							Pause2
(0606)                            || ;
(0607)                            || ;	a shorter pause
(0608)                            || ;---------------------------------------------------------------------
(0609)                            || 
(0610)                            || 
(0611)  CS-0x11F  0x3711F  0x11F  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0612)  CS-0x120  0x2D101  0x120  || outside_for: 	SUB     R17, 0x01
(0613)                            || 
(0614)  CS-0x121  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0615)  CS-0x122  0x2D201  0x122  || middle_for:  	SUB     R18, 0x01
(0616)                            ||              
(0617)  CS-0x123  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0618)  CS-0x124  0x2D301  0x124  || inside_for:  	SUB     R19, 0x01
(0619)  CS-0x125  0x08923         ||              	BRNE    inside_for
(0620)                            ||              
(0621)  CS-0x126  0x23200         ||              	or     R18, 0x00              
(0622)  CS-0x127  0x08913         ||              	BRNE    middle_for
(0623)                            ||              
(0624)  CS-0x128  0x31100         ||              	CMP      R17, 0x00               
(0625)  CS-0x129  0x08903         ||              	BRNE    outside_for
(0626)  CS-0x12A  0x18002         || 				ret
(0627)                            || 
(0628)                            || ;---------------------------------------------------------------------
(0629)                            || ;							INTERRUPTS
(0630)                            || ;---------------------------------------------------------------------
(0631)                            || 
(0632)                            || 
(0633)                     0x12B  || ISR: 
(0634)                            || 
(0635)  CS-0x12B  0x33420         ||    	IN R20, INTERRUPT_ID
(0636)  CS-0x12C  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0637)                            || 	
(0638)  CS-0x12D  0x31400         || 	CMP R20, 0x00
(0639)  CS-0x12E  0x089B2         ||     breq testing0
(0640)                            || 
(0641)  CS-0x12F  0x11401         ||    LSR R20
(0642)  CS-0x130  0x0AB20         ||    BRCS moveRight
(0643)                            || 
(0644)  CS-0x131  0x11401         ||    LSR R20
(0645)  CS-0x132  0x0A9F0         ||    BRCS shoot   
(0646)                            || 
(0647)  CS-0x133  0x11401         ||    LSR R20  
(0648)  CS-0x134  0x08B0A         ||    BREQ moveLeft
(0649)                            || 
(0650)  CS-0x135  0x08B38         ||    brn ISR_END
(0651)                            || 
(0652)                     0x136  || testing0: 
(0653)  CS-0x136  0x044D9         ||    MOV  R4, R27   ;y coordin
(0654)  CS-0x137  0x045E1         ||    MOV  R5, R28   ;x coordin
(0655)                            || 
(0656)  CS-0x138  0x36603         || 	mov r6, 0x03
(0657)  CS-0x139  0x087D9         ||     call draw_dot
(0658)  CS-0x13A  0x08899         || 	call pause
(0659)  CS-0x13B  0x366FF         || 	mov r6, 0xff
(0660)  CS-0x13C  0x087D9         || 	call draw_dot
(0661)  CS-0x13D  0x08B38         ||     brn isr_end
(0662)                            || 
(0663)                     0x13E  || shoot: 
(0664)                            ||    
(0665)  CS-0x13E  0x31001         || 	CMP R16, 0x01
(0666)  CS-0x13F  0x08A6A         || 	BREQ second_bullet
(0667)                            || 
(0668)  CS-0x140  0x04469         || 	MOV R4, R13
(0669)  CS-0x141  0x04561         || 	MOV R5, R12
(0670)  CS-0x142  0x36600         || 	MOV R6, 0x00
(0671)  CS-0x143  0x087D9         || 	call draw_dot
(0672)                            || 
(0673)  CS-0x144  0x04DD9         ||    Mov R13, R27
(0674)  CS-0x145  0x2CD01         ||    SUB R13, 0x01
(0675)                            || 
(0676)  CS-0x146  0x04CE1         ||    MOV R12, R28
(0677)                            || 
(0678)  CS-0x147  0x04469         ||    MOV R4, R13
(0679)  CS-0x148  0x04561         ||    MOV R5, R12
(0680)  CS-0x149  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0681)  CS-0x14A  0x087D9         ||    call draw_dot
(0682)                            || 
(0683)  CS-0x14B  0x29001         ||    ADD R16, 0x01
(0684)                            ||    
(0685)  CS-0x14C  0x08AC8         ||    BRN animation
(0686)                            || 
(0687)                     0x14D  || second_bullet:		   
(0688)  CS-0x14D  0x04479         || 	MOV R4, R15
(0689)  CS-0x14E  0x04571         || 	MOV R5, R14
(0690)  CS-0x14F  0x36600         || 	MOV R6, 0x00
(0691)  CS-0x150  0x087D9         || 	call draw_dot
(0692)                            || 
(0693)  CS-0x151  0x04FD9         || 	MOV R15, R27
(0694)  CS-0x152  0x2CF01         || 	SUB R15, 0x01
(0695)                            || 
(0696)  CS-0x153  0x04EE1         || 	MOV R14, R28	
(0697)                            || 
(0698)  CS-0x154  0x04479         ||    MOV R4, R15
(0699)  CS-0x155  0x04571         ||    MOV R5, R14
(0700)  CS-0x156  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0701)  CS-0x157  0x087D9         ||    call draw_dot
(0702)                            || 
(0703)  CS-0x158  0x2D001         ||    SUB R16, 0x01
(0704)                            || 
(0705)                     0x159  || animation:
(0706)  CS-0x159  0x044D9         ||    MOV  R4, R27   ;y coordin
(0707)  CS-0x15A  0x045E1         ||    MOV  R5, R28   ;x coordin
(0708)                            || 
(0709)  CS-0x15B  0x366E0         || 	  mov R6, 0xE0
(0710)  CS-0x15C  0x087D9         || 	  call draw_dot
(0711)  CS-0x15D  0x088F9         ||       call pause2
(0712)  CS-0x15E  0x366FF         || 	  mov R6, 0xFF
(0713)  CS-0x15F  0x087D9         ||       call draw_dot
(0714)  CS-0x160  0x08B38         || 	  brn ISR_END
(0715)                            || 
(0716)                     0x161  || moveLeft:
(0717)  CS-0x161  0x36CFF         ||     MOV R12, 0xFF
(0718)  CS-0x162  0x08261         || 	call move_player
(0719)                            || 
(0720)  CS-0x163  0x08B38         || 	brn ISR_END
(0721)                            || 
(0722)                     0x164  || moveRight:
(0723)  CS-0x164  0x36C01         || 	MOV R12, 0x01
(0724)                            || 	
(0725)  CS-0x165  0x08261         || 	call move_player
(0726)                            || 
(0727)  CS-0x166  0x08B38         || 	brn ISR_END
(0728)                     0x167  || ISR_END:
(0729)  CS-0x167  0x1A003         || 		RETIE
(0730)                            || 
(0731)                            || 
(0732)                            || ;---------------------------------------------------------------------
(0733)                            || ;							INTERRUPT VECTOR
(0734)                            || ;---------------------------------------------------------------------
(0735)                            || 
(0736)                            || .CSEG
(0737)                       1023  || .ORG 0x3FF
(0738)  CS-0x3FF  0x08958  0x3FF  || VECTOR:      BRN ISR
(0739)                            || 





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
ANIMATION      0x159   (0705)  ||  0685 
CLEAR_BULLET   0x0D3   (0448)  ||  0390 0502 
CLEAR_PLAYER   0x064   (0226)  ||  0185 
CLEAR_PLAYER_LOOP 0x068   (0233)  ||  0239 
CLEAR_SHIP     0x094   (0322)  ||  0252 0281 
CLEAR_SHIP_LOOP 0x098   (0329)  ||  0336 
COLLISION_PLAYER 0x0BF   (0411)  ||  0386 
DD_OUT         0x0FD   (0536)  ||  
DONE           0x101   (0548)  ||  0548 0577 
DOWN_SHIP      0x06E   (0251)  ||  0120 
DRAW_BULLET    0x0CE   (0437)  ||  0398 0515 
DRAW_DOT       0x0FB   (0532)  ||  0081 0087 0171 0210 0235 0310 0332 0441 0454 0567 
                               ||  0573 0657 0660 0671 0681 0691 0701 0710 0713 
DRAW_PLAYER    0x042   (0163)  ||  0104 0217 
DRAW_PLAYER_LOOP 0x046   (0169)  ||  0175 
DRAW_SHIP      0x089   (0301)  ||  0105 0270 0293 
DRAW_SHIP_BULLETS 0x0D8   (0465)  ||  0128 
DRAW_SHIP_BULLETS_CHECK 0x0E3   (0482)  ||  
DRAW_SHIP_BULLETS_END 0x0E7   (0488)  ||  0484 
DRAW_SHIP_BULLETS_LOOP 0x0DD   (0473)  ||  0480 
DRAW_SHIP_LOOP 0x08D   (0307)  ||  0314 
END_COLLISION_PLAYER 0x0CD   (0428)  ||  0418 
END_DOWN_SHIP  0x079   (0269)  ||  0265 
END_MOVE_BULLET 0x0BE   (0405)  ||  0399 
END_MOVE_PLAYER 0x063   (0219)  ||  0215 
END_MOVE_SHIP  0x088   (0294)  ||  0277 
END_RESET_BULLETS 0x0B0   (0375)  ||  0369 
END_START_SHIP_BULLET 0x0FA   (0523)  ||  0520 
HIT_PLAYER     0x0B1   (0384)  ||  
HIT_SHIP       0x0B2   (0389)  ||  
INSIDE_FOR     0x124   (0618)  ||  0619 
INSIDE_FOR0    0x118   (0594)  ||  0595 
ISR            0x12B   (0633)  ||  0738 
ISR_END        0x167   (0728)  ||  0650 0661 0714 0720 0727 
LOSE           0x102   (0556)  ||  0257 0423 
LOSE_LOOP      0x107   (0563)  ||  0569 0576 
MIDDLE_FOR     0x122   (0615)  ||  0622 
MIDDLE_FOR0    0x116   (0591)  ||  0598 
MOVE           0x035   (0123)  ||  0117 
MOVELEFT       0x161   (0716)  ||  0648 
MOVERIGHT      0x164   (0722)  ||  0642 
MOVE_BULLET    0x0B1   (0382)  ||  0474 
MOVE_BULLETS   0x037   (0127)  ||  0121 
MOVE_PLAYER    0x04C   (0184)  ||  0718 0725 
MOVE_PLAYER_LOOP 0x059   (0205)  ||  0198 0214 
MOVE_REMOVE_BULLET 0x0BB   (0401)  ||  0393 
MOVE_SHIP      0x07B   (0275)  ||  0124 
MOVE_SHIP_LOOP 0x081   (0285)  ||  0291 
OUTSIDE_FOR    0x120   (0612)  ||  0625 
OUTSIDE_FOR0   0x114   (0588)  ||  0601 
PAUSE          0x113   (0587)  ||  0103 0557 0658 
PAUSE2         0x11F   (0611)  ||  0114 0711 
RESET          0x01A   (0073)  ||  
RESET_BULLETS  0x0A9   (0363)  ||  0095 
RESET_BULLETS_LOOP 0x0AB   (0367)  ||  0373 
RESET_LOOP     0x01D   (0078)  ||  0083 0091 
RESET_PLAYER   0x039   (0144)  ||  0093 
RESET_PLAYER_LOOP 0x03C   (0149)  ||  0154 
RESET_SHIP     0x09F   (0344)  ||  0094 
RESET_SHIP_LOOP 0x0A3   (0350)  ||  0355 
RE_DRAW_PLAYER 0x062   (0217)  ||  0199 0203 
SECOND_BULLET  0x14D   (0687)  ||  0666 
SET_NEG        0x078   (0267)  ||  0262 
SHOOT          0x13E   (0663)  ||  0645 
START          0x02F   (0113)  ||  0130 
START_SHIP_BULLET 0x0E8   (0495)  ||  0487 
START_SHIP_BULLET_MAIN 0x0ED   (0504)  ||  
TESTING0       0x136   (0652)  ||  0639 
TEST_LEFT_PLAYER 0x057   (0201)  ||  0194 
TEST_PLAYER    0x0C6   (0419)  ||  0426 
TEST_RIGHT_PLAYER 0x054   (0196)  ||  
VECTOR         0x3FF   (0738)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BULLETS_END_LOC 0x04A   (0041)  ||  0368 
END_COL        0x01D   (0018)  ||  0075 0165 0188 0228 0256 0392 0413 0559 
END_ROW_PLAYER 0x025   (0017)  ||  0197 
END_ROW_SHIP   0x04A   (0016)  ||  0063 0119 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0593 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0617 
INTERRUPT_ID   0x020   (0043)  ||  0635 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0590 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0614 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0587 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0611 
PLAYER_BULLETS_LOC 0x040   (0040)  ||  
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0680 0700 
PLAYER_COLOR   0x0FF   (0025)  ||  0166 0189 
PLAYER_COLOR_LOC 0x00F   (0037)  ||  
PLAYER_X_LOC   0x010   (0036)  ||  0146 0164 0187 0227 0412 
SHIP_BULLETS_LOC 0x020   (0039)  ||  0365 0466 0496 
SHIP_BULLET_COLOR 0x003   (0026)  ||  0467 0514 
SHIP_BULLET_RATE 0x00B   (0029)  ||  0062 0486 
SHIP_COLOR     0x0E3   (0019)  ||  0304 
SHIP_COLOR_LOC 0x00B   (0034)  ||  
SHIP_X_LOC     0x00C   (0032)  ||  0282 0303 0324 0346 0505 
SHIP_Y_LOC     0x00A   (0033)  ||  0253 0259 0302 0323 0347 0510 
SSEG_CNTR_ID   0x060   (0044)  ||  0059 
SSEG_VAL_ID    0x080   (0045)  ||  0636 
VGA_COLOR      0x092   (0006)  ||  0538 
VGA_HADD       0x090   (0004)  ||  0537 
VGA_LADD       0x091   (0005)  ||  0536 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
