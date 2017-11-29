
 add_fsm_encoding \
       {spiCtrl.pState} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} }

 add_fsm_encoding \
       {Binary_To_BCD.STATE} \
       { }  \
       {{000 000} {001 001} {010 011} {011 010} {110 100} }

 add_fsm_encoding \
       {pmod_step_driver.present_state} \
       { }  \
       {{000 000} {001 100} {010 010} {011 011} {110 001} }

 add_fsm_encoding \
       {db_1shot_FSM.PS} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }
