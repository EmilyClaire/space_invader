

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
(0022)                            || ;R0 is for status
(0023)                            || ;R1 is for interrupt count
(0024)                            || ;r2 is keyboard input
(0025)                            || ;r4 is for y
(0026)                            || ;r5 is for x
(0027)                            || ;r6 is for color
(0028)                            || ;r7 temp y
(0029)                            || ;r8 temp x
(0030)                            || 
(0031)                     0x010  || init:
(0032)  CS-0x010  0x36000         ||    MOV  R0, 0x00
(0033)  CS-0x011  0x36100         ||    MOV  R1, 0x00
(0034)  CS-0x012  0x3670F         ||    MOV  R7, 0x0F
(0035)  CS-0x013  0x36814         ||    MOV  R8, 0x14
(0036)  CS-0x014  0x04439         ||    MOV  R4, R7   ;y coordin
(0037)  CS-0x015  0x04541         ||    MOV  R5, R8   ;x coordin
(0038)  CS-0x016  0x366E0         ||    MOV  R6, 0xE0
(0039)  CS-0x017  0x08111         ||    CALL draw_dot   ;draw red square at origin
(0040)  CS-0x018  0x36000         ||    MOV  R0, 0x00
(0041)  CS-0x019  0x36100         ||    MOV  R1, 0x00
(0042)  CS-0x01A  0x36710         ||    MOV  R7, 0x10
(0043)  CS-0x01B  0x36815         ||    MOV  R8, 0x15
(0044)  CS-0x01C  0x04439         ||    MOV  R4, R7   ;y coordin
(0045)  CS-0x01D  0x04541         ||    MOV  R5, R8   ;x coordin
(0046)  CS-0x01E  0x366E0         ||    MOV  R6, 0xE0
(0047)  CS-0x01F  0x08111         ||    CALL draw_dot   ;draw red square at origin
(0048)                            ||       
(0049)                     0x020  || main:
(0050)  CS-0x020  0x30001         ||    CMP  R0, 0x01
(0051)  CS-0x021  0x08100         ||    BRN  main   ; continuous loop waiting for interrupts
(0052)                            ||    
(0053)                            || 
(0054)                            || ; --------------------------------------------------------------------
(0055)                            || ; function draw_dot
(0056)                            || ; --------------------------------------------------------------------
(0057)                     0x022  || draw_dot: 
(0058)  CS-0x022  0x2053F         ||         AND r5, 0x3F ; make sure top 2 bits cleared
(0059)  CS-0x023  0x2041F         ||         AND r4, 0x1F ; make sure top 3 bits cleared
(0060)  CS-0x024  0x10401         ||         LSR r4 ;need to get the bot 2 bits of s4 into sA
(0061)  CS-0x025  0x0A160         ||         BRCS dd_add40
(0062)  CS-0x026  0x10401  0x026  || t1:     LSR r4
(0063)  CS-0x027  0x0A178         ||         BRCS dd_add80
(0064)  CS-0x028  0x34591  0x028  || dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
(0065)  CS-0x029  0x34490         ||         OUT r4, VGA_HADD ; write top 3 address bits to register
(0066)  CS-0x02A  0x34692         ||         OUT r6, VGA_COLOR ; write data to frame buffer
(0067)  CS-0x02B  0x18002         ||         RET
(0068)  CS-0x02C  0x22540  0x02C  || dd_add40: OR r5, 0x40
(0069)  CS-0x02D  0x18000         ||         CLC
(0070)  CS-0x02E  0x08130         ||         BRN t1
(0071)  CS-0x02F  0x22580  0x02F  || dd_add80: OR r5, 0x80
(0072)  CS-0x030  0x08140         ||         BRN dd_out
(0073)                            || 





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
DD_ADD40       0x02C   (0068)  ||  0061 
DD_ADD80       0x02F   (0071)  ||  0063 
DD_OUT         0x028   (0064)  ||  0072 
DRAW_DOT       0x022   (0057)  ||  0039 0047 
INIT           0x010   (0031)  ||  
MAIN           0x020   (0049)  ||  0051 
T1             0x026   (0062)  ||  0070 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LEDS           0x040   (0019)  ||  
SSEG           0x081   (0018)  ||  
VGA_COLOR      0x092   (0017)  ||  0066 
VGA_HADD       0x090   (0015)  ||  0065 
VGA_LADD       0x091   (0016)  ||  0064 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
