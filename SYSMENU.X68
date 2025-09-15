;-----------------------------------------------------------
SELMENU
;-----------------------------------------------------------
        CMP.B #1,(ACTVEN)
        BEQ     .VEN
        CMP.B  #1,(ACTCHAR)
        BEQ     .CHAR
        CMP.B  #1,(ACTBLAST)
        BEQ     .BLAS
        RTS
.VEN
        LEA.L MENUVENV,A0
        LEA.L MENUVEN,A1
        RTS
.CHAR   
        LEA.L MENUCHARV,A0
        LEA.L MENUCHAR,A1
        RTS
.BLAS
        LEA.L MENUBLASV,A0
        LEA.L MENUBLAS,A1
        RTS



;-----------------------------------------------------------
CHGMENU
;-----------------------------------------------------------
; CHANGE MOVEMENTS OF POKEMON WHEN 1 OF YOUR POKEMON DIE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
        
        MOVE.W  #1,D0
        CMP.B   #1,(DEFEATPKM)
        BEQ     .ACT
        RTS
.ACT
        JSR UPDACTIVE
.LOOP
        CMP.B #1,(ACTVEN)
        BEQ     .VEN
        CMP.B  #1,(ACTCHAR)
        BEQ     .CHAR
        CMP.B  #1,(ACTBLAST)
        BEQ     .BLAS
        MOVE.B  #0,(DEFEATPKM)
        MOVE.B  #1,(ACTBLAST)
        DBRA    D0,.LOOP
        RTS
        
.VEN
        LEA.L MENUVENV,A0
        LEA.L MENUVEN,A1
        JSR MENUINIT
        MOVE.B  #0,(DEFEATPKM)
        RTS
.CHAR   
        LEA.L MENUCHARV,A0
        LEA.L MENUCHAR,A1
        JSR MENUINIT
        MOVE.B  #0,(DEFEATPKM)
        RTS
.BLAS
        LEA.L MENUBLASV,A0
        LEA.L MENUBLAS,A1
        JSR MENUINIT
        MOVE.B  #0,(DEFEATPKM)
        RTS

UPDACTIVE
        CMP.B #1,(ACTVEN)
        BEQ .UPDVEN
        CMP.B  #1,(ACTCHAR)
        BEQ .UPDCHAR
        CMP.B  #1,(ACTBLAST)
        BEQ     .UPDBLAS
        RTS
.UPDVEN
        ADDQ.B  #1,(ACTVEN)
        ADDQ.B  #1,(ACTCHAR)
        RTS
.UPDCHAR
        ADDQ.B  #1,(ACTCHAR)
        ADDQ.B  #1,(ACTVEN)
        RTS
.UPDBLAS
        ADDQ.B  #1,(ACTBLAST)
        ADDQ.B  #1,(ACTVEN)
        RTS

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
