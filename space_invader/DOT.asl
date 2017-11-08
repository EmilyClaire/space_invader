

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
(0018)                       037  || .EQU KEYBOARD = 0x25
(0019)                       129  || .EQU SSEG = 0x81
(0020)                       064  || .EQU LEDS = 0x40
(0021)                       029  || .EQU UP = 0x1D ; 'W' 
(0022)                       028  || .EQU LEFT = 0x1C; 'A'
(0023)                       035  || .EQU RIGHT = 0x23; 'D'
(0024)                       027  || .EQU DOWN =  0x1B; 'S'
(0025)                            || 
(0026)                            || 
(0027)                            || ;R0 is for status
(0028)                            || ;R1 is for interrupt count
(0029)                            || ;r2 is keyboard input
(0030)                            || ;r4 is for y
(0031)                            || ;r5 is for x
(0032)                            || ;r6 is for color
(0033)                            || ;r7 temp y
(0034)                            || ;r8 temp x
(0035)                            || 
(0036)                     0x010  || init:
(0037)  CS-0x010  0x36000         ||    MOV  R0, 0x00
(0038)  CS-0x011  0x36100         ||    MOV  R1, 0x00
(0039)  CS-0x012  0x3670F         ||    MOV  R7, 0x0F
(0040)  CS-0x013  0x36814         ||    MOV  R8, 0x14
(0041)  CS-0x014  0x04439         ||    MOV  R4, R7   ;y coordin
(0042)  CS-0x015  0x04541         ||    MOV  R5, R8   ;x coordin
(0043)  CS-0x016  0x366E0         ||    MOV  R6, 0xE0
(0044)  CS-0x017  0x080D9         ||    CALL draw_dot   ;draw red square at origin
(0045)                            ||       
(0046)                     0x018  || main:
(0047)  CS-0x018  0x30001         ||    CMP  R0, 0x01
(0048)  CS-0x019  0x080DA         ||    BREQ CheckKeyboard
(0049)  CS-0x01A  0x080C0         ||    BRN  main   ; continuous loop waiting for interrupts
(0050)                            ||    
(0051)                            ||   
(0052)                     0x01B  || CheckKeyboard:
(0053)                            || 
(0054)                            || 
(0055)                            || 
(0056)                            || ; --------------------------------------------------------------------
(0057)                            || ; function draw_dot
(0058)                            || ; --------------------------------------------------------------------
(0059)                     0x01B  || draw_dot: 
(0060)  CS-0x01B  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0061)  CS-0x01C  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0062)  CS-0x01D  0x10401         ||         LSR r4 ;need to get the bot 2 bits of s4 into sA
(0063)  CS-0x01E  0x0A128         ||         BRCS dd_add40
(0064)  CS-0x01F  0x10401  0x01F  || t1:     LSR r4
(0065)  CS-0x020  0x0A140         ||         BRCS dd_add80
(0066)  CS-0x021  0x34591  0x021  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0067)  CS-0x022  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0068)  CS-0x023  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0069)  CS-0x024  0x18002         ||         RET
(0070)  CS-0x025  0x22540  0x025  || dd_add40: OR r5, 0x40
(0071)  CS-0x026  0x18000         ||         CLC
(0072)  CS-0x027  0x080F8         ||         BRN t1
(0073)  CS-0x028  0x22580  0x028  || dd_add80: OR r5, 0x80
(0074)  CS-0x029  0x08108         ||         BRN dd_out
(0075)                            || 





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
CHECKKEYBOARD  0x01B   (0052)  ||  0048 
DD_ADD40       0x025   (0070)  ||  0063 
DD_ADD80       0x028   (0073)  ||  0065 
DD_OUT         0x021   (0066)  ||  0074 
DRAW_DOT       0x01B   (0059)  ||  0044 
INIT           0x010   (0036)  ||  
MAIN           0x018   (0046)  ||  0049 
T1             0x01F   (0064)  ||  0072 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
DOWN           0x01B   (0024)  ||  
KEYBOARD       0x025   (0018)  ||  
LEDS           0x040   (0020)  ||  
LEFT           0x01C   (0022)  ||  
RIGHT          0x023   (0023)  ||  
SSEG           0x081   (0019)  ||  
UP             0x01D   (0021)  ||  
VGA_COLOR      0x092   (0017)  ||  0068 
VGA_HADD       0x090   (0015)  ||  0067 
VGA_LADD       0x091   (0016)  ||  0066 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
