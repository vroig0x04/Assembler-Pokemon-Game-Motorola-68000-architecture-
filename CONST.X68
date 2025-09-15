*-----------------------------------------------------------
* GAME CONSTANTS
*-----------------------------------------------------------

; --- BUFFERS RELATED CONSTANTS ----------------------------------------------------
;FILEPATH:      ADDRES TO INIT IMAGE
;FILEPATHWIN:   ADDRES TO WIN IMAGE
;FILEPATHLOSE:  ADDRES TO LOSE IMAGE
;BUFFERL:       BUFFER THAT CONTAINS THE INIT IMAGE AT FIRST OR THE ENEMY TEAM IMAGE
;PBUFFERL:      POINTER TO BUFFERL
;WINBUFF:       BUFFER THAT CONTAINS THE WIN IMAGE
;LOSEBUFF:      BUFFER THAT CONTAINS THE LOSE IMAGE
; ----------------------------------------------------------------------------------

FILEPATH        DC.B        'FILES/pixel_logo.bin',0
                DS.W        0
FILEPATHWIN     DC.B        'FILES/pixel_victoria.bin',0
                DS.W        0
FILEPATHLOSE    DC.B        'FILES/pixel_derrota.bin',0
                DS.W        0
BUFFERL         DS.B        1228800
                DS.W        0
PBUFFERL        DC.L        0                
TBUFFER         DS.B        479232
                DS.W        0
PTBUFFER        DC.L        0
WINBUFF         DS.B        1228800
                DS.W        0
LOSEBUFF        DS.B        1228800
                DS.W        0
                
; --- LOADING SCREEN RELATED VARIABLES ---------------------

MESSAGE         DC.B        'CARGANDO JUEGO',0
                DS.W        0

                
; --- RNG RELATED CONSTANS ---------------------------------

AMUL            EQU         $6D
CMUL            EQU         $1B
MMOD            EQU         $1000

; --- MENU RELATED CONSTANTS -----------------------------------------------------
; THERE ARE ALL THE ATTACKS FROM EVERY POKEMON (INCLUDING OPPONENT)
; THERE ARE 3 DIFFERENT MENUS FOR EACH POKEMON THAT YOU HAVE
; COLOR MENU:
; MENUDARKGREY: COLOR OF THE BUTTON THAT IS NOT BEING POINTED
; MENUDGREY:    COLOR OF THE BUTTON THAT IS POINTED
; --------------------------------------------------------------------------------

MENU            DC.W        16

ATCKPTR         DC.L        ATTACK1,ATTACK2,ATTACK3,ATTACK4
                DC.L        ATTACK5,ATTACK6,ATTACK7,ATTACK8
                DC.L        ATTACK9,ATTACK10,ATTACK11,ATTACK12
                DC.L        ATTACK13,ATTACK14,ATTACK15,ATTACK16

ATTACK1         DC.B        'LANZALLAMAS',0
ATTACK2         DC.B        'HIDROPULSO ',0
ATTACK3         DC.B        'GARRA DRAG.',0
ATTACK4         DC.B        'COLA FÉRREA',0
ATTACK5         DC.B        'PSÍQUICO   ',0
ATTACK6         DC.B        'BOLA SOMBR.',0
ATTACK7         DC.B        'RAYO       ',0
ATTACK8         DC.B        'ROCA AFIL. ',0
ATTACK9         DC.B        'TERREMOTO  ',0
ATTACK10        DC.B        'TIJERA X   ',0
ATTACK11        DC.B        'FUERZA LUN.',0
ATTACK12        DC.B        'DISTORSIÓN ',0
ATTACK13        DC.B        'PULSO UMBR.',0
ATTACK14        DC.B        'TRITURAR   ',0
ATTACK15        DC.B        'ESTOCISMO  ',0
ATTACK16        DC.B        'RAYO SOLAR ',0

MENUBLAS        DC.W        2
                DC.W        $0703
.STRLST         DC.L        ATTACK2,ATTACK14

MENUCHAR        DC.W        2
                DC.W        $0703
                DC.L        ATTACK1,ATTACK13

MENUVEN         DC.W        2
                DC.W        $0703
                DC.L        ATTACK16,ATTACK15

MENUBLASV       DS.W        3
MENUCHARV       DS.W        3
MENUVENV        DS.W        3

MENUDARKGREY    EQU         $808080
MENUGREY        EQU         $C0C0C0

       

; --- POKEMON RELATED CONSTANTS ----------------------------------------
; ADDRES TO ALL POKEMON SPRITES(TEAM AND OPONENT) AND POINTERS TO SPRITE
; PTRADCNT:     AMOUNT TO BE ADDED TO SIGN UP THE NEXT SPRITE
; DEFEATPKM:    AMOUNT OF POKEMON'S THAT YOUR OPPONENT DEFEATED
; DEFEATOP:     AMOUNT OF POKEMON'S THAT YOU DEFEATED
; ----------------------------------------------------------------------
TPTRBLAS        DC.B        'SPRITES/POKEMON/TEAM/pixel_blastoise.bin',0
TPTRCHAR        DC.W        'SPRITES/POKEMON/TEAM/pixel_charizard.bin',0
TPTRVEN         DC.W        'SPRITES/POKEMON/TEAM/pixel_venasur.bin',0

