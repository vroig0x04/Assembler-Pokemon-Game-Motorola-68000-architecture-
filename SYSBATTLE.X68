*-----------------------------------------------------------
* BATTLE SYSTEM
*-----------------------------------------------------------
; ----------------------------------------------------------
BTLINIT
; INITIALIZE THE BATTLE (ONLY WHEN EVERITHING IS SET UP)    
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------    
    
    ; FROM THE AVAILABLE POKEMON CHOOSE TWO FOR FIRST
    MOVEM.L D0-D4/A1,-(A7)
    MOVE.W #1,(DRAWYO)
    MOVE.W #1,(LOW)
    MOVE.W #4,(TOP)
    JSR GENRAN
    CMP.W #1,D1
    BEQ .SELBLAS
    CMP.W #2,D1
    BEQ .SELCHAR
    BNE .SELVEN
    
.SELBLAS
    
    MOVE.L (PTRBLAS),A0
    MOVE.B #1,(ACTBLAST)
    JSR DRAWPKM
    TRAP #1
    BRA .CONTO

.SELCHAR

    MOVE.L (PTRCHAR),A0
    MOVE.B #1,(ACTCHAR)
    JSR DRAWPKM
    TRAP #1
    BRA .CONTO

.SELVEN
    
    MOVE.L (PTRVEN),A0
    MOVE.B #1,(ACTVEN)
    JSR DRAWPKM
    TRAP #1
    
.CONTO   
    
    MOVE.L A0,(TFPKMRLS)    ; GET PLAYER FIRST POKEMON
  
    ; CHOOSE NOW RANDOM POKEMON TO START BATTLE WITH
    MOVE.W #0,(DRAWYO)
    MOVE.W #6,(TOP)
    JSR GENRAN
    CMP.W #1,D1
    BEQ .SELART
    CMP.W #2,D1
    BEQ .SELMOLT
    CMP.W #3,D1
    BEQ .SELZAP
    CMP.W #4,D1
    BEQ .SELMEW
    BNE .SELMEWT
    
.SELART
    JSR     PLAYBLUE
    MOVE.L (PTRART),A0
    MOVE.B #1,(ACTART)
    JSR DRAWPKM
    TRAP #1
    BRA .CONTI
   
.SELMOLT
    JSR     PLAYRESH
    MOVE.L (PTRMOLT),A0
    MOVE.B #1,(ACTMOLT)
    JSR DRAWPKM
    TRAP #1
    BRA .CONTI

.SELZAP
    JSR PLAYELIT
    MOVE.L (PTRZAP),A0
    MOVE.B #1,(ACTZAPD)
    JSR DRAWPKM
    TRAP #1
    BRA .CONTI

.SELMEW
    JSR     PLAYN
    MOVE.L (PTRMEW),A0
    MOVE.B #1,(ACTMEW)
    JSR DRAWPKM
    TRAP #1
    BRA .CONTI

.SELMEWT
    JSR     PLAYNEO
    MOVE.L (PTRMEWT),A0
    MOVE.B #1,(ACTMEWT)
    JSR DRAWPKM
    TRAP #1

.CONTI

    MOVE.L A0,(OFPKMRLS) ; GET FIRST POKEMON OF OPPONENT
          
        MOVEM.L (A7)+,D0-D4/A1
    RTS
; ----------------------------------------------------------

; ----------------------------------------------------------
BTLUPD
; CONTROLS AND MANAGES THE BATTLE OF POKEMONS    
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    

    ; MUST CHECK TURN TO PLAY
    MOVE.W  (TURN),D0
    CMP.W #0,(TURN)
    BEQ .PLYRTURN
    CMP.W #1,(TURN)
    BEQ .CPUTURN
    RTS
.PLYRTURN
    JSR     .DOATTACK  
    JSR     PSUPD
    RTS
    ;COMPUTE DAMAGE DONE TO THE OPONENTE BY THE MOVEMENT SELECTED
