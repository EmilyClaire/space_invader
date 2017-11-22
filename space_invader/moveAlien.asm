.DSEG
.ORG 0x00

.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92
.EQU LEDS = 0x40

.EQU INSIDE_FOR_COUNT    = 	0x2f
.EQU MIDDLE_FOR_COUNT    = 0x2f
.EQU OUTSIDE_FOR_COUNT   = 0x2f

.equ END_ROW = 0x25
.equ END_COL = 0x1D
.equ SHIP_COLOR = 0xE0;0x03 ;blue
					   ;0xE0 ;red
					   ; 0x1C    ;green

.EQU INTERRUPT_ID  = 0x20

.equ SSEG_CNTR_ID = 0x60
.equ SSEG_VAL_ID  = 0x80

.CSEG
.ORG 0x10

   SEI

MOV R2, 0x81
OUT R2, SSEG_CNTR_ID
reset:
	    CALL clear_row
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

   MOV  R27, 0x1B
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






clear_row:

   
   CALL clear_square
   SUB R8, 0x01
   CMP R8, 0xFF
   BRNE clear_row
   RET








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

;		mov r29, 0x01
;		mov r30, 0x02
 ;       mov r31, 0x03

ISR: 
   IN R22, INTERRUPT_ID
	OUT  R22, SSEG_VAL_ID

	cmp r22, 0x00
    breq testing0

	cmp r22, 0x05
	breq testing5

   CMP R22, 0x03
   BREQ shoot

   CMP R22, 0x15
   BREQ moveLeft   

   CMP R22, 0x01  
   BREQ moveRight

   brn ISR_END

testing0: 
   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin

	mov r6, 0x03
    call draw_dot
	call pause
	mov r6, 0xff
	call draw_dot
    brn isr_end



testing5: 
   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin

	mov r6, 0x1c
    call draw_dot
	call pause
	mov r6, 0xff
	call draw_dot
    brn isr_end


shoot: 
   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin

	  mov R6, 0xE0
	  call draw_dot
      call pause
	  mov R6, 0xFF
      call draw_dot
	  brn ISR_END

moveLeft:
	CMP R28, 0x00
	BREQ ISR_END

   CALL clear_square

   
   SUB  R28, 0x01  


   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin
   brn ISR_END

moveRight:
	CMP R28, END_ROW
	BREQ ISR_END

   CALL clear_square

   
   ADD  R28, 0x01  


   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin
   
	brn ISR_END
ISR_END:
		RETIE

.CSEG
.ORG 0x3FF
VECTOR:      BRN ISR

