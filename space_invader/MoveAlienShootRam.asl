

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
(0062)  CS-0x015  0x37E12         || 		MOV R30, SHIP_BULLET_RATE
(0063)  CS-0x016  0x36A4A         || 		MOV  R10, END_ROW_SHIP
(0064)  CS-0x017  0x36B01         || 		MOV R11, 0x01   
(0065)  CS-0x018  0x36303         || 		MOV R3, 0x03
(0066)                            || 
(0067)                            || ;---------------------------------------------------------------------
(0068)                            || ;							Clearing the screen
(0069)                            || ; 
(0070)                            || ;---------------------------------------------------------------------
(0071)                            || 		
(0072)                     0x019  || reset:
(0073)  CS-0x019  0x36827         || 		MOV R8, 0x27
(0074)  CS-0x01A  0x3671D         || 		MOV R7, END_COL
(0075)  CS-0x01B  0x36600         || 		MOV R6, 0x00
(0076)                            || 
(0077)                     0x01C  || reset_loop:
(0078)  CS-0x01C  0x04439         || 		MOV R4, R7
(0079)  CS-0x01D  0x04541         || 		MOV R5, R8
(0080)  CS-0x01E  0x08579         || 		call draw_dot
(0081)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0082)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0083)                            || 
(0084)  CS-0x021  0x04439         || 		MOV R4, R7
(0085)  CS-0x022  0x04541         || 		MOV R5, R8
(0086)  CS-0x023  0x08579         || 		call draw_dot
(0087)  CS-0x024  0x36827         || 		MOV R8, 0x27
(0088)  CS-0x025  0x2C701         || 		SUB R7, 0x01
(0089)  CS-0x026  0x307FF         || 		CMP R7, 0xFF
(0090)  CS-0x027  0x080E3         || 		BRNE reset_loop
(0091)                            || 
(0092)  CS-0x028  0x081B9         || 		call reset_player
(0093)  CS-0x029  0x084E9         || 		call reset_ship
(0094)  CS-0x02A  0x08539         || 		call reset_bullets
(0095)                            || 
(0096)                            || 
(0097)                            || ;---------------------------------------------------------------------
(0098)                            || ;					Drawing the ship and the player
(0099)                            || ; 
(0100)                            || ;---------------------------------------------------------------------
(0101)                            || 	
(0102)  CS-0x02B  0x08639         || 		call pause
(0103)  CS-0x02C  0x08201         || 		call draw_player
(0104)  CS-0x02D  0x08439         || 		call draw_ship
(0105)                            || 
(0106)                            || 
(0107)                            || ;---------------------------------------------------------------------
(0108)                            || ;				The main code for the program
(0109)                            || ;---------------------------------------------------------------------
(0110)                            || 
(0111)                            || 
(0112)                     0x02E  || start:
(0113)  CS-0x02E  0x08699         || 		CALL pause2
(0114)                            || 
(0115)  CS-0x02F  0x30A00         || 		CMP R10, 0x00
(0116)  CS-0x030  0x081A3         || 		BRNE move
(0117)                            || 		
(0118)  CS-0x031  0x36A4A         || 		MOV R10, END_ROW_SHIP
(0119)  CS-0x032  0x08361         || 		CALL down_ship
(0120)  CS-0x033  0x08170         || 		BRN start
(0121)                            || 
(0122)                     0x034  || move:
(0123)  CS-0x034  0x083C9         || 		call move_ship
(0124)  CS-0x035  0x2CA01         || 		SUB R10, 0x01
(0125)  CS-0x036  0x08170         || 		brn start
(0126)                            || 
(0127)                            || ;---------------------------------------------------------------------
(0128)                            || ;								FUNCTIONS 
(0129)                            || ;---------------------------------------------------------------------
(0130)                            || 
(0131)                            || 
(0132)                            || ;---------------------------------------------------------------------
(0133)                            || ;							Reset Player
(0134)                            || ;
(0135)                            || ;	Sets the player location to the middle of the bottom row
(0136)                            || ;	does not draw the player
(0137)                            || ;---------------------------------------------------------------------
(0138)                            || 
(0139)                     0x037  || reset_player:
(0140)  CS-0x037  0x36914         || 			MOV R9, 0x14
(0141)  CS-0x038  0x37D10         || 			MOV R29, PLAYER_X_LOC
(0142)  CS-0x039  0x36303         || 			MOV R3, 0x03
(0143)                            || 
(0144)                     0x03A  || reset_player_loop:
(0145)  CS-0x03A  0x049EB         || 			ST R9, (R29)
(0146)  CS-0x03B  0x28901         || 			ADD R9, 0x01
(0147)  CS-0x03C  0x29D01         || 			ADD R29, 0x01
(0148)  CS-0x03D  0x2C301         || 			SUB R3, 0x01
(0149)  CS-0x03E  0x081D3         || 			BRNE reset_player_loop
(0150)                            || 
(0151)  CS-0x03F  0x18002         || 			ret
(0152)                            || 
(0153)                            || 
(0154)                            || ;---------------------------------------------------------------------
(0155)                            || ;							Draw Player
(0156)                            || ;---------------------------------------------------------------------
(0157)                            || 
(0158)                     0x040  || draw_player:
(0159)  CS-0x040  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0160)  CS-0x041  0x3641D         || 				MOV R4,  END_COL
(0161)  CS-0x042  0x366FF         || 				MOV R6, PLAYER_COLOR
(0162)  CS-0x043  0x36303         || 				MOV R3, 0x03
(0163)                            || 
(0164)                     0x044  || draw_player_loop:
(0165)  CS-0x044  0x045CA         || 				LD R5, (R25)
(0166)  CS-0x045  0x08579         || 				call draw_dot
(0167)                            || 
(0168)  CS-0x046  0x29901         || 				ADD R25, 0x01
(0169)  CS-0x047  0x2C301         || 				SUB R3, 0x01
(0170)  CS-0x048  0x08223         || 				BRNE draw_player_loop
(0171)                            || 				
(0172)  CS-0x049  0x18002         || 				ret
(0173)                            || 
(0174)                            || 
(0175)                            || ;---------------------------------------------------------------------
(0176)                            || ;							Move Player
(0177)                            || ;---------------------------------------------------------------------
(0178)                            || 
(0179)                     0x04A  || move_player:
(0180)  CS-0x04A  0x08311         || 				call clear_player
(0181)                            || 
(0182)  CS-0x04B  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0183)  CS-0x04C  0x3641D         || 				MOV R4,  END_COL
(0184)  CS-0x04D  0x366FF         || 				MOV R6, PLAYER_COLOR
(0185)  CS-0x04E  0x36303         || 				MOV R3, 0x03
(0186)                            || 
(0187)  CS-0x04F  0x049CA         || 				LD R9, (R25)
(0188)  CS-0x050  0x30C01         || 				CMP R12, 0x01
(0189)  CS-0x051  0x082AB         || 				BRNE test_left_player
(0190)                            || 
(0191)                     0x052  || test_right_player:
(0192)  CS-0x052  0x30925         || 				CMP R9, END_ROW_PLAYER
(0193)  CS-0x053  0x082BB         || 				BRNE move_player_loop
(0194)  CS-0x054  0x08300         || 				brn re_draw_player
(0195)                            || 
(0196)                     0x055  || test_left_player:
(0197)  CS-0x055  0x30900         || 				CMP R9, 0x00
(0198)  CS-0x056  0x08302         || 				BREQ re_draw_player
(0199)                            || 				
(0200)                     0x057  || move_player_loop:
(0201)  CS-0x057  0x049CA         || 				LD R9, (R25)
(0202)  CS-0x058  0x02960         || 				ADD R9, R12
(0203)  CS-0x059  0x049CB         || 				ST R9, (R25)
(0204)  CS-0x05A  0x04549         || 				MOV R5, R9
(0205)  CS-0x05B  0x08579         || 				call draw_dot
(0206)                            || 
(0207)  CS-0x05C  0x29901         || 				ADD R25, 0x01
(0208)  CS-0x05D  0x2C301         || 				SUB R3, 0x01
(0209)  CS-0x05E  0x082BB         || 				BRNE move_player_loop
(0210)  CS-0x05F  0x08308         || 				brn end_move_player
(0211)                            || 
(0212)  CS-0x060  0x08201  0x060  || re_draw_player: call draw_player
(0213)                            || 
(0214)                     0x061  || end_move_player:
(0215)  CS-0x061  0x18002         || 				ret
(0216)                            || 
(0217)                            || ;---------------------------------------------------------------------
(0218)                            || ;							Clear Player
(0219)                            || ;---------------------------------------------------------------------
(0220)                            || 
(0221)                     0x062  || clear_player: 
(0222)  CS-0x062  0x37910         || 				MOV R25, PLAYER_X_LOC
(0223)  CS-0x063  0x3641D         || 				MOV R4, END_COL
(0224)  CS-0x064  0x36600         || 				MOV R6, 0x00
(0225)                            || 
(0226)  CS-0x065  0x36303         || 				MOV R3, 0x03
(0227)                            || 
(0228)                     0x066  || clear_player_loop:
(0229)  CS-0x066  0x045CA         || 				LD R5, (R25)
(0230)  CS-0x067  0x08579         || 				call draw_dot
(0231)                            || 
(0232)  CS-0x068  0x29901         || 				ADD R25, 0x01
(0233)  CS-0x069  0x2C301         || 				SUB R3, 0x01
(0234)  CS-0x06A  0x08333         || 				BRNE clear_player_loop
(0235)                            || 				
(0236)  CS-0x06B  0x18002         || 				ret
(0237)                            || 
(0238)                            || 
(0239)                            || 
(0240)                            || ;---------------------------------------------------------------------
(0241)                            || ;							Down Ship
(0242)                            || ;
(0243)                            || ;	Moves the ship down one row and changes the ships direction
(0244)                            || ;---------------------------------------------------------------------
(0245)                            || 
(0246)                     0x06C  || down_ship:		
(0247)  CS-0x06C  0x08491         || 				call clear_ship
(0248)  CS-0x06D  0x3890A         || 				LD R9, SHIP_Y_LOC
(0249)                            || 				
(0250)  CS-0x06E  0x28901         || 				ADD R9, 0x01
(0251)  CS-0x06F  0x3091D         || 				CMP R9, END_COL
(0252)  CS-0x070  0x085B2         || 				BREQ lose
(0253)                            || 
(0254)  CS-0x071  0x3A90A         || 				ST R9, SHIP_Y_LOC
(0255)                            || 
(0256)  CS-0x072  0x30B01         || 				CMP R11, 0x01
(0257)  CS-0x073  0x083B2         || 				BREQ set_neg
(0258)                            || 		
(0259)  CS-0x074  0x36B01         || 				MOV R11, 0x01
(0260)  CS-0x075  0x083B8         || 				brn end_down_ship
(0261)                            || 					
(0262)  CS-0x076  0x36BFF  0x076  || set_neg:		MOV R11, 0xFF
(0263)                            || 				
(0264)                     0x077  || end_down_ship:
(0265)  CS-0x077  0x08439         || 				call draw_ship
(0266)  CS-0x078  0x18002         || 				ret
(0267)                            || ;---------------------------------------------------------------------
(0268)                            || ;							Move Ship
(0269)                            || ;---------------------------------------------------------------------
(0270)                     0x079  || move_ship:
(0271)  CS-0x079  0x2DF01         || 				SUB R31, 0x01
(0272)  CS-0x07A  0x08433         || 				BRNE end_move_ship
(0273)                            || 			
(0274)  CS-0x07B  0x37F02         || 				MOV R31, 0x02
(0275)                            ||  
(0276)  CS-0x07C  0x08491         || 				call clear_ship
(0277)  CS-0x07D  0x3790C         || 				MOV R25, SHIP_X_LOC
(0278)  CS-0x07E  0x36303         || 				MOV R3, 0x03
(0279)                            || 
(0280)                     0x07F  || move_ship_loop:
(0281)  CS-0x07F  0x049CA         || 				LD R9, (R25)
(0282)  CS-0x080  0x02958         || 				ADD R9, R11
(0283)  CS-0x081  0x049CB         || 				ST R9, (R25)
(0284)  CS-0x082  0x29901         || 				ADD R25, 0x01
(0285)  CS-0x083  0x2C301         || 				SUB R3, 0x01
(0286)  CS-0x084  0x083FB         || 				BRNE move_ship_loop
(0287)                            || 
(0288)  CS-0x085  0x08439         || 				call draw_ship
(0289)                     0x086  || end_move_ship:
(0290)  CS-0x086  0x18002         || 				ret
(0291)                            || 
(0292)                            || 
(0293)                            || ;---------------------------------------------------------------------
(0294)                            || ;							Draw Ship
(0295)                            || ;---------------------------------------------------------------------
(0296)                     0x087  || draw_ship:
(0297)  CS-0x087  0x3780A         || 			  	MOV R24, SHIP_Y_LOC
(0298)  CS-0x088  0x3790C         || 				MOV R25, SHIP_X_LOC
(0299)  CS-0x089  0x366E3         || 				MOV R6, SHIP_COLOR
(0300)  CS-0x08A  0x36303         || 				MOV R3, 0x03
(0301)                            || 
(0302)                     0x08B  || draw_ship_loop:
(0303)  CS-0x08B  0x044C2         || 				LD R4, (R24)
(0304)  CS-0x08C  0x045CA         || 				LD R5, (R25)
(0305)  CS-0x08D  0x08579         || 				call draw_dot
(0306)                            || 
(0307)  CS-0x08E  0x29901         || 				ADD R25, 0x01
(0308)  CS-0x08F  0x2C301         || 				SUB R3, 0x01
(0309)  CS-0x090  0x0845B         || 				BRNE draw_ship_loop
(0310)                            || 				
(0311)  CS-0x091  0x18002         || 				ret
(0312)                            || 
(0313)                            || ;---------------------------------------------------------------------
(0314)                            || ;							Clear Ship
(0315)                            || ;---------------------------------------------------------------------
(0316)                            || 
(0317)                     0x092  || clear_ship: 
(0318)  CS-0x092  0x3780A         || 				MOV R24, SHIP_Y_LOC
(0319)  CS-0x093  0x3790C         || 				MOV R25, SHIP_X_LOC
(0320)  CS-0x094  0x36600         || 				MOV R6, 0x00
(0321)                            || 
(0322)  CS-0x095  0x36303         || 				MOV R3, 0x03
(0323)                            || 
(0324)                     0x096  || clear_ship_loop:
(0325)  CS-0x096  0x044C2         || 				LD R4, (R24)
(0326)  CS-0x097  0x045CA         || 				LD R5, (R25)
(0327)  CS-0x098  0x08579         || 				call draw_dot
(0328)                            || 
(0329)  CS-0x099  0x29901         || 				ADD R25, 0x01
(0330)  CS-0x09A  0x2C301         || 				SUB R3, 0x01
(0331)  CS-0x09B  0x084B3         || 				BRNE clear_ship_loop
(0332)                            || 				
(0333)  CS-0x09C  0x18002         || 				ret
(0334)                            || 
(0335)                            || ;---------------------------------------------------------------------
(0336)                            || ;							Reset Ship
(0337)                            || ;---------------------------------------------------------------------
(0338)                            || 
(0339)                     0x09D  || reset_ship: 
(0340)  CS-0x09D  0x36000         || 				MOV R0, 0x00	
(0341)  CS-0x09E  0x3780C         || 				MOV R24, SHIP_X_LOC
(0342)  CS-0x09F  0x3A00A         || 				ST R0, SHIP_Y_LOC
(0343)  CS-0x0A0  0x36303         || 				MOV R3, 0x03
(0344)                            || 
(0345)                     0x0A1  || reset_ship_loop:
(0346)  CS-0x0A1  0x040C3         || 				ST R0, (R24)
(0347)  CS-0x0A2  0x29801         || 				ADD R24, 0x01
(0348)  CS-0x0A3  0x28001         || 				ADD R0, 0x01
(0349)  CS-0x0A4  0x2C301         || 				SUB R3, 0x01
(0350)  CS-0x0A5  0x0850B         || 				BRNE reset_ship_loop
(0351)                            || 				
(0352)  CS-0x0A6  0x18002         || 				ret
(0353)                            || 
(0354)                            || ;---------------------------------------------------------------------
(0355)                            || ;							Reset Bullets
(0356)                            || ;---------------------------------------------------------------------
(0357)                            || 
(0358)                     0x0A7  || reset_bullets:  
(0359)  CS-0x0A7  0x360FF         || 				MOV R0, 0xFF
(0360)  CS-0x0A8  0x37820         || 				MOV R24, SHIP_BULLETS_LOC
(0361)                            || 
(0362)                     0x0A9  || reset_bullets_loop:
(0363)  CS-0x0A9  0x3184A         || 				CMP R24, BULLETS_END_LOC
(0364)  CS-0x0AA  0x08572         || 				BREQ end_reset_bullets
(0365)                            || 				
(0366)  CS-0x0AB  0x040C3         || 				ST R0, (R24)
(0367)  CS-0x0AC  0x29801         || 				ADD R24, 0x01
(0368)  CS-0x0AD  0x08548         || 				BRN reset_bullets_loop
(0369)                            || 				
(0370)                     0x0AE  || end_reset_bullets:
(0371)  CS-0x0AE  0x18002         || 				ret
(0372)                            || 
(0373)                            || 
(0374)                            || ;---------------------------------------------------------------------
(0375)                            || ;							Draw Dot
(0376)                            || ;---------------------------------------------------------------------
(0377)                            || 
(0378)                     0x0AF  || draw_dot: 
(0379)  CS-0x0AF  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0380)  CS-0x0B0  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0381)                            || 
(0382)  CS-0x0B1  0x34591  0x0B1  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0383)  CS-0x0B2  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0384)  CS-0x0B3  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0385)  CS-0x0B4  0x18002         ||         RET
(0386)                            || 	   
(0387)                            || 
(0388)                            || ;---------------------------------------------------------------------
(0389)                            || ;							Done
(0390)                            || ;
(0391)                            || ; 	Don't do anything anymore
(0392)                            || ;---------------------------------------------------------------------
(0393)                            || 
(0394)  CS-0x0B5  0x085A8  0x0B5  || DONE:        BRN DONE
(0395)                            || 
(0396)                            || ;---------------------------------------------------------------------
(0397)                            || ;							Lose
(0398)                            || ;
(0399)                            || ; 	Turn the screen red
(0400)                            || ;---------------------------------------------------------------------
(0401)                            || 
(0402)                     0x0B6  || lose:     
(0403)  CS-0x0B6  0x08639         || 		call pause
(0404)  CS-0x0B7  0x36827         || 		MOV R8, 0x27
(0405)  CS-0x0B8  0x3671D         || 		MOV R7, END_COL
(0406)  CS-0x0B9  0x28801         || 		ADD R8, 0x01
(0407)  CS-0x0BA  0x366E0         || 		MOV R6, 0xE0 ;RED SCREEN
(0408)                            || 
(0409)                     0x0BB  || lose_loop:
(0410)                            || 
(0411)  CS-0x0BB  0x04439         || 		MOV R4, R7
(0412)  CS-0x0BC  0x04541         || 		MOV R5, R8
(0413)  CS-0x0BD  0x08579         || 		call draw_dot
(0414)  CS-0x0BE  0x2C801         || 		SUB R8, 0x01
(0415)  CS-0x0BF  0x085DB         || 		BRNE lose_loop
(0416)                            || 
(0417)  CS-0x0C0  0x04439         || 		MOV R4, R7
(0418)  CS-0x0C1  0x04541         || 		MOV R5, R8
(0419)  CS-0x0C2  0x08579         || 		call draw_dot
(0420)  CS-0x0C3  0x2C701         || 		SUB R7, 0x01
(0421)  CS-0x0C4  0x307FF         || 		CMP R7, 0xFF
(0422)  CS-0x0C5  0x085DB         || 		BRNE lose_loop
(0423)  CS-0x0C6  0x085A8         || 		brn done
(0424)                            || 
(0425)                            || 
(0426)                            || 
(0427)                            || ;---------------------------------------------------------------------
(0428)                            || ;							Pause
(0429)                            || ;
(0430)                            || ;	a long pause
(0431)                            || ;---------------------------------------------------------------------
(0432)                            || 
(0433)  CS-0x0C7  0x3712F  0x0C7  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0434)  CS-0x0C8  0x2D101  0x0C8  || outside_for0: 	SUB     R17, 0x01
(0435)                            || 
(0436)  CS-0x0C9  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0437)  CS-0x0CA  0x2D201  0x0CA  || middle_for0:  	SUB     R18, 0x01
(0438)                            ||              
(0439)  CS-0x0CB  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0440)  CS-0x0CC  0x2D301  0x0CC  || inside_for0:  	SUB     R19, 0x01
(0441)  CS-0x0CD  0x08663         ||              	BRNE    inside_for0
(0442)                            ||              
(0443)  CS-0x0CE  0x23200         ||              	OR      R18, 0x00              
(0444)  CS-0x0CF  0x08653         ||              	BRNE    middle_for0
(0445)                            ||              
(0446)  CS-0x0D0  0x23100         ||              	OR      R17, 0x00               
(0447)  CS-0x0D1  0x08643         ||              	BRNE    outside_for0
(0448)  CS-0x0D2  0x18002         || 				ret
(0449)                            || 
(0450)                            || ;---------------------------------------------------------------------
(0451)                            || ;							Pause2
(0452)                            || ;
(0453)                            || ;	a shorter pause
(0454)                            || ;---------------------------------------------------------------------
(0455)                            || 
(0456)                            || 
(0457)  CS-0x0D3  0x3711F  0x0D3  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0458)  CS-0x0D4  0x2D101  0x0D4  || outside_for: 	SUB     R17, 0x01
(0459)                            || 
(0460)  CS-0x0D5  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0461)  CS-0x0D6  0x2D201  0x0D6  || middle_for:  	SUB     R18, 0x01
(0462)                            ||              
(0463)  CS-0x0D7  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0464)  CS-0x0D8  0x2D301  0x0D8  || inside_for:  	SUB     R19, 0x01
(0465)  CS-0x0D9  0x086C3         ||              	BRNE    inside_for
(0466)                            ||              
(0467)  CS-0x0DA  0x23200         ||              	or     R18, 0x00              
(0468)  CS-0x0DB  0x086B3         ||              	BRNE    middle_for
(0469)                            ||              
(0470)  CS-0x0DC  0x31100         ||              	CMP      R17, 0x00               
(0471)  CS-0x0DD  0x086A3         ||              	BRNE    outside_for
(0472)  CS-0x0DE  0x18002         || 				ret
(0473)                            || 
(0474)                            || ;---------------------------------------------------------------------
(0475)                            || ;							INTERRUPTS
(0476)                            || ;---------------------------------------------------------------------
(0477)                            || 
(0478)                            || 
(0479)                     0x0DF  || ISR: 
(0480)                            || 
(0481)  CS-0x0DF  0x33420         ||    	IN R20, INTERRUPT_ID
(0482)  CS-0x0E0  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0483)                            || 	
(0484)  CS-0x0E1  0x31400         || 	CMP R20, 0x00
(0485)  CS-0x0E2  0x08752         ||     breq testing0
(0486)                            || 
(0487)  CS-0x0E3  0x11401         ||    LSR R20
(0488)  CS-0x0E4  0x0A8C0         ||    BRCS moveRight
(0489)                            || 
(0490)  CS-0x0E5  0x11401         ||    LSR R20
(0491)  CS-0x0E6  0x0A790         ||    BRCS shoot   
(0492)                            || 
(0493)  CS-0x0E7  0x11401         ||    LSR R20  
(0494)  CS-0x0E8  0x088AA         ||    BREQ moveLeft
(0495)                            || 
(0496)  CS-0x0E9  0x088D8         ||    brn ISR_END
(0497)                            || 
(0498)                     0x0EA  || testing0: 
(0499)  CS-0x0EA  0x044D9         ||    MOV  R4, R27   ;y coordin
(0500)  CS-0x0EB  0x045E1         ||    MOV  R5, R28   ;x coordin
(0501)                            || 
(0502)  CS-0x0EC  0x36603         || 	mov r6, 0x03
(0503)  CS-0x0ED  0x08579         ||     call draw_dot
(0504)  CS-0x0EE  0x08639         || 	call pause
(0505)  CS-0x0EF  0x366FF         || 	mov r6, 0xff
(0506)  CS-0x0F0  0x08579         || 	call draw_dot
(0507)  CS-0x0F1  0x088D8         ||     brn isr_end
(0508)                            || 
(0509)                     0x0F2  || shoot: 
(0510)                            ||    
(0511)  CS-0x0F2  0x31001         || 	CMP R16, 0x01
(0512)  CS-0x0F3  0x0880A         || 	BREQ second_bullet
(0513)                            || 
(0514)  CS-0x0F4  0x04469         || 	MOV R4, R13
(0515)  CS-0x0F5  0x04561         || 	MOV R5, R12
(0516)  CS-0x0F6  0x36600         || 	MOV R6, 0x00
(0517)  CS-0x0F7  0x08579         || 	call draw_dot
(0518)                            || 
(0519)  CS-0x0F8  0x04DD9         ||    Mov R13, R27
(0520)  CS-0x0F9  0x2CD01         ||    SUB R13, 0x01
(0521)                            || 
(0522)  CS-0x0FA  0x04CE1         ||    MOV R12, R28
(0523)                            || 
(0524)  CS-0x0FB  0x04469         ||    MOV R4, R13
(0525)  CS-0x0FC  0x04561         ||    MOV R5, R12
(0526)  CS-0x0FD  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0527)  CS-0x0FE  0x08579         ||    call draw_dot
(0528)                            || 
(0529)  CS-0x0FF  0x29001         ||    ADD R16, 0x01
(0530)                            ||    
(0531)  CS-0x100  0x08868         ||    BRN animation
(0532)                            || 
(0533)                     0x101  || second_bullet:		   
(0534)  CS-0x101  0x04479         || 	MOV R4, R15
(0535)  CS-0x102  0x04571         || 	MOV R5, R14
(0536)  CS-0x103  0x36600         || 	MOV R6, 0x00
(0537)  CS-0x104  0x08579         || 	call draw_dot
(0538)                            || 
(0539)  CS-0x105  0x04FD9         || 	MOV R15, R27
(0540)  CS-0x106  0x2CF01         || 	SUB R15, 0x01
(0541)                            || 
(0542)  CS-0x107  0x04EE1         || 	MOV R14, R28	
(0543)                            || 
(0544)  CS-0x108  0x04479         ||    MOV R4, R15
(0545)  CS-0x109  0x04571         ||    MOV R5, R14
(0546)  CS-0x10A  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0547)  CS-0x10B  0x08579         ||    call draw_dot
(0548)                            || 
(0549)  CS-0x10C  0x2D001         ||    SUB R16, 0x01
(0550)                            || 
(0551)                     0x10D  || animation:
(0552)  CS-0x10D  0x044D9         ||    MOV  R4, R27   ;y coordin
(0553)  CS-0x10E  0x045E1         ||    MOV  R5, R28   ;x coordin
(0554)                            || 
(0555)  CS-0x10F  0x366E0         || 	  mov R6, 0xE0
(0556)  CS-0x110  0x08579         || 	  call draw_dot
(0557)  CS-0x111  0x08699         ||       call pause2
(0558)  CS-0x112  0x366FF         || 	  mov R6, 0xFF
(0559)  CS-0x113  0x08579         ||       call draw_dot
(0560)  CS-0x114  0x088D8         || 	  brn ISR_END
(0561)                            || 
(0562)                     0x115  || moveLeft:
(0563)  CS-0x115  0x36CFF         ||     MOV R12, 0xFF
(0564)  CS-0x116  0x08251         || 	call move_player
(0565)                            || 
(0566)  CS-0x117  0x088D8         || 	brn ISR_END
(0567)                            || 
(0568)                     0x118  || moveRight:
(0569)  CS-0x118  0x36C01         || 	MOV R12, 0x01
(0570)                            || 	
(0571)  CS-0x119  0x08251         || 	call move_player
(0572)                            || 
(0573)  CS-0x11A  0x088D8         || 	brn ISR_END
(0574)                     0x11B  || ISR_END:
(0575)  CS-0x11B  0x1A003         || 		RETIE
(0576)                            || 
(0577)                            || 
(0578)                            || ;---------------------------------------------------------------------
(0579)                            || ;							INTERRUPT VECTOR
(0580)                            || ;---------------------------------------------------------------------
(0581)                            || 
(0582)                            || .CSEG
(0583)                       1023  || .ORG 0x3FF
(0584)  CS-0x3FF  0x086F8  0x3FF  || VECTOR:      BRN ISR
(0585)                            || 





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
ANIMATION      0x10D   (0551)  ||  0531 
CLEAR_PLAYER   0x062   (0221)  ||  0180 
CLEAR_PLAYER_LOOP 0x066   (0228)  ||  0234 
CLEAR_SHIP     0x092   (0317)  ||  0247 0276 
CLEAR_SHIP_LOOP 0x096   (0324)  ||  0331 
DD_OUT         0x0B1   (0382)  ||  
DONE           0x0B5   (0394)  ||  0394 0423 
DOWN_SHIP      0x06C   (0246)  ||  0119 
DRAW_DOT       0x0AF   (0378)  ||  0080 0086 0166 0205 0230 0305 0327 0413 0419 0503 
                               ||  0506 0517 0527 0537 0547 0556 0559 