.DOATTACK

    MOVE.B (SELLANZ),D0
    CMP.B   #1,D0
    BEQ     DOLANZALLAMAS
    MOVE.B (SELPULS),D0
    CMP.B   #1,D0
    BEQ     DOPULSOUMBRIO
    MOVE.B (SELHIDR),D0
    CMP.B   #1,D0
    BEQ     DOHIDROPULSO
    MOVE.B (SELTRIT),D0
    CMP.B   #1,D0
    BEQ     DOTRITURAR
    MOVE.B (SELRAYO),D0
    CMP.B   #1,D0
    BEQ     DORAYOSOL
    MOVE.B (SELZUMB),D0
    CMP.B   #1,D0
    BEQ     DOZUMBIDO 
    RTS
; ----------------------------------------------------------

.CPUTURN

    JSR .ODOATCK
    JSR OPSUPD
    RTS

;CHOSES A RNDM MVMNT AND COMPUTES DAMAGE DONE TO THE OPONENTE BY THE MOVEMENT SELECTED
.ODOATCK
    MOVE.B  (ACTMOLT),D0
    CMP.B   #1,D0
    BEQ     MOLTRESATCK
    MOVE.B  (ACTART),D0
    CMP.B   #1,D0
    BEQ     ARTICUNOATCK
    MOVE.B  (ACTZAPD),D0
    CMP.B   #1,D0
    BEQ     ZAPDOSATCK
    MOVE.B  (ACTMEW),D0
    CMP.B   #1,D0
    BEQ     MEWATCK
    MOVE.B  (ACTMEWT),D0
    CMP.B   #1,D0
    BEQ     MEWTATCK
    
MOLTRESATCK

    MOVE.W #0,(LOW)
    MOVE.W #2,(TOP)
    JSR    GENRAN
    CMP.B  #0,D1
    BEQ    SOFOCO
    BRA    HIPERRAYO

ARTICUNOATCK

    MOVE.W #0,(LOW)
    MOVE.W #2,(TOP)
    JSR    GENRAN
    CMP.B  #0,D1
    BEQ    HIDROBOMBA
    BRA    HIPERRAYO
    
ZAPDOSATCK

    MOVE.W #0,(LOW)
    MOVE.W #2,(TOP)
    JSR    GENRAN
    CMP.B  #0,D1
    BEQ    TRUENO
    BRA    HIPERRAYO  
  
MEWATCK

    MOVE.W #0,(LOW)
    MOVE.W #2,(TOP)
    JSR    GENRAN
    CMP.B  #0,D1
    BEQ    TRANSFORMACION
    BRA    HIPERRAYO
    
MEWTATCK

    BRA TRANSFORMACION
    
SOFOCO

    JSR    GETDMG
    MOVE.W (STRDDMG),D0
    MOVE.B (ACTVEN),D1
    CMP.B   #1,D1
    BEQ     OSUPEREF
    MOVE    D0,(STRDDMG)
    
    RTS
    
HIDROBOMBA

    JSR    GETDMG
    MOVE.W (STRDDMG),D0
    MOVE.B (ACTCHAR),D1
    CMP.B   #1,D1
    BEQ     OSUPEREF
    MOVE    D0,(STRDDMG)
    
    RTS

TRUENO

    JSR    GETDMG
    MOVE.W (STRDDMG),D0
    MOVE.B (ACTBLAST),D1
    CMP.B   #1,D1
    BEQ     OSUPEREF
    MOVE    D0,(STRDDMG)
    
    RTS
    
TRANSFORMACION

    MOVE.W #0,(LOW)
    MOVE.W #3,(TOP)
    JSR    GENRAN
    CMP.B  #0,D1
    BEQ    SOFOCO
    CMP.B  #1,D1
    BEQ    HIDROBOMBA
    BRA    TRUENO

HIPERRAYO

    JSR     GETDMG
    RTS

;DOUBLES DMG IF THE MVMT IS SUPEREF.
OSUPEREF

    MOVE.W D0,-(A7)

    ADD.B  D0,D0
    MOVE.W  D0,(STRDDMG)
    
    MOVE.W (A7)+,D0
    
    RTS
    
