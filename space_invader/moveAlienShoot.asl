

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
(0047)  CS-0x018  0x082B1         || 	    CALL clear_row
(0048)  CS-0x019  0x36828         || 		MOV R8, 0x28
(0049)  CS-0x01A  0x3671D         || 		MOV R7, 0x1D
(0050)  CS-0x01B  0x36600         || 		MOV R6, 0x00
(0051)                     0x01C  || reset_loop:
(0052)  CS-0x01C  0x04439         || 		MOV R4, R7
(0053)  CS-0x01D  0x04541         || 		MOV R5, R8
(0054)  CS-0x01E  0x08429         || 		call draw_dot
(0055)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0056)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0057)                            || 
(0058)  CS-0x021  0x2C701         || 		SUB R7, 0x01
(0059)  CS-0x022  0x307FF         || 		CMP R7, 0xFF
(0060)  CS-0x023  0x080E3         || 		BRNE reset_loop
(0061)                            || 	
(0062)  CS-0x024  0x08461         || 		call pause
(0063)                            || 
(0064)  CS-0x025  0x37B1D         ||    MOV  R27, END_COL
(0065)  CS-0x026  0x2DB01         || 	SUB R27, 0x01
(0066)  CS-0x027  0x37C14         ||    MOV  R28, 0x14
(0067)  CS-0x028  0x366FF         || 	MOV R6, 0xFF
(0068)  CS-0x029  0x044D9         || 	MOV R4, R27
(0069)  CS-0x02A  0x045E1         || 	MOV R5, R28
(0070)  CS-0x02B  0x08429         || 	call draw_dot
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
(0082)  CS-0x033  0x083B9         || 	CALL draw_ship
(0083)  CS-0x034  0x02858         || 	ADD R8, R11
(0084)  CS-0x035  0x2C301         || 	SUB R3, 0x01
(0085)  CS-0x036  0x0818B         || 	BRNE start
(0086)                            || 
(0087)  CS-0x037  0x08461         || call pause
(0088)                     0x038  || MAIN:       
(0089)  CS-0x038  0x04469         || 			MOV R4, R13
(0090)  CS-0x039  0x04561         || 			MOV R5, R12
(0091)  CS-0x03A  0x36600         || 			MOV R6, 0x00
(0092)  CS-0x03B  0x08429         || 			call draw_dot
(0093)                            || 
(0094)  CS-0x03C  0x30D00         || 			CMP R13, 0x00
(0095)  CS-0x03D  0x08212         || 			BREQ p_bullet_2
(0096)                            || 
(0097)  CS-0x03E  0x2CD01         || 			SUB R13, 0x01
(0098)  CS-0x03F  0x04469         || 			MOV R4, R13
(0099)  CS-0x040  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0100)  CS-0x041  0x08429         || 			call draw_dot
(0101)                            || 
(0102)                     0x042  || p_bullet_2:
(0103)  CS-0x042  0x04479         || 			MOV R4, R15
(0104)  CS-0x043  0x04571         || 			MOV R5, R14
(0105)  CS-0x044  0x36600         || 			MOV R6, 0x00
(0106)  CS-0x045  0x08429         || 			call draw_dot
(0107)                            || 
(0108)  CS-0x046  0x30F00         || 			CMP R15, 0x00
(0109)  CS-0x047  0x0826A         || 			BREQ main_ship
(0110)                            || 
(0111)  CS-0x048  0x2CF01         || 			SUB R15, 0x01
(0112)  CS-0x049  0x04571         || 			MOV R5, R14
(0113)  CS-0x04A  0x04479         || 			MOV R4, R15
(0114)  CS-0x04B  0x366E3         || 			MOV R6, SHIP_COLOR
(0115)  CS-0x04C  0x08429         || 			call draw_dot
(0116)                            || 								
(0117)                     0x04D  || main_ship:
(0118)  CS-0x04D  0x04439         ||             MOV  R4, R7   ;y coordin
(0119)  CS-0x04E  0x04541         || 			MOV  R5, R8   ;x coordin
(0120)  CS-0x04F  0x083B9         || 			call draw_ship  
(0121)  CS-0x050  0x08461  0x050  || main_pause:	call pause
(0122)                            || 			
(0123)                            || 
(0124)  CS-0x051  0x2CA01  0x051  || ret_pause:	SUB R10, 0x01
(0125)  CS-0x052  0x30A00         || 			CMP R10, 0x00
(0126)  CS-0x053  0x082DA         || 			BREQ col
(0127)                            || 
(0128)                            || 
(0129)  CS-0x054  0x02858  0x054  || end_main:	ADD R8, R11
(0130)  CS-0x055  0x081C0         || 			BRN MAIN
(0131)                            || 
(0132)                     0x056  || clear_row:
(0133)                            ||    
(0134)  CS-0x056  0x08521         ||    CALL clear_square
(0135)  CS-0x057  0x2C801         ||    SUB R8, 0x01
(0136)  CS-0x058  0x308FF         ||    CMP R8, 0xFF
(0137)  CS-0x059  0x082B3         ||    BRNE clear_row
(0138)  CS-0x05A  0x18002         ||    RET
(0139)                            || 
(0140)  CS-0x05B  0x28701  0x05B  || col:		ADD R7, 0x01
(0141)  CS-0x05C  0x36A24         || 			MOV R10, END_ROW_SHIP
(0142)  CS-0x05D  0x3071D         || 			CMP R7, END_COL
(0143)  CS-0x05E  0x0845A         || 			BREQ DONE
(0144)                            || 			
(0145)  CS-0x05F  0x30B01         || 			CMP R11, 0x01
(0146)  CS-0x060  0x08332         || 			BREQ set_neg
(0147)                            || 	
(0148)  CS-0x061  0x36B01         || 			MOV R11, 0x01
(0149)  CS-0x062  0x08359         || 			call clear_ship
(0150)  CS-0x063  0x36801         || 			MOV R8, 0x01
(0151)  CS-0x064  0x36303         || 			MOV R3, 0x03
(0152)  CS-0x065  0x08188         || 			BRN start
(0153)                            || 
(0154)  CS-0x066  0x36BFF  0x066  || set_neg:	MOV R11, 0xFF
(0155)  CS-0x067  0x08359         || 			CALL clear_ship
(0156)  CS-0x068  0x36827         || 			MOV R8, 0x27
(0157)  CS-0x069  0x36303         || 			MoV R3, 0x03
(0158)  CS-0x06A  0x08188         || 			brn start
(0159)                            || 
(0160)                     0x06B  || clear_ship:
(0161)  CS-0x06B  0x2C701         || 			SUB R7, 0x01
(0162)  CS-0x06C  0x36303         || 			MOV R3, 0x03
(0163)  CS-0x06D  0x36600         || 			MOV R6, 0x00
(0164)                     0x06E  || clear_loop: 
(0165)  CS-0x06E  0x04541         || 			MOV R5, R8
(0166)  CS-0x06F  0x04439         || 			MOV R4, R7
(0167)  CS-0x070  0x08429         || 			call draw_dot
(0168)  CS-0x071  0x02858         || 			ADD R8, R11
(0169)  CS-0x072  0x2C301         || 			SUB R3, 0x01
(0170)  CS-0x073  0x30303         || 			CMP R3, 0x03
(0171)  CS-0x074  0x08373         || 			BRNE clear_loop
(0172)                            || 						
(0173)  CS-0x075  0x28701         || 			ADD R7, 0x01
(0174)  CS-0x076  0x18002         || 			ret
(0175)                            || 
(0176)                     0x077  || draw_ship:
(0177)  CS-0x077  0x04541         || 			MOV R5, R8
(0178)  CS-0x078  0x04439         || 			MOV R4, R7
(0179)  CS-0x079  0x36600         || 			MOV R6, 0x00
(0180)                            || 
(0181)                            || 
(0182)  CS-0x07A  0x30BFF         || 			CMP R11, 0xFF
(0183)  CS-0x07B  0x083F2         || 			BREQ draw_neg
(0184)                            || 
(0185)  CS-0x07C  0x2C503         || 			SUB R5, 0x03
(0186)  CS-0x07D  0x083F8         || 			brn rest
(0187)                            || 
(0188)  CS-0x07E  0x28503  0x07E  || draw_neg:	ADD R5, 0x03
(0189)                            || 
(0190)  CS-0x07F  0x08429  0x07F  || rest:		call draw_dot
(0191)                            || 
(0192)  CS-0x080  0x04541         || 			MOV R5, R8
(0193)  CS-0x081  0x04439         || 			MOV R4, R7
(0194)  CS-0x082  0x366E3         || 			MOV R6, SHIP_COLOR
(0195)  CS-0x083  0x08429         || 			call draw_dot
(0196)  CS-0x084  0x18002         || 			ret
(0197)                            || 
(0198)                     0x085  || draw_dot: 
(0199)  CS-0x085  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0200)  CS-0x086  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0201)                            || 
(0202)  CS-0x087  0x34591  0x087  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0203)  CS-0x088  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0204)  CS-0x089  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0205)  CS-0x08A  0x18002         ||         RET
(0206)                            || 	   
(0207)  CS-0x08B  0x08458  0x08B  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0208)                            || 
(0209)                            || 
(0210)  CS-0x08C  0x3712F  0x08C  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0211)  CS-0x08D  0x2D101  0x08D  || outside_for0: 	SUB     R17, 0x01
(0212)                            || 
(0213)  CS-0x08E  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0214)  CS-0x08F  0x2D201  0x08F  || middle_for0:  	SUB     R18, 0x01
(0215)                            ||              
(0216)  CS-0x090  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0217)  CS-0x091  0x2D301  0x091  || inside_for0:  	SUB     R19, 0x01
(0218)  CS-0x092  0x0848B         ||              	BRNE    inside_for0
(0219)                            ||              
(0220)  CS-0x093  0x23200         ||              	OR      R18, 0x00              
(0221)  CS-0x094  0x0847B         ||              	BRNE    middle_for0
(0222)                            ||              
(0223)  CS-0x095  0x23100         ||              	OR      R17, 0x00               
(0224)  CS-0x096  0x0846B         ||              	BRNE    outside_for0
(0225)  CS-0x097  0x18002         || 				ret
(0226)                            || 
(0227)  CS-0x098  0x3711F  0x098  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
(0228)  CS-0x099  0x2D101  0x099  || outside_for: 	SUB     R17, 0x01
(0229)                            || 
(0230)  CS-0x09A  0x3721F         ||              	MOV     R18, MIDDLE_FOR_COUNT2   
(0231)  CS-0x09B  0x2D201  0x09B  || middle_for:  	SUB     R18, 0x01
(0232)                            ||              
(0233)  CS-0x09C  0x3731F         ||              	MOV     R19, INSIDE_FOR_COUNT2   
(0234)  CS-0x09D  0x2D301  0x09D  || inside_for:  	SUB     R19, 0x01
(0235)  CS-0x09E  0x084EB         ||              	BRNE    inside_for
(0236)                            ||              
(0237)  CS-0x09F  0x23200         ||              	or     R18, 0x00              
(0238)  CS-0x0A0  0x084DB         ||              	BRNE    middle_for
(0239)                            ||              
(0240)  CS-0x0A1  0x31100         ||              	CMP      R17, 0x00               
(0241)  CS-0x0A2  0x084CB         ||              	BRNE    outside_for
(0242)  CS-0x0A3  0x18002         || 				ret
(0243)                     0x0A4  || clear_square:
(0244)                            || 
(0245)  CS-0x0A4  0x044D9         ||    MOV  R4, R27   ;y coordin
(0246)  CS-0x0A5  0x045E1         ||    MOV  R5, R28   ;x coordin
(0247)  CS-0x0A6  0x36600         ||    MOV  R6, 0x00
(0248)  CS-0x0A7  0x08429         ||    CALL draw_dot   ;clears dot at the origin
(0249)  CS-0x0A8  0x18002         ||    RET
(0250)                            || 
(0251)                     0x0A9  || ISR: 
(0252)  CS-0x0A9  0x33420         ||    	IN R20, INTERRUPT_ID
(0253)  CS-0x0AA  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0254)                            || 
(0255)  CS-0x0AB  0x31400         || 	cmp R20, 0x00
(0256)  CS-0x0AC  0x085B2         ||     breq testing0
(0257)                            || 
(0258)  CS-0x0AD  0x31403         || 	CMP R20, 0x03
(0259)  CS-0x0AE  0x085F2         || 	breq testing5
(0260)                            || 
(0261)  CS-0x0AF  0x31405         ||    CMP R20, 0x05
(0262)  CS-0x0B0  0x08632         ||    BREQ shoot
(0263)                            || 
(0264)  CS-0x0B1  0x31402         ||    CMP R20, 0x02
(0265)  CS-0x0B2  0x0874A         ||    BREQ moveLeft   
(0266)                            || 
(0267)  CS-0x0B3  0x31401         ||    CMP R20, 0x01  
(0268)  CS-0x0B4  0x08792         ||    BREQ moveRight
(0269)                            || 
(0270)  CS-0x0B5  0x087D8         ||    brn ISR_END
(0271)                            || 
(0272)                     0x0B6  || testing0: 
(0273)  CS-0x0B6  0x044D9         ||    MOV  R4, R27   ;y coordin
(0274)  CS-0x0B7  0x045E1         ||    MOV  R5, R28   ;x coordin
(0275)                            || 
(0276)  CS-0x0B8  0x36603         || 	mov r6, 0x03
(0277)  CS-0x0B9  0x08429         ||     call draw_dot
(0278)  CS-0x0BA  0x08461         || 	call pause
(0279)  CS-0x0BB  0x366FF         || 	mov r6, 0xff
(0280)  CS-0x0BC  0x08429         || 	call draw_dot
(0281)  CS-0x0BD  0x087D8         ||     brn isr_end
(0282)                            || 
(0283)                     0x0BE  || testing5: 
(0284)  CS-0x0BE  0x044D9         ||    MOV  R4, R27   ;y coordin
(0285)  CS-0x0BF  0x045E1         ||    MOV  R5, R28   ;x coordin
(0286)                            || 
(0287)  CS-0x0C0  0x3661C         || 	mov r6, 0x1c
(0288)  CS-0x0C1  0x08429         ||     call draw_dot
(0289)  CS-0x0C2  0x08461         || 	call pause
(0290)  CS-0x0C3  0x366FF         || 	mov r6, 0xff
(0291)  CS-0x0C4  0x08429         || 	call draw_dot
(0292)  CS-0x0C5  0x087D8         ||     brn isr_end
(0293)                            || 
(0294)                     0x0C6  || shoot: 
(0295)                            ||    
(0296)  CS-0x0C6  0x31001         || 	CMP R16, 0x01
(0297)  CS-0x0C7  0x086AA         || 	BREQ second_bullet
(0298)                            || 
(0299)  CS-0x0C8  0x04469         || 	MOV R4, R13
(0300)  CS-0x0C9  0x04561         || 	MOV R5, R12
(0301)  CS-0x0CA  0x36600         || 	MOV R6, 0x00
(0302)  CS-0x0CB  0x08429         || 	call draw_dot
(0303)                            || 
(0304)  CS-0x0CC  0x04DD9         ||    Mov R13, R27
(0305)  CS-0x0CD  0x2CD01         ||    SUB R13, 0x01
(0306)                            || 
(0307)  CS-0x0CE  0x04CE1         ||    MOV R12, R28
(0308)                            || 
(0309)  CS-0x0CF  0x04469         ||    MOV R4, R13
(0310)  CS-0x0D0  0x04561         ||    MOV R5, R12
(0311)  CS-0x0D1  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0312)  CS-0x0D2  0x08429         ||    call draw_dot
(0313)                            || 
(0314)  CS-0x0D3  0x29001         ||    ADD R16, 0x01
(0315)                            ||    
(0316)  CS-0x0D4  0x08708         ||    BRN animation
(0317)                            || 
(0318)                     0x0D5  || second_bullet:		   
(0319)  CS-0x0D5  0x04479         || 	MOV R4, R15
(0320)  CS-0x0D6  0x04571         || 	MOV R5, R14
(0321)  CS-0x0D7  0x36600         || 	MOV R6, 0x00
(0322)  CS-0x0D8  0x08429         || 	call draw_dot
(0323)                            || 
(0324)  CS-0x0D9  0x04FD9         || 	MOV R15, R27
(0325)  CS-0x0DA  0x2CF01         || 	SUB R15, 0x01
(0326)                            || 
(0327)  CS-0x0DB  0x04EE1         || 	MOV R14, R28	
(0328)                            || 
(0329)  CS-0x0DC  0x04479         ||    MOV R4, R15
(0330)  CS-0x0DD  0x04571         ||    MOV R5, R14
(0331)  CS-0x0DE  0x366E3         ||    MOV R6, SHIP_COLOR
(0332)  CS-0x0DF  0x08429         ||    call draw_dot
(0333)                            || 
(0334)  CS-0x0E0  0x2D001         ||    SUB R16, 0x01
(0335)                            || 
(0336)                     0x0E1  || animation:
(0337)  CS-0x0E1  0x044D9         ||    MOV  R4, R27   ;y coordin
(0338)  CS-0x0E2  0x045E1         ||    MOV  R5, R28   ;x coordin
(0339)                            || 
(0340)  CS-0x0E3  0x366E0         || 	  mov R6, 0xE0
(0341)  CS-0x0E4  0x08429         || 	  call draw_dot
(0342)  CS-0x0E5  0x084C1         ||       call pause2
(0343)  CS-0x0E6  0x366FF         || 	  mov R6, 0xFF
(0344)  CS-0x0E7  0x08429         ||       call draw_dot
(0345)  CS-0x0E8  0x087D8         || 	  brn ISR_END
(0346)                            || 
(0347)                     0x0E9  || moveLeft:
(0348)  CS-0x0E9  0x31C01         || 	CMP R28, 0x01
(0349)  CS-0x0EA  0x087DA         || 	BREQ ISR_END
(0350)                            || 
(0351)  CS-0x0EB  0x08521         ||    CALL clear_square
(0352)                            ||    
(0353)  CS-0x0EC  0x2DC01         ||    SUB  R28, 0x01  
(0354)                            || 
(0355)  CS-0x0ED  0x044D9         ||    MOV  R4, R27   ;y coordin
(0356)  CS-0x0EE  0x045E1         ||    MOV  R5, R28   ;x coordin
(0357)  CS-0x0EF  0x366FF         ||    MOV  R6, 0xFF
(0358)  CS-0x0F0  0x08429         ||    CALL draw_dot   ;draw red square at origin
(0359)  CS-0x0F1  0x087D8         ||    brn ISR_END
(0360)                            || 
(0361)                     0x0F2  || moveRight:
(0362)  CS-0x0F2  0x31C27         || 	CMP R28, END_ROW_PLAYER
(0363)  CS-0x0F3  0x087DA         || 	BREQ ISR_END
(0364)                            || 
(0365)  CS-0x0F4  0x08521         ||    CALL clear_square
(0366)                            || 
(0367)                            ||    
(0368)  CS-0x0F5  0x29C01         ||    ADD  R28, 0x01  
(0369)                            || 
(0370)                            || 
(0371)  CS-0x0F6  0x044D9         ||    MOV  R4, R27   ;y coordin
(0372)  CS-0x0F7  0x045E1         ||    MOV  R5, R28   ;x coordin
(0373)  CS-0x0F8  0x366FF         ||    MOV  R6, 0xFF
(0374)  CS-0x0F9  0x08429         ||    CALL draw_dot   ;draw red square at origin
(0375)                            ||    
(0376)  CS-0x0FA  0x087D8         || 	brn ISR_END
(0377)                     0x0FB  || ISR_END:
(0378)  CS-0x0FB  0x1A003         || 		RETIE
(0379)                            || 
(0380)                            || .CSEG
(0381)                       1023  || .ORG 0x3FF
(0382)  CS-0x3FF  0x08548  0x3FF  || VECTOR:      BRN ISR
(0383)                            || 





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
ANIMATION      0x0E1   (0336)  ||  0316 
CLEAR_LOOP     0x06E   (0164)  ||  0171 
CLEAR_ROW      0x056   (0132)  ||  0047 0137 
CLEAR_SHIP     0x06B   (0160)  ||  0149 0155 
CLEAR_SQUARE   0x0A4   (0243)  ||  0134 0351 0365 
COL            0x05B   (0140)  ||  0126 
DD_OUT         0x087   (0202)  ||  
DONE           0x08B   (0207)  ||  0143 0207 
DRAW_DOT       0x085   (0198)  ||  0054 0070 0092 0100 0106 0115 0167 0190 0195 0248 
                               ||  0277 0280 0288 0291 0302 0312 0322 0332 0341 0344 
                               ||  0358 0374 
