

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


(0001)                            || 
(0002)                            || 
(0003)                            || .DSEG
(0004)                       000  || .ORG 0x00
(0005)                            || 
(0006)                            || 
(0007)                       036  || .EQU INSIDE_FOR_COUNT    = 0x24 ;
(0008)                       036  || .EQU MIDDLE_FOR_COUNT    = 0x24 ;
(0009)                       036  || .EQU OUTSIDE_FOR_COUNT   = 0x24 ;
(0010)                            || 
(0011)                       144  || .EQU VGA_HADD = 0x90
(0012)                       145  || .EQU VGA_LADD = 0x91
(0013)                       146  || .EQU VGA_COLOR = 0x92
(0014)                       129  || .EQU SSEG = 0x81
(0015)                       064  || .EQU LEDS = 0x40
(0016)                       037  || .equ loop_count = 0x25     ; extend the loop count
(0017)                            || 
(0018)                            || 
(0019)                            || .CSEG
(0020)                       016  || .ORG 0x10
(0021)                            || 
(0022)  CS-0x010  0x1A000         ||    SEI
(0023)                            || 
(0024)  CS-0x011  0x36000         ||    MOV  R0, 0x00
(0025)  CS-0x012  0x36100         ||    MOV  R1, 0x00
(0026)  CS-0x013  0x3671D         ||    MOV  R7, 0x1D
(0027)                            || 
(0028)                            || 
(0029)                            || 
(0030)  CS-0x014  0x36828         ||    MOV R8, 0x28
(0031)                            || 
(0032)                            || 
(0033)                     0x015  || clear_row:
(0034)                            || 
(0035)                            ||    
(0036)  CS-0x015  0x081A9         ||    CALL clear_square
(0037)  CS-0x016  0x2C801         ||    SUB R8, 0x01
(0038)  CS-0x017  0x308FF         ||    CMP R8, 0xFF
(0039)  CS-0x018  0x080AB         ||    BRNE clear_row
(0040)                            || 
(0041)                            || 
(0042)                            || 
(0043)                            || 
(0044)  CS-0x019  0x36814         ||    MOV  R8, 0x14
(0045)                            || 
(0046)                            || 
(0047)                            ||              
(0048)                     0x01A  || MAIN:        
(0049)  CS-0x01A  0x04439         ||    MOV  R4, R7   ;y coordin
(0050)  CS-0x01B  0x04541         ||    MOV  R5, R8   ;x coordin
(0051)  CS-0x01C  0x366FF         ||    MOV  R6, 0xFF
(0052)  CS-0x01D  0x08159         ||    CALL draw_dot   ;draw red square at origin
(0053)                            || 
(0054)                            || 
(0055)  CS-0x01E  0x08238         ||    BRN DONE
(0056)                            || 	;CALL pause
(0057)                            || 
(0058)                            || 
(0059)                     0x01F  || pause: 
(0060)                            || ;-HOLD-DELAY-1-----------------------------------------------------------
(0061)  CS-0x01F  0x36124         || 		MOV     R1, OUTSIDE_FOR_COUNT
(0062)  CS-0x020  0x2C101  0x020  || OUTSIDE_FOR1: 	SUB     R1, 0x01
(0063)                            ||  
(0064)  CS-0x021  0x36224         || 		MOV     R2, MIDDLE_FOR_COUNT
(0065)  CS-0x022  0x2C201  0x022  || MIDDLE_FOR1:  	SUB     R2, 0x01
(0066)                            ||              
(0067)  CS-0x023  0x36324         || 		MOV     R3, INSIDE_FOR_COUNT
(0068)  CS-0x024  0x2C301  0x024  || INSIDE_FOR1:  	SUB     R3, 0x01
(0069)  CS-0x025  0x08123         || 		BRNE    INSIDE_FOR1
(0070)                            || 
(0071)  CS-0x026  0x22200         || 		OR      R2, 0x00
(0072)  CS-0x027  0x08113         || 		BRNE    MIDDLE_FOR1
(0073)                            || 
(0074)  CS-0x028  0x22100         || 		OR      R1, 0x00
(0075)  CS-0x029  0x08103         || 		BRNE    OUTSIDE_FOR1
(0076)                            || 
(0077)  CS-0x02A  0x18002         || 		RET
(0078)                            || 
(0079)                            || 
(0080)                            || 
(0081)                     0x02B  || draw_dot: 
(0082)  CS-0x02B  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0083)  CS-0x02C  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0084)                            ||         ;LSR r4 ;need to get the bot 2 bits of s4 into sA
(0085)                            ||         ;BRCS dd_add40
(0086)                     0x02D  || t1:     ;LSR r4
(0087)                            ||         ;BRCS dd_add80
(0088)  CS-0x02D  0x34591  0x02D  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0089)  CS-0x02E  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0090)  CS-0x02F  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0091)  CS-0x030  0x18002         ||         RET
(0092)  CS-0x031  0x22540  0x031  || dd_add40: OR r5, 0x40
(0093)  CS-0x032  0x18000         ||         CLC
(0094)                            ||         ;BRN t1
(0095)  CS-0x033  0x22580  0x033  || dd_add80: OR r5, 0x80
(0096)  CS-0x034  0x08168         ||         BRN dd_out
(0097)                            || 
(0098)                            || 
(0099)                     0x035  || clear_square:
(0100)                            || 
(0101)  CS-0x035  0x04439         ||    MOV  R4, R7   ;y coordin
(0102)  CS-0x036  0x04541         ||    MOV  R5, R8   ;x coordin
(0103)  CS-0x037  0x36600         ||    MOV  R6, 0x00
(0104)  CS-0x038  0x08159         ||    CALL draw_dot   ;clears dot at the origin
(0105)  CS-0x039  0x18002         ||    RET
(0106)                            || 
(0107)                            || 
(0108)                     0x03A  || ISR:            
(0109)  CS-0x03A  0x081A9         ||    CALL clear_square
(0110)                            || 
(0111)                            || 
(0112)                            ||   ;CALL pause
(0113)                            ||    
(0114)  CS-0x03B  0x2C801         ||    SUB  R8, 0x01  
(0115)                            || 
(0116)                            || 
(0117)  CS-0x03C  0x04439         ||    MOV  R4, R7   ;y coordin
(0118)  CS-0x03D  0x04541         ||    MOV  R5, R8   ;x coordin
(0119)  CS-0x03E  0x366FF         ||    MOV  R6, 0xFF
(0120)  CS-0x03F  0x08159         ||    CALL draw_dot   ;draw red square at origin
(0121)                            || 
(0122)                            || 
(0123)                            ||    
(0124)  CS-0x040  0x30800         ||    CMP R8, 0x00
(0125)  CS-0x041  0x0823A         ||    BREQ DONE
(0126)                            || 
(0127)                            ||    ;CALL pause
(0128)                            || 
(0129)  CS-0x042  0x1A003         ||    RETIE
(0130)                            || 	   
(0131)                            || 
(0132)                            || 
(0133)                     0x043  || clear_end:
(0134)  CS-0x043  0x080A9         || 	CALL clear_row
(0135)  CS-0x044  0x36800         ||     MOV R8, 0x00
(0136)  CS-0x045  0x08159         ||     CALL draw_dot
(0137)  CS-0x046  0x08238         ||     BRN DONE
(0138)                            || 
(0139)  CS-0x047  0x08238  0x047  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0140)                            || 
(0141)                            || .CSEG
(0142)                       1023  || .ORG 0x3FF
(0143)  CS-0x3FF  0x081D0  0x3FF  || VECTOR:      BRN ISR
(0144)                            || 





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
CLEAR_END      0x043   (0133)  ||  
CLEAR_ROW      0x015   (0033)  ||  0039 0134 
CLEAR_SQUARE   0x035   (0099)  ||  0036 0109 
DD_ADD40       0x031   (0092)  ||  
DD_ADD80       0x033   (0095)  ||  
DD_OUT         0x02D   (0088)  ||  0096 
DONE           0x047   (0139)  ||  0055 0125 0137 0139 
DRAW_DOT       0x02B   (0081)  ||  0052 0104 0120 0136 
INSIDE_FOR1    0x024   (0068)  ||  0069 
ISR            0x03A   (0108)  ||  0143 
MAIN           0x01A   (0048)  ||  
MIDDLE_FOR1    0x022   (0065)  ||  0072 
OUTSIDE_FOR1   0x020   (0062)  ||  0075 
PAUSE          0x01F   (0059)  ||  
T1             0x02D   (0086)  ||  
VECTOR         0x3FF   (0143)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INSIDE_FOR_COUNT 0x024   (0007)  ||  0067 
LEDS           0x040   (0015)  ||  
LOOP_COUNT     0x025   (0016)  ||  
MIDDLE_FOR_COUNT 0x024   (0008)  ||  0064 
OUTSIDE_FOR_COUNT 0x024   (0009)  ||  0061 
SSEG           0x081   (0014)  ||  
VGA_COLOR      0x092   (0013)  ||  0090 
VGA_HADD       0x090   (0011)  ||  0089 
VGA_LADD       0x091   (0012)  ||  0088 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