; ----------------------------------------------------------
PSDRAW
; DRAWS AND UPDATES THE LIFE BAR FOR EACH POKEMON AFTER A TURN 
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D4/A1,-(A7)
.OPPONENT

    ; DRAW OPPONENT PS BAR
    ; DEFINE PEN COLOR
    MOVE.B #80,D0
    MOVE.L #PENCOL,D1
    TRAP #15
    
    ; DEFINE FILL COLOR
    MOVE.B #81,D0
    MOVE.L #FILLCOL,D1
    TRAP #15
    
    
    
    ; DRAW OPPONENT ACTUAL LIFE BAR
    MOVE.B #87,D0
    MOVE.W #OBARCORX,D1
    MOVE.W #OBARCORY,D2
    MOVE.W (OACTLIFE),D3
    MOVE.W #BARHEIGH,D4
    TRAP #15
    ; DEFINE TOTAL FILL COLOR
    MOVE.B #81,D0
    MOVE.L #$00FFFFFF,D1
    TRAP #15
    ; DRAW OPPONENT TOTAL LIFE BAR
    MOVE.B #87,D0
    MOVE.W (OACTLIFE),D1
    MOVE.W #OBARCORY,D2
    MOVE.W #OMAXPS,D3
    MOVE.W #BARHEIGH,D4
    TRAP #15
    ; SHOW OPPONENT LIFE BAR
    TRAP #1  

    ; SET BACKGROUND COLOR
    MOVE.B #81,D0
    MOVE.L #$00FFFFFF,D1
    TRAP #15
    
    ; SET TEXT FORMAT COLOR
    MOVE.B #21,D0
    MOVE.L #$00000000,D1
    MOVE.L #$060E0000,D2
    TRAP #15
    
    ; DRAW OPPONENT PS
    LEA.L PSMSG,A1
    MOVE.B #95,D0
    MOVE.W #OPSCORX,D1
    MOVE.W #OPSCORY,D2
    TRAP #15
    TRAP #1
       
; ----------------------------------------------------------   
.PLAYER
 
    ; DRAW PLAYER PS BAR
    ; DEFINE PEN COLOR
    MOVE.B #80,D0
    MOVE.L #PENCOL,D1
    TRAP #15
    
    ; DEFINE FILL COLOR
    MOVE.B #81,D0
    MOVE.L #FILLCOL,D1
    TRAP #15
    
    ; DRAW ACTUAL PLAYER LIFE BAR
    MOVE.B #87,D0
    MOVE.W #TBARCORX,D1  
    MOVE.W #TBARCORY,D2 
    MOVE.W  (TACTLIFE),D3 
    ADD.W  #TBARCORY+20,D3
    MOVE.W #256+BARHEIGH,D4  
    TRAP #15
    TRAP #1
     ; DEFINE TOTAL FILL COLOR
    MOVE.B #81,D0
    MOVE.L #$00FFFFFF,D1
    TRAP #15
    ; DRAW PLAYER TOTAL LIFE BAR
    MOVE.B #87,D0
    MOVE.W (TACTLIFE),D1
    ADD.W  #TBARCORY+20,D1
    MOVE.W #TBARCORY,D2
    MOVE.W #TMAXPS,D3
    MOVE.W #256+BARHEIGH,D4  
    TRAP #15
    ; SHOW PLAYER LIFE BAR
    TRAP #1  

    ; SET BACKGROUND COLOR
    MOVE.B #81,D0
    MOVE.L #$00FFFFFF,D1
    TRAP #15
    
    ; SET TEXT FORMAT COLOR
    MOVE.B #21,D0
    MOVE.L #$00000000,D1
    MOVE.L #$060E0000,D2
    TRAP #15
    
    ; DRAW PLAYER PS
    LEA.L PSMSG,A1
    MOVE.B #95,D0
    MOVE.W #TPSCORX,D1
    MOVE.W #TPSCORY,D2
    TRAP #15
    TRAP #1
    
    MOVEM.L (A7)+,D0-D4/A1
    
    RTS