BPTRART         DC.B        'SPRITES/POKEMON/BATTLE/pixel_articuno.bin',0
BPTRMEW         DC.B        'SPRITES/POKEMON/BATTLE/pixel_mew.bin',0
BPTRMEWT        DC.B        'SPRITES/POKEMON/BATTLE/pixel_mewtwo.bin',0
BPTRMOLT        DC.B        'SPRITES/POKEMON/BATTLE/pixel_moltres.bin',0
BPTRZAP         DC.B        'SPRITES/POKEMON/BATTLE/pixel_zapdos.bin',0


                
PTRBLAS         DC.L        0   ; POINTERS TO SPRITES IN BUFFERL
PTRCHAR         DC.L        0
PTRVEN          DC.L        0
PTRART          DC.L        0
PTRMEW          DC.L        0
PTRMEWT         DC.L        0
PTRMOLT         DC.L        0
PTRZAP          DC.L        0

PTRADCNT        EQU         $27000

DEFEATPKM       DS.B        1
                DS.W        0 
DEFEATOP        DS.B        1
                DS.W        0

; --- POKEMON SIZE RELATED CONSTANTS -----------------------------------
; WIDTH AND HEIGHT OF THE SPRITES
; ----------------------------------------------------------------------
STDWIDTH        EQU         210
STDHEIGH        EQU         190

; --- POKEMON DRAWING COORGINATE RELATED CONSTANTS

OPKMCORX        EQU         320    ; OPPONENT COORDINATES
OPKMCORY        EQU         0
TPKMCORX        EQU         48     ; PLAYER COORDINATES               
TPKMCORY        EQU         290  

; --- POKEMON LIFE BAR RELATED CONSTANTS -------------------------------------------
; COLORS OF THE BAR:                FILLCOL, DMGCOL, PENCOL 
; (WE REPAINT WHIT WHITE WHEN THE POKEMON ASSUME DAMAGE)
; SIZE OF LIFE BAR:                 BARWIDTH,BARHEIGH
; OPPONENT LIFE BAR COORDENATES:    OBARCORX, OBARCORY, OPSCORX, OPSCORY
; TEAM LIFE BAR COORDENATES:        TBARCORX, TBARCORY, TPSCORX, TPSCORY
;----------------------------------------------------------------------------------
FILLCOL         EQU         $005D5D5D
DMGFILLC        EQU         $00AAAAAA
PENCOL          EQU         $000E0E0E
BARWIDTH        EQU         280
BARHEIGH        EQU         85
OBARCORX        EQU         28
OBARCORY        EQU         43
TBARCORX        EQU         346
TBARCORY        EQU         300
OPSCORX         EQU         286
OPSCORY         EQU         53
TPSCORX         EQU         312
TPSCORY         EQU         308
PSMSG           DC.B        'PS',0
                DS.W        0
               
; --- POKEMON ATTACKS RELATED CONSTANTS ----------------------------------------------
; MAXIMUMLIFE: 280PS (TMAXPS IS 600 BECAUSE THE LIFE BAR IS IN DIFFERENT COORDINATES)
; DMGPTR:      POINTER THAT HAVE ALL DE DIFERENTS DAMAGES THAT THE POKEMON CAN DO
;              (NOT COUNTING SUPER EFFECTIVE) 
; ------------------------------------------------------------------------------------
OMAXPS          EQU         280
TMAXPS          EQU         600
DMGPTR          DC.L        DMG1,DMG2
DMG1            DC.B        20
DMG2            DC.B        25     
; --- ALL REALTED POKEMON THEMES ---------------------------------------------------
; THEMES THAT HAVE THE GAME
; PTRTHEME:     POINTER THAT HAVE ALL THE ADDRES OF THE THEMES
;-----------------------------------------------------------------------------------
PTRTHEME        DC.L        MTHEME,BLUETHM,NTHM,ELITETHM,NEOTHM,RESHTHM,WINTHM
MTHEME          DC.B        'THEMES/intro.wav',0            ; REF 0
BLUETHM         DC.B        'THEMES/champion_blue.wav',0    ; REF 1
NTHM            DC.B        'THEMES/final_N.wav',0          ; REF 2
ELITETHM        DC.B        'THEMES/elite_four.wav',0       ; REF 3
NEOTHM          DC.B        'THEMES/neo_team_plasma.wav',0  ; REF 4
RESHTHM         DC.B        'THEMES/vs_reshiram.wav',0      ; REF 5
WINTHM          DC.B        'THEMES/win_theme.wav',0        ; REF 6

; ----------------------------------------------------------   


;--- END GAME RELATED CONSTANT ----------------------------

END             DS.B        1
                DS.W        0































*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
