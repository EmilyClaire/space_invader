

.DSEG
.ORG 0x00




.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92
.EQU SSEG = 0x81
.EQU LEDS = 0x40

.EQU INSIDE_FOR_COUNT    = 0x2f;0xB4
.EQU MIDDLE_FOR_COUNT    = 0x2f;0xCA
.EQU OUTSIDE_FOR_COUNT   = 0x2f

.equ END_ROW = 0x27
.equ END_COL = 0x1E
.equ SHIP_COLOR = 0xE0



.CSEG
.ORG 0x10

   SEI
   MOV  R0, 0x00
   MOV  R1, 0x00
   MOV  R7, 0x00
   MOV  R8, 0x00 
   MOV  R18, END_ROW
	MOV R11, 0x01
	
MAIN:     
			MOV  R4, R7   ;y coordin
			MOV  R5, R8   ;x coordin
			CALL draw_ship   ;draw red square at origin
			call pause
			
			SUB R18, 0x01
			BREQ col


end_main:	ADD R8, R11
			BRN MAIN



col:		ADD R7, 0x01
			MOV R18, END_ROW
			CMP R7, END_COL
			BREQ DONE
			
			CMP R11, 0x01
			BREQ set_neg
	
			MOV R11, 0x01
			BRN end_main

set_neg:	MOV R11, 0xFF
			brn end_main

draw_ship:
			MOV R5, R8
			MOV R4, R7
			MOV R6, 0x00
			SUB R5, 0x03
			call draw_dot


			MOV R5, R8
			MOV R4, R7
			MOV R6, SHIP_COLOR
			call draw_dot
			ret

draw_dot: 
        AND r5, 0x3F ; make sure top 2 bits cleared
        AND r4, 0x1F ; make sure top 3 bits cleared
        LSR r4 ;need to get the bot 2 bits of s4 into sA

dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
        OUT r4, VGA_HADD ; write top 3 address bits to register
        OUT r6, VGA_COLOR ; write data to frame buffer
        RET



ISR:            MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0x00
   CALL draw_dot   ;draw red square at origin

    
   MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0x03
   CALL draw_dot   ;draw red square at origin


   RETIE
	   


DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!


pause:	    	MOV     R17, OUTSIDE_FOR_COUNT  
outside_for0: 	SUB     R17, 0x01

             	MOV     R18, MIDDLE_FOR_COUNT   
middle_for0:  	SUB     R18, 0x01
             
             	MOV     R19, INSIDE_FOR_COUNT   
inside_for0:  	SUB     R19, 0x01
             	BRNE    inside_for0
             
             	OR      R18, 0x00              
             	BRNE    middle_for0
             
             	OR      R17, 0x00               
             	BRNE    outside_for0

				ret

.CSEG
.ORG 0x3FF
VECTOR:      BRN ISR

