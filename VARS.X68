*-----------------------------------------------------------
* VARIABLES
*-----------------------------------------------------------
    
; --- RNG RELATED VARIABLES --------------------------------

NEWSEED         DS.W        1
LOW             DS.W        1
TOP             DS.W        1

; --- GAME RELATED VARIABLES -------------------------------

INGAME          DS.W        1
DOREAD          DS.B        1
                DS.W        0

; --- DRAWING POKEMON RELATED VARIABLES --------------------

DRAWYO          DC.W        0   ; IF 0, DRAW OPPNENT, 1 OTHERWISE
CORPKMX         DS.W        1 ; (NOT USED)   
CORPKMY         DS.W        1 ; (NOT USED)

;--- ACTIVE POKEMON RELATED VARIABLES ---------------------

ACTCHAR         DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTBLAST        DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTVEN          DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTMOLT         DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTART          DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTZAPD         DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTMEW          DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
ACTMEWT         DC.B        0 ;0 IF NOT IN COMBAT, 1 IF IS IN COMBAT
                DS.W        0

;---SELECTED MOVEMENT RELATED VARIABLES---------------------

SELLANZ         DC.B        0
SELPULS         DC.B        0
SELHIDR         DC.B        0
SELTRIT         DC.B        0
SELRAYO         DC.B        0
SELZUMB         DC.B        0
                DS.W        0
        
;---LIFE RELATED VARS --------------------------------------

OACTLIFE        DC.W        280 ;ACTUAL LIFE OF THE ACTIVE OP PKM
TACTLIFE        DC.W        280 ;ACTUAL LIFE OF THE ACTIVE TEAM PKM

; --- BATTLE POKEMON RELATED VARIABLES ---------------------

OFPKMRLS        DS.L        1   ; POINTER TO THE FIRST POKEMON OF OPPONENT
TFPKMRLS        DS.L        1   ; POINTER TO THE FIRST POKEMON PLAYER
FAINTPKM        DC.W        2   
; |
; *-----> IF 0, OPPONENT FAINTED, 1 OTHERWISE, - 1 NONE OF THEM

LENPKMO         DC.W        5   ; TOTAL POKEMON OF OPPONENT
LENPKMT         DC.W        3   ; TOTAL POKEMON OF PLAYER
TURN            DC.W        2   ; 0 IF PLAYER TURN 1 IF MACHINE TURN
NXTTURN         DC.W        2   ; 0 IF NEXT TURN IS FOR MACHINE 1 IF NEXT TURN IS FOR PLAYER
STRDDMG         DC.B        0
                DS.W        0

; --- BATTLE SOUND RELATED VARIABLES -----------------------

REFSOUND        DS.B        1 
                DS.W        0


























*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
