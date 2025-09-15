*-----------------------------------------------------------
* SYSTEM CONSTANTS
*-----------------------------------------------------------

; --- SCREEN RELATED CONSTANTS -----------------------------

SCRWIDTH        EQU         640
SCRHEIGH        EQU         480

             
; --- KEYCODES ---------------------------------------------

KBDLEFT         EQU         $25
KBDUP           EQU         $26
KBDRIGHT        EQU         $27
KBDDOWN         EQU         $28
ATTACK          EQU         'Z'
SELECT          EQU         'X'
PAUSE           EQU         ' '

; --- BITFIELD MASKS ---------------------------------------

KBDMSKLEFT      EQU         %00100000
KBDMSKUP        EQU         %10000000
KBDMSKRIGHT     EQU         %00010000
KBDMSKDOWN      EQU         %01000000
KBDMSKATTACK    EQU         %00000100
KBDMSKSELECT    EQU         %00001000
KBDMSKPAUSE     EQU         %00000001

; --- BITFIELD POSITIONS -----------------------------------

KBDPOSLEFT      EQU         5
KBDPOSUP        EQU         7
KBDPOSRIGHT     EQU         4
KBDPOSDOWN      EQU         6
KBDPOSATTACK    EQU         2
KBDPOSSELECT    EQU         3
KBDPOSPAUSE     EQU         0



*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