; ----------------------------------------------------------
PSUPD
; AFTER TEAM TURN LIFE BAR MANAGEMENT
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : OACTLIFE
; ----------------------------------------------------------

    MOVE.B  (STRDDMG),D0
    EXT.W   D0
    MOVE.W  (OACTLIFE),D1
    SUB.W   D0,D1
    MOVE.W  D1,(OACTLIFE)
    CMP.W   #OBARCORX,D1
    BGE     SETNXTTURN  
    ;OPONENT PKM FAINTED
    MOVE.W  #0,(FAINTPKM)
    MOVE.W  #0,(DEFEATPKM)
    JSR     DFTPKM  
    RTS
    
; ----------------------------------------------------------
OPSUPD
; AFET OPONENT TURN LIFE BAR MANAGEMENT   
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : TACTLIFE
; ----------------------------------------------------------
    MOVE.W  #0,D0
.MINILOOP
    ADD.L   #1,D0
    CMP.L   #500000,D0
    BNE     .MINILOOP  
    MOVE.B  (STRDDMG),D0
    EXT.W   D0
    SUB.W   #5,D0
    MOVE.W  (TACTLIFE),D1
    SUB.W   D0,D1
    MOVE.W  D1,(TACTLIFE)
    CMP.W   #30,D1
    BGE     SETNXTTURN  
    MOVE.W  #TBARCORX,(TACTLIFE)
    ; TEAM POKEMON FAINTED
    MOVE.W  #1,(FAINTPKM)
    MOVE.B  #1,(DEFEATPKM)
    JSR     DFTPKM  


; ----------------------------------------------------------
SETNXTTURN
; UPDATES WHO WILL HAVE THE TURN  
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : TURN
; ----------------------------------------------------------
    MOVE.W      (NXTTURN),D0
    CMP.W       #0,D0
    BEQ         SETOTURN
SETTTURN
    MOVE.W      #2,(NXTTURN)
    RTS
SETOTURN
    MOVE.W  #1,(NXTTURN)
    RTS
; ----------------------------------------------------------
SETTURN
; UPDATES WHO HAS THE TURN  
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : TURN
; ----------------------------------------------------------
    MOVE.W (NXTTURN),(TURN)
    RTS
; ----------------------------------------------------------
DFTPKM
; UPDATED THE NEXT POKEMON TO BE SHOWN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0/A0-A3,-(A7)
    ;CHECK FAINTED POKEMON
    CMP.W #0,(FAINTPKM)
    BEQ UPDOPKM
CHNGPKM   
    MOVE.W #1,(DRAWYO)
    MOVE.L (PTBUFFER),A0
    MOVE.L (TFPKMRLS),D0
    MOVEA.L D0,A1
    CMPA.L A0,A1
    BNE .SHOWTPKM
    ADD.L #PTRADCNT,(PTBUFFER)
    MOVE.L  (PTBUFFER),A0
.SHOWTPKM
    JSR DRAWPKM
    ; POINT AT NEW SPRITE
    ADD.L #PTRADCNT,(PTBUFFER)
    ; RESET FAINTED POKEMON
    MOVE.W #-1,(FAINTPKM)
    SUBQ.W #1,(LENPKMT)
    MOVE.W  #280,(TACTLIFE)
    BRA RETURNDFT
GETDRWPKM
    MOVEA.L  (PTRBLAS),A3
    CMPA.L   A0,A3
    BEQ     DRWBLAST
    MOVEA.L  (PTRCHAR),A3
    CMPA.L   A0,A3
    BEQ     DRWCHAR
    MOVEA.L  (PTRVEN),A3
    CMPA.L   A0,A3
    BEQ     DRWVEN
    
DRWBLAST
    MOVE.B  #1,(ACTBLAST)
    RTS
DRWCHAR
    MOVE.B  #1,(ACTCHAR)
    RTS
DRWVEN
    MOVE.B  #1,(ACTVEN)
    RTS
      
