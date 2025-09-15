 *-----------------------------------------------------------
* MENU INITIALIZATION
*-----------------------------------------------------------

; ----------------------------------------------------------
MENUINIT
; INITIALIZE MENU GAME SYSTEM.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
        MOVE.L  A1,(A0)
        CLR.W   4(A0)
        RTS
;-----------------------------------------------------------
MENUPD
; INPUT    : A0 - POINTER TO VARIABLE DATA BLOCK
;            A1 - POINTER TO STATIC DATA BLOCK
; OUTPUT   : NONE
; MODIFIES : NONE
;-----------------------------------------------------------
        MOVEM.L D0/A1,-(A7)
        BTST.B  #KBDPOSLEFT,(KBDEDGE) ;MIRAMOS SI HA SIDO PRESIONADO "LEFT
        BEQ     .CHKR
        JSR     .PRE  
.CHKR   BTST.B  #KBDPOSRIGHT,(KBDEDGE) ;MIRAMOS SI HA PRESIONADO "RIGHT"
        BEQ     .CHKZ
        JSR     .NXT
.CHKZ   BTST.B  #KBDPOSATTACK,(KBDEDGE) ;MIRAMOS SI HA PRESIONADO "Z"
        BEQ     .DONE
        JSR     .CHKACTPKM
.DONE   MOVEM.L (A7)+,D0/A1
        RTS
        
        ;AVANCAR SIGUIENTE OPCIÓN
.NXT    MOVE.L  (A0),A1
        MOVE.W  (A1),D0
        ADDQ.W  #1,4(A0) ;SIGUIENTE OPCIÓN
        CMP.W   4(A0),D0 ;COMPARAR CON EL NÚMERO DE ITEMS
        BLE     .NRES
        RTS
.NRES   CLR.W   4(A0)
        RTS
        
        ;IR A LA OPCIÓN ANTERIOR
.PRE    TST.W   4(A0)   ;SI LA OPCION ACTUAL ES 0 
        BEQ     .PRES   ;RESETEAMOS
        SUBQ.W  #1,4(A0)
        RTS
.PRES   MOVE.L  (A0),A1
        MOVE.W  (A1),D0
        SUBQ.W  #1,D0
        MOVE.W  D0,4(A0)
        RTS
        ;MIRAR MOVIMIENTO POKEMON

.CHKACTPKM
        MOVE.W  #0,(NXTTURN) ;NOS CONCEDEMOS TURNO
        JSR     RESTARTSEL   ;REINICIAR LOS MOVIMIENTOS SELECCIONADOS
        MOVE.B  (ACTCHAR),D1
        CMP.B   #1,D1
        BEQ     .CHKMVCHAR
        MOVE.B  (ACTBLAST),D1
        CMP.B   #1,D1
        BEQ     .CHKMVBLAST
        BRA     .CHKMVVEN
        
.CHKMVCHAR                  ;MIRAR MOVIMIENTOS DE CHARIZARD
        MOVE.W 4(A0),D1
        CMP.W   #0,D1
        BEQ     .LANZALLAMAS
        BRA     .PULSOUMBRIO
.CHKMVBLAST                 ;MIRAR MOVIMIENTOS DE BLASTOISE
        MOVE.W 4(A0),D1
        CMP.W   #0,D1
        BEQ     .HIDROPULSO
        BRA     .TRITURAR
.CHKMVVEN                   ;MIRAR MOVIMIENTOS DE VENASAUR
        MOVE.W 4(A0),D1
        CMP.W   #0,D1
        BEQ     .RAYOSOL
        BRA     .ZUMBIDO
.LANZALLAMAS
        MOVE.B #1,(SELLANZ)
        RTS
.PULSOUMBRIO
        MOVE.B #1,(SELPULS)
        RTS
.HIDROPULSO
        MOVE.B #1,(SELHIDR)
        RTS
.TRITURAR
        MOVE.B #1,(SELTRIT)
        RTS
.RAYOSOL
        MOVE.B #1,(SELRAYO)
        RTS
.ZUMBIDO
        MOVE.B #1,(SELZUMB)
        RTS
RESTARTSEL
    MOVE.B #0,(SELLANZ)
    MOVE.B #0,(SELPULS)
    MOVE.B #0,(SELHIDR)
    MOVE.B #0,(SELTRIT)
    MOVE.B #0,(SELRAYO)
    MOVE.B #0,(SELZUMB)
    RTS
;----------------------------------------------------------
MENUPLOT
; PLOTS A MENU
; INPUT     : A0 - POINTER TO VARIABLE DATA BLOCK
; OUTPUT    : NONE
; MODIFIES  : NONE
;----------------------------------------------------------
            MOVEM.L D0-D5/A1-A3,-(A7)       ; SAVE REGISTERS
            MOVE.L  (A0),A2                 ; A2: STATIC DATA BLOCK
            MOVE.W  (A2),D2                 ; D2: NUMBER OF OPTIONS
            SUBQ.W  #1,D2                   ; D2: NUMBER OF OPTIONS - 1
            MOVE.W  2(A2),D1                ; D1: X,Y
            ADD.W   #$1A0E,D1
            LEA     4(A2),A3                ; FIRST STRING POINTER
            MOVE.W  4(A0),D3                ; SELECTED OPTION
            CLR.W   D4                      ; OPTION NUMBER
.LOOP       MOVE.W  D1,D5                   ; STORE D1
            MOVE.B  #81,D0                  ; PREPARE TO CHANGE COLOR
            MOVE.L  #MENUDARKGREY,D1
*            CLR.L   D1                      ; PREPARE BLACK AS COLOR
            CMP.W   D3,D4                   ; IF PLOTTED OPTION IS NOT SELECTED
            BNE     .CONT                   ; SET BLACK COLOR
            MOVE.L  #MENUGREY,D1             ; OTHERWISE, SET RED COLOR
.CONT       TRAP    #15                     ; DEFINE THE COLOR
            ADDQ.W  #1,D4                   ; NEXT OPTION
            MOVE.W  D5,D1                   ; RESTORE D1
            MOVE.B  #11,D0                  ; POSITION TEXT
            TRAP    #15
            ADD.W   #$1000,D1
*            ADDQ.W  #1,D1                   ; NEXT LINE
            MOVE.B  #13,D0
            MOVE.L  (A3)+,A1                ; GET STRING
            TRAP    #15                     ; PRINT STRING
            DBRA.W  D2,.LOOP                ; LOOP FOR ALL OPTIONS
            MOVEM.L (A7)+,D0-D5/A1-A3       ; RESTORE REGISTERS
            RTS



*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
