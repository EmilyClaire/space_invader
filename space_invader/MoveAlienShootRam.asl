

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
(0070)  CS-0x01E  0x08451         || 		call draw_dot
(0071)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0072)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0073)                            || 
(0074)  CS-0x021  0x04439         || 		MOV R4, R7
(0075)  CS-0x022  0x04541         || 		MOV R5, R8
(0076)  CS-0x023  0x08451         || 		call draw_dot
(0077)  CS-0x024  0x36827         || 		MOV R8, END_ROW_PLAYER
(0078)  CS-0x025  0x2C701         || 		SUB R7, 0x01
(0079)  CS-0x026  0x307FF         || 		CMP R7, 0xFF
(0080)  CS-0x027  0x080E3         || 		BRNE reset_loop
(0081)                            || 
(0082)  CS-0x028  0x08179         || 		call reset_player
(0083)  CS-0x029  0x083C1         || 		call reset_ship
(0084)  CS-0x02A  0x08411         || 		call reset_bullets
(0085)                            || 	
(0086)  CS-0x02B  0x08489         || 		call pause
(0087)                            || 
(0088)  CS-0x02C  0x081C1         || 		call draw_player
(0089)  CS-0x02D  0x08311         || 		call draw_ship
(0090)                            || 
(0091)                     0x02E  || start:
(0092)                            || 
(0093)  CS-0x02E  0x08480         || 		brn done
(0094)                            || ;---------------------------------------------------------------------
(0095)                            || ;							Reset Player
(0096)                            || ;
(0097)                            || ;	Sets the player location to the middle of the bottom row
(0098)                            || ;	does not draw the player
(0099)                            || ;---------------------------------------------------------------------
(0100)                            || 
(0101)                     0x02F  || reset_player:
(0102)  CS-0x02F  0x36914         || 			MOV R9, 0x14
(0103)  CS-0x030  0x37D10         || 			MOV R29, PLAYER_X_LOC
(0104)  CS-0x031  0x36303         || 			MOV R3, 0x03
(0105)                            || 
(0106)                     0x032  || reset_player_loop:
(0107)  CS-0x032  0x049EB         || 			ST R9, (R29)
(0108)  CS-0x033  0x28901         || 			ADD R9, 0x01
(0109)  CS-0x034  0x29D01         || 			ADD R29, 0x01
(0110)  CS-0x035  0x2C301         || 			SUB R3, 0x01
(0111)  CS-0x036  0x08193         || 			BRNE reset_player_loop
(0112)                            || 
(0113)  CS-0x037  0x18002         || 			ret
(0114)                            || 
(0115)                            || 
(0116)                            || ;---------------------------------------------------------------------
(0117)                            || ;							Draw Player
(0118)                            || ;---------------------------------------------------------------------
(0119)                            || 
(0120)                     0x038  || draw_player:
(0121)  CS-0x038  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0122)  CS-0x039  0x3641D         || 				MOV R4,  END_COL
(0123)  CS-0x03A  0x366FF         || 				MOV R6, PLAYER_COLOR
(0124)  CS-0x03B  0x36303         || 				MOV R3, 0x03
(0125)                            || 
(0126)                     0x03C  || draw_player_loop:
(0127)  CS-0x03C  0x045CA         || 				LD R5, (R25)
(0128)  CS-0x03D  0x08451         || 				call draw_dot
(0129)                            || 
(0130)  CS-0x03E  0x29901         || 				ADD R25, 0x01
(0131)  CS-0x03F  0x2C301         || 				SUB R3, 0x01
(0132)  CS-0x040  0x081E3         || 				BRNE draw_player_loop
(0133)                            || 				
(0134)  CS-0x041  0x18002         || 				ret
(0135)                            || 
(0136)                            || 
(0137)                            || ;---------------------------------------------------------------------
(0138)                            || ;							Move Player
(0139)                            || ;---------------------------------------------------------------------
(0140)                            || 
(0141)                     0x042  || move_player:
(0142)  CS-0x042  0x082C1         || 				call clear_player
(0143)                            || 
(0144)  CS-0x043  0x37910         || 			  	MOV R25, PLAYER_X_LOC
(0145)  CS-0x044  0x3641D         || 				MOV R4,  END_COL
(0146)  CS-0x045  0x366FF         || 				MOV R6, PLAYER_COLOR
(0147)  CS-0x046  0x36303         || 				MOV R3, 0x03
(0148)                            || 
(0149)  CS-0x047  0x049CA         || 				LD R9, (R25)
(0150)  CS-0x048  0x30C01         || 				CMP R12, 0x01
(0151)  CS-0x049  0x0826B         || 				BRNE test_left_player
(0152)                            || 
(0153)                     0x04A  || test_right_player:
(0154)  CS-0x04A  0x30948         || 				CMP R9, END_ROW_SHIP
(0155)  CS-0x04B  0x0827B         || 				BRNE move_player_loop
(0156)  CS-0x04C  0x082B8         || 				brn end_move_player
(0157)                            || 
(0158)                     0x04D  || test_left_player:
(0159)  CS-0x04D  0x30900         || 				CMP R9, 0x00
(0160)  CS-0x04E  0x082BA         || 				BREQ end_move_player
(0161)                            || 				
(0162)                     0x04F  || move_player_loop:
(0163)  CS-0x04F  0x049CA         || 				LD R9, (R25)
(0164)  CS-0x050  0x02960         || 				ADD R9, R12
(0165)  CS-0x051  0x049CB         || 				ST R9, (R25)
(0166)  CS-0x052  0x04549         || 				MOV R5, R9
(0167)  CS-0x053  0x08451         || 				call draw_dot
(0168)                            || 
(0169)  CS-0x054  0x29901         || 				ADD R25, 0x01
(0170)  CS-0x055  0x2C301         || 				SUB R3, 0x01
(0171)  CS-0x056  0x0827B         || 				BRNE move_player_loop
(0172)                            || 				
(0173)                     0x057  || end_move_player:
(0174)  CS-0x057  0x18002         || 				ret
(0175)                            || 
(0176)                            || ;---------------------------------------------------------------------
(0177)                            || ;							Clear Player
(0178)                            || ;---------------------------------------------------------------------
(0179)                            || 
(0180)                     0x058  || clear_player: 
(0181)  CS-0x058  0x37910         || 				MOV R25, PLAYER_X_LOC
(0182)  CS-0x059  0x3641D         || 				MOV R4, END_COL
(0183)  CS-0x05A  0x36600         || 				MOV R6, 0x00
(0184)                            || 
(0185)  CS-0x05B  0x36303         || 				MOV R3, 0x03
(0186)                            || 
(0187)                     0x05C  || clear_player_loop:
(0188)  CS-0x05C  0x045CA         || 				LD R5, (R25)
(0189)  CS-0x05D  0x08451         || 				call draw_dot
(0190)                            || 
(0191)  CS-0x05E  0x29901         || 				ADD R25, 0x01
(0192)  CS-0x05F  0x2C301         || 				SUB R3, 0x01
(0193)  CS-0x060  0x082E3         || 				BRNE clear_player_loop
(0194)                            || 				
(0195)  CS-0x061  0x18002         || 				ret
(0196)                            || 
(0197)                            || ;---------------------------------------------------------------------
(0198)                            || ;							Draw Ship
(0199)                            || ;---------------------------------------------------------------------
(0200)                     0x062  || draw_ship:
(0201)  CS-0x062  0x3780A         || 			  	MOV R24, SHIP_Y_LOC
(0202)  CS-0x063  0x3790C         || 				MOV R25, SHIP_X_LOC
(0203)  CS-0x064  0x366E3         || 				MOV R6, SHIP_COLOR
(0204)  CS-0x065  0x36303         || 				MOV R3, 0x03
(0205)                            || 
(0206)                     0x066  || draw_ship_loop:
(0207)  CS-0x066  0x044C2         || 				LD R4, (R24)
(0208)  CS-0x067  0x045CA         || 				LD R5, (R25)
(0209)  CS-0x068  0x08451         || 				call draw_dot
(0210)                            || 
(0211)  CS-0x069  0x29901         || 				ADD R25, 0x01
(0212)  CS-0x06A  0x2C301         || 				SUB R3, 0x01
(0213)  CS-0x06B  0x08333         || 				BRNE draw_ship_loop
(0214)                            || 				
(0215)  CS-0x06C  0x18002         || 				ret
(0216)                            || 
(0217)                            || ;---------------------------------------------------------------------
(0218)                            || ;							Clear Ship
(0219)                            || ;---------------------------------------------------------------------
(0220)                            || 
(0221)                     0x06D  || clear_ship: 
(0222)  CS-0x06D  0x3780A         || 				MOV R24, SHIP_Y_LOC
(0223)  CS-0x06E  0x3790C         || 				MOV R25, SHIP_X_LOC
(0224)  CS-0x06F  0x36600         || 				MOV R6, 0x00
(0225)                            || 
(0226)  CS-0x070  0x36303         || 				MOV R3, 0x03
(0227)                            || 
(0228)                     0x071  || clear_ship_loop:
(0229)  CS-0x071  0x044C2         || 				LD R4, (R24)
(0230)  CS-0x072  0x045CA         || 				LD R5, (R25)
(0231)  CS-0x073  0x08451         || 				call draw_dot
(0232)                            || 
(0233)  CS-0x074  0x29901         || 				ADD R25, 0x01
(0234)  CS-0x075  0x2C301         || 				SUB R3, 0x01
(0235)  CS-0x076  0x0838B         || 				BRNE clear_ship_loop
(0236)                            || 				
(0237)  CS-0x077  0x18002         || 				ret
(0238)                            || 
(0239)                            || ;---------------------------------------------------------------------
(0240)                            || ;							Reset Ship
(0241)                            || ;---------------------------------------------------------------------
(0242)                            || 
(0243)                     0x078  || reset_ship: 
(0244)  CS-0x078  0x36000         || 				MOV R0, 0x00	
(0245)  CS-0x079  0x3780C         || 				MOV R24, SHIP_X_LOC
(0246)  CS-0x07A  0x3A00A         || 				ST R0, SHIP_Y_LOC
(0247)  CS-0x07B  0x36303         || 				MOV R3, 0x03
(0248)                            || 
(0249)                     0x07C  || reset_ship_loop:
(0250)  CS-0x07C  0x040C3         || 				ST R0, (R24)
(0251)  CS-0x07D  0x29801         || 				ADD R24, 0x01
(0252)  CS-0x07E  0x28001         || 				ADD R0, 0x01
(0253)  CS-0x07F  0x2C301         || 				SUB R3, 0x01
(0254)  CS-0x080  0x083E3         || 				BRNE reset_ship_loop
(0255)                            || 				
(0256)  CS-0x081  0x18002         || 				ret
(0257)                            || 
(0258)                            || ;---------------------------------------------------------------------
(0259)                            || ;							Reset Bullets
(0260)                            || ;---------------------------------------------------------------------
(0261)                            || 
(0262)                     0x082  || reset_bullets:  
(0263)  CS-0x082  0x360FF         || 				MOV R0, 0xFF
(0264)  CS-0x083  0x37820         || 				MOV R24, SHIP_BULLETS_LOC
(0265)                            || 
(0266)                     0x084  || reset_bullets_loop:
(0267)  CS-0x084  0x3184A         || 				CMP R24, BULLETS_END_LOC
(0268)  CS-0x085  0x0844A         || 				BREQ end_reset_bullets
(0269)                            || 				
(0270)  CS-0x086  0x040C3         || 				ST R0, (R24)
(0271)  CS-0x087  0x29801         || 				ADD R24, 0x01
(0272)  CS-0x088  0x08420         || 				BRN reset_bullets_loop
(0273)                            || 				
(0274)                     0x089  || end_reset_bullets:
(0275)  CS-0x089  0x18002         || 				ret
(0276)                            || 
(0277)                            || 
(0278)                            || ;---------------------------------------------------------------------
(0279)                            || ;							Draw Dot
(0280)                            || ;---------------------------------------------------------------------
(0281)                            || 
(0282)                     0x08A  || draw_dot: 
(0283)  CS-0x08A  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0284)  CS-0x08B  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0285)                            || 
(0286)  CS-0x08C  0x34591  0x08C  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0287)  CS-0x08D  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0288)  CS-0x08E  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0289)  CS-0x08F  0x18002         ||         RET
(0290)                            || 	   
(0291)                            || 
(0292)                            || ;---------------------------------------------------------------------
(0293)                            || ;							Done
(0294)                            || ;
(0295)                            || ; 	Don't do anything anymore
(0296)                            || ;---------------------------------------------------------------------
(0297)                            || 
(0298)  CS-0x090  0x08480  0x090  || DONE:        BRN DONE
(0299)                            || 
(0300)                            || 
(0301)                            || ;---------------------------------------------------------------------
(0302)                            || ;							Pause
(0303)                            || ;
(0304)                            || ;	a long pause
(0305)                            || ;---------------------------------------------------------------------
(0306)                            || 
(0307)  CS-0x091  0x3712F  0x091  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0308)  CS-0x092  0x2D101  0x092  || outside_for0: 	SUB     R17, 0x01
(0309)                            || 
(0310)  CS-0x093  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0311)  CS-0x094  0x2D201  0x094  || middle_for0:  	SUB     R18, 0x01
(0312)                            ||              
(0313)  CS-0x095  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0314)  CS-0x096  0x2D301  0x096  || inside_for0:  	SUB     R19, 0x01
(0315)  CS-0x097  0x084B3         ||              	BRNE    inside_for0
(0316)                            ||              
(0317)  CS-0x098  0x23200         ||              	OR      R18, 0x00              
(0318)  CS-0x099  0x084A3         ||              	BRNE    middle_for0
(0319)                            ||              
(0320)  CS-0x09A  0x23100         ||              	OR      R17, 0x00               
(0321)  CS-0x09B  0x08493         ||              	BRNE    outside_for0
(0322)  CS-0x09C  0x18002         || 				ret
(0323)                            || 
(0324)                            || ;---------------------------------------------------------------------
(0325)                            || ;							Pause2
(0326)                            || ;
(0327)                            || ;	a shorter pause
(0328)                            || ;---------------------------------------------------------------------
(0329)                            || 
(0330)                            || 
(0331)  CS-0x09D  0x3711F  0x09D  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0332)  CS-0x09E  0x2D101  0x09E  || outside_for: 	SUB     R17, 0x01
(0333)                            || 
(0334)  CS-0x09F  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0335)  CS-0x0A0  0x2D201  0x0A0  || middle_for:  	SUB     R18, 0x01
(0336)                            ||              
(0337)  CS-0x0A1  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0338)  CS-0x0A2  0x2D301  0x0A2  || inside_for:  	SUB     R19, 0x01
(0339)  CS-0x0A3  0x08513         ||              	BRNE    inside_for
(0340)                            ||              
(0341)  CS-0x0A4  0x23200         ||              	or     R18, 0x00              
(0342)  CS-0x0A5  0x08503         ||              	BRNE    middle_for
(0343)                            ||              
(0344)  CS-0x0A6  0x31100         ||              	CMP      R17, 0x00               
(0345)  CS-0x0A7  0x084F3         ||              	BRNE    outside_for
(0346)  CS-0x0A8  0x18002         || 				ret
(0347)                            || 
(0348)                            || 
(0349)                     0x0A9  || ISR: 
(0350)                            || 
(0351)  CS-0x0A9  0x33420         ||    	IN R20, INTERRUPT_ID
(0352)  CS-0x0AA  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0353)                            || 	
(0354)  CS-0x0AB  0x31400         || 	CMP R20, 0x00
(0355)  CS-0x0AC  0x085A2         ||     breq testing0
(0356)                            || 
(0357)  CS-0x0AD  0x11401         ||    LSR R20
(0358)  CS-0x0AE  0x0A708         ||    BRCS moveRight
(0359)                            || 
(0360)  CS-0x0AF  0x11401         ||    LSR R20
(0361)  CS-0x0B0  0x0A5E0         ||    BRCS shoot   
(0362)                            || 
(0363)  CS-0x0B1  0x11401         ||    LSR R20  
(0364)  CS-0x0B2  0x086FA         ||    BREQ moveLeft
(0365)                            || 
(0366)  CS-0x0B3  0x08718         ||    brn ISR_END
(0367)                            || 
(0368)                     0x0B4  || testing0: 
(0369)  CS-0x0B4  0x044D9         ||    MOV  R4, R27   ;y coordin
(0370)  CS-0x0B5  0x045E1         ||    MOV  R5, R28   ;x coordin
(0371)                            || 
(0372)  CS-0x0B6  0x36603         || 	mov r6, 0x03
(0373)  CS-0x0B7  0x08451         ||     call draw_dot
(0374)  CS-0x0B8  0x08489         || 	call pause
(0375)  CS-0x0B9  0x366FF         || 	mov r6, 0xff
(0376)  CS-0x0BA  0x08451         || 	call draw_dot
(0377)  CS-0x0BB  0x08718         ||     brn isr_end
(0378)                            || 
(0379)                     0x0BC  || shoot: 
(0380)                            ||    
(0381)  CS-0x0BC  0x31001         || 	CMP R16, 0x01
(0382)  CS-0x0BD  0x0865A         || 	BREQ second_bullet
(0383)                            || 
(0384)  CS-0x0BE  0x04469         || 	MOV R4, R13
(0385)  CS-0x0BF  0x04561         || 	MOV R5, R12
(0386)  CS-0x0C0  0x36600         || 	MOV R6, 0x00
(0387)  CS-0x0C1  0x08451         || 	call draw_dot
(0388)                            || 
(0389)  CS-0x0C2  0x04DD9         ||    Mov R13, R27
(0390)  CS-0x0C3  0x2CD01         ||    SUB R13, 0x01
(0391)                            || 
(0392)  CS-0x0C4  0x04CE1         ||    MOV R12, R28
(0393)                            || 
(0394)  CS-0x0C5  0x04469         ||    MOV R4, R13
(0395)  CS-0x0C6  0x04561         ||    MOV R5, R12
(0396)  CS-0x0C7  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0397)  CS-0x0C8  0x08451         ||    call draw_dot
(0398)                            || 
(0399)  CS-0x0C9  0x29001         ||    ADD R16, 0x01
(0400)                            ||    
(0401)  CS-0x0CA  0x086B8         ||    BRN animation
(0402)                            || 
(0403)                     0x0CB  || second_bullet:		   
(0404)  CS-0x0CB  0x04479         || 	MOV R4, R15
(0405)  CS-0x0CC  0x04571         || 	MOV R5, R14
(0406)  CS-0x0CD  0x36600         || 	MOV R6, 0x00
(0407)  CS-0x0CE  0x08451         || 	call draw_dot
(0408)                            || 
(0409)  CS-0x0CF  0x04FD9         || 	MOV R15, R27
(0410)  CS-0x0D0  0x2CF01         || 	SUB R15, 0x01
(0411)                            || 
(0412)  CS-0x0D1  0x04EE1         || 	MOV R14, R28	
(0413)                            || 
(0414)  CS-0x0D2  0x04479         ||    MOV R4, R15
(0415)  CS-0x0D3  0x04571         ||    MOV R5, R14
(0416)  CS-0x0D4  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0417)  CS-0x0D5  0x08451         ||    call draw_dot
(0418)                            || 
(0419)  CS-0x0D6  0x2D001         ||    SUB R16, 0x01
(0420)                            || 
(0421)                     0x0D7  || animation:
(0422)  CS-0x0D7  0x044D9         ||    MOV  R4, R27   ;y coordin
(0423)  CS-0x0D8  0x045E1         ||    MOV  R5, R28   ;x coordin
(0424)                            || 
(0425)  CS-0x0D9  0x366E0         || 	  mov R6, 0xE0
(0426)  CS-0x0DA  0x08451         || 	  call draw_dot
(0427)  CS-0x0DB  0x084E9         ||       call pause2
(0428)  CS-0x0DC  0x366FF         || 	  mov R6, 0xFF
(0429)  CS-0x0DD  0x08451         ||       call draw_dot
(0430)  CS-0x0DE  0x08718         || 	  brn ISR_END
(0431)                            || 
(0432)                     0x0DF  || moveLeft:
(0433)  CS-0x0DF  0x36CFF         ||     MOV R12, 0xFF
(0434)  CS-0x0E0  0x08718         || 	brn ISR_END
(0435)                            || 
(0436)                     0x0E1  || moveRight:
(0437)  CS-0x0E1  0x36C01         || 	MOV R12, 0x01
(0438)                            ||    
(0439)  CS-0x0E2  0x08718         || 	brn ISR_END
(0440)                     0x0E3  || ISR_END:
(0441)  CS-0x0E3  0x1A003         || 		RETIE
(0442)                            || 
(0443)                            || .CSEG
(0444)                       1023  || .ORG 0x3FF
(0445)  CS-0x3FF  0x08548  0x3FF  || VECTOR:      BRN ISR
(0446)                            || 





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
ANIMATION      0x0D7   (0421)  ||  0401 
CLEAR_PLAYER   0x058   (0180)  ||  0142 
CLEAR_PLAYER_LOOP 0x05C   (0187)  ||  0193 
CLEAR_SHIP     0x06D   (0221)  ||  
CLEAR_SHIP_LOOP 0x071   (0228)  ||  0235 
DD_OUT         0x08C   (0286)  ||  
DONE           0x090   (0298)  ||  0093 0298 
DRAW_DOT       0x08A   (0282)  ||  0070 0076 0128 0167 0189 0209 0231 0373 0376 0387 
                               ||  0397 0407 0417 0426 0429 