UPDOPKM
    ; UPDATE OPPONENT POKEMON
    MOVE.W #0,(DRAWYO)
    MOVE.L (PBUFFERL),A0
    MOVE.L (OFPKMRLS),D0
    MOVEA.L D0,A1
    CMPA.L A0,A1
    BNE .SHOWOPKM
    ADD.L #PTRADCNT,(PBUFFERL)
    MOVE.L  (PBUFFERL),A0
.SHOWOPKM

    JSR DRAWPKM
    JSR GETDRWNOPKM
    MOVE.B  #2,(NXTTURN)
    ; POINT AT NEW SPRITE
    ADD.L #PTRADCNT,(PBUFFERL)
    ; RESET FAINTED POKEMON
    MOVE.W #-1,(FAINTPKM)
    SUBQ.W #1,(LENPKMO)
    MOVE.W  #280,(OACTLIFE)
RETURNDFT
    TRAP    #1
    MOVEM.L (A7)+,D0/A0-A3
    RTS

GETDRWNOPKM ;UPDATES THE OPONENT ACTPKM VAR
    MOVE.B  #0,(ACTART)
    MOVE.B  #0,(ACTMEW)
    MOVE.B  #0,(ACTMEWT)
    MOVE.B  #0,(ACTMOLT)
    MOVE.B  #0,(ACTZAPD)
    MOVE.L  (PTRART),A1
    CMP.L      A0,A1
    BEQ      ISACTART
    MOVE.L  (PTRMEW),A1
    CMP.L      A0,A1
    BEQ      ISACTMEW
    MOVE.L  (PTRMEWT),A1
    CMP.L      A0,A1
    BEQ      ISACTMEWT
    MOVE.L  (PTRMOLT),A1
    CMP.L      A0,A1
    BEQ      ISACTMOLT
    MOVE.L  (PTRZAP),A1
    CMP.L      A0,A1
    BEQ      ISACTZAP

ISACTART
    JSR     STOP
    JSR     PLAYBLUE
    MOVE.B  #1,(ACTART)
    MOVE.L  #0,A3
    RTS
ISACTMEW
    JSR     STOP
    JSR     PLAYN
    MOVE.B  #1,(ACTMEW)
    MOVE.L  #0,A3
    RTS
ISACTMEWT
    JSR     STOP
    JSR     PLAYNEO
    MOVE.B  #1,(ACTMEWT)
    MOVE.L  #0,A3
    RTS
ISACTZAP
    JSR     STOP
    JSR     PLAYELIT
    MOVE.B  #1,(ACTZAPD)
    MOVE.L  #0,A3
    RTS
ISACTMOLT
    JSR STOP
    JSR PLAYRESH
    
    MOVE.B  #1,(ACTMOLT)
    MOVE.L  #0,A3
    RTS

; ----------------------------------------------------------
TEAMINIT
; INITIALIZE THE TEAMS FOR THE USER AND THE OPPONENT
; INPUT     : NONE
; OUTPUT    : POINTERS TO POKEMON SPRITES
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D1-D2/A0-A1,-(A7)
    
; --- OPPONENT TEAM GENERATION -----------------------------
    
    LEA.L BUFFERL,A0
    MOVE.L A0,(PBUFFERL)   
    MOVE.W #5,D2 
    ; GENERATE RANDOM TEAM FOR PLAYER
    MOVE.W #1,(LOW)
    MOVE.W #6,(TOP)
    
    ; CHECK FOR RANDOM VALUE
.OLOOP
    
    CMP.W #0,D2
    BEQ .END
    CMP.W #1,D2
    BEQ .GETART
    CMP.W #2,D2
    BEQ .GETMEW
    CMP.W #3,D2
    BEQ .GETMEWT
    CMP.W #4,D2
    BEQ .GETMOLT
    BNE .GETZAP
    
    