DRAW_PLAYER    0x040   (0158)  ||  0103 0212 
DRAW_PLAYER_LOOP 0x044   (0164)  ||  0170 
DRAW_SHIP      0x087   (0296)  ||  0104 0265 0288 
DRAW_SHIP_LOOP 0x08B   (0302)  ||  0309 
END_DOWN_SHIP  0x077   (0264)  ||  0260 
END_MOVE_PLAYER 0x061   (0214)  ||  0210 
END_MOVE_SHIP  0x086   (0289)  ||  0272 
END_RESET_BULLETS 0x0AE   (0370)  ||  0364 
INSIDE_FOR     0x0D8   (0464)  ||  0465 
INSIDE_FOR0    0x0CC   (0440)  ||  0441 
ISR            0x0DF   (0479)  ||  0584 
ISR_END        0x11B   (0574)  ||  0496 0507 0560 0566 0573 
LOSE           0x0B6   (0402)  ||  0252 
LOSE_LOOP      0x0BB   (0409)  ||  0415 0422 
MIDDLE_FOR     0x0D6   (0461)  ||  0468 
MIDDLE_FOR0    0x0CA   (0437)  ||  0444 
MOVE           0x034   (0122)  ||  0116 
MOVELEFT       0x115   (0562)  ||  0494 
MOVERIGHT      0x118   (0568)  ||  0488 
MOVE_PLAYER    0x04A   (0179)  ||  0564 0571 
MOVE_PLAYER_LOOP 0x057   (0200)  ||  0193 0209 
MOVE_SHIP      0x079   (0270)  ||  0123 
MOVE_SHIP_LOOP 0x07F   (0280)  ||  0286 
OUTSIDE_FOR    0x0D4   (0458)  ||  0471 
OUTSIDE_FOR0   0x0C8   (0434)  ||  0447 
PAUSE          0x0C7   (0433)  ||  0102 0403 0504 
PAUSE2         0x0D3   (0457)  ||  0113 0557 
RESET          0x019   (0072)  ||  
RESET_BULLETS  0x0A7   (0358)  ||  0094 
RESET_BULLETS_LOOP 0x0A9   (0362)  ||  0368 
RESET_LOOP     0x01C   (0077)  ||  0082 0090 
RESET_PLAYER   0x037   (0139)  ||  0092 
RESET_PLAYER_LOOP 0x03A   (0144)  ||  0149 
RESET_SHIP     0x09D   (0339)  ||  0093 
RESET_SHIP_LOOP 0x0A1   (0345)  ||  0350 
RE_DRAW_PLAYER 0x060   (0212)  ||  0194 0198 
SECOND_BULLET  0x101   (0533)  ||  0512 
SET_NEG        0x076   (0262)  ||  0257 
SHOOT          0x0F2   (0509)  ||  0491 
START          0x02E   (0112)  ||  0120 0125 
TESTING0       0x0EA   (0498)  ||  0485 
TEST_LEFT_PLAYER 0x055   (0196)  ||  0189 
TEST_RIGHT_PLAYER 0x052   (0191)  ||  
VECTOR         0x3FF   (0584)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BULLETS_END_LOC 0x04A   (0041)  ||  0363 
END_COL        0x01D   (0018)  ||  0074 0160 0183 0223 0251 0405 
END_ROW_PLAYER 0x025   (0017)  ||  0192 
END_ROW_SHIP   0x04A   (0016)  ||  0063 0118 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0439 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0463 
INTERRUPT_ID   0x020   (0043)  ||  0481 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0436 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0460 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0433 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0457 
PLAYER_BULLETS_LOC 0x040   (0040)  ||  
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0526 0546 
PLAYER_COLOR   0x0FF   (0025)  ||  0161 0184 
PLAYER_COLOR_LOC 0x00F   (0037)  ||  
PLAYER_X_LOC   0x010   (0036)  ||  0141 0159 0182 0222 
SHIP_BULLETS_LOC 0x020   (0039)  ||  0360 
SHIP_BULLET_COLOR 0x003   (0026)  ||  
SHIP_BULLET_RATE 0x012   (0029)  ||  0062 
SHIP_COLOR     0x0E3   (0019)  ||  0299 
SHIP_COLOR_LOC 0x00B   (0034)  ||  
SHIP_X_LOC     0x00C   (0032)  ||  0277 0298 0319 0341 
SHIP_Y_LOC     0x00A   (0033)  ||  0248 0254 0297 0318 0342 
SSEG_CNTR_ID   0x060   (0044)  ||  0059 
SSEG_VAL_ID    0x080   (0045)  ||  0482 
VGA_COLOR      0x092   (0006)  ||  0384 
VGA_HADD       0x090   (0004)  ||  0383 
VGA_LADD       0x091   (0005)  ||  0382 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
