

.DSEG
.ORG 0x00




.EQU VGA_HADD = 0x90
.EQU VGA_LADD = 0x91
.EQU VGA_COLOR = 0x92
.EQU SSEG = 0x81
.EQU LEDS = 0x40
.equ loop_count = 0xFF     ; extend the loop count


.CSEG
.ORG 0x10

   SEI
   MOV  R0, 0x00
   MOV  R1, 0x00
   MOV  R7, 0x0F
   MOV  R8, 0x14 


              ;illuminate LD7 when interrupts are on
MAIN:        
 MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0xFF
   CALL draw_dot   ;draw red square at origin



	          BRN  FOR

              ;LD7 is off when interrutps are disabled
BACK1:        
			  
	          MOV  R11, loop_count  ;set outside for loop count
              BRN FOR2
              BRN MAIN

FOR:
outside_for1: SUB     R11, 0x01
              MOV     R12, loop_count   ;set middle for loop count
middle_for1:  SUB     R12, 0x01
             
              MOV     R13, loop_count   ;set inside for loop count
inside_for1:  SUB     R13, 0x01
              
              MOV     R31,0xFF          ;empty instructions to slow things down
	          MOV     R31,0xFF          ;when interrupts are enabled to allow
              MOV     R31,0xFF          ;button presses
              MOV     R31,0xFF
              MOV     R31,0xFF
              MOV     R31,0xFF

              BRNE    inside_for1
             
              OR      R12, 0x00         ;load flags for middle for counter
              BRNE    middle_for1
             
              OR      R11, 0x00         ;load flags for outsde for counter value
              BRNE    outside_for1
BRN BACK1

FOR2:
outside_for: SUB     R11, 0x01
             MOV     R12, loop_count   ;set middle for loop count
middle_for:  SUB     R12, 0x01
             
             MOV     R13, loop_count   ;set inside for loop count
inside_for:  SUB     R13, 0x01
             BRNE    inside_for
             
             OR      R12, 0x00         ;load flags for middle for counter
             BRNE    middle_for
             
             OR      R11, 0x00         ;load flags for outsde for counter value
             BRNE    outside_for
             BRN MAIN



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





ISR:            MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0x00
   CALL draw_dot   ;draw red square at origin


   BRN FOR ;
    
   MOV  R4, R7   ;y coordin
   MOV  R5, R8   ;x coordin
   MOV  R6, 0x03
   CALL draw_dot   ;draw red square at origin


   BRN FOR ;

   RETIE
	   


DONE:        BRN DONE                  ;ALL DONE, NO MORE INTERRUPTS!

.CSEG
.ORG 0x3FF
VECTOR:      BRN ISR