.GETART
    
    ; CHECK IF NOT REPEATED POKEMON
    ;TST.L (PTRART) ; VER SI GENRAN NO PETA
    ;BNE .NOTNEW
    ; PREPARE TO READ TO BUFFERL
    MOVEA.L #BPTRART,A1
    JSR READ
    MOVE.L A0,(PTRART)   ;STORE ARTICUNO POINTER
    ADDA.L #PTRADCNT,A0 ;POINT AT NEXT MEMORY POSITION
    DBRA D2,.OLOOP
    BRA .END
    
.GETMEW
    
    ;TST.L (PTRMEW)
    ;BNE .NOTNEW
    ; PREPARE TO READ TO BUFFERL
    MOVEA.L #BPTRMEW,A1
    JSR READ
    MOVE.L A0,(PTRMEW)   ;STORE MEW POINTER
    ADDA.L #PTRADCNT,A0 ;POINT AT NEXT MEMORY POSITION
    DBRA D2,.OLOOP
    BRA .END
    
.GETMEWT

    ;TST.L (PTRMEWT)
    ;BNE .NOTNEW
    ; PREPARE TO READ TO BUFFERL
    MOVEA.L #BPTRMEWT,A1
    JSR READ
    MOVE.L A0,(PTRMEWT)   ;STORE MEWTWO POINTER
    ADDA.L #PTRADCNT,A0 ;POINT AT NEXT MEMORY POSITION
    DBRA D2,.OLOOP
    BRA .END 

.GETMOLT

    ;TST.L (PTRMOLT)
    ;BNE .NOTNEW
    ; PREPARE TO READ TO BUFFERL
    MOVEA.L #BPTRMOLT,A1
    JSR READ
    MOVE.L A0,(PTRMOLT)  ;STORE MOLTRES POINTER
    ADDA.L #PTRADCNT,A0 ;POINT AT NEXT MEMORY POSITION
    DBRA D2,.OLOOP
    BRA .END 

.GETZAP

    ;TST.L (PTRZAP)
    ;BNE .NOTNEW
    ; PREPARE TO READ TO BUFFERL
    MOVEA.L #BPTRZAP,A1
    JSR READ
    MOVE.L A0,(PTRZAP)  ;STORE ZAPDOS POINTER
    ADDA.L #PTRADCNT,A0 ;POINT AT NEXT MEMORY POSITION
    DBRA D2,.OLOOP
    BRA .END 
    
.NOTNEW

    ;BRA .TLOOP ; PARTE DE GENRAN
    
    
; ----------------------------------------------------------
.END
; --- PLAYER TEAM GENERATION -------------------------------    
    
    LEA.L TBUFFER,A0
    MOVE.L A0,(PTBUFFER)
    MOVE.W #3,D2
    ; GENERATE RANDOM TEAM FOR PLAYER
    MOVE.W #1,(LOW)
    MOVE.W #6,(TOP)
    
.TLOOP

    CMP.W #0,D2
    BEQ .ENDT
    CMP.W #1,D2
    BEQ .GETBLAS
    CMP.W #2,D2
    BEQ .GETCHAR
    BNE .GETVEN
    
.GETBLAS
    
    MOVE.L #TPTRBLAS,A1
    JSR READ
    MOVE.L A0,(PTRBLAS) ; STORE BLASTOISE POINTER
    ADDA.L #PTRADCNT,A0 ; POINT AT NEXT FREE MEMORY POSITION
    DBRA D2,.TLOOP
    BRA .END

.GETCHAR

    MOVE.L #TPTRCHAR,A1
    JSR READ
    MOVE.L A0,(PTRCHAR) ; STORE CHARIZARD POINTER
    ADDA.L #PTRADCNT,A0 ; POINT AT NEXT FREE MEMORY POSITION
    DBRA D2,.TLOOP
    BRA .END


.GETVEN

    MOVE.L #TPTRVEN,A1
    JSR READ
    MOVE.L A0,(PTRVEN)  ; STORE VENASUR POINTER
    ADDA.L #PTRADCNT,A0 ; POINT AT NEXT FREE MEMORY POSITION
    DBRA D2,.TLOOP
    BRA .END

       
; ---------------------------------------------------------- 
    
