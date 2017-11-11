

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
(0007)                            || 
(0008)                            || 
(0009)                       144  || .EQU VGA_HADD = 0x90
(0010)                       145  || .EQU VGA_LADD = 0x91
(0011)                       146  || .EQU VGA_COLOR = 0x92
(0012)                       129  || .EQU SSEG = 0x81
(0013)                       064  || .EQU LEDS = 0x40
(0014)                       255  || .equ loop_count = 0xFF     ; extend the loop count
(0015)                            || 
(0016)                            || 
(0017)                            || .CSEG
(0018)                       016  || .ORG 0x10
(0019)                            || 
(0020)  CS-0x010  0x1A000         ||    SEI
(0021)  CS-0x011  0x36000         ||    MOV  R0, 0x00
(0022)  CS-0x012  0x36100         ||    MOV  R1, 0x00
(0023)  CS-0x013  0x3670F         ||    MOV  R7, 0x0F
(0024)  CS-0x014  0x36814         ||    MOV  R8, 0x14 
(0025)                            || 
(0026)                            || 
(0027)                            ||               ;illuminate LD7 when interrupts are on
(0028)                     0x015  || MAIN:        
(0029)  CS-0x015  0x04439         ||  MOV  R4, R7   ;y coordin
(0030)  CS-0x016  0x04541         ||    MOV  R5, R8   ;x coordin
(0031)  CS-0x017  0x366FF         ||    MOV  R6, 0xFF
(0032)  CS-0x018  0x081C9         ||    CALL draw_dot   ;draw red square at origin
(0033)                            || 
(0034)                            || 
(0035)                            || 
(0036)  CS-0x019  0x080E8         || 	          BRN  FOR
(0037)                            || 
(0038)                            ||               ;LD7 is off when interrutps are disabled
(0039)                     0x01A  || BACK1:        
(0040)                            || 			  
(0041)  CS-0x01A  0x36BFF         || 	          MOV  R11, loop_count  ;set outside for loop count
(0042)  CS-0x01B  0x08170         ||               BRN FOR2
(0043)  CS-0x01C  0x080A8         ||               BRN MAIN
(0044)                            || 
(0045)                     0x01D  || FOR:
(0046)  CS-0x01D  0x2CB01  0x01D  || outside_for1: SUB     R11, 0x01
(0047)  CS-0x01E  0x36CFF         ||               MOV     R12, loop_count   ;set middle for loop count
(0048)  CS-0x01F  0x2CC01  0x01F  || middle_for1:  SUB     R12, 0x01
(0049)                            ||              
(0050)  CS-0x020  0x36DFF         ||               MOV     R13, loop_count   ;set inside for loop count
(0051)  CS-0x021  0x2CD01  0x021  || inside_for1:  SUB     R13, 0x01
(0052)                            ||               
(0053)  CS-0x022  0x37FFF         ||               MOV     R31,0xFF          ;empty instructions to slow things down
(0054)  CS-0x023  0x37FFF         || 	          MOV     R31,0xFF          ;when interrupts are enabled to allow
(0055)  CS-0x024  0x37FFF         ||               MOV     R31,0xFF          ;button presses
(0056)  CS-0x025  0x37FFF         ||               MOV     R31,0xFF
(0057)  CS-0x026  0x37FFF         ||               MOV     R31,0xFF
(0058)  CS-0x027  0x37FFF         ||               MOV     R31,0xFF
(0059)                            || 
(0060)  CS-0x028  0x0810B         ||               BRNE    inside_for1
(0061)                            ||              
(0062)  CS-0x029  0x22C00         ||               OR      R12, 0x00         ;load flags for middle for counter
(0063)  CS-0x02A  0x080FB         ||               BRNE    middle_for1
(0064)                            ||              
(0065)  CS-0x02B  0x22B00         ||               OR      R11, 0x00         ;load flags for outsde for counter value
(0066)  CS-0x02C  0x080EB         ||               BRNE    outside_for1
(0067)  CS-0x02D  0x080D0         || BRN BACK1
(0068)                            || 
(0069)                     0x02E  || FOR2:
(0070)  CS-0x02E  0x2CB01  0x02E  || outside_for: SUB     R11, 0x01
(0071)  CS-0x02F  0x36CFF         ||              MOV     R12, loop_count   ;set middle for loop count
(0072)  CS-0x030  0x2CC01  0x030  || middle_for:  SUB     R12, 0x01
(0073)                            ||              
(0074)  CS-0x031  0x36DFF         ||              MOV     R13, loop_count   ;set inside for loop count
(0075)  CS-0x032  0x2CD01  0x032  || inside_for:  SUB     R13, 0x01
(0076)  CS-0x033  0x08193         ||              BRNE    inside_for
(0077)                            ||              
(0078)  CS-0x034  0x22C00         ||              OR      R12, 0x00         ;load flags for middle for counter
(0079)  CS-0x035  0x08183         ||              BRNE    middle_for
(0080)                            ||              
(0081)  CS-0x036  0x22B00         ||              OR      R11, 0x00         ;load flags for outsde for counter value
(0082)  CS-0x037  0x08173         ||              BRNE    outside_for
(0083)  CS-0x038  0x080A8         ||              BRN MAIN
(0084)                            || 
(0085)                            || 
(0086)                            || 
(0087)                     0x039  || draw_dot: 
(0088)  CS-0x039  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0089)  CS-0x03A  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0090)  CS-0x03B  0x10401         ||         LSR r4 ;need to get the bot 2 bits of s4 into sA
(0091)  CS-0x03C  0x0A218         ||         BRCS dd_add40
(0092)  CS-0x03D  0x10401  0x03D  || t1:     LSR r4
(0093)  CS-0x03E  0x0A230         ||         BRCS dd_add80
(0094)  CS-0x03F  0x34591  0x03F  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0095)  CS-0x040  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0096)  CS-0x041  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0097)  CS-0x042  0x18002         ||         RET
(0098)  CS-0x043  0x22540  0x043  || dd_add40: OR r5, 0x40
(0099)  CS-0x044  0x18000         ||         CLC
(0100)  CS-0x045  0x081E8         ||         BRN t1
(0101)  CS-0x046  0x22580  0x046  || dd_add80: OR r5, 0x80
(0102)  CS-0x047  0x081F8         ||         BRN dd_out
(0103)                            || 
(0104)                            || 
(0105)                            || 
(0106)                            || 
(0107)                            || 
(0108)  CS-0x048  0x04439  0x048  || ISR:            MOV  R4, R7   ;y coordin
(0109)  CS-0x049  0x04541         ||    MOV  R5, R8   ;x coordin
(0110)  CS-0x04A  0x36600         ||    MOV  R6, 0x00
(0111)  CS-0x04B  0x081C9         ||    CALL draw_dot   ;draw red square at origin
(0112)                            || 
(0113)                            || 
(0114)  CS-0x04C  0x080E8         ||    BRN FOR ;
(0115)                            ||     
(0116)  CS-0x04D  0x04439         ||    MOV  R4, R7   ;y coordin
(0117)  CS-0x04E  0x04541         ||    MOV  R5, R8   ;x coordin
(0118)  CS-0x04F  0x36603         ||    MOV  R6, 0x03
(0119)  CS-0x050  0x081C9         ||    CALL draw_dot   ;draw red square at origin
(0120)                            || 
(0121)                            || 
(0122)  CS-0x051  0x080E8         ||    BRN FOR ;
(0123)                            || 
(0124)  CS-0x052  0x1A003         ||    RETIE
(0125)                            || 	   
(0126)                            || 
(0127)                            || 
(0128)  CS-0x053  0x08298  0x053  || DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!
(0129)                            || 
(0130)                            || .CSEG
(0131)                       1023  || .ORG 0x3FF
(0132)  CS-0x3FF  0x08240  0x3FF  || VECTOR:      BRN ISR
(0133)                            || 





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
BACK1          0x01A   (0039)  ||  0067 
DD_ADD40       0x043   (0098)  ||  0091 
DD_ADD80       0x046   (0101)  ||  0093 
DD_OUT         0x03F   (0094)  ||  0102 
DONE           0x053   (0128)  ||  0128 
DRAW_DOT       0x039   (0087)  ||  0032 0111 0119 
FOR            0x01D   (0045)  ||  0036 0114 0122 
FOR2           0x02E   (0069)  ||  0042 
INSIDE_FOR     0x032   (0075)  ||  0076 
INSIDE_FOR1    0x021   (0051)  ||  0060 
ISR            0x048   (0108)  ||  0132 
MAIN           0x015   (0028)  ||  0043 0083 
MIDDLE_FOR     0x030   (0072)  ||  0079 
MIDDLE_FOR1    0x01F   (0048)  ||  0063 
OUTSIDE_FOR    0x02E   (0070)  ||  0082 
OUTSIDE_FOR1   0x01D   (0046)  ||  0066 
T1             0x03D   (0092)  ||  0100 
VECTOR         0x3FF   (0132)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LEDS           0x040   (0013)  ||  
LOOP_COUNT     0x0FF   (0014)  ||  0041 0047 0050 0071 0074 
SSEG           0x081   (0012)  ||  
VGA_COLOR      0x092   (0011)  ||  0096 
VGA_HADD       0x090   (0009)  ||  0095 
VGA_LADD       0x091   (0010)  ||  0094 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
