

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
(0012)                       037  || .equ END_ROW = 0x25
(0013)                       029  || .equ END_COL = 0x1D
(0014)                       227  || .equ SHIP_COLOR = 0xE3;0x03 ;blue
(0015)                            || 					   ;0xE0 ;red
(0016)                            || 					   ; 0x1C    ;green
(0017)                            || 					; 0xE3 ; pink
(0018)                            || 						;0xFC ; yellow
(0019)                            || 					;0x1F aqua
(0020)                            || 
(0021)                       252  || .equ PLAYER_BULLET_COLOR = 0xFC
(0022)                       032  || .EQU INTERRUPT_ID  = 0x20
(0023)                            || 
(0024)                       096  || .equ SSEG_CNTR_ID = 0x60
(0025)                       128  || .equ SSEG_VAL_ID  = 0x80
(0026)                            || 
(0027)                            || .CSEG
(0028)                       016  || .ORG 0x10
(0029)                            || 
(0030)  CS-0x010  0x1A000         ||    SEI
(0031)  CS-0x011  0x37000         || MOV R16, 0x00
(0032)  CS-0x012  0x36C00         || MOV R12, 0x00
(0033)  CS-0x013  0x36D00         || MOV R13, 0x00
(0034)  CS-0x014  0x36E00         || MOV R14, 0x00
(0035)  CS-0x015  0x36F00         || MOV R15, 0x00
(0036)                            || 
(0037)  CS-0x016  0x36281         || MOV R2, 0x81
(0038)  CS-0x017  0x34260         || OUT R2, SSEG_CNTR_ID
(0039)                     0x018  || reset:
(0040)  CS-0x018  0x082B1         || 	    CALL clear_row
(0041)  CS-0x019  0x36828         || 		MOV R8, 0x28
(0042)  CS-0x01A  0x3671D         || 		MOV R7, 0x1D
(0043)  CS-0x01B  0x36600         || 		MOV R6, 0x00
(0044)                     0x01C  || reset_loop:
(0045)  CS-0x01C  0x04439         || 		MOV R4, R7
(0046)  CS-0x01D  0x04541         || 		MOV R5, R8
(0047)  CS-0x01E  0x08429         || 		call draw_dot
(0048)  CS-0x01F  0x2C801         || 		SUB R8, 0x01
(0049)  CS-0x020  0x080E3         || 		BRNE reset_loop
(0050)                            || 
(0051)  CS-0x021  0x2C701         || 		SUB R7, 0x01
(0052)  CS-0x022  0x307FF         || 		CMP R7, 0xFF
(0053)  CS-0x023  0x080E3         || 		BRNE reset_loop
(0054)                            || 	
(0055)  CS-0x024  0x08461         || 		call pause
(0056)                            || 
(0057)  CS-0x025  0x37B1D         ||    MOV  R27, END_COL
(0058)  CS-0x026  0x2DB01         || 	SUB R27, 0x01
(0059)  CS-0x027  0x37C14         ||    MOV  R28, 0x14
(0060)  CS-0x028  0x366FF         || 	MOV R6, 0xFF
(0061)  CS-0x029  0x044D9         || 	MOV R4, R27
(0062)  CS-0x02A  0x045E1         || 	MOV R5, R28
(0063)  CS-0x02B  0x08429         || 	call draw_dot
(0064)                            || 
(0065)  CS-0x02C  0x36700         ||    MOV  R7, 0x00
(0066)  CS-0x02D  0x36800         ||    MOV  R8, 0x00 
(0067)  CS-0x02E  0x36A25         ||    MOV  R10, END_ROW
(0068)  CS-0x02F  0x36B01         || 	MOV R11, 0x01
(0069)  CS-0x030  0x36303         || 	MOV R3, 0x03
(0070)                            || 	
(0071)                     0x031  || start:
(0072)  CS-0x031  0x04439         || 	MOV R4, R7
(0073)  CS-0x032  0x04541         || 	MOV R5, R8
(0074)  CS-0x033  0x083B9         || 	CALL draw_ship
(0075)  CS-0x034  0x02858         || 	ADD R8, R11
(0076)  CS-0x035  0x2C301         || 	SUB R3, 0x01
(0077)  CS-0x036  0x0818B         || 	BRNE start
(0078)                            || 
(0079)  CS-0x037  0x08461         || call pause
(0080)                     0x038  || MAIN:       
(0081)  CS-0x038  0x04469         || 			MOV R4, R13
(0082)  CS-0x039  0x04561         || 			MOV R5, R12
(0083)  CS-0x03A  0x36600         || 			MOV R6, 0x00
(0084)  CS-0x03B  0x08429         || 			call draw_dot
(0085)                            || 
(0086)  CS-0x03C  0x30D00         || 			CMP R13, 0x00
(0087)  CS-0x03D  0x08212         || 			BREQ p_bullet_2
(0088)                            || 
(0089)  CS-0x03E  0x2CD01         || 			SUB R13, 0x01
(0090)  CS-0x03F  0x04561         || 			MOV R5, R12
(0091)  CS-0x040  0x366FC         || 			MOV R6, PLAYER_BULLET_COLOR
(0092)  CS-0x041  0x08429         || 			call draw_dot
(0093)                            || 
(0094)                     0x042  || p_bullet_2:
(0095)  CS-0x042  0x04479         || 			MOV R4, R15
(0096)  CS-0x043  0x04571         || 			MOV R5, R14
(0097)  CS-0x044  0x36600         || 			MOV R6, 0x00
(0098)  CS-0x045  0x08429         || 			call draw_dot
(0099)                            || 
(0100)  CS-0x046  0x30F00         || 			CMP R15, 0x00
(0101)  CS-0x047  0x0826A         || 			BREQ main_ship
(0102)                            || 
(0103)  CS-0x048  0x2CF01         || 			SUB R15, 0x01
(0104)  CS-0x049  0x04571         || 			MOV R5, R14
(0105)  CS-0x04A  0x04479         || 			MOV R4, R15
(0106)  CS-0x04B  0x366E3         || 			MOV R6, SHIP_COLOR
(0107)  CS-0x04C  0x08429         || 			call draw_dot
(0108)                            || 								
(0109)                     0x04D  || main_ship:
(0110)  CS-0x04D  0x04439         ||             MOV  R4, R7   ;y coordin
(0111)  CS-0x04E  0x04541         || 			MOV  R5, R8   ;x coordin
(0112)  CS-0x04F  0x083B9         || 			call draw_ship  
(0113)  CS-0x050  0x08461  0x050  || main_pause:	call pause
(0114)                            || 			
(0115)                            || 
(0116)  CS-0x051  0x2CA01  0x051  || ret_pause:	SUB R10, 0x01
(0117)  CS-0x052  0x30A00         || 			CMP R10, 0x00
(0118)  CS-0x053  0x082DA         || 			BREQ col
(0119)                            || 
(0120)                            || 
(0121)  CS-0x054  0x02858  0x054  || end_main:	ADD R8, R11
(0122)  CS-0x055  0x081C0         || 			BRN MAIN
(0123)                            || 
(0124)                     0x056  || clear_row:
(0125)                            ||    
(0126)  CS-0x056  0x084C1         ||    CALL clear_square
(0127)  CS-0x057  0x2C801         ||    SUB R8, 0x01
(0128)  CS-0x058  0x308FF         ||    CMP R8, 0xFF
(0129)  CS-0x059  0x082B3         ||    BRNE clear_row
(0130)  CS-0x05A  0x18002         ||    RET
(0131)                            || 
(0132)  CS-0x05B  0x28701  0x05B  || col:		ADD R7, 0x01
(0133)  CS-0x05C  0x36A25         || 			MOV R10, END_ROW
(0134)  CS-0x05D  0x3071D         || 			CMP R7, END_COL
(0135)  CS-0x05E  0x0845A         || 			BREQ DONE
(0136)                            || 			
(0137)  CS-0x05F  0x30B01         || 			CMP R11, 0x01
(0138)  CS-0x060  0x08332         || 			BREQ set_neg
(0139)                            || 	
(0140)  CS-0x061  0x36B01         || 			MOV R11, 0x01
(0141)  CS-0x062  0x08359         || 			call clear_ship
(0142)  CS-0x063  0x36800         || 			MOV R8, 0x00
(0143)  CS-0x064  0x36303         || 			MOV R3, 0x03
(0144)  CS-0x065  0x08188         || 			BRN start
(0145)                            || 
(0146)  CS-0x066  0x36BFF  0x066  || set_neg:	MOV R11, 0xFF
(0147)  CS-0x067  0x08359         || 			CALL clear_ship
(0148)  CS-0x068  0x36827         || 			MOV R8, 0x27
(0149)  CS-0x069  0x36303         || 			MoV R3, 0x03
(0150)  CS-0x06A  0x08188         || 			brn start
(0151)                            || 
(0152)                     0x06B  || clear_ship:
(0153)  CS-0x06B  0x2C701         || 			SUB R7, 0x01
(0154)  CS-0x06C  0x36303         || 			MOV R3, 0x03
(0155)  CS-0x06D  0x36600         || 			MOV R6, 0x00
(0156)                     0x06E  || clear_loop: 
(0157)  CS-0x06E  0x04541         || 			MOV R5, R8
(0158)  CS-0x06F  0x04439         || 			MOV R4, R7
(0159)  CS-0x070  0x08429         || 			call draw_dot
(0160)  CS-0x071  0x02858         || 			ADD R8, R11
(0161)  CS-0x072  0x2C301         || 			SUB R3, 0x01
(0162)  CS-0x073  0x30303         || 			CMP R3, 0x03
(0163)  CS-0x074  0x08373         || 			BRNE clear_loop
(0164)                            || 						
(0165)  CS-0x075  0x28701         || 			ADD R7, 0x01
(0166)  CS-0x076  0x18002         || 			ret
(0167)                            || 
(0168)                     0x077  || draw_ship:
(0169)  CS-0x077  0x04541         || 			MOV R5, R8
(0170)  CS-0x078  0x04439         || 			MOV R4, R7
(0171)  CS-0x079  0x36600         || 			MOV R6, 0x00
(0172)                            || 
(0173)                            || 
(0174)  CS-0x07A  0x30BFF         || 			CMP R11, 0xFF
(0175)  CS-0x07B  0x083F2         || 			BREQ draw_neg
(0176)                            || 
(0177)  CS-0x07C  0x2C503         || 			SUB R5, 0x03
(0178)  CS-0x07D  0x083F8         || 			brn rest
(0179)                            || 
(0180)  CS-0x07E  0x28503  0x07E  || draw_neg:	ADD R5, 0x03
(0181)                            || 
(0182)  CS-0x07F  0x08429  0x07F  || rest:		call draw_dot
(0183)                            || 
(0184)  CS-0x080  0x04541         || 			MOV R5, R8
(0185)  CS-0x081  0x04439         || 			MOV R4, R7
(0186)  CS-0x082  0x366E3         || 			MOV R6, SHIP_COLOR
(0187)  CS-0x083  0x08429         || 			call draw_dot
(0188)  CS-0x084  0x18002         || 			ret
(0189)                            || 
(0190)                     0x085  || draw_dot: 
(0191)  CS-0x085  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0192)  CS-0x086  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0193)                            || 
(0194)  CS-0x087  0x34591  0x087  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0195)  CS-0x088  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0196)  CS-0x089  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0197)  CS-0x08A  0x18002         ||         RET
(0198)                            || 	   
(0199)  CS-0x08B  0x08458  0x08B  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0200)                            || 
(0201)                            || 
(0202)  CS-0x08C  0x3712F  0x08C  || pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
(0203)  CS-0x08D  0x2D101  0x08D  || outside_for0: 	SUB     R17, 0x01
(0204)                            || 
(0205)  CS-0x08E  0x3722F         ||              	MOV     R18, MIDDLE_FOR_COUNT   
(0206)  CS-0x08F  0x2D201  0x08F  || middle_for0:  	SUB     R18, 0x01
(0207)                            ||              
(0208)  CS-0x090  0x3732F         ||              	MOV     R19, INSIDE_FOR_COUNT   
(0209)  CS-0x091  0x2D301  0x091  || inside_for0:  	SUB     R19, 0x01
(0210)  CS-0x092  0x0848B         ||              	BRNE    inside_for0
(0211)                            ||              
(0212)  CS-0x093  0x23200         ||              	OR      R18, 0x00              
(0213)  CS-0x094  0x0847B         ||              	BRNE    middle_for0
(0214)                            ||              
(0215)  CS-0x095  0x23100         ||              	OR      R17, 0x00               
(0216)  CS-0x096  0x0846B         ||              	BRNE    outside_for0
(0217)                            || 
(0218)  CS-0x097  0x18002         || 				ret
(0219)                            || 
(0220)                     0x098  || clear_square:
(0221)                            || 
(0222)  CS-0x098  0x044D9         ||    MOV  R4, R27   ;y coordin
(0223)  CS-0x099  0x045E1         ||    MOV  R5, R28   ;x coordin
(0224)  CS-0x09A  0x36600         ||    MOV  R6, 0x00
(0225)  CS-0x09B  0x08429         ||    CALL draw_dot   ;clears dot at the origin
(0226)  CS-0x09C  0x18002         ||    RET
(0227)                            || 
(0228)                     0x09D  || ISR: 
(0229)  CS-0x09D  0x33420         ||    	IN R20, INTERRUPT_ID
(0230)  CS-0x09E  0x35480         || 	OUT  R20, SSEG_VAL_ID
(0231)                            || 
(0232)  CS-0x09F  0x31400         || 	cmp R20, 0x00
(0233)  CS-0x0A0  0x08552         ||     breq testing0
(0234)                            || 
(0235)  CS-0x0A1  0x31403         || 	CMP R20, 0x03
(0236)  CS-0x0A2  0x08592         || 	breq testing5
(0237)                            || 
(0238)  CS-0x0A3  0x31405         ||    CMP R20, 0x05
(0239)  CS-0x0A4  0x085D2         ||    BREQ shoot
(0240)                            || 
(0241)  CS-0x0A5  0x31402         ||    CMP R20, 0x02
(0242)  CS-0x0A6  0x086EA         ||    BREQ moveLeft   
(0243)                            || 
(0244)  CS-0x0A7  0x31401         ||    CMP R20, 0x01  
(0245)  CS-0x0A8  0x08732         ||    BREQ moveRight
(0246)                            || 
(0247)  CS-0x0A9  0x08778         ||    brn ISR_END
(0248)                            || 
(0249)                     0x0AA  || testing0: 
(0250)  CS-0x0AA  0x044D9         ||    MOV  R4, R27   ;y coordin
(0251)  CS-0x0AB  0x045E1         ||    MOV  R5, R28   ;x coordin
(0252)                            || 
(0253)  CS-0x0AC  0x36603         || 	mov r6, 0x03
(0254)  CS-0x0AD  0x08429         ||     call draw_dot
(0255)  CS-0x0AE  0x08461         || 	call pause
(0256)  CS-0x0AF  0x366FF         || 	mov r6, 0xff
(0257)  CS-0x0B0  0x08429         || 	call draw_dot
(0258)  CS-0x0B1  0x08778         ||     brn isr_end
(0259)                            || 
(0260)                     0x0B2  || testing5: 
(0261)  CS-0x0B2  0x044D9         ||    MOV  R4, R27   ;y coordin
(0262)  CS-0x0B3  0x045E1         ||    MOV  R5, R28   ;x coordin
(0263)                            || 
(0264)  CS-0x0B4  0x3661C         || 	mov r6, 0x1c
(0265)  CS-0x0B5  0x08429         ||     call draw_dot
(0266)  CS-0x0B6  0x08461         || 	call pause
(0267)  CS-0x0B7  0x366FF         || 	mov r6, 0xff
(0268)  CS-0x0B8  0x08429         || 	call draw_dot
(0269)  CS-0x0B9  0x08778         ||     brn isr_end
(0270)                            || 
(0271)                     0x0BA  || shoot: 
(0272)                            ||    
(0273)  CS-0x0BA  0x31001         || 	CMP R16, 0x01
(0274)  CS-0x0BB  0x0864A         || 	BREQ second_bullet
(0275)                            || 
(0276)  CS-0x0BC  0x04469         || 	MOV R4, R13
(0277)  CS-0x0BD  0x04561         || 	MOV R5, R12
(0278)  CS-0x0BE  0x36600         || 	MOV R6, 0x00
(0279)  CS-0x0BF  0x08429         || 	call draw_dot
(0280)                            || 
(0281)  CS-0x0C0  0x04DD9         ||    Mov R13, R27
(0282)  CS-0x0C1  0x2CD01         ||    SUB R13, 0x01
(0283)                            || 
(0284)  CS-0x0C2  0x04CE1         ||    MOV R12, R28
(0285)                            || 
(0286)  CS-0x0C3  0x04469         ||    MOV R4, R13
(0287)  CS-0x0C4  0x04561         ||    MOV R5, R12
(0288)  CS-0x0C5  0x366FC         ||    MOV R6, PLAYER_BULLET_COLOR
(0289)  CS-0x0C6  0x08429         ||    call draw_dot
(0290)                            || 
(0291)  CS-0x0C7  0x29001         ||    ADD R16, 0x01
(0292)                            ||    
(0293)  CS-0x0C8  0x086A8         ||    BRN animation
(0294)                            || 
(0295)                     0x0C9  || second_bullet:		   
(0296)  CS-0x0C9  0x04479         || 	MOV R4, R15
(0297)  CS-0x0CA  0x04571         || 	MOV R5, R14
(0298)  CS-0x0CB  0x36600         || 	MOV R6, 0x00
(0299)  CS-0x0CC  0x08429         || 	call draw_dot
(0300)                            || 
(0301)  CS-0x0CD  0x04FD9         || 	MOV R15, R27
(0302)  CS-0x0CE  0x2CF01         || 	SUB R15, 0x01
(0303)                            || 
(0304)  CS-0x0CF  0x04EE1         || 	MOV R14, R28	
(0305)                            || 
(0306)  CS-0x0D0  0x04479         ||    MOV R4, R15
(0307)  CS-0x0D1  0x04571         ||    MOV R5, R14
(0308)  CS-0x0D2  0x366E3         ||    MOV R6, SHIP_COLOR
(0309)  CS-0x0D3  0x08429         ||    call draw_dot
(0310)                            || 
(0311)  CS-0x0D4  0x2D001         ||    SUB R16, 0x01
(0312)                            || 
(0313)                     0x0D5  || animation:
(0314)  CS-0x0D5  0x044D9         ||    MOV  R4, R27   ;y coordin
(0315)  CS-0x0D6  0x045E1         ||    MOV  R5, R28   ;x coordin
(0316)                            || 
(0317)  CS-0x0D7  0x366E0         || 	  mov R6, 0xE0
(0318)  CS-0x0D8  0x08429         || 	  call draw_dot
(0319)  CS-0x0D9  0x08461         ||       call pause
(0320)  CS-0x0DA  0x366FF         || 	  mov R6, 0xFF
(0321)  CS-0x0DB  0x08429         ||       call draw_dot
(0322)  CS-0x0DC  0x08778         || 	  brn ISR_END
(0323)                            || 
(0324)                     0x0DD  || moveLeft:
(0325)  CS-0x0DD  0x31C00         || 	CMP R28, 0x00
(0326)  CS-0x0DE  0x0877A         || 	BREQ ISR_END
(0327)                            || 
(0328)  CS-0x0DF  0x084C1         ||    CALL clear_square
(0329)                            ||    
(0330)  CS-0x0E0  0x2DC01         ||    SUB  R28, 0x01  
(0331)                            || 
(0332)  CS-0x0E1  0x044D9         ||    MOV  R4, R27   ;y coordin
(0333)  CS-0x0E2  0x045E1         ||    MOV  R5, R28   ;x coordin
(0334)  CS-0x0E3  0x366FF         ||    MOV  R6, 0xFF
(0335)  CS-0x0E4  0x08429         ||    CALL draw_dot   ;draw red square at origin
(0336)  CS-0x0E5  0x08778         ||    brn ISR_END
(0337)                            || 
(0338)                     0x0E6  || moveRight:
(0339)  CS-0x0E6  0x31C25         || 	CMP R28, END_ROW
(0340)  CS-0x0E7  0x0877A         || 	BREQ ISR_END
(0341)                            || 
(0342)  CS-0x0E8  0x084C1         ||    CALL clear_square
(0343)                            || 
(0344)                            ||    
(0345)  CS-0x0E9  0x29C01         ||    ADD  R28, 0x01  
(0346)                            || 
(0347)                            || 
(0348)  CS-0x0EA  0x044D9         ||    MOV  R4, R27   ;y coordin
(0349)  CS-0x0EB  0x045E1         ||    MOV  R5, R28   ;x coordin
(0350)  CS-0x0EC  0x366FF         ||    MOV  R6, 0xFF
(0351)  CS-0x0ED  0x08429         ||    CALL draw_dot   ;draw red square at origin
(0352)                            ||    
(0353)  CS-0x0EE  0x08778         || 	brn ISR_END
(0354)                     0x0EF  || ISR_END:
(0355)  CS-0x0EF  0x1A003         || 		RETIE
(0356)                            || 
(0357)                            || .CSEG
(0358)                       1023  || .ORG 0x3FF
(0359)  CS-0x3FF  0x084E8  0x3FF  || VECTOR:      BRN ISR
(0360)                            || 





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
ANIMATION      0x0D5   (0313)  ||  0293 
CLEAR_LOOP     0x06E   (0156)  ||  0163 
CLEAR_ROW      0x056   (0124)  ||  0040 0129 
CLEAR_SHIP     0x06B   (0152)  ||  0141 0147 
CLEAR_SQUARE   0x098   (0220)  ||  0126 0328 0342 
COL            0x05B   (0132)  ||  0118 
DD_OUT         0x087   (0194)  ||  
DONE           0x08B   (0199)  ||  0135 0199 
DRAW_DOT       0x085   (0190)  ||  0047 0063 0084 0092 0098 0107 0159 0182 0187 0225 
                               ||  0254 0257 0265 0268 0279 0289 0299 0309 0318 0321 
                               ||  0335 0351 
