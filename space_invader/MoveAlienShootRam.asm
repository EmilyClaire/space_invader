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

.equ END_ROW_SHIP = 0x48; the row length minus 3 times 2
.equ END_ROW_PLAYER = 0x27
.equ END_COL = 0x1D
.equ SHIP_COLOR = 0xE3;0x03 ;blue
					   ;0xE0 ;red
					   ; 0x1C    ;green
					; 0xE3 ; pink
						;0xFC ; yellow
					;0x1F aqua
.equ SHIP_BULLET_COLOR = 0x03
.equ SHIP_BULLET_RATE = 0x16
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
	MOV R12, 0xFF
	MOV R13, 0xFF
	MOV R14, 0xFF
	MOV R15, 0xFF
    MOV R31, 0x02

	MOV R30, SHIP_BULLET_RATE
	MOV R21, 0xFF
	MOV R22, 0xFF
	MOV R23, 0xFF
	MOV R24, 0xFF
	MOV R25, 0xFF
	MOV R26, 0xFF
	MOV R9, 0xFF

reset:
	    CALL clear_row
		MOV R8, END_ROW_PLAYER
		MOV R7, END_COL
		MOV R6, 0x00
reset_loop:
		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R8, 0x01
		BRNE reset_loop

		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R7, 0x01
		CMP R7, 0xFF
		BRNE reset_loop
	
		call pause

   MOV  R27, END_COL
   MOV  R28, 0x14
	MOV R6, 0xFF
	MOV R4, R27
	MOV R5, R28
	call draw_dot

   MOV  R7, 0x00
   MOV  R8, 0x00 
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

collision:
			CMP R13, R7
			BRNE collision2

			MOV R29, R12
			CMP R29, R8  ; check the front of the ship
			BREQ win

			ADD R29, R11
			CMP R29, R8		; check the middle of the ship
			BREQ win

			ADD R29, R11
			CMP R29, R8		; check the end of the ship
			BREQ win

collision2: CMP R15, R7
			BRNE collision3

			MOV R29, R14
			CMP R29, R8  ; check the front of the ship
			BREQ win2

			ADD R29, R11
			CMP R29, R8		; check the middle of the ship
			BREQ win2

			ADD R29, R11
			CMP R29, R8		; check the end of the ship
			BREQ win2
collision3: 
			CMP R27, R7
			BRNE collision_end
			
			BRN lose
			
collision_end:

main_ship:
            MOV  R4, R7   ;y coordin
			MOV  R5, R8   ;x coordin
			call draw_ship  

s_bullets_start:
			SUB R30, 0x01
			BRNE s_bullet_1
			
			ADD R9, 0x01

			CMP R9, 0x00
			BREQ start_bullet_1

			CMP R9, 0x01
			BREQ start_bullet_2

			CMP R9, 0x02
			BREQ start_bullet_3
			
			brn s_bullet_1

start_bullet_1:
			MOV R4, R22
			MOV R5, R21
			MOV R6, 0x00
			call draw_dot
			 
			MOV R30, SHIP_BULLET_RATE
			MOV R21, R8
			SUB R21, R11

			MOV R22, R7
			ADD R22, 0x01
			
			MOV R6, SHIP_BULLET_COLOR
			MOV R5, R21
			MOV R4, R22
			call draw_dot
			
			brn s_bullet_1


start_bullet_2: 
			MOV R4, R24
			MOV R5, R23
			MOV R6, 0x00
			call draw_dot

			MOV R30, SHIP_BULLET_RATE
			MOV R23, R8
			SUB R23, R11

			MOV R24, R7
			ADD R24, 0x01
			
			MOV R6, 0xe0 ;SHIP_BULLET_COLOR
			MOV R5, R24
			MOV R4, R24
			call draw_dot
			
			brn s_bullet_1


start_bullet_3: 
			MOV R4, R26
			MOV R5, R25
			MOV R6, 0x00
			call draw_dot

			MOV R30, SHIP_BULLET_RATE
			MOV R25, R8
			SUB R25, R11

			MOV R26, R7
			ADD R26, 0x01
			
			MOV R6, 0x1C ;SHIP_BULLET_COLOR
			MOV R5, R25
			MOV R4, R26
			call draw_dot
			
			MOV R9, 0xFF
			brn s_bullet_1


s_bullet_1: 

			CMP R30, SHIP_BULLET_RATE
			BRNE draw_s_bullet_1

			CMP R9, 0x00
			BREQ s_bullet_2

