*-----------------------------------------------------------
* RANDOM NUMBER GENERATOR
*   
* It generates a pseudorandomly number specified by
* LOW limit and TOP limit. Uses a Linear Congruential Generator (LCG)
* which takes the current time in hundreths of a second as a valid
* seed. Notice that each time the subroutine GENRAN is called the seed
* changes into another one, ensureing new pseudorandomly genereted numbers 
* within that range.

* Note: This method provides random numbers from LOW limit (inclusive) 
* and TOP limit (exclusive)
* 
* INPUT:    (LOW) as low limit, (TOP) as top limit
* OUTPUT:   Random number in D1 register
*----------------------------------------------------------- 

; ----------------------------------------------------------
GENRAN
    
    MOVEM.W D0/D2-D4,-(A7)
    
    ; GET TIME SINCE MIDNIGHT (SEED)
    MOVE.B #8,D0
    TRAP #15
    MOVE.W D1,D2
    CLR.L D1
    
    ; USE LCR ALGORITHM
    MOVE.W #AMUL,D3
    MULU.W D2,D3
    ADD.W #CMUL,D3
    DIVU.W #MMOD,D3
    LSR.L #8,D3
    LSR.L #8,D3
    MOVE.W (TOP),D4
    SUB.W (LOW),D4
    DIVU.W D4,D3
    LSR.L #8,D3
    LSR.L #8,D3
    ADD.W (LOW),D3
    MOVE.W D3,D1
    
    MOVEM.W (A7)+,D0/D2-D4

    RTS
    
; ----------------------------------------------------------
















*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
