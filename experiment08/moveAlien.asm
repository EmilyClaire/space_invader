.DSEG
.ORG 0x00

.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92
.EQU SSEG = 0x81
.EQU LEDS = 0x40

.EQU INSIDE_FOR_COUNT    = 	0x2f
.EQU MIDDLE_FOR_COUNT    = 0x2f
.EQU OUTSIDE_FOR_COUNT   = 0x2f

.equ END_ROW = 0x25
.equ END_COL = 0x1D
.equ SHIP_COLOR = 0xE0;0x03 ;blue
					   ;0xE0 ;red
					   ;     ;green

.EQU INPUT_LEFT_ID   = 0x20
.EQU INPUT_RIGHT_ID  = 0x21
.EQU INPUT_SHOOT_ID  = 0x22


.CSEG
.ORG 0x10

   SEI

reset:
		MOV R8, 0x28
		MOV R7, 0x1D
		MOV R6, 0x00
reset_loop:
		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R8, 0x01
		BRNE reset_loop

		SUB R7, 0x01
		CMP R7, 0xFF
		BRNE reset_loop
	
		call pause

   MOV  R27, 0x1D
   MOV  R28, 0x14
	MOV R6, 0xFF
	MOV R4, R27
	MOV R5, R28
	call draw_dot

   MOV  R7, 0x00
   MOV  R8, 0x00 
   MOV  R10, END_ROW
	MOV R11, 0x01
	MOV R3, 0x03
	
start:
	MOV R4, R7
	MOV R5, R8
	CALL draw_ship
	ADD R8, R11
	SUB R3, 0x01
	BRNE start

call pause
MAIN:     
			MOV  R4, R7   ;y coordin
			MOV  R5, R8   ;x coordin
			call draw_ship  
main_pause:	call pause
			

ret_pause:	SUB R10, 0x01
			CMP R10, 0x00
			BREQ col


end_main:	ADD R8, R11
			BRN MAIN

col:		ADD R7, 0x01
			MOV R10, END_ROW
			CMP R7, END_COL
			BREQ DONE
			
			CMP R11, 0x01
			BREQ set_neg
	
			MOV R11, 0x01
			call clear_ship
			MOV R8, 0x00
			MOV R3, 0x03
			BRN start

set_neg:	MOV R11, 0xFF
			CALL clear_ship
			MOV R8, 0x27
			MoV R3, 0x03
			brn start


clear_ship:
			SUB R7, 0x01
			MOV R3, 0x03
			MOV R6, 0x00
clear_loop: 
			MOV R5, R8
			MOV R4, R7
			call draw_dot
			ADD R8, R11
			SUB R3, 0x01
			CMP R3, 0x03
			BRNE clear_loop
						
			ADD R7, 0x01
			ret


draw_ship:
			MOV R5, R8
			MOV R4, R7
			MOV R6, 0x00


			CMP R11, 0xFF
			BREQ draw_neg

			SUB R5, 0x03
			brn rest

draw_neg:	ADD R5, 0x03

rest:		call draw_dot


			MOV R5, R8
			MOV R4, R7
			MOV R6, SHIP_COLOR
			call draw_dot
			ret

draw_dot: 
        AND r5, 0x3F ; make sure top 2 bits cleared
        AND r4, 0x1F ; make sure top 3 bits cleared

dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
        OUT r4, VGA_HADD ; write top 3 address bits to register
        OUT r6, VGA_COLOR ; write data to frame buffer
        RET
	   
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

clear_square:

   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0x00
   CALL draw_dot   ;clears dot at the origin
   RET


ISR:            
   CALL clear_square
   CMP R28, 0x00
   BREQ retie   
   
	SUB  R28, 0x01  


   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin
   


	RETIE

.CSEG
.ORG 0x3FF
VECTOR:      BRN ISR