DRAW_NEG       0x07E   (0180)  ||  0175 
DRAW_SHIP      0x077   (0168)  ||  0074 0112 
END_MAIN       0x054   (0121)  ||  
INSIDE_FOR0    0x091   (0209)  ||  0210 
ISR            0x09D   (0228)  ||  0359 
ISR_END        0x0EF   (0354)  ||  0247 0258 0269 0322 0326 0336 0340 0353 
MAIN           0x038   (0080)  ||  0122 
MAIN_PAUSE     0x050   (0113)  ||  
MAIN_SHIP      0x04D   (0109)  ||  0101 
MIDDLE_FOR0    0x08F   (0206)  ||  0213 
MOVELEFT       0x0DD   (0324)  ||  0242 
MOVERIGHT      0x0E6   (0338)  ||  0245 
OUTSIDE_FOR0   0x08D   (0203)  ||  0216 
PAUSE          0x08C   (0202)  ||  0055 0079 0113 0255 0266 0319 
P_BULLET_2     0x042   (0094)  ||  0087 
RESET          0x018   (0039)  ||  
RESET_LOOP     0x01C   (0044)  ||  0049 0053 
REST           0x07F   (0182)  ||  0178 
RET_PAUSE      0x051   (0116)  ||  
SECOND_BULLET  0x0C9   (0295)  ||  0274 
SET_NEG        0x066   (0146)  ||  0138 
SHOOT          0x0BA   (0271)  ||  0239 
START          0x031   (0071)  ||  0077 0144 0150 
TESTING0       0x0AA   (0249)  ||  0233 
TESTING5       0x0B2   (0260)  ||  0236 
VECTOR         0x3FF   (0359)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
END_COL        0x01D   (0013)  ||  0057 0134 
END_ROW        0x025   (0012)  ||  0067 0133 0339 
INSIDE_FOR_COUNT 0x02F   (0008)  ||  0208 
INTERRUPT_ID   0x020   (0022)  ||  0229 
MIDDLE_FOR_COUNT 0x02F   (0009)  ||  0205 
OUTSIDE_FOR_COUNT 0x02F   (0010)  ||  0202 
PLAYER_BULLET_COLOR 0x0FC   (0021)  ||  0091 0288 
SHIP_COLOR     0x0E3   (0014)  ||  0106 0186 0308 
SSEG_CNTR_ID   0x060   (0024)  ||  0038 
SSEG_VAL_ID    0x080   (0025)  ||  0230 
VGA_COLOR      0x092   (0006)  ||  0196 
VGA_HADD       0x090   (0004)  ||  0195 
VGA_LADD       0x091   (0005)  ||  0194 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