draw_s_bullet_1:
			MOV R4, R22
			MOV R5, R21
			MOV R6, 0x00
			call draw_dot
			
			CMP R22, END_COL
			BREQ clear_s_bullet_1

			ADD R22, 0x01
			MOV R4, R22
			MOV R5, R21
			MOV R6, SHIP_BULLET_COLOR
			call draw_dot
			brn s_bullet_2

clear_s_bullet_1: MOV R21, 0xFF
				brn s_bullet_2

s_bullet_2:	
			CMP R30, SHIP_BULLET_RATE
			BRNE draw_s_bullet_2

			CMP R9, 0x01
			BREQ s_bullet_3

draw_s_bullet_2:

			MOV R4, R24
			MOV R5, R23
			MOV R6, 0x00
			call draw_dot
			
			CMP R24, END_COL
			BREQ clear_s_bullet_2

			ADD R24, 0x01
			MOV R4, R24
			MOV R5, R23
			MOV R6, 0xE0;SHIP_BULLET_COLOR
			call draw_dot
			brn s_bullet_3

clear_s_bullet_2: MOV R23, 0xFF
				brn s_bullet_3

s_bullet_3:
			CMP R30, SHIP_BULLET_RATE
			BRNE draw_s_bullet_3

			CMP R9, 0xFF
			BREQ p_bullet_1

draw_s_bullet_3:

			MOV R4, R26
			MOV R5, R25
			MOV R6, 0x00
			call draw_dot
			
			CMP R26, END_COL
			BREQ clear_s_bullet_3

			ADD R26, 0x01
			MOV R4, R26
			MOV R6, 0x1C;SHIP_BULLET_COLOR
			call draw_dot
			brn p_bullet_1

clear_s_bullet_3: MOV R25, 0xFF
				brn p_bullet_1

p_bullet_1:
			MOV R4, R13
			MOV R5, R12
			MOV R6, 0x00
			call draw_dot

			SUB R13, 0x01
			MOV R4, R13
			MOV R6, PLAYER_BULLET_COLOR
			call draw_dot
			brn p_bullet_2

clear_bullet_1: MOV R12, 0xFF

p_bullet_2:
			MOV R4, R15
			MOV R5, R14
			MOV R6, 0x00
			call draw_dot

			CMP R15, 0x00
			BREQ clear_bullet_2

			SUB R15, 0x01
			MOV R5, R14
			MOV R4, R15
			MOV R6, PLAYER_BULLET_COLOR
			call draw_dot
		    brn main_pause

clear_bullet_2:
			MOV R14, 0xFF

main_pause:	call pause2
			

ret_pause:	
			SUB R10, 0x01
			CMP R10, 0x00
			BREQ col

end_main:	
			SUB R31, 0x01
			BRNE MAIN
			
			MOV R31, 0x02
			ADD R8, R11
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

win:    call pause
		MOV R8, END_ROW_PLAYER
		MOV R7, END_COL
		MOV R6, 0x1C ;GREEN SCREEN
reset_loop2:
		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R8, 0x01
		BRNE reset_loop2

		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R7, 0x01
		CMP R7, 0xFF
		BRNE reset_loop2
	
	    brn done
win2:   call pause
		MOV R8, END_ROW_PLAYER
		MOV R7, END_COL
		MOV R6, 0xFC ;YELLOW SCREEN
reset_loop3:
		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R8, 0x01
		BRNE reset_loop3

		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R7, 0x01
		CMP R7, 0xFF
		BRNE reset_loop3
		brn done

lose:     
		call pause
		MOV R8, END_ROW_PLAYER
		MOV R7, END_COL
		ADD R8, 0x01
		MOV R6, 0xE0 ;RED SCREEN
reset_loop4:
		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R8, 0x01
		BRNE reset_loop4

		MOV R4, R7
		MOV R5, R8
		call draw_dot
		SUB R7, 0x01
		CMP R7, 0xFF
		BRNE reset_loop4

		brn done

clear_square:

   MOV  R4, R27   ;y coordin
   MOV  R5, R28   ;x coordin
   MOV  R6, 0x00
   CALL draw_dot   ;clears dot at the origin
   RET

ISR: 

   	IN R20, INTERRUPT_ID
	OUT  R20, SSEG_VAL_ID
	
	CMP R20, 0x00
    breq testing0

   LSR R20
   BRCS moveRight

   LSR R20
   BRCS shoot   

   LSR R20  
   BREQ moveLeft

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
   MOV R6, PLAYER_BULLET_COLOR
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

