

.DSEG
.ORG 0x00


.EQU INSIDE_FOR_COUNT    = 0x24 ;
.EQU MIDDLE_FOR_COUNT    = 0x24 ;
.EQU OUTSIDE_FOR_COUNT   = 0x24 ;


.EQU INPUT_LEFT_ID   = 0x20
.EQU INPUT_RIGHT_ID  = 0x21
.EQU INPUT_SHOOT_ID  = 0x22

.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92
.EQU SSEG = 0x81
.EQU LEDS = 0x40
.equ loop_count = 0x25     ; extend the loop count


.CSEG
.ORG 0x10

   SEI

   MOV  R0, 0x00
   MOV  R1, 0x00
   MOV  R7, 0x1D



   MOV R8, 0x28


clear_row:

   
   CALL clear_square
   SUB R8, 0x01
   CMP R8, 0xFF
   BRNE clear_row




   MOV  R8, 0x14


             
MAIN:        
   MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin


   BRN DONE
	;CALL pause


pause: 
;-HOLD-DELAY-1-----------------------------------------------------------
		MOV     R1, OUTSIDE_FOR_COUNT
OUTSIDE_FOR1: 	SUB     R1, 0x01
 
		MOV     R2, MIDDLE_FOR_COUNT
MIDDLE_FOR1:  	SUB     R2, 0x01
             
		MOV     R3, INSIDE_FOR_COUNT
INSIDE_FOR1:  	SUB     R3, 0x01
		BRNE    INSIDE_FOR1

		OR      R2, 0x00
		BRNE    MIDDLE_FOR1

		OR      R1, 0x00
		BRNE    OUTSIDE_FOR1

		RET



draw_dot: 
        AND r5, 0x3F ; make sure top 2 bits cleared
        AND r4, 0x1F ; make sure top 3 bits cleared
        ;LSR r4 ;need to get the bot 2 bits of s4 into sA
        ;BRCS dd_add40
t1:     ;LSR r4
        ;BRCS dd_add80
dd_out: OUT r5, VGA_LADD ; write bot 8 address bits to register
        OUT r4, VGA_HADD ; write top 3 address bits to register
        OUT r6, VGA_COLOR ; write data to frame buffer
        RET
dd_add40: OR r5, 0x40
        CLC
        ;BRN t1
dd_add80: OR r5, 0x80
        BRN dd_out


clear_square:

   MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0x00
   CALL draw_dot   ;clears dot at the origin
   RET


ISR:            
   CALL clear_square


  ;CALL pause
   
   SUB  R8, 0x01  


   MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin


   
   CMP R8, 0x00
   BREQ DONE

   ;CALL pause

   RETIE
	   




DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!

.CSEG
.ORG 0x3FF
VECTOR:      BRN ISR

