

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


(0001)                            || .CSEG
(0002)                       016  || .ORG 0x10 ; program starts here
(0003)                            || 
(0004)                            || 
(0005)  CS-0x010  0x1A000         || 		SEI
(0006)  CS-0x011  0x36103  0x011  || divide:  MOV R1, 0x03;Inputs data from address 0x99
(0007)  CS-0x012  0x08088         || 		BRN divide
(0008)                            || 
(0009)                            || .CSEG
(0010)                       1023  || .ORG 0x3FF
(0011)  CS-0x3FF  0x1A002  0x3FF  || ISR: RETID
(0012)                            || 
(0013)                            || 





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
DIVIDE         0x011   (0006)  ||  0007 
ISR            0x3FF   (0011)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
