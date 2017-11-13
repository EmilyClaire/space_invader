.CSEG
.ORG 0x10 ; program starts here


		SEI
divide:  MOV R1, 0x03;Inputs data from address 0x99
		BRN divide

.CSEG
.ORG 0x3FF
ISR: RETID