DRAW_NEG       0x07E   (0188)  ||  0183 
DRAW_SHIP      0x077   (0176)  ||  0082 0120 
END_MAIN       0x054   (0129)  ||  
INSIDE_FOR     0x09D   (0234)  ||  0235 
INSIDE_FOR0    0x091   (0217)  ||  0218 
ISR            0x0A9   (0251)  ||  0382 
ISR_END        0x0FB   (0377)  ||  0270 0281 0292 0345 0349 0359 0363 0376 
MAIN           0x038   (0088)  ||  0130 
MAIN_PAUSE     0x050   (0121)  ||  
MAIN_SHIP      0x04D   (0117)  ||  0109 
MIDDLE_FOR     0x09B   (0231)  ||  0238 
MIDDLE_FOR0    0x08F   (0214)  ||  0221 
MOVELEFT       0x0E9   (0347)  ||  0265 
MOVERIGHT      0x0F2   (0361)  ||  0268 
OUTSIDE_FOR    0x099   (0228)  ||  0241 
OUTSIDE_FOR0   0x08D   (0211)  ||  0224 
PAUSE          0x08C   (0210)  ||  0062 0087 0121 0278 0289 
PAUSE2         0x098   (0227)  ||  0342 
P_BULLET_2     0x042   (0102)  ||  0095 
RESET          0x018   (0046)  ||  
RESET_LOOP     0x01C   (0051)  ||  0056 0060 
REST           0x07F   (0190)  ||  0186 
RET_PAUSE      0x051   (0124)  ||  
SECOND_BULLET  0x0D5   (0318)  ||  0297 
SET_NEG        0x066   (0154)  ||  0146 
SHOOT          0x0C6   (0294)  ||  0262 
START          0x031   (0078)  ||  0085 0152 0158 
TESTING0       0x0B6   (0272)  ||  0256 
TESTING5       0x0BE   (0283)  ||  0259 
VECTOR         0x3FF   (0382)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0018)  ||  0064 0142 
END_ROW_PLAYER 0x027   (0017)  ||  0362 
END_ROW_SHIP   0x024   (0016)  ||  0074 0141 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0216 
INSIDE_FOR_COUNT2 0x01F   (0012)  ||  0233 
INTERRUPT_ID   0x020   (0027)  ||  0252 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0213 
MIDDLE_FOR_COUNT2 0x01F   (0013)  ||  0230 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0210 
OUTSIDE_FOR_COUNT2 0x01F   (0014)  ||  0227 
PLAYER_BULLET_COLOR 0x0FC   (0026)  ||  0099 0311 
SHIP_COLOR     0x0E3   (0019)  ||  0114 0194 0331 
SSEG_CNTR_ID   0x060   (0029)  ||  0039 
SSEG_VAL_ID    0x080   (0030)  ||  0253 
VGA_COLOR      0x092   (0006)  ||  0204 
VGA_HADD       0x090   (0004)  ||  0203 
VGA_LADD       0x091   (0005)  ||  0202 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
