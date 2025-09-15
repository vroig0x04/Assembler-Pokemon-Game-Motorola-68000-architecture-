*-----------------------------------------------------------
* READS ANY GIVEN FILE
*-----------------------------------------------------------
; ----------------------------------------------------------
READFILE
; READS ANY GIVEN FILE
; INPUT     : BUFFER IN A0 AND PATH IN A1
; OUTUT     : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D4/A0-A1,-(A7)
    
    ; PREPARE THE FILE TO READ
    JSR READ
    
    ; DRAW LINE OF PIXELS
    CLR.B D0
    ; USING D1 AND D2 AS COORDINATES
    MOVE.W #0,D1
    MOVE.W #0,D2
    MOVE.W #SCRHEIGH-1,D4   ; Y ITERATIONS
    
.DRAWY

    MOVE.W #SCRWIDTH-1,D3   ; X ITERATIONS
    
    .DRAWX:
        
        MOVE.W D1,-(A7)
        CLR.L D1
        MOVE.L (A0)+,D1 ; LOAD 4 BYTES
        MOVE.B #80,D0
        TRAP #15
        MOVE.W (A7)+,D1
        
        MOVE.B #82,D0
        TRAP #15
        ADDQ.W #1,D1
        DBRA D3,.DRAWX
    
    MOVE.W #0,D1
    ADDQ.W #1,D2
    DBRA D4,.DRAWY  
        
    MOVEM.L (A7)+,D0-D4/A0-A1
    RTS


; ----------------------------------------------------------

; ----------------------------------------------------------
READ
; READS THE BINARY FILE IN ORDER TO LOAD IT TO MEMORY
; INPUT     : 'A' CHA
; OUTUT     : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D2/A1,-(A7)
    ; CLOSE ALL OPENED FILES
    MOVE.B #50,D0
    TRAP #15
    
    ; OPEN FILE (A1 POINTS TO THE FILE)
    MOVE.B #51,D0
    TRAP #15
    
    ; READ BYTES
    MOVE.L A0,A1   
.LOOP
    MOVE.B #53,D0
    MOVE.L #4,D2
    TRAP #15
    ADDA.L D2,A1
    TST.B D0    ; CHECK EOF OR ERROR
    BEQ .LOOP
    CLR.B (A1)
    
    ; FINALLY CLOSE OPENED FILE
    MOVE.B #56,D0
    TRAP #15
    
    MOVEM.L (A7)+,D0-D2/A1
    
    RTS 

; ----------------------------------------------------------








*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
