*-----------------------------------------------------------
* LOADING GAME SCREEN
*-----------------------------------------------------------  
   
; ----------------------------------------------------------
LOADGAME
; SHOWS A SCREEN MESSAGE TO USER WHILE AWAITING THE
; GAME TO BE SET UP
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------
    JSR     MAINTHM
    MOVE.B  #1,(DOREAD)
    MOVE.L #BUFFERL,A0
    MOVE.L #FILEPATH,A1
    JSR READFILE
    RTS
    
; -----------------------------------------------------------

; ----------------------------------------------------------
STRTGAME
; SHOWS THE MESSAGE TO START THE GAME IN LOADED SCREEN 
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------
    
    MOVEM.W D0-D4,-(A7)
    
    ; SET PEN COLOR
    MOVE.B #80,D0
    MOVE.L #$00000000,D1
    TRAP #15
    
    ; SET FILL COLOR
    MOVE.B #81,D0
    MOVE.L #$00FFFFFF,D1
    TRAP #15
    
    ; DRAW WHITE RECTANGLE
    MOVE.B #87,D0
    MOVE.W #-1,D1
    MOVE.W #SCRHEIGH,D2
    MOVE.W #SCRWIDTH,D3
    MOVE.W #-1,D4
    TRAP #15
    
    MOVEM.W (A7)+,D0-D4

    RTS
    








*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
