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
.EQU PLAYER_COLOR = 0xFF
.equ SHIP_BULLET_COLOR = 0x03
.equ PLAYER_BULLET_COLOR = 0xFC

.equ SHIP_BULLET_RATE = 0x12


.EQU SHIP_X_LOC = 0x0C
.EQU SHIP_Y_LOC = 0x0A
.EQU SHIP_COLOR_LOC = 0x0B

.EQU PLAYER_X_LOC = 0x10
.EQU PLAYER_COLOR_LOC = 0x0F

.EQU SHIP_BULLETS_LOC = 0x20
.EQU PLAYER_BULLETS_LOC = 0x40
.EQU BULLETS_END_LOC = 0x4A

.EQU INTERRUPT_ID  = 0x20
.equ SSEG_CNTR_ID = 0x60
.equ SSEG_VAL_ID  = 0x80

.CSEG
.ORG 0x10

   SEI


MOV R2, 0x81
OUT R2, SSEG_CNTR_ID
	MOV R16, 0x00	
    MOV R31, 0x02
	MOV R30, SHIP_BULLET_RATE
	MOV  R10, END_ROW_SHIP
	MOV R11, 0x01   
	MOV R3, 0x03
	
reset:
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
		MOV R8, END_ROW_PLAYER
		SUB R7, 0x01
		CMP R7, 0xFF
		BRNE reset_loop

		call reset_player
		call reset_ship
		call reset_bullets
	
		call pause

		call draw_player
		call draw_ship

start:

		brn done
;---------------------------------------------------------------------
;							Reset Player
;
;	Sets the player location to the middle of the bottom row
;	does not draw the player
;---------------------------------------------------------------------

reset_player:
			MOV R9, 0x14
			MOV R29, PLAYER_X_LOC
			MOV R3, 0x03

reset_player_loop:
			ST R9, (R29)
			ADD R9, 0x01
			ADD R29, 0x01
			SUB R3, 0x01
			BRNE reset_player_loop

			ret


;---------------------------------------------------------------------
;							Draw Player
;---------------------------------------------------------------------

draw_player:
			  	MOV R25, PLAYER_X_LOC
				MOV R4,  END_COL
				MOV R6, PLAYER_COLOR
				MOV R3, 0x03

draw_player_loop:
				LD R5, (R25)
				call draw_dot

				ADD R25, 0x01
				SUB R3, 0x01
				BRNE draw_player_loop
				
				ret


;---------------------------------------------------------------------
;							Move Player
;---------------------------------------------------------------------

move_player:
				call clear_player

			  	MOV R25, PLAYER_X_LOC
				MOV R4,  END_COL
				MOV R6, PLAYER_COLOR
				MOV R3, 0x03

				LD R9, (R25)
				CMP R12, 0x01
				BRNE test_left_player

test_right_player:
				CMP R9, END_ROW_SHIP
				BRNE move_player_loop
				brn end_move_player

test_left_player:
				CMP R9, 0x00
				BREQ end_move_player
				
move_player_loop:
				LD R9, (R25)
				ADD R9, R12
				ST R9, (R25)
				MOV R5, R9
				call draw_dot

				ADD R25, 0x01
				SUB R3, 0x01
				BRNE move_player_loop
				
end_move_player:
				ret

;---------------------------------------------------------------------
;							Clear Player
;---------------------------------------------------------------------

clear_player: 
				MOV R25, PLAYER_X_LOC
				MOV R4, END_COL
				MOV R6, 0x00

				MOV R3, 0x03

clear_player_loop:
				LD R5, (R25)
				call draw_dot

				ADD R25, 0x01
				SUB R3, 0x01
				BRNE clear_player_loop
				
				ret

;---------------------------------------------------------------------
;							Draw Ship
;---------------------------------------------------------------------
draw_ship:
			  	MOV R24, SHIP_Y_LOC
				MOV R25, SHIP_X_LOC
				MOV R6, SHIP_COLOR
				MOV R3, 0x03

draw_ship_loop:
				LD R4, (R24)
				LD R5, (R25)
				call draw_dot

				ADD R25, 0x01
				SUB R3, 0x01
				BRNE draw_ship_loop
				
				ret

;---------------------------------------------------------------------
;							Clear Ship
;---------------------------------------------------------------------

clear_ship: 
				MOV R24, SHIP_Y_LOC
				MOV R25, SHIP_X_LOC
				MOV R6, 0x00

				MOV R3, 0x03

clear_ship_loop:
				LD R4, (R24)
				LD R5, (R25)
				call draw_dot

				ADD R25, 0x01
				SUB R3, 0x01
				BRNE clear_ship_loop
				
				ret

;---------------------------------------------------------------------
;							Reset Ship
;---------------------------------------------------------------------

reset_ship: 
				MOV R0, 0x00	
				MOV R24, SHIP_X_LOC
				ST R0, SHIP_Y_LOC
				MOV R3, 0x03

reset_ship_loop:
				ST R0, (R24)
				ADD R24, 0x01
				ADD R0, 0x01
				SUB R3, 0x01
				BRNE reset_ship_loop
				
				ret

;---------------------------------------------------------------------
;							Reset Bullets
;---------------------------------------------------------------------

reset_bullets:  
				MOV R0, 0xFF
				MOV R24, SHIP_BULLETS_LOC

reset_bullets_loop:
				CMP R24, BULLETS_END_LOC
				BREQ end_reset_bullets
				
				ST R0, (R24)
				ADD R24, 0x01
				BRN reset_bullets_loop
				
end_reset_bullets:
				ret


;---------------------------------------------------------------------
;							Draw Dot
;---------------------------------------------------------------------

draw_dot: 
        AND r5, 0x3F ; make sure top 2 bits cleared
        AND r4, 0x1F ; make sure top 3 bits cleared

dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
        OUT r4, VGA_HADD ; write top 3 address bits to register
        OUT r6, VGA_COLOR ; write data to frame buffer
        RET
	   

;---------------------------------------------------------------------
;							Done
;
; 	Don't do anything anymore
;---------------------------------------------------------------------

DONE:        BRN DONE


;---------------------------------------------------------------------
;							Pause
;
;	a long pause
;---------------------------------------------------------------------

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

;---------------------------------------------------------------------
;							Pause2
;
;	a shorter pause
;---------------------------------------------------------------------


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
    MOV R12, 0xFF
	call move_player

	brn ISR_END

moveRight:
	MOV R12, 0x01
	
	call move_player

	brn ISR_END
ISR_END:
		RETIE

.CSEG
.ORG 0x3FF
VECTOR:      BRN ISR

