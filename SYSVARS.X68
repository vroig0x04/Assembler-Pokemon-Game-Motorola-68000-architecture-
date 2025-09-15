*-----------------------------------------------------------
* SYSTEM VARIABLES
*-----------------------------------------------------------

; --- KEYBOARD RELATED VARIABLES ---------------------------

KBDVAL      DS.B        1       ; KEY STATE
KBDEDGE     DS.B        1       ; KEY EDGE

; --- TIME INTERRUPT RELATED VARIABLES ---------------------

SCRINTCT    DS.B        1       ; INTERRUPT COUNTER
            DS.W        0
SCRCYCCT    DS.B        1       ; FRAME COUNTER
            DS.W        0 

; --- CLEAN SCREEN RELATED VARIABLES -----------------------

SCRCLEAR    DS.B        1       ; CLEAN SCREEN
            DS.W        0      





*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
