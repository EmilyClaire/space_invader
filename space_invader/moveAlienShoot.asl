

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
(0012)                       037  || .equ END_ROW_SHIP = 0x25
(0013)                       039  || .equ END_ROW_PLAYER = 0x27
(0014)                       029  || .equ END_COL = 0x1D
(0015)                       227  || .equ SHIP_COLOR = 0xE3;0x03 ;blue
(0016)                            || 					   ;0xE0 ;red
(0017)                            || 					   ; 0x1C    ;green
(0018)                            || 					; 0xE3 ; pink
(0019)                            || 						;0xFC ; yellow
(0020)                            || 					;0x1F aqua
(0021)                            || 
(0022)                       252  || .equ PLAYER_BULLET_COLOR = 0xFC
(0023)                       032  || .EQU INTERRUPT_ID  = 0x20
(0024)                            || 
(0025)                       096  || .equ SSEG_CNTR_ID = 0x60
(0026)                       128  || .equ SSEG_VAL_ID  = 0x80
(0027)                            || 
(0028)                            || .CSEG
(0029)                       016  || .ORG 0x10
(0030)                            || 
(0031)  CS-0x010  0x1A000         ||    SEI
(0032)                            || 
(0033)                            || 
(0034)  CS-0x011  0x36281         || MOV R2, 0x81
(0035)  CS-0x012  0x34260         || OUT R2, SSEG_CNTR_ID
(0036)  CS-0x013  0x37000         || 	MOV R16, 0x00	
(0037)  CS-0x014  0x36C00         || 	MOV R12, 0x00
(0038)  CS-0x015  0x36D00         || 	MOV R13, 0x00
(0039)  CS-0x016  0x36E00         || 	MOV R14, 0x00
(0040)  CS-0x017  0x36F00         || 	MOV R15, 0x00
(0041)                            || 
(0042)                     0x018  || reset:
(0043)  CS-0x018  0x082B1         || 	    CALL clear_row
(0044)  CS-0x019  0x36828         || 		MOV R8, 0x28
(0045)  CS-0x01A  0x3671D         || 		MOV R7, 0x1D
(0046)  CS-0x01B  0x36600         || 		MOV R6, 0x00
(0047)                     0x01C  || reset_loop:
(0048)  CS-0x01C  0x04439         || 		MOV R4, R7
(0049)  CS-0x01D  0x04541         || 		MOV R5, R8
(0050)  CS-0x01E  0x08429         || 		call draw_dot
(0051)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0052)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0053)                            || 
(0054)  CS-0x021  0x2C701         || 		SUB R7, 0x01
(0055)  CS-0x022  0x307FF         || 		CMP R7, 0xFF
(0056)  CS-0x023  0x080E3         || 		BRNE reset_loop
(0057)                            || 	
(0058)  CS-0x024  0x08461         || 		call pause
(0059)                            || 
(0060)  CS-0x025  0x37B1D         ||    MOV  R27, END_COL
(0061)  CS-0x026  0x2DB01         || 	SUB R27, 0x01
(0062)  CS-0x027  0x37C14         ||    MOV  R28, 0x14
(0063)  CS-0x028  0x366FF         || 	MOV R6, 0xFF
(0064)  CS-0x029  0x044D9         || 	MOV R4, R27
(0065)  CS-0x02A  0x045E1         || 	MOV R5, R28
(0066)  CS-0x02B  0x08429         || 	call draw_dot
(0067)                            || 
(0068)  CS-0x02C  0x36700         ||    MOV  R7, 0x00
(0069)  CS-0x02D  0x36801         ||    MOV  R8, 0x01 
(0070)  CS-0x02E  0x36A25         ||    MOV  R10, END_ROW_SHIP
(0071)  CS-0x02F  0x36B01         || 	MOV R11, 0x01
(0072)  CS-0x030  0x36303         || 	MOV R3, 0x03
(0073)                            || 	
(0074)                     0x031  || start:
(0075)                            || 
(0076)  CS-0x031  0x04439         || 	MOV R4, R7
(0077)  CS-0x032  0x04541         || 	MOV R5, R8
(0078)  CS-0x033  0x083B9         || 	CALL draw_ship
(0079)  CS-0x034  0x02858         || 	ADD R8, R11
(0080)  CS-0x035  0x2C301         || 	SUB R3, 0x01
(0081)  CS-0x036  0x0818B         || 	BRNE start
(0082)                            || 
(0083)  CS-0x037  0x08461         || call pause
(0084)                     0x038  || MAIN:       
(0085)  CS-0x038  0x04469         || 			MOV R4, R13
(0086)  CS-0x039  0x04561         || 			MOV R5, R12
(0087)  CS-0x03A  0x36600         || 			MOV R6, 0x00
(0088)  CS-0x03B  0x08429         || 			call draw_dot
(0089)                            || 
(0090)  CS-0x03C  0x30D00         || 			CMP R13, 0x00
(0091)  CS-0x03D  0x08212         || 			BREQ p_bullet_2
(0092)                            || 
(0093)  CS-0x03E  0x2CD01         || 			SUB R13, 0x01
(0094)  CS-0x03F  0x04469         || 			MOV R4, R13
(0095)  CS-0x040  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0096)  CS-0x041  0x08429         || 			call draw_dot
(0097)                            || 
(0098)                     0x042  || p_bullet_2:
(0099)  CS-0x042  0x04479         || 			MOV R4, R15
(0100)  CS-0x043  0x04571         || 			MOV R5, R14
(0101)  CS-0x044  0x36600         || 			MOV R6, 0x00
(0102)  CS-0x045  0x08429         || 			call draw_dot
(0103)                            || 
(0104)  CS-0x046  0x30F00         || 			CMP R15, 0x00
(0105)  CS-0x047  0x0826A         || 			BREQ main_ship
(0106)                            || 
(0107)  CS-0x048  0x2CF01         || 			SUB R15, 0x01
(0108)  CS-0x049  0x04571         || 			MOV R5, R14
(0109)  CS-0x04A  0x04479         || 			MOV R4, R15
(0110)  CS-0x04B  0x366E3         || 			MOV R6, SHIP_COLOR
(0111)  CS-0x04C  0x08429         || 			call draw_dot
(0112)                            || 								
(0113)                     0x04D  || main_ship:
(0114)  CS-0x04D  0x04439         ||             MOV  R4, R7   ;y coordin
(0115)  CS-0x04E  0x04541         || 			MOV  R5, R8   ;x coordin
(0116)  CS-0x04F  0x083B9         || 			call draw_ship  
(0117)  CS-0x050  0x08461  0x050  || main_pause:	call pause
(0118)                            || 			
(0119)                            || 
(0120)  CS-0x051  0x2CA01  0x051  || ret_pause:	SUB R10, 0x01
(0121)  CS-0x052  0x30A00         || 			CMP R10, 0x00
(0122)  CS-0x053  0x082DA         || 			BREQ col
(0123)                            || 
(0124)                            || 
(0125)  CS-0x054  0x02858  0x054  || end_main:	ADD R8, R11
(0126)  CS-0x055  0x081C0         || 			BRN MAIN
(0127)                            || 
(0128)                     0x056  || clear_row:
(0129)                            ||    
(0130)  CS-0x056  0x084F9         ||    CALL clear_square
(0131)  CS-0x057  0x2C801         ||    SUB R8, 0x01
(0132)  CS-0x058  0x308FF         ||    CMP R8, 0xFF
(0133)  CS-0x059  0x082B3         ||    BRNE clear_row
(0134)  CS-0x05A  0x18002         ||    RET
(0135)                            || 
(0136)  CS-0x05B  0x28701  0x05B  || col:		ADD R7, 0x01
(0137)  CS-0x05C  0x36A25         || 			MOV R10, END_ROW_SHIP
(0138)  CS-0x05D  0x3071D         || 			CMP R7, END_COL
(0139)  CS-0x05E  0x0845A         || 			BREQ DONE
(0140)                            || 			
(0141)  CS-0x05F  0x30B01         || 			CMP R11, 0x01
(0142)  CS-0x060  0x08332         || 			BREQ set_neg
(0143)                            || 	
(0144)  CS-0x061  0x36B01         || 			MOV R11, 0x01
(0145)  CS-0x062  0x08359         || 			call clear_ship
(0146)  CS-0x063  0x36801         || 			MOV R8, 0x01
(0147)  CS-0x064  0x36303         || 			MOV R3, 0x03
(0148)  CS-0x065  0x08188         || 			BRN start
(0149)                            || 
(0150)  CS-0x066  0x36BFF  0x066  || set_neg:	MOV R11, 0xFF
(0151)  CS-0x067  0x08359         || 			CALL clear_ship
(0152)  CS-0x068  0x36827         || 			MOV R8, 0x27
(0153)  CS-0x069  0x36303         || 			MoV R3, 0x03
(0154)  CS-0x06A  0x08188         || 			brn start
(0155)                            || 
(0156)                     0x06B  || clear_ship:
(0157)  CS-0x06B  0x2C701         || 			SUB R7, 0x01
(0158)  CS-0x06C  0x36303         || 			MOV R3, 0x03
(0159)  CS-0x06D  0x36600         || 			MOV R6, 0x00
(0160)                     0x06E  || clear_loop: 
(0161)  CS-0x06E  0x04541         || 			MOV R5, R8
(0162)  CS-0x06F  0x04439         || 			MOV R4, R7
(0163)  CS-0x070  0x08429         || 			call draw_dot
(0164)  CS-0x071  0x02858         || 			ADD R8, R11
(0165)  CS-0x072  0x2C301         || 			SUB R3, 0x01
(0166)  CS-0x073  0x30303         || 			CMP R3, 0x03
(0167)  CS-0x074  0x08373         || 			BRNE clear_loop
(0168)                            || 						
(0169)  CS-0x075  0x28701         || 			ADD R7, 0x01
(0170)  CS-0x076  0x18002         || 			ret
(0171)                            || 
(0172)                     0x077  || draw_ship:
(0173)  CS-0x077  0x04541         || 			MOV R5, R8
(0174)  CS-0x078  0x04439         || 			MOV R4, R7
(0175)  CS-0x079  0x36600         || 			MOV R6, 0x00
(0176)                            || 
(0177)                            || 
(0178)  CS-0x07A  0x30BFF         || 			CMP R11, 0xFF
(0179)  CS-0x07B  0x083F2         || 			BREQ draw_neg
(0180)                            || 
(0181)  CS-0x07C  0x2C503         || 			SUB R5, 0x03
(0182)  CS-0x07D  0x083F8         || 			brn rest
(0183)                            || 
(0184)  CS-0x07E  0x28503  0x07E  || draw_neg:	ADD R5, 0x03
(0185)                            || 
(0186)  CS-0x07F  0x08429  0x07F  || rest:		call draw_dot
(0187)                            || 
(0188)  CS-0x080  0x04541         || 			MOV R5, R8
(0189)  CS-0x081  0x04439         || 			MOV R4, R7
(0190)  CS-0x082  0x366E3         || 			MOV R6, SHIP_COLOR
(0191)  CS-0x083  0x08429         || 			call draw_dot
(0192)  CS-0x084  0x18002         || 			ret
(0193)                            || 
(0194)                     0x085  || draw_dot: 
(0195)  CS-0x085  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0196)  CS-0x086  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0197)                            || 
(0198)  CS-0x087  0x34591  0x087  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0199)  CS-0x088  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0200)  CS-0x089  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0201)  CS-0x08A  0x18002         ||         RET
(0202)                            || 	   
(0203)  CS-0x08B  0x08458  0x08B  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0204)                            || 
(0205)                            || 
(0206)  CS-0x08C  0x3712F  0x08C  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0207)  CS-0x08D  0x2D101  0x08D  || outside_for0: 	SUB     R17, 0x01
(0208)                            || 
(0209)  CS-0x08E  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0210)  CS-0x08F  0x2D201  0x08F  || middle_for0:  	SUB     R18, 0x01
(0211)                            ||              
(0212)  CS-0x090  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0213)  CS-0x091  0x2D301  0x091  || inside_for0:  	SUB     R19, 0x01
(0214)  CS-0x092  0x0848B         ||              	BRNE    inside_for0
(0215)                            ||              
(0216)  CS-0x093  0x23200         ||              	OR      R18, 0x00              
(0217)  CS-0x094  0x0847B         ||              	BRNE    middle_for0
(0218)                            ||              
(0219)  CS-0x095  0x23100         ||              	OR      R17, 0x00               
(0220)  CS-0x096  0x0846B         ||              	BRNE    outside_for0
(0221)  CS-0x097  0x18002         || 				ret
(0222)                            || 
(0223)  CS-0x098  0x3712F  0x098  || pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0224)  CS-0x099  0x2D101  0x099  || outside_for: 	SUB     R17, 0x01
(0225)                            || 
(0226)                            ||              
(0227)  CS-0x09A  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0228)  CS-0x09B  0x2D301  0x09B  || inside_for:  	SUB     R19, 0x01
(0229)  CS-0x09C  0x084DB         ||              	BRNE    inside_for
(0230)                            ||                           
(0231)  CS-0x09D  0x23100         ||              	OR      R17, 0x00               
(0232)  CS-0x09E  0x084CB         ||              	BRNE    outside_for
(0233)                            || 
(0234)                     0x09F  || clear_square:
(0235)                            || 
(0236)  CS-0x09F  0x044D9         ||    MOV  R4, R27   ;y coordin
(0237)  CS-0x0A0  0x045E1         ||    MOV  R5, R28   ;x coordin
(0238)  CS-0x0A1  0x36600         ||    MOV  R6, 0x00
(0239)  CS-0x0A2  0x08429         ||    CALL draw_dot   ;clears dot at the origin
(0240)  CS-0x0A3  0x18002         ||    RET
(0241)                            || 
(0242)                     0x0A4  || ISR: 
(0243)  CS-0x0A4  0x33420         ||    	IN R20, INTERRUPT_ID
(0244)  CS-0x0A5  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0245)                            || 
(0246)  CS-0x0A6  0x31400         || 	cmp R20, 0x00
(0247)  CS-0x0A7  0x0858A         ||     breq testing0
(0248)                            || 
(0249)  CS-0x0A8  0x31403         || 	CMP R20, 0x03
(0250)  CS-0x0A9  0x085CA         || 	breq testing5
(0251)                            || 
(0252)  CS-0x0AA  0x31405         ||    CMP R20, 0x05
(0253)  CS-0x0AB  0x0860A         ||    BREQ shoot
(0254)                            || 
(0255)  CS-0x0AC  0x31402         ||    CMP R20, 0x02
(0256)  CS-0x0AD  0x08722         ||    BREQ moveLeft   
(0257)                            || 
(0258)  CS-0x0AE  0x31401         ||    CMP R20, 0x01  
(0259)  CS-0x0AF  0x0876A         ||    BREQ moveRight
(0260)                            || 
(0261)  CS-0x0B0  0x087B0         ||    brn ISR_END
(0262)                            || 
(0263)                     0x0B1  || testing0: 
(0264)  CS-0x0B1  0x044D9         ||    MOV  R4, R27   ;y coordin
(0265)  CS-0x0B2  0x045E1         ||    MOV  R5, R28   ;x coordin
(0266)                            || 
(0267)  CS-0x0B3  0x36603         || 	mov r6, 0x03
(0268)  CS-0x0B4  0x08429         ||     call draw_dot
(0269)  CS-0x0B5  0x08461         || 	call pause
(0270)  CS-0x0B6  0x366FF         || 	mov r6, 0xff
(0271)  CS-0x0B7  0x08429         || 	call draw_dot
(0272)  CS-0x0B8  0x087B0         ||     brn isr_end
(0273)                            || 
(0274)                     0x0B9  || testing5: 
(0275)  CS-0x0B9  0x044D9         ||    MOV  R4, R27   ;y coordin
(0276)  CS-0x0BA  0x045E1         ||    MOV  R5, R28   ;x coordin
(0277)                            || 
(0278)  CS-0x0BB  0x3661C         || 	mov r6, 0x1c
(0279)  CS-0x0BC  0x08429         ||     call draw_dot
(0280)  CS-0x0BD  0x08461         || 	call pause
(0281)  CS-0x0BE  0x366FF         || 	mov r6, 0xff
(0282)  CS-0x0BF  0x08429         || 	call draw_dot
(0283)  CS-0x0C0  0x087B0         ||     brn isr_end
(0284)                            || 
(0285)                     0x0C1  || shoot: 
(0286)                            ||    
(0287)  CS-0x0C1  0x31001         || 	CMP R16, 0x01
(0288)  CS-0x0C2  0x08682         || 	BREQ second_bullet
(0289)                            || 
(0290)  CS-0x0C3  0x04469         || 	MOV R4, R13
(0291)  CS-0x0C4  0x04561         || 	MOV R5, R12
(0292)  CS-0x0C5  0x36600         || 	MOV R6, 0x00
(0293)  CS-0x0C6  0x08429         || 	call draw_dot
(0294)                            || 
(0295)  CS-0x0C7  0x04DD9         ||    Mov R13, R27
(0296)  CS-0x0C8  0x2CD01         ||    SUB R13, 0x01
(0297)                            || 
(0298)  CS-0x0C9  0x04CE1         ||    MOV R12, R28
(0299)                            || 
(0300)  CS-0x0CA  0x04469         ||    MOV R4, R13
(0301)  CS-0x0CB  0x04561         ||    MOV R5, R12
(0302)  CS-0x0CC  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0303)  CS-0x0CD  0x08429         ||    call draw_dot
(0304)                            || 
(0305)  CS-0x0CE  0x29001         ||    ADD R16, 0x01
(0306)                            ||    
(0307)  CS-0x0CF  0x086E0         ||    BRN animation
(0308)                            || 
(0309)                     0x0D0  || second_bullet:		   
(0310)  CS-0x0D0  0x04479         || 	MOV R4, R15
(0311)  CS-0x0D1  0x04571         || 	MOV R5, R14
(0312)  CS-0x0D2  0x36600         || 	MOV R6, 0x00
(0313)  CS-0x0D3  0x08429         || 	call draw_dot
(0314)                            || 
(0315)  CS-0x0D4  0x04FD9         || 	MOV R15, R27
(0316)  CS-0x0D5  0x2CF01         || 	SUB R15, 0x01
(0317)                            || 
(0318)  CS-0x0D6  0x04EE1         || 	MOV R14, R28	
(0319)                            || 
(0320)  CS-0x0D7  0x04479         ||    MOV R4, R15
(0321)  CS-0x0D8  0x04571         ||    MOV R5, R14
(0322)  CS-0x0D9  0x366E3         ||    MOV R6, SHIP_COLOR
(0323)  CS-0x0DA  0x08429         ||    call draw_dot
(0324)                            || 
(0325)  CS-0x0DB  0x2D001         ||    SUB R16, 0x01
(0326)                            || 
(0327)                     0x0DC  || animation:
(0328)  CS-0x0DC  0x044D9         ||    MOV  R4, R27   ;y coordin
(0329)  CS-0x0DD  0x045E1         ||    MOV  R5, R28   ;x coordin
(0330)                            || 
(0331)  CS-0x0DE  0x366E0         || 	  mov R6, 0xE0
(0332)  CS-0x0DF  0x08429         || 	  call draw_dot
(0333)  CS-0x0E0  0x084C1         ||       call pause2
(0334)  CS-0x0E1  0x366FF         || 	  mov R6, 0xFF
(0335)  CS-0x0E2  0x08429         ||       call draw_dot
(0336)  CS-0x0E3  0x087B0         || 	  brn ISR_END
(0337)                            || 
(0338)                     0x0E4  || moveLeft:
(0339)  CS-0x0E4  0x31C00         || 	CMP R28, 0x00
(0340)  CS-0x0E5  0x087B2         || 	BREQ ISR_END
(0341)                            || 
(0342)  CS-0x0E6  0x084F9         ||    CALL clear_square
(0343)                            ||    
(0344)  CS-0x0E7  0x2DC01         ||    SUB  R28, 0x01  
(0345)                            || 
(0346)  CS-0x0E8  0x044D9         ||    MOV  R4, R27   ;y coordin
(0347)  CS-0x0E9  0x045E1         ||    MOV  R5, R28   ;x coordin
(0348)  CS-0x0EA  0x366FF         ||    MOV  R6, 0xFF
(0349)  CS-0x0EB  0x08429         ||    CALL draw_dot   ;draw red square at origin
(0350)  CS-0x0EC  0x087B0         ||    brn ISR_END
(0351)                            || 
(0352)                     0x0ED  || moveRight:
(0353)  CS-0x0ED  0x31C27         || 	CMP R28, END_ROW_PLAYER
(0354)  CS-0x0EE  0x087B2         || 	BREQ ISR_END
(0355)                            || 
(0356)  CS-0x0EF  0x084F9         ||    CALL clear_square
(0357)                            || 
(0358)                            ||    
(0359)  CS-0x0F0  0x29C01         ||    ADD  R28, 0x01  
(0360)                            || 
(0361)                            || 
(0362)  CS-0x0F1  0x044D9         ||    MOV  R4, R27   ;y coordin
(0363)  CS-0x0F2  0x045E1         ||    MOV  R5, R28   ;x coordin
(0364)  CS-0x0F3  0x366FF         ||    MOV  R6, 0xFF
(0365)  CS-0x0F4  0x08429         ||    CALL draw_dot   ;draw red square at origin
(0366)                            ||    
(0367)  CS-0x0F5  0x087B0         || 	brn ISR_END
(0368)                     0x0F6  || ISR_END:
(0369)  CS-0x0F6  0x1A003         || 		RETIE
(0370)                            || 
(0371)                            || .CSEG
(0372)                       1023  || .ORG 0x3FF
(0373)  CS-0x3FF  0x08520  0x3FF  || VECTOR:      BRN ISR
(0374)                            || 





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
ANIMATION      0x0DC   (0327)  ||  0307 
CLEAR_LOOP     0x06E   (0160)  ||  0167 
CLEAR_ROW      0x056   (0128)  ||  0043 0133 
CLEAR_SHIP     0x06B   (0156)  ||  0145 0151 
CLEAR_SQUARE   0x09F   (0234)  ||  0130 0342 0356 
COL            0x05B   (0136)  ||  0122 
DD_OUT         0x087   (0198)  ||  
DONE           0x08B   (0203)  ||  0139 0203 
DRAW_DOT       0x085   (0194)  ||  0050 0066 0088 0096 0102 0111 0163 0186 0191 0239 
                               ||  0268 0271 0279 0282 0293 0303 0313 0323 0332 0335 
                               ||  0349 0365 
