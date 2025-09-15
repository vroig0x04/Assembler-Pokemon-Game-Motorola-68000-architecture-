*-----------------------------------------------------------
* SYSTEM.
*-----------------------------------------------------------
    
; ----------------------------------------------------------
SYSINIT
; INITIALIZE GAME SYSTEM.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
        
    MOVE.L #KBDUPD,($80)
    MOVE.L #SCRPLOT,($84)
    MOVE.L #SCRTIM,($64)
    MOVE.B #1,(SCRCLEAR)    ; DEFAULT CLEAN SREEN (ACTIVE)
    
    JSR SCRINIT
    JSR KBDINIT
        
    MOVE.W SR,-(A7)
    ANDI.W #$D8FF,(A7)
    
    RTE

; ----------------------------------------------------------    
    
    
; ----------------------------------------------------------
SCRINIT
; INITIALIZATION OF MAIN WINDOW. DEFINES THE CURRENT SCREEN
; RESOLUTION AND THE WINDOWED MODE. ALSO ENABLES TIME INTERRUPT.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D1,-(A7)
    
    ; SET WINDOW OUTPUT
    MOVE.B #33,D0
    MOVE.L #SCRWIDTH<<16|SCRHEIGH,D1
    TRAP #15
    
    ; SET WINDOWED MODE
    MOVE.L #1,D1
    TRAP #15
    
    ; CLEAR SCREEN
    MOVE.B #11,D0
    MOVE.L #$FF00,D1
    TRAP #15
    
    ; ENABLE DOUBLE BUFFER
    MOVE.B #92,D0
    MOVE.B #17,D1
    TRAP #15 
    
    ; ENABLE TIMED INTERRUPT
    MOVE.B #32,D0
    MOVE.B #6,D1
    MOVE.B #$81,D2
    MOVE.L #20,D3   ; 50FPS 
    TRAP #15
    
    ; CLEAR INTERRUPT COUNTER
    CLR.B (SCRINTCT)
       
    MOVEM.L (A7)+,D0-D1

    RTS

; ----------------------------------------------------------

; ----------------------------------------------------------
SCRPLOT
; UPDATES THE DOUBLE BUFFER. CHANGES FROM SECUNDARY BUFFER
; PRIMARY BUFFER SHOWING WHATS ON IT.
; INPUT     : BUFFER VALUE IN A7 REGISTER
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.W D0-D1,-(A7)
    
    ; SWITCH BUFFERS
    MOVE.B #94,D0
    TRAP #15
    
    ; CLEAR HIDDEN BUFFER
    TST.B (SCRCLEAR)
    BEQ NOCLEAR
    MOVE.B #11,D0
    MOVE.W #$FF00,D1
    TRAP #15
NOCLEAR  
    MOVEM.W (A7)+,D0-D1 

    RTE

; ----------------------------------------------------------

; ----------------------------------------------------------
SCRTIM
; TIMED INTERRUPT SERVICE ROUTINE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    ADDQ.B #1,(SCRINTCT)
    ADDQ.B #1,(SCRCYCCT)
    RTE

; ----------------------------------------------------------

; ----------------------------------------------------------
KBDINIT
; INITALIZE KEYBOARD.
; INPUT     : NONE
; OUTUT     : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    CLR.B (KBDVAL)
    CLR.B (KBDEDGE)
    RTS 

; ----------------------------------------------------------

; ----------------------------------------------------------
KBDUPD
; UPDATE KEYBOARD INFO.
; 6 -> UP
; 5 -> DOWN
; 4 -> LEFT
; 3 -> RIGHT
; 2 -> SELECT
; 1 -> ATTACK
; 0 -> PAUSE
; INPUT     : NONE
; OUTUT     : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D3,-(A7)
    
    ; READ FIRST PART TO CONVERT TO FRIENDLY FORMAT
    MOVE.B  #19,D0
    MOVE.L  #KBDUP<<24+KBDDOWN<<16+KBDLEFT<<8+KBDRIGHT,D1
    TRAP    #15
    BSR     .STORE
    MOVE.L  #SELECT<<24+ATTACK<<16+PAUSE,D1
    TRAP    #15
    BSR     .STORE
    
    ; COMPUTE KBDEDGE
    MOVE.B  (KBDVAL),D0
    NOT.B   D0
    AND.B   D2,D0
    MOVE.B  D2,(KBDVAL)
    MOVE.B  D0,(KBDEDGE)
    MOVEM.L (A7)+,D0-D3
    RTE   

.STORE
    MOVE.W  #3,D3
.LOOP
    LSL.L   #8,D1
    ROXL.B  #1,D2
    DBRA.W  D3,.LOOP
    RTS  
    
; ----------------------------------------------------------



















*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
