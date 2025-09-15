; -----------------------------------------------------------

; -----------------------------------------------------------
CHKACTLEN
; SHOWS THE MESSAGE SAYING THAT THE GAME IS OVER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------
    MOVE.L  D0,-(A7)
    MOVE.W  (LENPKMO),D0
    CMP.W   #0,D0
    BEQ     .UWIN
    MOVE.W  (LENPKMT),D0
    CMP.W   #0,D0
    BEQ     .ULOSE
    MOVE.L  D0,(A7)+
    RTS

.UWIN
    JSR STRTGAME
    JSR STOP
    TRAP    #1
    MOVE.B  #1,(DOREAD)
    MOVE.L #WINBUFF,A0
    MOVE.L #FILEPATHWIN,A1
    JSR READFILE
    TRAP    #1
    BRA     WINGAME
    
    
.ULOSE
    JSR STRTGAME
    TRAP    #1
    MOVE.B  #1,(DOREAD)
    MOVE.L #LOSEBUFF,A0
    MOVE.L #FILEPATHLOSE,A1
    JSR READFILE
    TRAP  #1
    BRA     LOSEGAME
    





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
