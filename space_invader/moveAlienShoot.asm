.DSEG
.ORG 0x00

.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92

.EQU INSIDE_FOR_COUNT    = 	0x2f
.EQU MIDDLE_FOR_COUNT    = 0x2f
.EQU OUTSIDE_FOR_COUNT   = 0x2f

.EQU INSIDE_FOR_COUNT2    = 	0x1f
.EQU MIDDLE_FOR_COUNT2    = 0x1f
.EQU OUTSIDE_FOR_COUNT2   = 0x1f

.equ END_ROW_SHIP = 0x24
.equ END_ROW_PLAYER = 0x27
.equ END_COL = 0x1D
.equ SHIP_COLOR = 0xE3;0x03 ;blue
					   ;0xE0 ;red
					   ; 0x1C    ;green
					; 0xE3 ; pink
						;0xFC ; yellow
					;0x1F aqua

.equ PLAYER_BULLET_COLOR = 0xFC
.EQU INTERRUPT_ID  = 0x20

.equ SSEG_CNTR_ID = 0x60
.equ SSEG_VAL_ID  = 0x80

.CSEG
.ORG 0x10

   SEI


MOV R2, 0x81
OUT R2, SSEG_CNTR_ID
	MOV R16, 0x00	
	MOV R12, 0x00
	MOV R13, 0x00
	MOV R14, 0x00
	MOV R15, 0x00

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

   MOV  R27, END_COL
	SUB R27, 0x01
   MOV  R28, 0x14
	MOV R6, 0xFF
	MOV R4, R27
	MOV R5, R28
	call draw_dot

   MOV  R7, 0x00
   MOV  R8, 0x01 
   MOV  R10, END_ROW_SHIP
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
			MOV R4, R13
			MOV R5, R12
			MOV R6, 0x00
			call draw_dot

			CMP R13, 0x00
			BREQ p_bullet_2

			SUB R13, 0x01
			MOV R4, R13
			MOV R6, PLAYER_BULLET_COLOR
			call draw_dot

p_bullet_2:
			MOV R4, R15
			MOV R5, R14
			MOV R6, 0x00
			call draw_dot

			CMP R15, 0x00
			BREQ main_ship

			SUB R15, 0x01
			MOV R5, R14
			MOV R4, R15
			MOV R6, SHIP_COLOR
			call draw_dot
								
main_ship:
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
			MOV R10, END_ROW_SHIP
			CMP R7, END_COL
			BREQ DONE
			
			CMP R11, 0x01
			BREQ set_neg
	
			MOV R11, 0x01
			call clear_ship
			MOV R8, 0x01
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

pause2:	    	MOV     R17, OUTSIDE_FOR_COUNT2  
outside_for: 	SUB     R17, 0x01

             	MOV     R18, MIDDLE_FOR_COUNT2   
middle_for:  	SUB     R18, 0x01
             
             	MOV     R19, INSIDE_FOR_COUNT2   
inside_for:  	SUB     R19, 0x01
             	BRNE    inside_for
             
             	or     R18, 0x00              
             	BRNE    middle_for
             
             	CMP      R17, 0x00               
             	BRNE    outside_for
				ret
clear_square:

   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0x00
   CALL draw_dot   ;clears dot at the origin
   RET

ISR: 
   	IN R20, INTERRUPT_ID
	OUT  R20, SSEG_VAL_ID

	cmp R20, 0x00
    breq testing0

	CMP R20, 0x03
	breq testing5

   CMP R20, 0x05
   BREQ shoot

   CMP R20, 0x02
   BREQ moveLeft   

   CMP R20, 0x01  
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
   
	CMP R16, 0x01
	BREQ second_bullet

	MOV R4, R13
	MOV R5, R12
	MOV R6, 0x00
	call draw_dot

   Mov R13, R27
   SUB R13, 0x01

   MOV R12, R28

   MOV R4, R13
   MOV R5, R12
   MOV R6, PLAYER_BULLET_COLOR
   call draw_dot

   ADD R16, 0x01
   
   BRN animation

second_bullet:		   
	MOV R4, R15
	MOV R5, R14
	MOV R6, 0x00
	call draw_dot

	MOV R15, R27
	SUB R15, 0x01

	MOV R14, R28	

   MOV R4, R15
   MOV R5, R14
   MOV R6, SHIP_COLOR
   call draw_dot

   SUB R16, 0x01

animation:
   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin

	  mov R6, 0xE0
	  call draw_dot
      call pause2
	  mov R6, 0xFF
      call draw_dot
	  brn ISR_END

moveLeft:
	CMP R28, 0x01
	BREQ ISR_END

   CALL clear_square
   
   SUB  R28, 0x01  

   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin
   brn ISR_END

moveRight:
	CMP R28, END_ROW_PLAYER
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