DRAW_PLAYER    0x038   (0120)  ||  0088 
DRAW_PLAYER_LOOP 0x03C   (0126)  ||  0132 
DRAW_SHIP      0x062   (0200)  ||  0089 
DRAW_SHIP_LOOP 0x066   (0206)  ||  0213 
END_MOVE_PLAYER 0x057   (0173)  ||  0156 0160 
END_RESET_BULLETS 0x089   (0274)  ||  0268 
INSIDE_FOR     0x0A2   (0338)  ||  0339 
INSIDE_FOR0    0x096   (0314)  ||  0315 
ISR            0x0A9   (0349)  ||  0445 
ISR_END        0x0E3   (0440)  ||  0366 0377 0430 0434 0439 
MIDDLE_FOR     0x0A0   (0335)  ||  0342 
MIDDLE_FOR0    0x094   (0311)  ||  0318 
MOVELEFT       0x0DF   (0432)  ||  0364 
MOVERIGHT      0x0E1   (0436)  ||  0358 
MOVE_PLAYER    0x042   (0141)  ||  
MOVE_PLAYER_LOOP 0x04F   (0162)  ||  0155 0171 
OUTSIDE_FOR    0x09E   (0332)  ||  0345 
OUTSIDE_FOR0   0x092   (0308)  ||  0321 
PAUSE          0x091   (0307)  ||  0086 0374 
PAUSE2         0x09D   (0331)  ||  0427 
RESET          0x019   (0062)  ||  
RESET_BULLETS  0x082   (0262)  ||  0084 
RESET_BULLETS_LOOP 0x084   (0266)  ||  0272 
RESET_LOOP     0x01C   (0067)  ||  0072 0080 
RESET_PLAYER   0x02F   (0101)  ||  0082 
RESET_PLAYER_LOOP 0x032   (0106)  ||  0111 
RESET_SHIP     0x078   (0243)  ||  0083 
RESET_SHIP_LOOP 0x07C   (0249)  ||  0254 
SECOND_BULLET  0x0CB   (0403)  ||  0382 
SHOOT          0x0BC   (0379)  ||  0361 
START          0x02E   (0091)  ||  
TESTING0       0x0B4   (0368)  ||  0355 
TEST_LEFT_PLAYER 0x04D   (0158)  ||  0151 
TEST_RIGHT_PLAYER 0x04A   (0153)  ||  
VECTOR         0x3FF   (0445)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BULLETS_END_LOC 0x04A   (0041)  ||  0267 
END_COL        0x01D   (0018)  ||  0064 0122 0145 0182 
END_ROW_PLAYER 0x027   (0017)  ||  0063 0077 
END_ROW_SHIP   0x048   (0016)  ||  0058 0154 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0313 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0337 
INTERRUPT_ID   0x020   (0043)  ||  0351 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0310 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0334 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0307 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0331 
PLAYER_BULLETS_LOC 0x040   (0040)  ||  
PLAYER_BULLET_COLOR 0x0FC   (0027)  ||  0396 0416 
PLAYER_COLOR   0x0FF   (0025)  ||  0123 0146 
PLAYER_COLOR_LOC 0x00F   (0037)  ||  
PLAYER_X_LOC   0x010   (0036)  ||  0103 0121 0144 0181 
SHIP_BULLETS_LOC 0x020   (0039)  ||  0264 
SHIP_BULLET_COLOR 0x003   (0026)  ||  
SHIP_BULLET_RATE 0x012   (0029)  ||  0057 
SHIP_COLOR     0x0E3   (0019)  ||  0203 
SHIP_COLOR_LOC 0x00B   (0034)  ||  
SHIP_X_LOC     0x00C   (0032)  ||  0202 0223 0245 
SHIP_Y_LOC     0x00A   (0033)  ||  0201 0222 0246 
SSEG_CNTR_ID   0x060   (0044)  ||  0054 
SSEG_VAL_ID    0x080   (0045)  ||  0352 
VGA_COLOR      0x092   (0006)  ||  0288 
VGA_HADD       0x090   (0004)  ||  0287 
VGA_LADD       0x091   (0005)  ||  0286 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