.ENDT
     
    MOVEM.L (A7)+,D1-D2/A0-A1 ; CORREGIR (PUEDE)
    
    
    RTS

; ----------------------------------------------------------

; ----------------------------------------------------------
DRAWPKM
; DRAWS ANY POKEMON SPRITE
; INPUT     : POINTER TO SPRITE
;             DRAWING MODE (DRAWYO: 0 -> OPPONENT, 1 TEAM)
; OUTUT     : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVEM.L D0-D4/A0-A1,-(A7)
    ; CHECK FOR COORDINATE DRAWING
    CMP.W #0,(DRAWYO)
    BEQ .DRAWOP
    BNE .DRAWT
    
.DRAWOP
    
    MOVE.W #OPKMCORX,D1
    MOVE.W #OPKMCORY,D2
    BRA .DOIT
    
.DRAWT
    
    MOVE.W #TPKMCORX,D1
    MOVE.W #TPKMCORY,D2
    
.DOIT
          
    ; PREPARE THE FILE TO READ
    CLR.B D0
    MOVE.W #STDHEIGH-1,D4   ; Y ITERATIONS
    
.DRAWY

    MOVE.W #STDWIDTH-1,D3   ; X ITERATIONS
    
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
    
    CMP.W #0,(DRAWYO)
    BEQ .RSTPKMX
    MOVE.W #TPKMCORX,D1
    BRA .CONT
.RSTPKMX
    MOVE.W #OPKMCORX,D1
.CONT
    ADDQ.W #1,D2
    DBRA D4,.DRAWY  
        
    MOVEM.L (A7)+,D0-D4/A0-A1
    RTS


; ----------------------------------------------------------
    

;--- CHARIZARD MOVEMENTS

DOLANZALLAMAS

    MOVEM.W D0-D1,-(A7)

    JSR     GETDMG  
    MOVE.B  (STRDDMG),D0
    MOVE.B  (ACTART),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
DOPULSOUMBRIO

    MOVEM.W D0-D1,-(A7)
    
    JSR     GETDMG
    MOVE.B  (STRDDMG),D0
    MOVE.B  (ACTMEW),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  (ACTMEWT),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
;--- BLASTOISE MOVEMENTS

DOHIDROPULSO

    MOVEM.W D0-D1,-(A7)

    JSR     GETDMG
    MOVE.B  (STRDDMG),D0
    MOVE.B  (ACTMOLT),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
DOTRITURAR

    MOVEM.W D0-D1,-(A7)

    JSR     GETDMG
    MOVE.B  (STRDDMG),D0
    MOVE.B  (ACTMEW),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  (ACTMEWT),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
;--- VENASUR MOVEMENTS

DORAYOSOL

    MOVEM.W D0-D1,-(A7)

    JSR     GETDMG
    MOVE.B  (STRDDMG),D0
    MOVE.B  (ACTZAPD),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
DOZUMBIDO

    MOVEM.W D0-D1,-(A7)

    JSR     GETDMG
    MOVE.B  (STRDDMG),D0
    MOVE.B  (ACTMEW),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  (ACTMEWT),D1
    CMP.B   #1,D1
    BEQ     SUPEREF
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
SUPEREF



    ADD.B  D0,D0
    MOVE.B  D0,(STRDDMG)
    
    MOVEM.W (A7)+,D0-D1
    
    RTS
    
; ----------------------------------------------------------
GETDMG
; COMPUTES RANDOM DAMAGE FROM ATTACKS
; INPUT     : NONE
; OUTUT     : DAMAGE IN STRDDMG MEMORY LOCATION
; MODIFIES  : NONE
; ----------------------------------------------------------
    
    MOVE.W #0,(LOW)
    MOVE.W #2,(TOP)
    JSR GENRAN
    LEA.L DMGPTR,A1
    
.LOOP
    MOVEA.L (A1)+,A2
    DBRA D1,.LOOP
    MOVE.B (A2),(STRDDMG) 
    
    RTS
; ----------------------------------------------------------

*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
