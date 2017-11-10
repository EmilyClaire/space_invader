; --------------------------------------------------------------------
; A simple etch-a-sketch program to illustrate an example
; of how to write an interrupt based assembly language program that
; interfaces the keyboard and VGA.  
;
; Uses keys W, A, S, and D to move the cursor up, left, down, and right
; No reset currently implemented
;
; Author: Bridget Benson
; --------------------------------------------------------------------

.CSEG
.ORG 0x10

.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92
.EQU SSEG = 0x81
.EQU LEDS = 0x40


;R0 is for status
;R1 is for interrupt count
;r2 is keyboard input
;r4 is for y
;r5 is for x
;r6 is for color
;r7 temp y
;r8 temp x

init:
   MOV  R0, 0x00
   MOV  R1, 0x00
   MOV  R7, 0x0F
   MOV  R8, 0x14
   MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0xE0
   CALL draw_dot   ;draw red square at origin
      
main:
   CMP  R0, 0x01
   BRN  main   ; continuous loop waiting for interrupts
   

; --------------------------------------------------------------------
; function draw_dot
; --------------------------------------------------------------------
draw_dot: 
        AND r5, 0x3F ; make sure top 2 bits cleared
        AND r4, 0x1F ; make sure top 3 bits cleared
        LSR r4 ;need to get the bot 2 bits of s4 into sA
        BRCS dd_add40
t1:     LSR r4
        BRCS dd_add80
dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
        OUT r4, VGA_HADD ; write top 3 address bits to register
        OUT r6, VGA_COLOR ; write data to frame buffer
        RET
dd_add40: OR r5, 0x40
        CLC
        BRN t1
dd_add80: OR r5, 0x80
        BRN dd_out