DRAW_NEG       0x07E   (0184)  ||  0179 
DRAW_SHIP      0x077   (0172)  ||  0078 0116 
END_MAIN       0x054   (0125)  ||  
INSIDE_FOR     0x09B   (0228)  ||  0229 
INSIDE_FOR0    0x091   (0213)  ||  0214 
ISR            0x0A4   (0242)  ||  0373 
ISR_END        0x0F6   (0368)  ||  0261 0272 0283 0336 0340 0350 0354 0367 
MAIN           0x038   (0084)  ||  0126 
MAIN_PAUSE     0x050   (0117)  ||  
MAIN_SHIP      0x04D   (0113)  ||  0105 
MIDDLE_FOR0    0x08F   (0210)  ||  0217 
MOVELEFT       0x0E4   (0338)  ||  0256 
MOVERIGHT      0x0ED   (0352)  ||  0259 
OUTSIDE_FOR    0x099   (0224)  ||  0232 
OUTSIDE_FOR0   0x08D   (0207)  ||  0220 
PAUSE          0x08C   (0206)  ||  0058 0083 0117 0269 0280 
PAUSE2         0x098   (0223)  ||  0333 
P_BULLET_2     0x042   (0098)  ||  0091 
RESET          0x018   (0042)  ||  
RESET_LOOP     0x01C   (0047)  ||  0052 0056 
REST           0x07F   (0186)  ||  0182 
RET_PAUSE      0x051   (0120)  ||  
SECOND_BULLET  0x0D0   (0309)  ||  0288 
SET_NEG        0x066   (0150)  ||  0142 
SHOOT          0x0C1   (0285)  ||  0253 
START          0x031   (0074)  ||  0081 0148 0154 
TESTING0       0x0B1   (0263)  ||  0247 
TESTING5       0x0B9   (0274)  ||  0250 
VECTOR         0x3FF   (0373)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0014)  ||  0060 0138 
END_ROW_PLAYER 0x027   (0013)  ||  0353 
END_ROW_SHIP   0x025   (0012)  ||  0070 0137 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0212 0227 
INTERRUPT_ID   0x020   (0023)  ||  0243 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0209 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0206 0223 
PLAYER_BULLET_COLOR 0x0FC   (0022)  ||  0095 0302 
SHIP_COLOR     0x0E3   (0015)  ||  0110 0190 0322 
SSEG_CNTR_ID   0x060   (0025)  ||  0035 
SSEG_VAL_ID    0x080   (0026)  ||  0244 
VGA_COLOR      0x092   (0006)  ||  0200 
VGA_HADD       0x090   (0004)  ||  0199 
VGA_LADD       0x091   (0005)  ||  0198 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
