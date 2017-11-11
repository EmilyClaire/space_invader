

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


(0001)                            || ; --------------------------------------------------------------------
(0002)                            || ; A simple etch-a-sketch program to illustrate an example
(0003)                            || ; of how to write an interrupt based assembly language program that
(0004)                            || ; interfaces the keyboard and VGA.  
(0005)                            || ;
(0006)                            || ; Uses keys W, A, S, and D to move the cursor up, left, down, and right
(0007)                            || ; No reset currently implemented
(0008)                            || ;
(0009)                            || ; Author: Bridget Benson
(0010)                            || ; --------------------------------------------------------------------
(0011)                            || 
(0012)                            || .CSEG
(0013)                       016  || .ORG 0x10
(0014)                            || 
(0015)                       144  || .EQU VGA_HADD = 0x90
(0016)                       145  || .EQU VGA_LADD = 0x91
(0017)                       146  || .EQU VGA_COLOR = 0x92
(0018)                       129  || .EQU SSEG = 0x81
(0019)                       064  || .EQU LEDS = 0x40
(0020)                            || 
(0021)                            || 
(0022)                            || ;- Looping Constants: --------------------------------------------------|
(0023)                       255  || .EQU INSIDE_FOR_COUNT    = 0xff ;
(0024)                       255  || .EQU MIDDLE_FOR_COUNT    = 0xff ;
(0025)                       255  || .EQU OUTSIDE_FOR_COUNT   = 0xff ;
(0026)                            || ;-----------------------------------------------------------------------|
(0027)                            || 
(0028)                            || ;R0 is for status
(0029)                            || ;R1 is for interrupt count
(0030)                            || ;r2 is keyboard input
(0031)                            || ;r4 is for y
(0032)                            || ;r5 is for x
(0033)                            || ;r6 is for color
(0034)                            || ;r7 temp y
(0035)                            || ;r8 temp x
(0036)                            || 
(0037)                     0x010  || main:
(0038)  CS-0x010  0x36000         ||    MOV  R0, 0x00
(0039)  CS-0x011  0x36100         ||    MOV  R1, 0x00
(0040)  CS-0x012  0x3670F         ||    MOV  R7, 0x0F
(0041)  CS-0x013  0x36814         ||    MOV  R8, 0x14
(0042)  CS-0x014  0x04439         ||    MOV  R4, R7   ;y coordin
(0043)  CS-0x015  0x04541         ||    MOV  R5, R8   ;x coordin
(0044)  CS-0x016  0x366E0         ||    MOV  R6, 0xE0
(0045)  CS-0x017  0x08159         ||    CALL draw_dot   ;draw red square at origin
(0046)                            || 
(0047)                            || 
(0048)  CS-0x018  0x081D1         || 	CALL pause ;
(0049)                            || 
(0050)  CS-0x019  0x36000         ||    MOV  R0, 0x00
(0051)  CS-0x01A  0x36100         ||    MOV  R1, 0x00
(0052)  CS-0x01B  0x3670F         ||    MOV  R7, 0x0F
(0053)  CS-0x01C  0x36814         ||    MOV  R8, 0x14
(0054)  CS-0x01D  0x04439         ||    MOV  R4, R7   ;y coordin
(0055)  CS-0x01E  0x04541         ||    MOV  R5, R8   ;x coordin
(0056)  CS-0x01F  0x36600         ||    MOV  R6, 0x00
(0057)  CS-0x020  0x08159         ||    CALL draw_dot   ;draw red square at origin
(0058)                            || 
(0059)                            || 
(0060)  CS-0x021  0x36000         ||    MOV  R0, 0x00
(0061)  CS-0x022  0x36100         ||    MOV  R1, 0x00
(0062)  CS-0x023  0x36710         ||    MOV  R7, 0x10
(0063)  CS-0x024  0x36814         ||    MOV  R8, 0x14
(0064)  CS-0x025  0x04439         ||    MOV  R4, R7   ;y coordin
(0065)  CS-0x026  0x04541         ||    MOV  R5, R8   ;x coordin
(0066)  CS-0x027  0x36603         ||    MOV  R6, 0x03
(0067)  CS-0x028  0x08159         ||    CALL draw_dot   ;draw red square at origin
(0068)                            || 
(0069)  CS-0x029  0x081D1         || 	call pause;
(0070)                            || 
(0071)                            || 
(0072)  CS-0x02A  0x08080         || 	   BRN  main   ; continuous loop waiting for interrupts
(0073)                            ||    
(0074)                            || 
(0075)                            || ; --------------------------------------------------------------------
(0076)                            || ; function draw_dot
(0077)                            || ; --------------------------------------------------------------------
(0078)                     0x02B  || draw_dot: 
(0079)  CS-0x02B  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0080)  CS-0x02C  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0081)  CS-0x02D  0x10401         ||         LSR r4 ;need to get the bot 2 bits of s4 into sA
(0082)  CS-0x02E  0x0A1A8         ||         BRCS dd_add40
(0083)  CS-0x02F  0x10401  0x02F  || t1:     LSR r4
(0084)  CS-0x030  0x0A1C0         ||         BRCS dd_add80
(0085)  CS-0x031  0x34591  0x031  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0086)  CS-0x032  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0087)  CS-0x033  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0088)  CS-0x034  0x18002         ||         RET
(0089)  CS-0x035  0x22540  0x035  || dd_add40: OR r5, 0x40
(0090)  CS-0x036  0x18000         ||         CLC
(0091)  CS-0x037  0x08178         ||         BRN t1
(0092)  CS-0x038  0x22580  0x038  || dd_add80: OR r5, 0x80
(0093)  CS-0x039  0x08188         ||         BRN dd_out
(0094)                            || 
(0095)                     0x03A  || pause: 
(0096)                            || ;-HOLD-DELAY-1-----------------------------------------------------------
(0097)  CS-0x03A  0x361FF         || 		MOV     R1, OUTSIDE_FOR_COUNT
(0098)  CS-0x03B  0x2C101  0x03B  || OUTSIDE_FOR1: 	SUB     R1, 0x01
(0099)                            ||  
(0100)  CS-0x03C  0x362FF         || 		MOV     R2, MIDDLE_FOR_COUNT
(0101)  CS-0x03D  0x2C201  0x03D  || MIDDLE_FOR1:  	SUB     R2, 0x01
(0102)                            ||              
(0103)  CS-0x03E  0x363FF         || 		MOV     R3, INSIDE_FOR_COUNT
(0104)  CS-0x03F  0x2C301  0x03F  || INSIDE_FOR1:  	SUB     R3, 0x01
(0105)  CS-0x040  0x081FB         || 		BRNE    INSIDE_FOR1
(0106)                            || 
(0107)  CS-0x041  0x22200         || 		OR      R2, 0x00
(0108)  CS-0x042  0x081EB         || 		BRNE    MIDDLE_FOR1
(0109)                            || 
(0110)  CS-0x043  0x22100         || 		OR      R1, 0x00
(0111)  CS-0x044  0x081DB         || 		BRNE    OUTSIDE_FOR1
(0112)                            || 
(0113)  CS-0x045  0x18002         || 		ret
(0114)                            || 





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
DD_ADD40       0x035   (0089)  ||  0082 
DD_ADD80       0x038   (0092)  ||  0084 
DD_OUT         0x031   (0085)  ||  0093 
DRAW_DOT       0x02B   (0078)  ||  0045 0057 0067 
INSIDE_FOR1    0x03F   (0104)  ||  0105 
MAIN           0x010   (0037)  ||  0072 
MIDDLE_FOR1    0x03D   (0101)  ||  0108 
OUTSIDE_FOR1   0x03B   (0098)  ||  0111 
PAUSE          0x03A   (0095)  ||  0048 0069 
T1             0x02F   (0083)  ||  0091 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INSIDE_FOR_COUNT 0x0FF   (0023)  ||  0103 
LEDS           0x040   (0019)  ||  
MIDDLE_FOR_COUNT 0x0FF   (0024)  ||  0100 
OUTSIDE_FOR_COUNT 0x0FF   (0025)  ||  0097 
SSEG           0x081   (0018)  ||  
VGA_COLOR      0x092   (0017)  ||  0087 
VGA_HADD       0x090   (0015)  ||  0086 
VGA_LADD       0x091   (0016)  ||  0085 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
