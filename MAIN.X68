*-----------------------------------------------------------
* Title      : POKEMON BATTLE SIMULATOR
* Authors    : Vicent Roig, Hugo López y Alenjando Martínez
* Date       : 11/11/2024
*
* Description: A Pokemon battle simulator based on the originals 
* ARCADE Pokemon red and green that came up on 1996 in Japan 
* and redistributed in Europe around 1988.
* Now this game pretends to emulate a serial number of random
* pokemon encounter battles, where each time the pokemon ir RNG.
* The user (trainer) will have to defeat each pokemon a determined
* number of times. If accomplished, then they will face a random
* champion enconter that will have to be defeated. If so, then the trainer
* is considerd to become the new champion. 
*-----------------------------------------------------------
    ORG    $1000
    
    
; --- INCLUDES ---------------------------------------------
    
    INCLUDE "SYSTEM.X68"
    INCLUDE "SYSCONST.X68"
    INCLUDE "CONST.X68"
    INCLUDE "RANDOM.X68"
    INCLUDE "FILEREADER.X68"
    INCLUDE "LOADSCREEN.X68"
    INCLUDE "MENU.X68"
    INCLUDE "SYSBATTLE.X68"
    INCLUDE "SYSMENU.X68"
    INCLUDE "THEMES.X68"
    INCLUDE "SYSEND.X68"


;-----------------------------------------------------------
    
START:       

; --- INITIALIZATION ---------------------------------------
    
    ORI.W #$0700,SR ; DISABLE INT

    JSR SYSINIT
FIRST
    JSR INITTHM
    JSR LOADGAME
    TRAP    #1
    MOVE.B  #1,(DOREAD)
    MOVE.L #BUFFERL,A0
    MOVE.L #FILEPATH,A1
    JSR READFILE
    TRAP    #1
    JSR STOP
    JSR STRTGAME
    TRAP    #1
    MOVE.B  #0,(SCRCLEAR)
    JSR STRTGAME
    JSR TEAMINIT
    JSR BTLINIT
    JSR PSDRAW
    JSR SELMENU
    JSR MENUINIT
.LOOP
; --- UPDATE -----------------------------------------------
    

; READ INPUT DEVICES

    TRAP #0
    
    
 

; UPDATE GAME LOGIC
    
    ; VERIFY IF THE GAME IS OVER
    ;------
    JSR CHKACTLEN
    ; CHECK FOR MENU UPDATES
        JSR     SELMENU
        JSR     CHGMENU
        JSR     MENUPD
    ;UPD BATTLE LOGIC
        JSR     SETTURN
        JSR     BTLUPD 
        JSR     PSDRAW

; --- SYNC -------------------------------------------------

.WINT   
    TST.B (SCRINTCT)
    BEQ .WINT
    CLR.B (SCRINTCT)
    

; --- PLOT -------------------------------------------------
    
    JSR SELMENU
    JSR MENUPLOT
; --- END --------------------------------------------------
.FINISH

    TRAP #1
    
    BRA .LOOP


LOSEGAME
     JSR     STOP
     JSR     MAINTHM
.MINILOOP
     TRAP    #0
     BTST.B  #KBDPOSSELECT,(KBDEDGE)
     BEQ     .ESPACE
     BRA     FIRST
.ESPACE
     BTST.B  #KBDPOSPAUSE,(KBDEDGE)
     BEQ     .MINILOOP
     BRA     WINGAME
     ;RESET STATUS VARS
     MOVE.W  #280,(OACTLIFE)
     MOVE.W  #280,(TACTLIFE)
     MOVE.W  #2,(TURN)
     MOVE.W  #2,(NXTTURN)
     MOVE.W  #5,(LENPKMO)
     MOVE.W  #3,(LENPKMT)
     MOVE.B  #1,(SCRCLEAR)
     TRAP    #1
     MOVE.L  (A7)+,D0
     CLR.L      D0
     BRA     FIRST
WINGAME
    SIMHALT
; --- VARIABLES --------------------------------------------

    INCLUDE "VARS.X68"
    INCLUDE "SYSVARS.X68"
    
    
    END    START        






























































*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
