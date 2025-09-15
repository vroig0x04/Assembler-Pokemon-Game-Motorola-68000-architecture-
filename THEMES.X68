*-----------------------------------------------------------
* POKEMON THEMES
*-----------------------------------------------------------

; ----------------------------------------------------------
INITTHM
; INITZIALICE ALL THE THEMES TO BE USED. (FAILED ON DIRECTX)
; ONLY ONE SOUND MAY BE PLAYED AT ONCE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.W D0-D2,-(A7)
    
    CLR.B D1
    MOVE.W #6,D2
    LEA.L PTRTHEME,A0
    MOVE.B #71,D0
    
.GETTHM
    
    MOVEA.L (A0)+,A1
    TRAP #15
    ADDQ.B #1,D1
    DBRA D2,.GETTHM
    
    MOVEM.W (A7)+,D0-D2
    RTS

; ----------------------------------------------------------


; ----------------------------------------------------------
STOP
; STOPS THE CURRENT PLAYING THEME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1
    MOVE.L #2,D2
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS

; ----------------------------------------------------------



; ----------------------------------------------------------
MAINTHM
; PLAYS THE MAIN MUSIC PANEL
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #0,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2    ; PLAY MAIN TITLE SOUND LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2 
    RTS

; ----------------------------------------------------------


; ----------------------------------------------------------
PLAYBLUE
; PLAYS THE CHAMPION BLUE MUSIC 
; INPUT     : D0 = 0 TO STOP, DIFFERNT THAN 0  TO PLAY SOUND
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #1,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2    ; PLAY BLUE THEME LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS
    
; ----------------------------------------------------------



; ----------------------------------------------------------
PLAYN
; PLAYS N FINAL BATTLE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #2,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2            ; PLAY N THEME LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS

; ----------------------------------------------------------



; ----------------------------------------------------------
PLAYNEO
; PLAYS NEO TEAM PLASMA THEME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #4,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2    ; PLAY NEO THEME LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS

; ----------------------------------------------------------

; ----------------------------------------------------------
PLAYRESH
; PLAYS THE RESHIRAM THEME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #5,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2    ; PLAY RESHIRAM THEME LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS

; ----------------------------------------------------------

; ----------------------------------------------------------
PLAYELIT
; PLAYS THE ELITE FOUR THEME
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #3,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2    ; PLAY ELITE FOUR THEME LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS

; ----------------------------------------------------------

; ----------------------------------------------------------
PLAYDMG
; PLAYS THE MAIN MUSIC PANEL
; INPUT     : D0 = 0 TO STOP, DIFFERNT THAN 0  TO PLAY SOUND
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D2,-(A7)
    
    MOVE.B #6,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1    
    MOVE.L #1,D2    ; PLAY BLUE THEME LOOP
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2
    RTS

; ----------------------------------------------------------

; ----------------------------------------------------------
WINTHEME
; PLAYS THE MAIN MUSIC PANEL
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D2,-(A7)

    MOVE.B #6,(REFSOUND)    ; STORE REFERENCE
    MOVE.B #76,D0
    MOVE.B (REFSOUND),D1
    MOVE.L #1,D2    ; PLAY MAIN TITLE SOUND LOOP
    TRAP #15

    MOVEM.L (A7)+,D0-D2 
    RTS

; ----------------------------------------------------------



*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
