^Z80^

NAME ^Rev 06.1 - TF^

;    Project:  EOS 6 Absolute Listing
;
;     ***********************************************************
;     ****                                                   ****
;     ****   EOS ABSOLUTE LISTING                            ****
;     ****                                                   ****
;     ****  Electronic Development Group                     ****
;     ****              Coleco Industries Inc.               ****
;     ****               999 Quaker Lane South               ****
;     ****               West Hardford, Connecticut          ****
;     ****                                  06110            ****
;     ****                                                   ****
;     ***********************************************************
;
;      This absolute listing was generated to ease software
;      development on ADAM.   This listing provides the location
;      of both released and unreleased entry points.  Released
;      entry points begin immediately in this file with the  jump
;      table and end before the first code segment listed.
;      Released entry points include the jump table, common  data
;      areas(EOSCOMN),  common data tables, and equates which
;      describe the released data structures.  Direct access
;      to code segments is STRONGLY DISCOURAGED and may make
;      your application incompatable with some ADAMs.  there  is
;      more than one version of EOS on the market at this  time
;      and updates are planned.
;
;      For further information on ADAM or EOS consult the
;      ADAM Technical Reference Manual or send your questions
;      in writing to:
;
;                       Coleco Software Suppot
;
;      at the above address.
;
;  COLECO MAKES NO REPRESENTATIONS OR WARRANTIES WHATSOEVER,  INCLUDING
;  WITHOUT LIMITATION ANY IMPLIED WARRANTIES OR MERCHANTABILITY  AND
;  FITNESS FOR A PARTICULAR PURPOSE, IN CONNECTION WITH THE  MATERIALS
;  CONTAINED HEREIN, AND SUCH MATERIALS ARE DISCLOSED AS IS.   COLECO
;  SHALL HAVE NO LIABILITY FOR ANY LOSSES CAUSED TO RECIPIENTS  OF THESE
;  MATERIALS BY REASON OF ANY CHANGES OR MODIFICATIONS MADE  BY COLECO  IN
;  THESE MATERIALS AFTER THEIR DISCLOSURE HEREIN.  IN ADDITION,  COLECO
;  SHALL HAVE NO LIABILITY FOR ANY CONSEQUENTIAL, SPECIAL, INDIRECT  OR
;  INCIDENTAL DAMAGES OR LOSSES WHATSOEVER, INCLUDING LOSS OF  PROFITS,  IN
;  CONNECTION WITH THE USE OF THE MATERIALS DISCLOSED HEREIN.
;
;*********************************************************************************
;
;       Rev History
;       Rev.  Date        Name       Change
;        6.1  21jun0844   af        Merge sources for absolute listing.
;                                   No changes made to code.
;        6.0  08oct 1545   jlk      Code released for production.
;
;[    code commented out by ¢;@***’was removed before EOS  ]
;[ was grouped into one file, code commented out by simple ]
;[ ';' was removed in the process of grouping E0S in order ]
;[ to avoid assembier complaints  or LOCAL/GLOBAL conflicts]
;[    @;********...’ generates code segments which were    ]
;[ originally in separate files                            ]
;*********************************************************************************
;*********************************************************************************
;*********************************************************************************
;
NAME ^Rev 11 - RPD^
;
; Rev  Date          Made by    Change
;  11   1Soct425p     RPD        changed E0S_4 to CV_A
;  10   13oct1000p    RPD        made only OS7 jump entries conditionally assembled
;   9   12oct2300     vsb        Added __POSIT_FILE,  __FILE_QUERY plus EOS1 thru EOS4
;   8   07oct1710     rfj        __EFXOVER changed to _EFFECT _0VER
;                                Added _UPDATE_SPINNER
;   7   05oct1725     rtj        Renamed WRSPR_NM_TBL  to WR_SPR_ATTRIBUTE
;   6   03oct1207     rtj        Increased TEMP_STACK to  12bytes,
;                                Removed SAVED_COUNT
;   &   30sept825p    RPD        replaced CONSOUT  data area with new CONSOUT2
;   4   29sept235p    RPD        replaced PLAYSONGS  with SOUNDS
;   3   26sept1005a   RPD        added conditional assembly stuff for super  games
;   2   25sept850a    RPD        merged all of EOS ram together into this file
;   1   20sept1005a   RPD        new memory mapping
;   0   mid-sept      VB         original map @  E8000H
;
TRUE                 EQU   0FFFFH                         
FALSE                EQU   00000H                         

IN_EOS               EQU   TRUE                           
SUPERGAME            EQU   FALSE                          
;
; CURRENT EOS MEMORY MAPPING
;
;FCB_S         EQU     0D390H                  ;FCB area
;THREE1K_BLKS  EQU     00400H                  ;3 FCB 1K buffers
EOS_CODE             EQU   0E000H                         ;address of EOS code segment
EOS_GLB_TBL          EQU   0FBFFH                         ;address of EOS global tables
EOS_JMP_TBL          EQU   0FC30H                         ;address of EOS jump table
EOS_GLB_RAM          EQU   0FD60H                         ;address of EOS global data  area
EOS_PCB_DCB          EQU   0FEC0H                         ;address of EOS PCB/DCB areas

;
;  These are key record sizes, used  invarious EOS routines.
;  See “INCLUDE FMGR_EQUS" AND “INCLUDE P_DCB_EQU" for details.
;

DIR_ENT_LENGTH       DEFL  26                             
P_SIZE               DEFL  4                              ;THE NUMBER OF BYTES IN THE PCB
D_SIZE               DEFL  21                             ;THE NUMBER OF BYTES  INTHE DCB
;
;
;
;  jump table area
;
; *********************************************************

                     ORG   EOS_JMP_TBL                    

; *********************************************************

_EOS_START           EQU   $                              
                     JP    __EOS_START                    
_CONS_DISP           EQU   $                              
                     JP    __CONS_DISP                    
_CONS_INIT           EQU   $                              
                     JP    __CONS_INIT                    
_CONS_OUT            EQU   $                              
                     JP    __CONS_OUT                     
_DLY_AFT_HRD_RES     EQU   $                              
                     JP    __DLY_AFT_HRD_RES              
_END_PR_BUFF         EQU   $                              
                     JP    __END_PR_BUFF                  
_END_PR_CH           EQU   $                              
                     JP    __END_PR_CH                    
_END_RD_1_BLOCK      EQU   $                              
                     JP    __END_RD_1_BLOCK               
_END_RD_CH_DEV       EQU   $                              
                     JP    __END_RD_CH_DEV                
_END_RD_KBD          EQU   $                              
                     JP    __END_RD_KBD                   
_END_WR_1_BLOCK      EQU   $                              
                     JP    __END_WR_1 BLOCK               
_END_WR_CH_DEV       EQU   $                              
                     JP    __END_WR_CH_DEV                
_FIND_DCB            EQU   $                              
                     JP    __FIND_DCB                     
_GET_DCB_ADDR        EQU   $                              
                     JP    __GET_DCB_ADDR                 
_GET_PCB_ADDR        EQU   $                              
                     JP    __GET_PCB_ADDR                 
_HARD_INIT           EQU   $                              
                     JP    __HARD_INIT                    
_HARD_RESET_NET      EQU   $                              
                     JP    __HARD_RESET_NET               
_PR_BUFF             EQU   $                              
                     JP    __PR_BUFF                      
_PR_CH               EQU   $                              
                     JP    __PR_CH                        
_RD_1_BLOCK          EQU   $                              
                     JP    __RD_1_BLOCK                   
_RD_KBD              EQU   $                              
                     JP    __RD_KBD                       
_RD_KBD_RET_CODE     EQU   $                              
                     JP    __RD_KBD_RET_CODE              
_RD_PR_RET_CODE      EQU   $                              
                     JP    __RD_PR_RET_CODE               
_RD_RET_CODE         EQU   $                              
                     JP    __RD_RET_CODE                  
_RD_TAPE_RET_CODE    EQU   $                              
                     JP    __RD_TAPERET  CODE             
_RELOC_PCB           EQU   $                              
                     JP    __RELOC_PCB                    
_REQUEST_STATUS      EQU   $                              
                     JP    __REQUEST_STATUS               
_REQ_KBO_STAT        EQU   $                              
                     JP    __REQ_KBD_STAT                 
_REQ_PR_STAT         EQU   $                              
                     JP    __REQ_PR_STAT                  
_REQ_TAPE_STAT       EQU   $                              
                     JP    __REQ_TAPE STAT                
_SCAN_ACTIVE         EQU   $                              
                     JP    __SCAN_ACTIVE                  
_SOFT_INIT           EQU   $                              
                     JP    __SOFT_INIT                    
_SOFT_RES_DEV        EQU   $                              
                     JP    __SOFT_RES_DEV                 
_SOFT_RES_KBD        EQU   $                              
                     JP    __SOFT_RES_KBD                 
_SOFT_RES_PR         EQU   $                              
                     JP    __SOFT_RES_PR                  
_SOFT_RES_TAPE       EQU   $                              
                     JP    __SOFT_RES_TAPE                
_START_PR_BUFF       EQU   $                              
                     JP    __START_PR_BUFF                
_START_PR_CH         EQU   $                              
                     JP    __START_PR_CH                  
_START_RD_1_BLOCK    EQU   $                              
                     JP    __START_RD_1 BLOCK             
_START_RD_CH_DEV     EQU   $                              
                     JP    __START_RD_CH_DEV              
_START_RD_KBD        EQU   $                              
                     JP    __START_RD_KBD                 
_START_WR_1_BLOCK    EQU   $                              
                     JP    __START_WR_1 BLOCK             
_START_WR_CHDEV      EQU   $                              
                     JP    __START_WR_CH DEV              
_SYNC                EQU   $                              
                     JP    __SYNC                         
_WR_1_BLOCK          EQU   $                              
                     JP    __WR_1_BLOCK                   
_WR_CH_DEV           EQU   $                              
                     JP    __WR_CH_DEV                    

;
;FILE  MANAGER    ENTRIES
;
_FMGR_INIT           EQU   $                              
                     JP    __FMGR_INIT                    
_INIT_TAPE_DIR       EQU   $                              
                     JP    __INIT_TAPE_DIR                
_OPEN_FILE           EQU   $                              
                     JP    __ OPEN FILE                   
_CLOSE_FILE          EQU   $                              
                     JP    __CLOSE_FILE                   
_RESET_FILE          EQU   $                              
                     JP    __RESET_FILE                   
_MAKE_FILE           EQU   $                              
                     JP    __MAKE_FILE                    
_QUERY_FILE          EQU   $                              
                     JP    __QUERY_FILE                   
_SET_FILE            EQU   $                              
                     JP    __SET_FILE                     
_READ_FILE           EQU   $                              
                     JP    __READ_FILE                    
_WRITE_FILE          EQU   $                              
                     JP    __WRITE_FILE                   
_SET_DATE            EQU   $                              
                     JP    __SET_DATE                     
_GET_DATE            EQU   $                              
                     JP    __GET_DATE                     
_RENAME_FILE         EQU   $                              
                     JP    __RENAME_FILE                  
_DELETE_FILE         EQU   $                              
                     JP    __DELETE_FILE                  
_RD_DEV_DEP_STAT     EQU   $                              
                     JP    __RD_DEV_DEP_STAT              
_GOTO_WP             EQU   $                              
                     JP    __GOTO_WP                      
_READ_EOS            EQU   $                              
                     JP    __READ_EOS                     
_TRIM_FILE           EQU   $                              
                     JP    __TRIM_FILE                    
_CHECK_FCB           EQU   $                              
                     JP    __CHECK_FCB                    
_READ_BLOCK          EQU   $                              
                     JP    __READ_BLOCK                   
_WRITE_BLOCK         EQU   $                              
                     JP    __WRITE_BLOCK                  
_MODE_CHECK          EQU   $                              
                     JP    __MODE_CHECK                   
_SCAN_FOR_FILE       EQU   $                              
                     JP    __SCAN_FOR_FILE                
_FILE_QUERY          EQU   $                              
                     JP    __FILE_QUERY                   
_POSIT_FILE          EQU   $                              
                     JP    __POSIT_FILE                   
_EOS_1               EQU   $                              
                     JP    __EOS_1                        
_EOS_2               EQU   $                              
                     JP    __EOS_2                        
_EOS_3               EQU   $                              
                     JP    __EOS_3                        
_CV_A                EQU   $                              
                     JP    _CV_A                          

_PORT_COLLECTION     EQU   $                              
                     JP    __PORT_COLLECTION              
_SWITCH_MEM          EQU   $                              
                     JP    __SWITCH_MEM                   
_PUT_ASCII           EQU   $                              
                     JP    __PUT_ASCII                    

;
; micro  OS7 entries
;

WRITE_VRAM           EQU                                  
                     JP    __WRITE_VRAM                   
READ_VRAM            EQU                                  
                     JP    __READ_VRAM                    
WRITE_REGISTER       EQU                                  
                     JP    __WRITE_REGISTER               
READ_REGISTER        EQU                                  
                     JP    __READ_REGISTER                
FILL_VRAM            EQU                                  
                     JP    __FILL_VRAM                    
INIT_TABLE           EQU                                  
                     JP    __INIT_TABLE                   
PUT_VRAM             EQU                                  
                     JP    __PUT_VRAM                     
GET_VRAM             EQU                                  
                     JP    __GET_VRAM                     
CALC_OFFSET          EQU                                  
                     JP    __CALC_OFFSET                  
PX_TO_PTRN_POS       EQU                                  
                     JP    __PX_TO_PTRN_POS               
LOAD_ASCII           FQU                                  
                     JP    __LOAD_ASCII                   
WR_SPR_ATTRIBUTE     EQU                                  
                     JP    __WR_SPR_ATTRIBUTE             
POLLER               EQU                                  
                     JP    __POLLER                       
UPDATE_SPINNER       EQU                                  
                     JP    __UPDATE_SPINNER               
DECLSN               EQU                                  
                     JP    __DECLSN                       
DECMSN               EQU   $                              
                     JP    __DECMSN                       
MSNTOLSN             EQU   $                              
                     JP    __MSNTOLSN                     
ADD816               EQU   $                              
                     JP    __ADD816                       
SOUND_INIT           EQU   $                              
                     JP    __SOUND_INIT                   
TURN_OFF_SOUND       EQU   $                              
                     JP    __TURN OFF_SOUND               ;not globalized    in os7?
PLAY_IT              EQU   $                              
                     JP    __PLAY_IT                      
SOUNOS               EQU   $                              
                     JP    __SOUNDS                       ;equals  calls  to  play songs   and  sound_man
EFFECT_OVER          EQU   $                              
                     JP    __EFFECT_OVER                  


;  NOTE:   See  INTERRUPT VECTORS

                     ORG   EOS_GLB_TBL                    
                                                          ;GLB     VECTOR_O8H
;VECTOR_OBH     EQU      $+0
                                                          ;GLB     INT_VCTR_TBL
;INT_VCTR_TBL   EQU      VECTOR_O8H
;               ;GLB     VECTOR_10H
;VECTOR_10H     EQU      $+3
                                                          ;GLB     VECTOR_18H
;VECTOR_18H     EQU      $+6
                                                          ;GLB     VECTOR20H
;VECTOR_20H     EQU      $+9
                                                          ;GLB     VECTOR_28H
;VECTOR_28H     EQU      $+12
                                                          ;GLB     VECTOR_30H
;VECTOR_30H      EQU     $+15
                                                          ;GLB     VECTOR38H
;VECTOR_36H     EQU      $+18
                                                          ;GLB     VECTOR_66H
;VECTOR_66H     EQU      $+21

;
;     NOTE: See SWITCHTABLE
;
;               ;GLB     MEMCNF GOO
;MEM_CNFGOO     EQU     $+24
;;              ;GLB     SWITCHTABLE
;SWITCH_TABLE   EQU     MEMCNFGOO
;;              ;GLB     MEMCNFGOI
;MEM_CNFGO1     EQU     $+25
;;              ;GLB     MEMCNFGO2
;MEM_CNFGO2     EQU     $+26
;;              ;GLB     MEMCNFGO3
;MEM_CNFGO3     EQU     $+27
;;              ;GLB     MEMCNFGO4
;MEM_CNFGO4     EQU     $+28
;;              ;GLB     MEMCNFGOS
;MEM_CNFGOS     EQU     $+29
;;              ;GLB     MEM_CNFGO6
;MEM_CNFGO6     EQU     $+30
;;              ;GLB     MEM_CNFGO7
;MEM_CNFGO7     EQU     $+31
;;              ;GLB     MEMCNFGOS8
;MEM_CNFGOS     EQU     $+32
;;              ;GLB     MEMCNF GOS
;MEM_CNFGOS     EQU     $+33
;;              ;GLB     MEMCNFGOA
;MEM_CNFGOA     EQU     $+34
;;              ;GLB     MEMCNF GOB
;MEM_CNFGOS     EQU     $+35
;;              ;GLB     MEM_CNFGOC
;MEM_CNFGOC     EQU     $+36
;;              ;GLB     MEM_CNFGOD
;MEM_CNFGOD     EQU     $+37
;;              ;GLB     MEM_CNFGOE
;MEM_CNFGOE     EQU     $+38
;;              ;GLB     MEM_CNFGOF
;MEM_CNFGOF    EQU     $+39

;
;        NOTE:   See  PORT  TABLE
;
;;                     ;GLB         MEM_SWITCH_PORT
;MEM_SWITCH_PORT  EQU        $+40
;;                    ;GLB PORT_TABLE
;PORT_TABLE          EQU        MEM_SWITCH_PORT
;;                 ;GLB NET_RESET_PORT
;NET_RESET_PORT       EQU        $+41
;;                 ;GLB        VDP_CTRL_PORT
;VOP_ CTRL_PORT       EQU         $+42
;;                 ;GLB        VDP_DATA_PORT
;VDP_DATA_PORT       EQU        $+43
;;                   ;GLB         CONTROLLER_0_PORT
;CONTROLLER_0_PORT    EQU       $+44
;;                  ;GLB     CONTROLLER_1_PORT
;CONTROLLER_1_PORT   EQU     $+45
;;                  ;GLB     STROBE_SET_PORT
;STROBE_SET_PORT   ;EQU        $+46
;;                      ;GLB         STROBE_RESET_PORT
;STROBE_RESET_PORT ;EQU     $+47
;;                  ;GLB      SOUNDPORT
;;SOUNDPORT            EQU         $+48


;RAM DEFINITIONS  FOR EOS

;REV O          (v/D     8-24-83)


; ************************************************

                     ORG   EOS_GLB_RAM                    

; ************************************************

                                                          ;GLB      CLEAR_RAMSTART

CLEAR_RAM_START:                                          

;
; EOS revision  number initialized  by  EOS START
;
                                                          ;GLB      REV_NUM
REV_NUM                                                   
                     DEFS  1                              


                     IF    ,NT,SUPERGAME                  
;
; 0S7 equivalent  global data structures
;
                                                          ;GLB     VDP_MODE WORD
VOP_MODEWORD         DEFS  2                              
                                                          ;GLB     VOP_STATUS  BYTE
VOP_STATUSBYTE       DEFS  1                              
                                                          ;GLB     VRAM_ADDR_ TABLE
VRAM_ADDR_TABLE                                           
                                                          ;GLB     SPRITEATTRIBL
SPRITEATTRIBL        DEFS  2                              
                                                          ;GLB     SPRITEGENTBL
SPRITEGENTBL         DEFS  2                              
                                                          ;GLB     PATTRNNAME TBL
PATTRNNAMETBL        DEFS  2                              
                                                          ;GLB     PATTRNGENTBL
PATTRNGENTBL         DEFS  2                              
                                                          ;GLB     COLORTABLE
COLORTABLE           DEFS  2                              
                     ELSE                                 
                     DEFS  2*6+1                          
                     ENDIF                                
                                                          ;GLB     CUR_BANK
CURBANK              DEFS  1                              


;
; EOS global  data structures
;
                                                          ;GLB      DEFAULTBT  DEV
                                                          ;GLB      CURRENTDEV

OEFAULTBT_DEV:                                            
CURRENTDEV:                                               
                     DEFS  1                              

                                                          ;GLB      CURRENTPCB

CURRENTPCB:                                               
                     DEFS  2                              ; HOLDS THE START ADDRESS OF THE PCB
                     IF    ,NT,SUPERGAME                  
                                                          ;GLB      DEVICEI0
                     ENDIF                                
DEVICEID:                                                 
                     DEFS  1                              ; SAVE DEVICE ID

;GLB      FILE NAME_ADDR
FILENAME             ADDR                                 
                     DEFS  2                              

                                                          ;GLB      KEYBOARDBUFFER

KEYBOARDBUFFER:                                           
                     DEFS  1                              ; HOLDS THE KEY THAT IS READ FROM THE
                                                          ; KEYBOARD

                                                          ;GLB      PRINTBUFFER

PRINTBUFFER:                                              
                     DEFS  16                             ; HOLDS THE STRING TO BE PRINTED

                                                          ;GLB      SECTORS_TO_INIT,SECTOR_NO

SECTORS_TO_INIT:                                          
                     DEFS  1                              

SECTOR_NO:                                                
                     DEFS  4                              

                                                          ;GLB      DCB_IMAGE

DCB_IMAGE:                                                
                     DEFS  21                             

                                                          ;GLB      QUERY_BUFFER
QUERY_BUFFER                                              
                     DEFS  DIR_ENT_LENGTH                 

                                                          ;GLB      FCB_BUFFER
FCB_BUFFER                                                
                     DEFS  DIR_ENT_LENGTH                 

                                                          ;GLB      FILE COUNT, MOD_FILE COUNT
FILE_COUNT                                                
                     DEFS  1                              

MOD_FILE             COUNT                                
                     DEFS  1                              

                                                          ;GLB       RETRY COUNT,   FILE NUMBR
RETRY_COUNT                                               
                     DEFS  1                              

FILE_NUMBR                                                
                     DEFS  1                              

                                                          ;GLB       FILENAME_CMPS
FILENAME_CMPS                                             
                     DEFS  1                              

                                                          ;GLB      DIR_BLOCK_NO,FOUND_AVAIL_ENT
DIR_BLOCK_NO                                              
                     DEFS  2                              

FOUND_AVAIL_ENT                                           
                     DEFS  1                              

                                                          ;GLB       VOL_BLK_SZ,BLK_STRT     PTR
BLK_STRT_PTR:                                             
VOL_BLK_SZ:                                               
                     DEFS  4                              

; FILE  MANAGER   RAM  STORAGE

                                                          ;GLB       EOS_YEAR,EOS   MONTH,EOSDAY
EOS_YEAR             DEFS  1                              ;FMGR’S DATE STORAGE
EOS_MONTH            DEFS  1                              
EOS_DAY              DEFS  1                              

                                                          ;GLB       FMGR_DIR_ENT
FMGR_DIR_ENT                                              ;PLACEFOR FMGR TO PUT A DIR. ENTRY

                                                          ;GLB        FCB_HEAD_ADOR,FCB_DATA_ ADDR
FCB_HEAD_ADDR        DEFS  2                              ;POINTER TO START OF FCB HEADS
FCB_DATA_ADDR        DEFS  2                              ;POINTER TO START OF FCB BUFFERS

                                                          ;GLB         FNUM, BYTES REQ,BYTES TO GO,USER BUF
                                                          ;GLB         BUF_START,BUF_ENO.BLOCKS  REQ
                                                          ;GLB        USER_NAME  ,STARTBLOCK
FNUM                 DEFS  1                              ;FILE NUMBER GIVEN TO READ/WRITE ROUTINES
BYTES_REQ            DEFS  2                              ;NUMBER OF BYTES REQUESTED BY CALLER
BYTES_TO_GO          DEFS  2                              ;NUMBER OF BYTES STILL TO GIVE TO CALLER
USER_BUF             DEFS  2                              ;ADDRESS OF CALLER’S BUFFER
BUF_START            DEFS  2                              ;ADDRESS OF MY OWN BUFFER
BUF_END              DEFS  2                              ;ADDRESS OF END + 1 OF MY BUFFER
BLOCKS_REQ           DEFS  4                              ;NUMBER OF BLOCKS REQUESTED (MAKEFILE)
USER_NAME            DEFS  2                              ;POINTER TO USER’S NAME STRING
START_BLOCK          DEFS  4                              ;START BLOCK # OF A FILE

                                                          ;GLB_      NEW_HOLE  START,NEW_HOLE    SIZE

NEW_HOLE             START                                
                     DEFS  4                              

NEW_HOLE_SIZE                                             ;
                     DEFS  2                              

STACK_START:                                              
                     DEFS  60                             

                                                          ;GLB      EOSSTACK
EOS_STACK:                                                

;            ;GLB      SAVEDCOUNT
                                                          ; controller data area
                                                          ;GLB      SPIN_SWOCT                 ; THESE TWO BYTES MUST  GE IN THIS ORDER!!!
                                                          ;GLB      SPIN_SW1CT
                                                          ;GLB      PERSONAL ODEBOUNCETABLE
                                                          ;GLB      TEMP STACK                 ; Used Dy putascit  when  bank switching
                                                          ; sound data areas
                                                          ;GLB      PTRTO LST  OF SND_ADORS
                                                          ;GLB      PTRTO S GN_O
                                                          ;GLB      PTR_TO_S_ON1
                                                          ;GLB      PTR_TO_SON  2
                                                          ;GLB      PTRTO S ON  3
                                                          ;GLB      SAVECTRL


;SAVEDCOUNT      DEFS      2
;
; controller  data  area
;
SPIN_SWO_CT          DEFS  1                              ; THESE  TWO BYTES MUST BE IN THIS ORDER!!!
SPIN_SW1_CT          DEFS  1                              
PERSONAL_DEBOUNCE_TABLE DEFS  8                              
                     DEFS  12                             ;USED BY TEMP_STACK
TEMP_STACK           EQU   $                              ;Used by put_ascii when bank switching

;
; sound data  areas
;
PTR_TO_LST_OF_SND_ADDRS DEFS  2                              
PTR_TO_S_ON_O        DEFS  2                              
PTR_TO_S_ON_1        DEFS  2                              
PTR_TO_S_ON_2        DEFS  2                              
PTR_TO_S_ON_3        DEFS  2                              
SAVE_CTRL            DEFS  1                              


;
; data  area  for   CONS OUT
;
                                                          ;GLB       OLDCHAR_
                                                          ;GLB       XMIN
                                                          ;GLB       XMAX
                                                          ;GLB       YMIN
                                                          ;GLB       Y_ MAX
                                                          ;GLB       LINEBUFFER_
                                                          ;GLB       NUM_LINES
                                                          ;GLB       NUM_COLUMNS
                                                          ;GLB       UPPER_LEFT
                                                          ;GLB       PTRN_NAME_TBL
                                                          ;GLB       CURSOR

OLDCHAR_             DEFS  1                              ;Storage   of   char  under   cursor
X_MIN                DEFS  1                              ;Absolute    X  coord  of   window
X_MAX                DEFS  1                              
YMIN                 DEFS  1                              
YMAX                 DEFS  1                              
LINEBUFFER_          DEFS  33                             
NUMLINES             DEFS  1                              
NUM_COLUMNS          DEFS  1                              
UPPER_LEFT           DEFS  2                              
PTRN_NAME_TBL        DEFS  2                              
CURSOR               DEFS  2                              

                                                          ;GLB        CLEAR_RAM_SIZE

CLEAR_RAM_SIZE       EQU   [$-CLEAR_RAM_START]            

;
; this  is  the PCB/DCB  area
;
;***********************************************************************

                     ORG   EOS_PCB_DCB                    

;***********************************************************************

                                                          ;GLB      PCB

PCB:                                                      
                     DEFS  P_SIZE                         ; PCB

DCBS:                                                     
                     DEFS  15*D_SIZE                      ; 1 OCB PER NETWORK  ADORESS

RESERVED_BYTE:                                            
                     DEFS  1                              ; SAVED IN CASE WE OO  FAST  DMA HERE
;
;***********************************************************************
;***********************************************************************
;***********************************************************************

NAME ^Rev OO - RPD^


;***********************************************************************

                     ORG   EOS_GLB_TBL                    

;***********************************************************************
;
; NOTE: these are defined globa! in £0S_COMN
;
;                     ;GLB     VECTOR_O8H
;                     ;GLB     VECTOR 10H
;                     ;GLB     VECTOR_18H
;                     ;GLB     VECTOR_20H
;                     ;GLB     VECTOR_28H
;                     ;GLB     VECTOR_30H
;                     ;GLB     VECTOR_38H
;                     ;GLB     VECTOR_66H
;
VECTOR_O8H           RET                                  ;rst 8
                     NOP                                  
                     NOP                                  
VECTOR_10H           RET                                  ;rst 10
                     NOP                                  
                     NOP                                  
VECTOR_18H           RET                                  ;rst 18
                     NOP                                  
                     NOP                                  
VECTOR_20H           RET                                  ;rst 20
                     NOP                                  
                     NOP                                  
VECTOR_28H           RET                                  ;rst 28
                     NOP                                  
                     NOP                                  
VECTOR_30H           RET                                  ;rst30
                     NOP                                  
                     NOP                                  
VECTOR_38H           RET                                  ;rst38
                     NOP                                  
                     NOP                                  
VECTOR_66H           RETN                                 ;nmi vector
                     NOP                                  




; NOTE: these are defined global in EQSCOMN

;             ;GLB     SWITCH_TABLE
;             ;GLB     MEM_CNFGOO
;             ;GLB     MEM_CNFGO1
;             ;GLB     MEM_CNFGO2
;             ;GLB     MEM_CNFGO3
;             ;GLB     MEM_CNFGO4
;             ;GLB     MEM_CNFGO5
;             ;GLB     MEM_CNFGO6
;             ;GLB     MEM_CNFGO7
;             ;GLB     MEM_CNFGO8
;             ;GLB     MEM_CNFGO9
;             ;GLB     MEM_CNFGOA
;             ;GLB     MEM_CNFGOB
;             ;GLB     MEM_CNFGOC
;             ;GLB     MEM_CNFGOD
;             ;GLB     MEM_CNFGOE
;             ;GLB     MEM_CNFGOF

LO_BOOT_ROM_N_ALPHA_MASK EQU   0000B                          
LO_INTRINSIC_RAM_TO_7FFFH_MASK EQU   0001B                          
LO_EXPANSION_0_TO_7FFFH_MASK EQU   0010B                          
LO_OS7_N_INTRINSIC_2000H_7FFFH_MASK EQU   0011B                          

HI_INTRINSIC_8000H_TO_0FFFFH_MASK EQU                                  
HI_AUXILLIARY_SLOT_8000H_0FFFFH EQU   0100B                          
HI_EXPANSION_8000H_TO_0FFFFH_MASK EQU   1000B                          
HI_COLECOVISION_CARTRIOGE_SLOT EQU   1100B                          



SWITCH_TABLE:                                             

MEM_CNFGOO                                                
                     DEFB  HI_INTRINSIC_8000H_TO_0FFFFH_MASK,OR,LO_BOOTROM_N_ALPHA_MASK 

MEM_CNFGO1                                                
                     DEFB  HI_INTRINSIC_8000H_TO_0FFFFH_MASK,OR,LO_INTRINSIC_RAM_0_TO_7FFFH_MASK 

MEM_CNFGO2                                                
                     DEFB  HI_INTRINSIC_8000H_TO_0FFFFH_MASK,OR,LO_EXPANSION_0_TO_7FFFH_MASK 

MEM_CNFGO3                                                
                     DEFB  HI_INTRINSIC_8000H_TO_0FFFFH_MASK,OR,LO_OS7_N_INTRINSIC_2000H_7FFFH_MASK 

MEM_CNFGO4                                                
                     DEFB  HI_AUXILLIARY_SLOT_8000H_0FFFFH,OR,LO_BOOT_ROM_N_ALPHA_MASK 

MEM_CNFGO5                                                
                     DEFB  HI_AUXILLIARY_SLOT_8000H_0FFFFH,OR,LO_INTRINSIC_RAM_0_TO_7FFF_MASK 

MEM_CNFGO6                                                
                     DEFB  HI_AUXILLIARY_SLOT_8000H_0FFFFH,OR,LO_EXPANSION_0_TO_7FFF_MASK 

MEM_CNFGO7                                                
                     DEFB  HI_AUXILLIARY_SLOT_8000H_0FFFFH,OR,LO_OS7_N_INTRINSIC_2000H_7FFFH_MASK 

MEM_CNFGO8                                                
                     DEFB  HI_EXPANSION_8000H_TO_0FFFFH_MASK,OR,LO_BOOT_ROM_N_ALPHA_MASK 

MEM_CNFGO9                                                
                     DEFB  HI_EXPANSION_8000H_TO_0FFFFH_MASK,OR,LO_INTRINSIC_RAM_0_TO_7FFFH_MASK 

MEM_CNFGOA                                                
                     DEFB  HI_EXPANSION_8000H_TO_0FFFFH_MASK,OR,LO_EXPANSION_0_TO_7FFFH_MASK 

MEM_CNFGOB                                                
                     DEFB  HI_EXPANSION_8000H_TO_0FFFFH_MASK,OR,LO_OS7_N_INTRINSIC_2000H_7FFFH_MASK 

MEM_CNFGOC                                                
                     DEFB  HI_COLECOVISION_CARTRIDE_SLOT,OR,LO_BOOT_ROM_N_ALPHA_MASK 

MEM_CNFGOD                                                
                     DEFB  HI_COLECOVISION_CARTRIDE_SLOT,OR,LO_INTRINSIC_RAM_0_TO_7FFFH_MASK 

MEM_CNFGOE                                                
                     DEFB  HI_COLECOVISION_CARTRIDE_SLOT,OR,LO_EXPANSION_0_TO_7FFFH_MASK 

MEM_CNFGOF                                                
                     DEFB  HI_COLECOVISION_CARTRIDE_SLOT,OR,LO_OS7_INTRINSIC_2000H_7FFFH_MASK 



;
;  NOTE:       these      are    defined       global       in    E0S_COMN
;
;                                       ;GLB            PORT_TABLE           ;port value memory locations
;                                       ;GLB            MEM_SWITCH_PORT
;                                       ;GLB            NET_RESET_PORT
;                                       ;GLB            VOP_CTRL_PORT
;                                       ;GLB            VOP_DATA_PORT
;                                       ;GLB            CONTROLLER_O_PORT
;                                       ;GLB            CONTROLLER_1_PORT
;                                       ;GLB            STROBE_SET_PORT
;                                       ;GLB            STROBE_RESET_PORT
;                                       ;GLB            SOUNODPORT
;
; ******************************************************
; *** VDP ports must remain next to each other       ***
; ***   and in CTRL -> DATA order                    ***
; ******************************************************

PORT_TABLE:                                               

MEM_SWITCH_PORT                                           
                     DEFB  07FH                           ;MEM_SWITCH_PORT         defined here

NET_RESET_PORT                                            
                     DEFB  03FH                           ;Adam_net reset port     defined here

VOP_CTRL_PORT                                             
                     DEFB  0BFH                           ;VDP ctrl port           01D43H

VDP_DATA_PORT                                             
                     DEFB  0BEH                           ;VOP data port           01D47H

CONTROLLER_O_PO                                           
                     DEFB  0FCH                           ;Controller O            0114BH

CONTROLLER_1_PO                                           
                     DEFB  0FFH                           ;Controller 1            01151H

STROBE_SET_PORT                                           
                     DEFB  080H                           ;Controller strobe set   01157H

STROBE_RESET_PO                                           
                     DEFB  0C0H                           ;Controller strobe reset 01168H

SOUNODPORT                                                
                     DEFB  0FFH                           ;Sound port              0018EH
;
; ******************************************************
; ******************************************************
; ******************************************************



;
; globals routines defined
;
                                                          ;GLB      __WRITEVRAM                 ;VDP support routines
                                                          ;GLB      __READ_VRAM
                                                          ;GLB      __WRITEREGISTER
                                                          ;GLB      __READ_REGISTER
                                                          ;GLB      __FILL_VRAM
                                                          ;GLB      __INIT_TABLE
                                                          ;GLB      __PUT_VRAM
                                                          ;GLB      __GET_VRAM
                                                          ;GLB      __CALC_OFFSET
                                                          ;GLB      __PX_TO_PTRN_POS
                                                          ;GLB      __LOAD_ASCTII
                                                          ;GLB      __PuT_ASCII
                                                          ;GLB      __WR_SPR_ATTRIBUTE

                                                          ;GLB      __DECODER
                                                          ;GLB      __POLLER                    ;controller support routines
                                                          ;GLB      __UPDATE_SPINNER

                                                          ;GLB      __DECLSN                    ;sound chip support routines
                                                          ;GLB      __DECMSN
                                                          ;GLB      __MSNTOLSN
                                                          ;GLB      __ADD816
                                                          ;GLB      ___SOUND_INIT
                                                          ;GLB      __TURN_OFF_SOUND
                                                          ;GLB      __PLAY_IT
                                                          ;GLB      ___SOUNODS
                                                          ;GLB      __EFFECT_OVER

                                                          ;GLB      __SWITCH_MEM                ;memory bank switch support routine
                                                          ;GLB      __PORTCOLLECTION            ;STORE THE PORT ADDRESSES FROM OS 7

;
; external data areas used
;
                                                          ;EXT       VDP_MODEWORD
                                                          ;EXT       VDP_STATUSBYTE
                                                          ;EXT       VRAM_ADDR [FABLE
                                                          ;EXT       SPRITEATTRIBLS
;eee          ;EXT       SPRITEGENTBL
;eee          ;EXT       PATTRNNAMETBL
                                                          ;EXT       PATTRNGENTBL
;eee          ;EXT       COLORTABLE
                                                          ;EXT       CUR_BANK

                                                          ;controller data area
                                                          ;EXT       SPIN_SWO_CT                 ;THESE TWO BYTES MUST BE IN THIS ORDER!!!
;ee@e         ;EXT       SPIN_SW1_CT
                                                          ;EXT       PERSONAL_DEBOUNCE_TABLE
                                                          ;EXT       TEMP_STACK                    ;Used by put_ascii when bank switching
                                                          ;sound data areas
                                                          ;EXT       PTR_TO_LST OF_SND_ADDRS
                                                          ;EXT       PTR_TO_S_ON_0
                                                          ;EXT       PTR_TO_S_ON_1
                                                          ;EXT       PTR_TO_S_ON_2
                                                          ;EXT       PTR_TO_S_ON_3
                                                          ;EXT       SAVE_CTRL
;
;    Port address and  bank  select  externals    follow
;
                                                          ;EXT       PORTTABLE
                                                          ;EXT       MEM_SWITCH_ PORT
;eee          ;EXT       NET_RESET_PORT
                                                          ;EXT       VDP_CTRL_PORT
;eee          ;EXT       VDP_DATA_PORT
                                                          ;EXT       CONTROLLER_O_PORT
;eee          ;EXT       CONTROLLER_1_PORT
                                                          ;EXT       STROBE_SET_PORT
;eee          ;EXT       STROBE_RESET_PORT
                                                          ;EXT       SOUNDPORT

;eee          ;EXT       SWITCH_TABLE
                                                          ;EXT       MEM_CNFGOO
;ee@          ;EXT       MEM_CNFGO1
;eee          ;EXT       MEM_CNFGO2
                                                          ;EXT       MEM_CNFGO3
;eee          ;EXT       MEM_CNFGO4
;eee          ;EXT       MEM_CNFGO5
;eee          ;EXT       MEM_CNFGO6
;eee          ;EXT       MEM_CNFGO7
;eee          ;EXT       MEM_CNFGO8
;eee          ;EXT       MEM_CNFGO9
;eee          ;EXT       MEM_CNFGOA
;ee¢@         ;EXT       MEM_CNFGOB
;ee@          ;EXT       MEM_CNFGOC
;ee@          ;EXT       MEM_CNFGOD
;ece@         ;EXT       MEM_CNFGOE
;ee¢          ;EXT       MEM_CNFGOF

;
; externals used
;
                                                          ;EXT      WRITE_REGISTER
;eee          ;EXT      INIT_TABLE
                                                          ;EXT      SWITCH_MEM
;eee          ;EXT      PUT_VRAM
                                                          ;EXT      WRITE_VRAM
                                                          ;EXT      READ_VRAM
;
; local equates
;
LOC_IN_ALPHA         EQU   0102H                          ;potnter  to  ascii  gens in rev  28+  alpha



; Offsets  into a volume   descriptor  (the first entry in the directory).
VOL_NAME             EQU   0                              ;LOGICALVOLUME NAME
VOL_DIRSIZE          EQU   12                             ;*ee7 BITS ONLY *** # BLOCKS IN DIRECTORY
VOL_ATTR             EQU   12                             ;**eTOP BIT ONLY ***SET FOR DELETE  PROTECTION
VOL_DIR_CHECK        EQU   13                             ;CONTAINS 4 UNIQUE BYTES FOR DIRECTORY   EXISTENCE   VERIFICATION
VOL_SIZE             EQU   17                             ;VOLUMESIZE (IN BLOCKS) (4 BYTES)
VOL_YEAR             EQU   23                             ;CREATIODATE -- YEAR
VOL_MONTH            EQU   24                             ;                MONTH
VOL_DAY              EQU   25                             ;                & DAY
VOL_DES_LENGTH       EQU   26                             

; Offsets  into a directory   entry.
DIR_NAME             EQU   0                              ;FILE NAME
DIR_ATTR             EQU   12                             ;FILE ATTRIBUTE BYTE
DIR_START_BLOCK      EQU   13                             ;STARTING BLOCK4
DIR_MAX_LENGTH       EQU   17                             ;TOTAL #4BLOCKS ALLOCATED
DIR_USED_LENGTH      EQU   19                             ;#OF BLOCKS USED (FULL + 1 PARTIAL)
DIR_LAST_COUNT       EQU   21                             ;NUMBER OF BYTES IN LAST PARTIAL BLOCK
DIR_YEAR             EQU   23                             ;CREATION DATE -- YEAR
DIR_MONTH            EQU   24                             ;                MONTH
DIR_DAY              EQU   25                             ;                & DAY
DIR_ENT_LENGTH       DEFL  26                             

ENT_PER_BLOCK        EQU   1024/26                        ;NUMBEROF ENTRIES PER DIR BLOCK

; Offsets  into an FCB  header.

; Copy of  DIR entry

FCB_NAME             EQU   0                              ;FILE NAME
FCB_ATTR             EQU   12                             ;FILE ATTRIBUTE BYTE
FCB_START_BLOCK      EQU   13                             ;STARTING BLOCK ¥#
FCB_FIRST_BLOCK      EQU   FCB_START_BLOCK                
FCB_MAX_LENGTH       EQU   17                             ;TOTAL # BLOCKS ALLOCATED
FCB_USED_LENGTH      EQU   19                             ;# OF BLOCKS USED (FULL + 1 PARTIAL)
FCB_LAST_COUNT       EQU   21                             ;NUMBER OF BYTES IN LAST PARTIAL BLOCK

FCB_STORED_BYTES     EQU   FCB_LAST_COUNT+1               ; NUMBER OF BYTES STORED  ON DEVICE
                                                          ; ... THE UPPER HALF OF THIS  FCB  EQU  LIST

FCB_DEVICE           EQU   26-3                           ;NUMBER OF DEVICE CONTAINING  FILE
FCB_MODE             EQU   27-3                           ;FILE MODE (UNUSED, READ,  WRITE,APPEND)
FCB_BLOCK            EQU   28-3                           ;>BLOCKNUMBER CURRENTLY IN  BUFFER
FCB_LAST_BLOCK       EQU   32-3                           ;LAST BLOCK NUMBER IN FILE
FCB_POINTER          EQU   36-3                           ;-POINTERINTO BLOCK BUFFER
FCB_LENGTH           EQU   38-3                           

; Possible  FCB modes.
;*
;* PROTECTED  MODE EQUATES
;*
MODE_UNUSED          EQU   0                              ;MANY PEOPLE ASSUME THIS IS ZERO!
MODE_READ            EQU   MODE_UNUSED+1                  
MODE_WRITE           EQU   MODE_READ+1                    
MODE_UPDATE          EQU   MODE_WRITE+1                   
MODE_EXEC            EQU   MODE_UPDATE+1                  
MODE_MAX             EQU   MODE_EXEC+0                    
;*
MODE_REMAINDER_BIT   EQU   5                              ; INDICATES TO ALLOCATE REST  OF  TAPE
MODE_DIRTY_BIT       EQU   6                              ; TEST BIT 6
MODE_DIRTY           EQU   010000008                      ;INOICATES MODIFIED BUFFER
MODE_LAST_BLOCK_BIT  EQU   7                              ; TEST BIT 7
MODE_LAST            EQU   100000008                      ;INDICATES LAST BLOCK OF FILE
MODE_MODE            EQU   000001118                      ;BITS TO STORE MODES

; File attribute bits.
ATTR_PERMANENT       EQU   10000000B                      
ATTR_WRITE_PROT      EQU   01000000B                      
ATTR_READ_PROT       EQU   00100000B                      
ATTR_USER            EQU   00010000B                      
ATTR_SYSTEM          EQU   00001000B                      
ATTR_DELETED         EQU   00000100B                      
ATTR_DEL_BIT         EQU   2                              
ATTR_EXECUTE         EQU   00000010B                      
ATTR_HOLE_BIT        EQU   0                              
ATTR_HOLE            EQU   00000001B                      

; System-wide file name length.
NAME_LENGTH          EQU   12                             

; Numbers of things we nave.
NUM_FCBS             EQU   3                              ;1 FOR THE SYSTEM, 2 FOR THE USER


DCB_NOT_FOUND        EQU   1                              ;  THERE WAS NO DCB FOR  THE  DEVICE  REQUESTED.
DCB_BUSY             EQU   2                              ;  OCB IS BUSY
DCB_IDLE_ERR         EQU   3                              ;  OCB IS IOLE

NO_DATE_ERR          EQU   4                              
NO_FILE_ERR          EQU   5                              
FILE_EXISTS_ERR      EQU   6                              
NO_FCB_ERR           EQU   7                              
MATCH_ERR            EQU   8                              
BAD_FNUM_ERR         EQU   9                              
EOF_ERR              EQU   10                             
TOOBIG_ERR           EQU   11                             
FULL_DIR_ERR         EQU   12                             
FULL_TAPE_ERR        EQU   13                             
FILE_NM_ERR          EQU   14                             ;0LS(8/28/83)
RENAME_ERR           EQU   15                             ;DLS(8/30/83)
DELETE_ERR           EQU   16                             ;DLS(8/30/83)
RANGE_ERR            EQU   17                             ;DLS(8/31/83)

CANT_SYNC1           EQU   18                             
CANT_SYNC2           EQU   19                             
PRT_ERR              EQU   20                             

RQ_TP_STAT_ERR       EQU   21                             
DEVICE_DEPD_ERR      EQU   22                             
PROG_NON_EXIST       EQU   23                             ; PROGRAM DOES NOT  CURRENTLY   EXIST
NO_DIR_ERR           EQU   24                             ; NO DIRECTORY ON  TAPE


;THESE  OUR  EQUATES   THAT  ARE  USED  BY  THE  EOS  PROGRAMS   TO REFEFERNCE
;PCB AND  DCB INFORMATION


;PCB EQUATES

P_COM_STAT           EQU   0                              ; THIS  IS  THE COMMAND/STATUS     BYTE

P_REL_ADDR           EQU   1                              ; THIS  IS  THE RELOCATION    ADDRESS
P_REL_AODR_LO        EQU   P_REL_ADDR+0                   
P_REL_ADOR_HI        EQU   P_REL_ADDR+1                   

P_NUM_DCBS           EQU   3                              ; THIS  IS  THE NUMBER   OF  DCBS  DEFINED


P_SIZE               DEFL  4                              ; THE NUMBER   OF  BYTES  IN  THE  PCB



;DCB EQUATES

D_COMSTAT            EQU   0                              ; THE  COMMANO   STATUS  BYTE

D_BUF_ADR            EQU   1                              ; ADDRESS   OF  THE DATA   BUFFER
D_BUF_ADR_LO         EQU   D_BUF_ADR+0                    
D_BUF_ADR_HI         EQU   D_BUF_ADR+1                    

D_BUF_LEN            EQU   3                              ; THE  LENGTH   OF THE  DATA  BUFFER
D_BUF_LEN_LO         EQU   D_BUF_LEN+0                    
D_BUF_LEN_HI         EQU   D_BUF_LEN+1                    

D_SECT_NUM           EQU   5                              ; THE  BLOCK  DEVICE   SECTOR   NUMBER

D_SEC_DEV_ID         EQU   9                              ; SECONDARY   DEVICE   ID

D_RET_COUNT          EQU   14                             ; THE  NUMBER   OF TIMES  A  COMMAND   WILL
                                                          ; BE  RETRIED.
D_RET_COUNT_LO       EQU   D_RET_COUNT+0                  
D_RET_COUNT_HI       EQU   D_RET_COUNT+1                  

D_DEV_ADDR           EQU   16                             ; THE  DEVICE   ADDRESS  (1D)

D_MAX_MSG_LEN        EQU   17                             ; THE  MAX  LENGTH  OF  A DATA   STRING
                                                          ; FOR  THE  DEVICE
D_MAX_MSG_LN_LO      EQU   D_MAX_MSG_LEN+0                
D_MAX_MSG_LN_HI      EQU   D_MAX_MSG_LEN+1                

D_DEV_TYPE           EQU   19                             ; THE  DEVICE   TYPE,  BLOCKED   OR CHARACTER

D_STATUS_FLAGS       EQU   20                             ; DEVICE  DEPENDENT    STATUS  FLAGS

D_SIZE               DEFL  21                             ; THE  NUMBER  OF  BYTES  IN  THE  DCB



;DEVICE  ID‘S  FOR  THE KEYBOARD,    PRINTER,   AND  TAPE  DRIVE

KEYBOARD_ID          EQU   1                              ;KYBD   ID
PRINTER_ID           EQU   2                              ;PRINTER  ID
TAPE_ID              EQU   8                              ;TAPE DRIVE  ID

ERROR_RETRY          EQU   2                              ;MAX RETRYS ON  ERRORS,   READ BLOCK  AND  WRITEBLOCK

MAX_DEV_ADDR         EQU   15                             ;HIGEST POSSIBLE  DEVICE   ADDRESS
                                                          ; ON NETWORK


;PCB COMMAND   EQUATES


PCB_IDLE             EQU   0                              ;THIS  ISAN  IDLE STATE

PCB_SYNC1            EQU   1                              ;SYNC BYTE  1
PCB_SYNC1_ACK        EQU   PCB_SYNC1+80H                  

PCB_SYNC2            EQU   2                              ;SYNC BYTE 2
PCB_SYNC2_ACK        EQU   PCB_SYNC2+80H                  

PCB_SNA              EQU   3                              ; SET NEW PCB ADDRESS
PCB_SNA_ACK          EQU   PCB_SNA+80H                    

PCB_RESET            EQU   4                              ; RESET ALL NODES
PCB_RESET_ACK        EQU   PCB_RESET+80H                  

PCB_WAIT             EQU   5                              ;
PCB_WAIT_ACK         EQU   PCB_WAIT+80H                   



;DCB COMMAND   EQUATES

DCB_IDLE             EQU   00                             ;
DCB_STATUS           EQU   01                             ; REQUEST STATUS
DCB_RESET            EQU   02                             ; RESET NODE
DCB_WR               EQU   03                             ; WRITE DATA TO DEVICE
DCB_RD               EQU   04                             ; READ DATA FROM DEVICE



INIT_PCB_ADDR        EQU   0FEC0H                         ; INITIAL ADDRESS  OF  THE PCB

FCB_S                EQU   0D390H                         ; FCB HEADER AREA
THREE1K_BLKS         EQU   0D400H                         ; 3K FCB DATA AREA


;GENERAL  USAGE  EQUATES    FOR USE WITH  DCB INFO

CMND_COMPLETE_BIT    EQU   7                              ; THIS IS THE BIT  THAT  INDICATES   THE
                                                          ; COMMAND HAS BEEN  PROCESSED.
CMND_FIN_STATUS      EQU   80H                            ; THIS IS THE STATUS  OF  A COMMAND
                                                          ; THAT COMPLETED WITH  NO  ERRORS
KBD_NAK              EQU   BCH                            ; INDICATES NO KEY  READY

PR_NAK               EQU   86H                            ; INDICATES THE PRINTER   IS BUSY

ETX                  EQU   03H                            ; END OF DATA STRING INOICATOR

TIMEOUT              EQU   9BH                            ; DEVICE TIMED OUT
;
;****************************************************************************************
;****************************************************************************************
;****************************************************************************************
;
SKIP                                                      

NAME ^Rev O7 - jki^

;DeA_uOS  OO MACRO               ;Header Rev. 5
;                .GOTO Ede_A_uOS_00

; Project:      ADAM, 83-101

;****************************************************************************************
;      sees                                                    eeee
;      eeee             A_uO000              RPD               seee
;     eee                                                     ess
;****************************************************************************************
;
;
;        Rev History
;        Rev.  Date         Name       Change
;         7    O8oct1545    jk         make  LOAD ASCII  load chars from  O to 7F
;         6    O8oct0003    rfj        Fixed 100H bug with Bob Greenberg's
;                                       algorithm
;         5    O7oct1708    rfj        __EFXOVER changed to _ EFFECT_OVER
;         4    OSoct10:40   rfj        Decoder now saves Acc before getting
;                                       interrupt data
;                                       Removed excess documentation on Put/Load   Ascii
;                                       Commented out all unreferenced symbols  with  ;eee
;                                       Renamed WRSPR_NM_TBL  to WR_SPR_ATTRIBUTE
;                                       globalized  UPDATE SPINNER
;                                       new address fcr the ASCII table  referenced
;         3    28septi3i7   rfj        Multy changes after personal review
;                                       but not approved
;         2    25sept900a   RPD        made ram externa!
;         1    24septi250p  RPO        addition of more routines & new port  accessing
;         O    24aug430p    RPO        Initial creation date (READ & WRITE  VRAM)
;
;A_u0SOO  stands for ADAM micro  Operating System version O. This file
;contains a scaled down mode! of  COLECOVISION OS 7. Primary routines from
;OS 7 are duplicated for ADAM application  programs use. The functional  areas
;that are supported by these routines  are the VDP, the controllers, the  sound
;chip, memory bank switch, port  collection.




;****************************************************************************************

                     ORG   EOS_CODE                       

;****************************************************************************************

;   Name:                WRITE_VRAM
;
;   Function:            Writes to VRAM the contents of the data in a buffer area.
;
;   Entry:               BC  -  number of bytes to be written
;                        DE  -  starting VRAM address to be written to
;                        HL  -  address of buffer containing the  data
;
;   Exit:                None.
;
;   Registers    used:   AF,  BC,   DE,   HL
;
;   Size:                ROM  -  28  bytes
;                        RAM  -  O  bytes
;
;   Comments:            This   version    of  WRITE   _VRAM   is  provided     for  EOS   operation.
;                        NOTE:   The   100H   bug   found   in  OS  7  has   been   corrected.
;
;   Comparision:         left  out   pascal    entry    point
;                        code  compacted
;                        100H  bug   fixed
;                        edited   for   documentation
;                        reference     port   table

WRITE_VRAM:                                               
                     PUSH  BC                             ;BC   has   the  number    of  bytes    to  xfer
                     EX    DE,HL                          ;>HL<--vram     addr  ,0E<--source     address
                     CALL  SET_WRITE                         :PUMP    THE  VRAM   ADDR   TO  THE   VDP 
                     LD    L,C                            ;save    C  (the  data  _port_addr    )
                     POP   BC                             ;restore     the  xfer   count
                     EX    DE,HL                          ;HiL<--source     address,port       in€
                     LD    A,C                            ;Save    low  order   of  count     in A
                     LD    C,,€                           ;  And  get   the   port   into   C
                     LD    0,8                            ;Get   HI  order    count   in  DO
                                                          ;  to  free   up  B  for   low  order    count
                     INC   D                              ;Increment      Hi  count   to  cover
                                                          ;  for  O   in  DEC  D  after    low  loop
                     LD    B,A                            ;Put   low   order   in  86 for   OUTI
                     OR    A                              ;Check    tf  low   order   is  zero   the    first   time
                     JR    Z,OUT_DEC_HI_BYTE              ;If   so  then   decrement     Hi  count   before     low  loop
OUTPUT_LOOP:                                              
                     OUTI                                 ;DATA  PORT     = buffer   data      write    the   data  to  the   VOP
                                                          ;>for   OUTI:    [C]  <--   [HL],   B  =  B  -   1 and  HL  =  HL  +  1
                     NOP                                  ;Gelay    for   stow  VOP
                     NOP                                  
                     JR    NZ,OUTPUT    LOOP              ;until    byte   count   low   (B  reg)   =  0
OUT_DEC_HI_BYTE:                                          
                     DEC   D                              ;>byte  count    high   = byte    count   high    -  1
                     JR    NZ,OUTPUT    LOOP              ;until    byte   count   high   (A  reg)   =   O
                     RET                                  

;
;   Name:                   READ_VRAM
;
;   Function:               Reads from VRAM and puts the read data into a buffer area.
;
;   Entry:                  BC  - number of bytes to be read
;                           DE  - starting VRAM address to be read from
;                           HL  - address of buffer to receive the read data
;
;   Exit:                   None.
;
;   Registers      used:    AF,  BC,  DE,   HL
;
;   Size:                   ROM  - 22  bytes
;                           RAM  - O  bytes
;
;   Comments:               This  version of READ_VRAM is provided for stand alone operation.
;                           NOTE:  The 1OOH bug found in OS 7 has been corrected.
;
;   Comparision:            left  out pascal entry point
;                           code  compacted
;                           100H  bug fixed
;                           edited for documentation
;
__READ_VRAM:                                              
                     PUSH  BC                             ;BC  has   the  number    of  bytes    to  xfer
                     EX    DE,HL                          ;HL<--vram     addr  ,DE<--source      address  .
                     CALL  SET READ                       ;pump   the  vram   addr    to  the   vdp
                     LD    L,C                            ;save   C  (the   data_port_  addr)
                     POP   BC                             ;restore    the   xfer  count
                     EX    DE,HL                          ;HL<--source      address,port       ine
                     LD    A,C                               :SAVE    LOW  ORDER    OF  COUNT    INA 
                     LD    C,E                            ;  And   get  the   port   into   C
                     LD    D,8                            ;Get   HI  order    count    in OD
                                                          ;  to  free   up  B  for   tow   order   count
                     INC   D                                  >INCREMENT     HI  COUNT   TO   COVER 
                                                          ;  for   O  tn  DEC  D  after    tow   loop
                     LD    B,A                            ;Put   low   order   in  86 for   OUTI
                     OR    A                              ;Check    if  tow   order   is   zero   the  first     time
                     JR    Z,IN_DEC_HI_BYTE               ;If   so  then   decrement     Hi  count    before     low   loop
INPUT_LOOP:                                               
                     INI                                  ;DATA_PORT      = buffer   data      read   the  data     from   to    the   VDP
                                                          ;for   INI:   [C]}  <--  [HL],    B  =  B  -  1 amd    HL  =  HL   +   1
                     NOP                                  ;delay    for   slow   VDP
                     NOP                                  
                     JR    NZ,INPUT_LOOP                  ;until    byte   count   low   (B  reg)    = O
IN_DEC_HI_BYTE:                                           
                     DEC   D                              ;byte   count    high   = byte    count    high   -   1
                     JR    NZ,INPUT_LOOP                   SUNTIL    BYTE   COUNT   HIGH    [A  REG]   =  O 
                     RET                                  

;
;   Name:                 WRITE_REGISTER
;
;   Function:             Writes a data byte vaiue to a desired VDP register
;
;   Entry:                B - register number to write to
;                         C - data byte value to be written
;
;   Exit:                 if register number = 0 or 1, the  respective byte
;                         of the VDP_MODE_WORD is updated.
;
;   Registers     used:   A,BC,E
;
;   Size:                ROM  - 27  bytes
;                         RAM - O  bytes
;
;   Comments:            This version    of  WRITE  REGITER      1s provided    for  stand    alone    operation.
;
;   Comparision:          left out  pascal    entry   point
;                        code  compacted
;                        edited   for  documentation

__WRITE_REGISTER:                                         
                     LD    E,C                            ;Move   data  to  E— register
                     LD    A,[VDOP_CTRL_PORT]             ;Get  the  control    port    value
                     LD    C,A                            ;Put   in Cc
                     OUT   [C],E                          ;Output   data   value.
                     LD    A,B                            ;Get  port   #  INA
                     OR    80H                            ;Set  high   bit  for   277772?
                     OUT   [C],A                          ;Out  to  VOP
                     LD    A,B                            ;Get  back   port  value
                     OR    A                              ;Check   for  zero
                     LD    A,E                            ;Put  data   in  accumulator

                     JR    NZ,CHK_REG   1                 ;1f  not  zero   then   see   if  register     1
                     LD    [VDP_MODE_WORD],A              ;If  register    zero   was   written     to then
                                                          ; Save   data   in VDP_MODE    WORD
                     RET   SEXIT                          

CHK_REG_1:                                                
                     DEC   B                              ;Check   for  register     1  in  B
                     RET   NZ                                -IF  NOT  THEN   RETURN 
                     LD    [VDOP_MODE  WORD+1],A             >IF  SO  THEN  STORE   DATA    IN  VOP_MODE    WORD?! 
                     RET   -EXIT                          



;     Name:                 READ_REGISTER
;
;     Function:             Reads a data byte value from the Colecovision CTRL_PORT.
;
;     Entry:                None.
;
;     Exit:                 A  -  data byte value read in
;
;     Registers used:       A,C
;
;     Size:                 ROM   -  3 bytes
;                           RAM   -  O  bytes
;
;     Comments:             This version of READ_REGISTER is provided for stand alone operation.
;                           This routine does a direct access to the COLECOVISION I/O ports.
;
;     Comparision:          edited for documentation
;
__READ_REGISTER:                                          
                     LD    A,[VOP_CTRL_PORT]              
                     LD    C,A                            
                     IN    A,[C]                          ;get    the   data   from   CTRL_PORT
                     LD    [VOP_STATUS_BYTE],A            ;Save    a  copy    of  VDP   status    data
                     RET                                  


;
;   Name:               FILL_VRAM
;
;   Function:           Fill a VRAM memory buffer with a constant byte value.
;
;   Entry:              A - constant byte vaiue to be written
;                       DE - number of bytes in the VRAM memory buffer
;                       HL - starting VRAM address to be written to
;
;   Exit:               None.
;
;   Registers    used:  AF, C, DE
;
;    Size:               ROM - 18 bytes
;                        RAM - O bytes
;
;    Comments:           This version of FILL_VRAM is provided for stand alone operation.
;                        This routine does a direct access to the COLECOVISION I/O ports.
;
;    Comparision:        edited for documentation
;                        uneeded call to READ_REGISTER taken out


FILL_VRAM:                                                
                     PUSH  AF                             ;Save the  data to fill with
                     CALL  SET_WRITE                      ;Sets the  ctrl port data and
                     POP   HL                             ;popping  AF into HL to restore the  fill  data
FILL:                                                     ;repeat
                                                          ;  get back  a copy of the saved constant
                     OUT   [C],,H                         ;  write  the constant out to the VRAM  buffer
                     DEC   DE                             ;  byte  count = byte count - 1
                     LD    A,O                            ;until byte  count = O
                     OR    E                              
                     JR    NZ,FILL                        
                     RET                                  ;all done

;
;
;   Name:                  INIT_TABLE
;
;   Function:              INIT TABLE initializes the addresses of the VRAM tabies.
;                          The passed address is converted to the correct format needed
;                          to setup the VDP address registers. The following tabie codes
;                          are use to indentify which table address is being setup:
;
;                            O  - SPRITE ATTRIBUTE TABLE    (SAT)
;                            1  - SPRITE GENERATOR TABLE    (SGT)
;                            2  - PATTERN NAME TABLE        (PNT)
;                            3  - PATTERN GENERATOR TABLE   (PGT)
;                            4  - PATTERN COLOR TABEL       (PCT)
;
;   Entry:                A   -  table code (see above)
;                         HL  -  table address
;
;   Exit:                 None.
;
;   Registers     used:   AF,  BC,   HL,  IX,   IY
;
;   Size:                 ROM  -  99  bytes
;                         RAM  -  O  bytes
;
;   Comments:             This   version    of  INIT_TABLE    is  provided    for   stand   alone    operation.
;
;   Comparision:           jleft out  pascal    entry   point
;                         code  compacted
;                         edited   for   documentation
;
__INIT_TABLE:                                             

                     LD    C,A                            
                     LD    B,0                            
                     LD    IX,VRAM_ADDR_TABLE             ;point    to  start   of  VRAM_ADOR_TABLE
                     ADD   IX,BC                          ;add   in  the   index
                     ADD   IX,BC                          
                     LD    [IXX+0],L                      ;save   the  address
                     LD    [IX+1],H                       
                                                          ;CHECK   VDP   GRAPHICS    MODE
                     LD    A,[VDP_MODE    WORD]           ;'f  VDOP_MODE  WORD    bit   t   mode   bit   3   =  1
                     BIT   1,8                            
                     JR    Z,INIT_TABLE8O                 
                                                          ;   ts   graphics     mode   2,  look   for   PGT  or  PCT   first
                     LD    A,C                            ;   get  the   table   code
                     CP    3                              ;   if  table   code   =  PGT
                     JR    Z,CASE  OF  GEN                ;      then  setup   PGT   address
                     CP    4                              ;      {f  table   code   = PCT
                     JR    Z,CASE  OF  COLOR              ;      then  setup   PCT   address
                     JR    INIT  TABLE8O                  ;     else   not   a special     case,   use   normal   setup

;
; special    case:   graphics   mode   2,  address    of  PGT
;
CASE_OF_GEN:                                              
                     LD    B,4                            ;register   mumber  *  PGT   base  address    register
                     LD    A,L                            ;if  PGT  address  =  QOOOH                                                                      
                     OR    H                              
                     JR    NZ,CASE_OF_GEN_IO              
                     LD    C,3                            ;   data  byte  value  for   address   OOOOH
                     JR    INIT_TABLES0                   
CASE_OF_GEN_IO:                                           ;else    PGT address   <>  OOOOH
                     LD    C,7                            ;   data  byte  value  for   address   2000H
                     JR    INIT_TABLES90                  ;endif
;
; special    case:   graphics   mode   2,  address    of  PCT
;
CASE_OF_COLOR:                                            
                     LD    8,3                            ;register   number  =  PCT   base  address    register
                     LD    AL                             ;if  PCT  address  =  QOOQOH
                     OR    H                              
                     JR    NZ,CASE   OF  CLR10            
                     LD    C,7FH                          ;   data  byte  value  for   address   OOOOH
                     JR    INIT_TABLE90                   
CASE_OF_CLRIO:                                            ;else    PCT address   <>  OOOOH
                     LD    C,OFFH                         ;   Gata  byte  value  for   address   2000H
                     JR    INIT_TABLE90                   ;endif
;
; not  a  special    case  (i.e.  not   mode   2,  PGT  or    PCT)
;
INIT_TABLE8O:                                             ;base   address  = table   address    /  factor
                     LD    IY,BASE  FACTORS               ;potnt   to start  of  the   the  factor   table
                     ADD   IY,BC                          ;index   into the  table   by  the  table    code
                     ADD   IY,6C                          
                     LD    A,[IY+0]                       ;get  the  shift  count
                     LD    B,[IY+1]                       ;get  the  register   number
DIVIDE:                                                   
                     SRL   H                                  :SHIFT   HI-BYTE 
                     RR    L                                  :SHIFT   LO-BYTE 
                     DEC   A                              ;shift   count  = shift   count   -  1
                     JR    NZ DIVIDE                      
                     LD    C,L                                :GET  THE  DATA  BYTE  VALUE 
INIT_TABLE90:                                             
                     CALL  WRITE_REGISTER                 ;setup   the base  register
                     RET                                  

;
; base factor  table, used  to calculate base  addresses
;
BASEFACTORS:                                              
                     DEFB  7                              ;table code O base factor
                     DEFB  5                              ;register 5, SAT base address
                     DEFB  11                             ;table code 1 base factor
                     DEFB  6                              ;register 6, SGT base address
                     DEFB  10                             ;table code 2 base factor
                     DEFB  2                              ;register 2, PNT base address
                     DEFB  11                             ;table code 3 base factor
                     DEFB  4                          :REGISTER 4,PGT BASE ADDRESS 
                     DEFB  6                              ;table code 4 base factor
                     DEFB  3                              ;register 3, PCT base address

;
;   Name:                PUT_VRAM
;
;   Function:            Gets a block of data from a user buffer and puts it into VRAM.
;                        The following table codes are used to identify which VRAM table
;                        is being referenced:
;
;                          O  - SPRITE ATTRIBUTE TABLE      (SAT)
;                          1  - SPRITE GENERATOR TABLE      (SGT)
;                          2  - PATTERN NAME TABLE          (PNT)
;                          3  - PATTERN GENERATOR TABLE     (PGT)
;                          4  - PATTERN COLOR TABLE         (PCT)
;
;   Entry:               A  -  table code (see above)
;                        DE -  starting index into the table
;                        Hi -  address of user buffer
;                        IY -  block size (or byte count)
;
;   Exit:                None.
;
;   Registers    used:   AF, DE, HL, IY
;
;   Routines    used:    SET_COUNT
;
;   Size:                ROM -  O bytes
;                        RAM -  O bytes
;
;   Comments:            This version of PUT_VRAM is provided for stand alone operation.
;
;   Comparision:         left out pascal entry point
;                        took out the mux sprites capablity
;                        code compacted
;                        edited for documentation
;
__PUT_VRAM:                                               
                     CALL  SET COUNT                      ;setup    the  actual    byte   count   and  the  absolute VRAM  address
;*                   CALL     WRITE  VRAM                      ;VRAM    data  =  user   buffer
;+                   RET
                     JP    WRITE  VRAM                    



;   Name:             GET_VRAM
;
;   Function:         Gets a block of data from VRAM and stores it into a user buffer.
;                     The following table codes are used to identify which vRAM table
;                     is being referenced:
;
;                       O - SPRITE ATTRIBUTE TABLE   (SAT).
;                       1 - SPRITE GENERATOR TABLE   (SGT)
;                       2 - PATTERN NAME TABLE       (PNT)
;                       3 - PATTERN GENERATOR TABLE  (PGT)
;                       4 - PATTERN COLOR TABEL      (PCT)
;
;   Entry:            A - table code (see above)
;                     DE - starting index into the table
;                     HL - address of user buffer
;                     IY - block size (or byte count)
;
;   Exit:             None.
;
;   Registers  used:  AF, DE, HL, IY
;
;   Routines  used:   SET_COUNT
;
;   Size:             ROM - O bytes
;                     RAM - O bytes
;
;   Comments:         This version of GET_VRAM is provided for stand alone operation.
;
;   Comparision:      left out pascal entry point
;                     code compacted
;                     edited for documentation

__GET_VRAM:                                               
                     CALL  SETCOUNT                       ;setup  the actual byte count and the  absolute VRAM  address
                     CALL  READ_VRAM                      ;user buffer  = VRAM data
                     RET                                  
                     JP    READ_VRAM                      

;
;  CALLED     BY   PUT_VRAM_     AND  GET  VRAM_
;
; SETS     BYTE   COUNT    AND  INDEX   FOR   WRITES     TO  AND   READS   FROM   VRAM.
;
;   TABLE                BYTES/ITEM
;   SPRITE   NAME               4
;   SPRITE   GEN                8
;   PATTERN    NAME             1
;   PATTERN    GEN              #
;   COLOR    (MODE     1)       1
;   COLOR    (MODE    2)        a
;
SET_COUNT                                                 
                     PUSH  IY                             ;Save   count   on  stack
                     LD    C,A                            ;Get  table   code    4
                     CP    4                              ;See   if color    table
                     JR    NZ,NOT   COLOR   TBL_ACCESS    ;If  not   then  check    for  name    table
                                                          ;Color   Table
                     LD    A,[VOP_MODE    WORD]           ;Get   mode   word   to  check    graphics     type
                     AND   02H                            ;Bit    1 indicates     mode   i  or  2
                     JR    Z,ADD_TO_  BASE                ;If   mode   1  then  start    index    is  not   modif   ted
                     LD    A,C                            ;Get   table   code   back
                                                          ;Fall    through    to  multiply     by  8  for   mode   2.
NOT_COLOR_TBL_ACCESS                                      
                     CP    2                              ;Check    for  Name    table
                     JR    Z,ADD  TO  BASE                ;If   so  then   don’t   modify    start    index
                                                          ;At   this  point    the   table   code    is:
                                                          ;   Sprite   attribute      table,    Sprite    gen   table,
                                                          ;  Pattern    gen   table,   or   Color   table     in  Mode   2

                     EX    DE,HL                              -GET   COUNT    IN HL 
                     ADD   HL,HL                          ;*2

                     ADD   HL,HL                          ;*4
                     OR    A                              ;Check    for  Sprite    attr   table
                     JR    Z,HAVE_CNT                     ;If   so  then   Index*4    is  complete
                     ADD   HL,HL                          ;If  not   then   Index*8     is  required
                                                          ;  this   is  for   the  pattern    gen   table,
                                                          ;  sprite   gen   table,    or  color    gen   table
                                                          ;  in  mode   2.
HAVE_CNT:                                                 
                     EX    DE,HL                          ;Put   updated    index    in  DE
                     EX    [SP],HL                        ;Get   count   off   stack
                                                          ;Put  address    of  RAM   buffer    on  stack

                                                          ;Now   modify    the  count    for:
                                                          ;  Sprite   attribute      table,   Sprite     gen   table,
                                                          ;  Pattern    gen   table,   or   Color   table     in  Mode   2
                     ADD   HL,HL                          
                     ADD   HL,HL                          
                     JR    Z,HAVE_CNT2                    ;If  Sprite    attr   table    then   +4  {is  enoungh
                                                          ;  (the   zero   flag   is  still   set   from    earlier)
                     ADD   HT,HL                          ;Count    *8  for  remaining      tables
HAVE_CNT2:                                                
                     EX    [SP],HL                        ;Save   updated    count    on  stack
                                                          ;Restore    RAM   buffer    off   stack
ADD_TOBASE:                                               
                     LD    A,C                            ;Get table code back
                     LD    BC,VRAMADDR_ TABLE             ;Get top of address table
                     PUSH  HL                             ;Save RAM buffer on stack
                     LD    H,OOH                          ;Put table code tnto HL
                     LD    L,A                            
                     ADD   HL,HL                          ;*2 to offset for addresses   in table
                     ADD   HT,BC                          ;Add to top of table
                     LD    A,[HL]                         ;Low byte of VRAM table address
                     INC   HL                             
                     LD    H,[HL]                         ;High byte of VRAM table  address
                     LD    L,A                            
                     ADD   HL,DE                          ;Add offset from start of  table
                     EX    DE,HL                          ;Absolute VRAM address  in DE
                     POP   HL                             ;Restore RAM buffer address
                     POP   BC                             ;Restore Count into BC
                                                          ;Registers are now ready  for
                                                          ; a call to the basic READ/WRITE   VRAM routines
                     RET                                  ;Exit

;*******************      CALC  OFFSET    *****************************************************************
;
;DESCRIPTION:         THIS ROUTINE CALCULATES THE PROPER OFFSET INTO THE NAME TABLE
;                     FOR THE PATTERN POSITION GIVEN BY X PAT_POS, Y_PAT_POS. THE
;                     FORMULA USED IS:   OFFSET =  32*Y_PAT_POS + XPAT_POS
;
;INPUT:               D  =   X_PAT_POS
;                     E  =   Y_PaT_POS
;
;OUTPUT  -            DE =   OFFSET
;
;**********************************************************************************************************
;
__CALC_OFFSET:                                            
                     PUSH  HL                             ;save   HL
                     BIT   7,D                            ;1f   Y_PAT  POS     is minus
                     JR    Z,ELSE_11                      
                     LD    H,OFFH                         ;   extend     negative    sign
                     JR    END_IF_11                      
ELSE_11:                                                  ;else
                     LD    H,O                            ;   extend     positive    sign
END_IF_11:                                                ;endif

                     LD    L,D                            ;OFFSET    =   32*Y PAT   POS    + X PAT   POS
                     ADD   HL,HL                            SHL=2*Y   PAT   POS 
                     ADD   HL HL                          ;     4+     .
                     ADD   HL,HL                            >     OF     * 
                     ADD   HL,HL                          ;   16       .
                     ADD   HL,HL                             > ; 32s      °

                     BIT   7,€                               > 1F  X_PAT_POS     IS  MINUS 
                     JR    Z,ELSE_12                      
                     LD    D,OFFH                             > ; extend    negative     sign
                     JR    END_IF_12                      
ELSE_12:                                                  ;else
                     LD    0,0                            ;   extend    positive     sign
ENO_IF_12:           endif                                

                     ADD   HL,DE                          ;HL=32¢Y   PAT    POS   +  XPAT_POS
                     EX    DE,HL                          
                     POP   HL                             ;restore    HL   intact
                     RET                                  

; ********************    PX TO.PTRN.  POS  ***************************************
;DESCRIPTION:       DIVIDES REG DE BY 8, IF SIGNED RESULT > 127 THEN E :=  MAX SIGNED
;                   POSITIVE NUMBER.  IF RESULT < -128,  THEN  E := MIN NEGATIVE NUM
;INPUT:              DE =  16  BIT SIGNED  NUMBER
;OUTPUT:             DE/8 < -128       E =  -128
;        -128   <= DE/8   <=+127      E  = DE/8
;        +127   <  DE/8               E  = +127
; *********************************************************************************
;
__PX_TO_PTRN_POS:                                         

                     PUSH  HL                             ;HL  USED  TO  TEST  MAGNITUDE
;
                     PUSH  BC                             ;B  WILL  BE  USED  AS  A  COUNTER   IN  THE   DIVIDE
                     LD    B,3                            
PX_2_P_P_1:                                               ;(THIS   IS  THE START   OF  THE   DIVIDE   LOOP)
                     SRA   D                              ;16  BIT  SHIFT  LEFT
                     RR    E                              
                     DJNZ  PX_2 P_P_1                     ;DIVIDE   BY  8 LOOP
                     POP   BC                             ;RESTORE   BC  TO  OLD  VALUE
;
                     LD    HL,OFF80H           -SET   HL TO  -128 
                     BIT   7,0                            ;1S  RESULT   OF DIVIDE    NEGATIVE?
                     JR    NZ,NEGTV                       
;
                     ADD   HL,DE                >IF DE-128   < O  [FRNC]  RETURN 
                     POP   HL                   -SAME   AS [IF  DE<=127    RETURN] 
                     RET   NC                             
                     LD    E,7FH                          ;1F  >  128,  THEN  E  >=  MAX  SIGNED   +  NUM.
                     RET                                  
;
NEGTV:               LD    H,OOH                          ;SET   HL TO  128
;
                     ADD   HL,DE                IF  DE+128   >= O  RETURN 
                     POP   HL                             ;same   as (IF  DE>=-128    RETURN)
                     RET   C                              
                     LD    E,80H                          ;IF  <  -128,  THE  E      MIN  SIGNED   -  NUM.
                     RET                                  

DEL                  EQU   7FH                            ;ASCII code for   it
;ASCII_GEN          EQU      LOC_INALPHA      ist byte of  generator  for  NUL
;
; _LOAD_ASCII
;
;     Loads the ASCII character generators into VRAM at the
;     current pattern generator table (NOTE - INIT_TABLE must
;     have been called prior to this).  Only the characters
;     from the space to the DEL (20h to 7Fh) are loaded.
;
;Input   Parameters:
;   NONE
;
;Returns:
;   A, 8C, HL, DE are destroyed
;
;  Falls into _PUT_ASCII
;
                                                          ;
                                                          ;LO       HL,[PATTRNGENTBL];get base of  current  generator    table
                     LD    DE,[PATTRNGENT8L]              ;get base of  current  generator    table
                                                          ;LD       DE,00H+8        ;Offset into  it where  SPACE  will   be
                                                          ;ADD      HL.DE
                                                          ;EX       DE.HL           ;leave VRAM address   in DE
                     LD    HL,00H                         ;want to start  with  the null
                     LD    BC,[DEL-00H+1]                 ;load the entire  ASCII  set (0. .7F)
;
; fall   thru to  PUT_ASCII
;:

;
;  __PUT_ASCII
;
;       Copys a specified number of ASCII character generators into VRAM.
;       Swaps to ROM that contains the generators then swaps back, keeps
;       track of callers stack and uses a local stack that is known to
;       be in RAM when the ROM is swapped in.
;
;Input  Parameters:
;  HL  - Character to 1st  load (generally in range O..FFH)
;  BC  - Number of characters to load  (Not the number of bytes)
;  DE  - Address in VRAM  to load the 1st generator
;
;  A,  BC, HL,  DE, IX  are  destroyed
;
;  Calis  WRITE_VRAM
;         SWITCH_MEM
;

                     ADD   HL,HL                          ;multiply  char  to  start  loading  by  8
                     ADD   HL,HL                          ;SO  can use  it as  an offset   into the
                     ADD   HT HL                          ;ASCII  generator
                     PUSH  BC                             ;save  number  of chars   desired
                                                          ;LD       BC,ASCII_GEN
                                                          ;LD       BC,([LOC_IN_ALPHA})
                                                          ;ADD      HL.BC              ;now HL points   to the  ist generator    desired
                     EX    [SP],HL                        ;get  number  of chars  desired
                     ADD   HL,HL                          ;and  multiply  by  8
                     ADD   HL,HL                          ;   since each  generator   is 8  bytes
                     ADD   HL,HL                          ;      long
                     EX    [SP],HL                        ;get  back pointer   into  ASCII  generators
                     POP   BC                             ;get  number  of chars  times  8

                     LD    IX,OOOOH                       ;   to use to  save  callers  SP
                     ADD   IX,SP                          
                     LD    SP,TEMP_STACK                  ;set  stack  into known  RAM
                     PUSH  IX                             ;save  callers  SP

                     LD    A,[CUR_BANK]                   ;remember  which  bank  setting   we
                     PUSH  AF                             ;    are in
                     LD    A,[MEM_CNFGOO]                 ;get  value  to let  us get  at the  ALPHA   roms

                     PUSH  BC                             ;count  would  get  destroyed  by  SWITCH MEM
                     CALL  SWITCHMEM                      
                     POP   BC                             

                     PUSH  DE                             
                     LD    DE,[LOC_IN_ ALPHA]             
                     ADD   HL,DE                          
                     POP   DE                             

                     CALL  WRITE_VRAM                     

                     POP   AF                             ;get  back callers   mem configuration
                     CALL  SWITCH_MEM                     

                     POP   HL                             ;get  callers  SP
                     LD    SP,HL             -AND RESTORE IT 
                     RET   >                              ;and back to  caller

;
;    Switch_mem:  memory bank switching routine
;
;    Inputs:
;                 A = Appropriate input from  SWITCH TABLE
;
;                  Example:
;     Switch Table  Offset    Memory  configuration
;    *************************************************************************
;
;             0 -          Boot ROM and Alpha Roms
;             1 -          Intrinsic RAM (OOOOH  thru 7FFFH)
;             2 -          Expansion memory (OOOOH thru 7FFFH)
;             3 -          OS_7 and Intrinsic RAM (2000H thru 7FFFH)
;             4
;             .
;             D
;             E
;             F
;
;   *** Note: The values in the table are subject to change in future
;             releases of ADAM  hardware.
;
;   For an example  of the use  of SWITCH MEM   see PORT COLLECTION    below.
;
;
;    Outputs:
;                  CUR_BANK, a defined memory location will contain
;                  the updated input parameter for applications and
;                  EOS routines which need to determine  which
;                  memory space is currently active.

__SWITCH_MEM                                              
                     LD    B A                            ;SAVE THE  PORT DATA   TO WRITE
                     LD    A [MEMSWITCH  PORT]            ;GET THE  PORT NUMBER
                     LD    CCA                            
                     OUT   [CJ»B                          ;SWITCH  MEMORY BANKS
                     LD    AB                             
                     LD    [CUR_BANK],A                   ;REMEMBER  WHAT WAS   SWITCHED  TO.
                     RET                                  
;
;
;    Port collection must be calied during initialization
;    It switches to OS7 ROM grabs the ports and switches back
;

PORT_COLLECTION:                                          
                     LD    A,[CUR_BANK]                   ;GET THE CURRENT BANK
                     PUSH  AF                             
;
                     LD    A,[MEMCNFGO3]                  ;SWAP IN THE OS
                     CALL  SWITCH_MEM                     
                     LD    HL,PORTTABLE+2                 ;HL POINTS TO THE PORT   TABLE
;
                     LD    A,[01043H]                     ;VDP CONTROL PORT
                     LD    [HL],A                         
                     INC   HL                             
;
                     LD    A,[01D47H]                     ;VDP DATA PORT
                     LD    [HL],A                         
                     INC   HL                             
;
                     LD    A,[0114BH]                     ;CONTROLLER O
                     LD    [HL],A                         
                     INC   HL                             
;
                     LD    A,[01151H]                     ;CONTROLLER 1
.                    LD    [HL],A                         
                     INC   HL                             
;
                     LD    A,[01157H]                     ;CONTROLLER STROBE SET
                     LD    [HL],A                         
                     INC   HL                             
;
                     LD    A,[01168H]                     ;CONTROLLER STROBE RESET
                     LD    [HL],A                         
                     INC   HL                             
;
                     LD    A,[O018EH]                     ;SOUND PORT
                     LD    [HL],A                         
                     POP   AF                             
                     CALL  SWITCH_MEM                     
                     RET                                  

;
;  Name:              WR_SPR_ATTRIBUTE
;
;  Function:          Transfers the local copy of the sprite attribute table
;                     to VRAM.   WR_SPR_ATTRIBUTE will also reorder the
;                     sprite table to reduce 5th sprite priority problems.
;
;  Entry:             DE - address of Local Sprite Table
;                     HL - address of Priority table
;                      A - number of sprites to be transfered (length of Local Sprite
;                            table divided by 4
;  Exit:              None.
;
;  Registers   usec:  AF, BC,  DE, Hi.
;
;  Data   structures  accessed:
;                     VRAM_ADDR_TABLE   (SPRITEATTRIBL)   for the starting     address
;                     of the  sprite  attribute  table  in VRAM.
;
;                     PORT PTR_TABLE   (CTRL_PORT_ PTR,  DATAPORT_PTR)     for
;                     VDP port  access.
;
;                     Local  Sprite  Table  - User defined  memory  image   of
;                     the sprite  attribute   table
;
;                     Priority  Table  - User  defined  sprite priority    list
;                     for the  transfer  of  the sprite  attributes
;
;  Size:              ROM  - xx bytes
;                     RAM  - xx bytes
;
;  Comments:
;
;  Comparision:       left out  pascal  entry  point
;                     added  register  parameters   in place of defined    memory  pointers
;                     code compacted
;                     edited  for documentation
;
_WR_SPR_ATTRIBUTE                                         
;                                                      Initialize  VOP  address    pointer
                     PUSH  AF                             
                     PUSH  HL                             
                     LD    HL,[SPRITEATTRTBL ]            
                     CALL  SET_WRITE                      
                     POP   HL                             
                     POP   AF                             
                     LD    B,A                            
                                                          ;-B = Sprite Count
                                                          ;-C = port address
                                                          ;-DE = address  of  Local   Sprite   Attribute  Table
                                                          ;-HL = address  of  Priority   table
                                                          ;-VDOPis initialized    to  appropriate    address

LOOP_EVERYSPRITE:                                         

;*                Index  to sprite   with the next  highest  priority

                     LD    A,[HL]                         ;Get current sprite   as defined  by the  priority table
                     ADD   A,A                            ;*2 Multiply by  an  attribute  entry (4)
                     ADD   A,A                            ;*4

                     INC   HL                             ;Index to next  location   in priority table
                     PUSH  HL                             ;Save for next  sprite

                     LD    L,A                            ;Offset into the  Local  Sprite  Table by  the current priority
                     LD    H,O                            
                     ADD   HL,DE                          


                     LD    A,B                            ;Save sprite count   tm Acc.
                     LD    8,4                            ;Set count for  write  to VRAM
                                                          ;C has port address
                                                          ;HL has the pointer   to a sprite’s  attributes
LOOPEVERY            BYTE                                 
                     OUTI                                 ;Output a byte
                     NOP                                  ;Wait for VDP to  catch  up  (worst case)
                     NOP                                  
                     JR    NZ,LOOP_EVERY  BYTE            

                     LD    B,A                            ;Restore sprite  count  to 8B register
                     POP   HL                             ;Restore index  into  the priority  table
                     DJNZ  LOOP_EVERY SPRITE              ; If more sprites   left then  loop back

                     RET                                  ;Else exit

;
; Name:       SET_READ / SET_WRITE
;
; Function:   Initiates the VDP for read or writes.
;
; Entry:      HL - VRAM  address to start read / writes
;
; Exit:       C register contains the VDP_DATA_PORT value
;             HL remains unchanged
;
; Registers used: AF, BC, HL,
;
; Data structures accessed:
;
;             PORT_TABLE (CTRL_PORT_PTR, DATA_PORT_PTR) for
;                    VDP  port access.
;
; Size:       ROM - xx bytes
;             RAM - xx bytes
;
; Comments:
;
; Comparison:
;
SET_READ:                                                 
                     XOR   A                              ;Clear accumulator  for later OR  which
                                                          ; Getermines a  read or write

                     DEFB  OC2H              :THIS IS THE BEGINNING  OF A JP  NZ WHICH 
                                                          ; will never be  true but leaves  the
                                                          ; accumulator  intact over the  next
                                                          ; two bytes (  the LD A,40H  is decoded
                                                          ; as the last  two bytes of the  jump
SETWRITE:                                                 
                     LD    A,40H                          ;Set bit to tell  VDP that write  is requested

                     LD    BC,[VDP_CTRL_PORT]             ;Get BOTH port  addresses
                     OUT   [C],L                          ;Output low 8 bits  of address
                     OR    4H                             ;OR read/write  bit (Bit 6) into  the high    8 bytes
                     OUT   [CJ,A                          ;Output result
                     LD    C,B                            ;Put DATA_PORT  value into the  C register

                     RET                                  ;Exit to caller

;CONTROLLER SOFTWARE
;
;**********************************************
;*
;*  DECODER TABLE FOR  THE  KEYBOARD
;*
;**********************************************
DEC_KBD_TBL                                               
                     DEFB  KBD_NULL                       ; NULL ENTRY
                     DEFB  6                              ; *°6’
                     DEFB  1                              ; ft’
                     DEFB  3                              ; °3°
                     DEFB  9                              ; *9’
                     DEFB  O                              ; °O’
                     DEFB  10                             ; fe!
                     DEFB  12                             ; Purple Action  Controller  key (third  one down)
                     DEFB  2                              ; °2°
                     DEFB  11                             ; fw?
                     DEFB  7                              ; ‘7’
                     DEFB  13                             ; Blue Action  Controller  key (fourth  (or last)  one down
                     DEFB  5                              ; ‘5’
                     DEFB  4                              ; 14!
                     DEFB  8                              ; ‘8’
                     DEFB  KBDO_NULL                      ; NULL ENTRY

KBD_NULL             EQU   0FH                            
KBD_MASK             EQU   0FH                            ;MASK  FOR  INPUT DATA BYTE
FIREMASK             EQU   40H                            
ARM_MASK             EQU   40H                            
JOY_MASK             EQU   0FH                            



__DECODER                                                 
;           Will read all the data, from both segments, for a given  controller
;           All data  isreturned in regtsters          .
;           Segment O data is returned the same as with 0S-7
;
;     NOTE - some operations are done in an odd order so that a certain
;            number of cycles (T states) pass between port addressing.
;            Turns off interupts if they were on at entry time for
;            195 T states (approx. 54.5 micro secs), the iterupts
;            are reenabled after this time if they were on before.
;
;     Callers  -  The input parameters are different than 0OS-7and
;                 both segments are returned so only one call is  required
;                 for all the data from a given controller.
;                 The values returned are the same for segment O  (H, L,  E)
;                 but segment 1 values are returned in B and OD.

;StackUsage:
; Uses 2 words (pushes only)
;
;Input Parameters:
;   A  - controller number, O or 1

;Returns:
;    H  - fire button data
;    L  - joystick data
;    6  - arm button data
;    C  - raw data for segment O, (joystick, fire)
;    D  - keyboard data
;    E  - spinner count data
;    A  - raw data for segment 1, (keyboard, arm, super controller  buttons)
;
;    SPIN SWxCT   - reset to O after read
;
;    strobe port left in the reset condition
;
;-Date:
; 9/24/83   11:14    JKL
;

DECODER:                                                  
                     LD    CA                             ;Save   controller      #
                     LD    A,1                            ;get   current    state    of   interupts,    on/off,     into   P/V   flag
                     PUSH  AF                             ;and   save   for   later    so  can   turn  them   back   on   if  needed

                     LD    A,C                            ;Restore     controller     #
                     LD    BC,[STROBE_SET_PORT]           ;C<--SET     PORT   ,B<--RST     PORT
                     OUT   [C],A                          ;STROBE    10   SEGMENT     1 (SET)
                     LD    0,B                            ;SAVE   RESET    PORT
                     LD    HL,SPIN    SWO   CT            ;potnt   at   spinner     count    for  controller     O
                     LD    BC,[CONTROLLER_O_PORT]         ;C<--PORT    O,   B<--PORT    1
                     OR    A                              ;A contains      controtter      number
                     JR    NZ,GOT_CORRECT_CONTROLLER_IN_C ;
                     INC   HL                             ;Point    to  spinner     for  ctrir    1
                     LD    C,,B                           ;C<--PORT   1
GOT_CORRECT_CONTROLLER_IN_C:                                      
                     XOR   A                              
                     LD    E,[HL]                         ;HAVE    SPIN   SWITCH    COUNT
                     LD    [HL],A                         ;>RESET    COUNT
                     LD    B,D                            ;>B<--RST    PORT
                     IN    A,[C]                          ;READ    DATA   FROM   SEG    1
                     CPL                                  
;
                     LD    H,O                            
                     LD    LA                             ;HL<--offset       into   DEC  _KBD_TBL
                     LD    A,C                            ;Swap    RST  PORT/DATA_    PORT
                     LD    C,8                            
                     OUT   [C],A                          ;STOBE    TO   SEG O    (reset)
                     LD    C,A                            ;C<--DATA      PORT
                     POP   AF                             ;get   back    entry   state    of   interupt    reg
                     JP    PO,LEAVE_THEM_OFF              
                     EI                                   ;turn    interrupts     back    on  only   if  they   were   on  entry
LEAVE_THEM_OFF:                                           
                     LD    A,L                            
                     PUSH  AF                             ;save    raw   data   seg   !
                     AND   ARM_MASK                       ;Test    sleeve
                     LD    B,A                            ;>HAVE  ARM   DATA       (in  B)
                     LD    A,L                            
                     AND   KBD_MASK                       ;isolate     KBD   data
                     LD    L,A                            
                     PUSH  DE                             ;Save   spin    switch    count    on  stack   (reg   E)
                     LD    DE,DEC_KBD_TBL                 ;Get   top   of  keypad     decoder    table
                     ADD   HL,DE                          ;point    to  DEC  KBD_TBL      entry
                     POP   DE                             ;Restore     Spinner     count    (reg  EF)
                     LD    D,[HL]                         ;HAVE  KEYBOARD      DATA
                     IN    A,[C]                          ;segment     O  data
                     CPL                                  
;
                     PUSH  AF                             ;save   raw   data
                     LD    L,A                            
                     AND   FIRE  MASK                     ;isolate     fire   data
                     LD    H,A                            ;HAVE   FIRE  DATA
                     LD    A,L                            
                     AND   JOY MASK                       ;isolate     joystick     data
                     LD    L,A                            ;HAVE   JOY   DATA
                     POP   AF                             ;get   back   raw   data   for   seg   0
                     LD    C,A                            ;C  =  raw   data   segment     O

                     RET                                  

;
;  __POLLER
;
;   Used to fill a table of values for the 2 controllers
;   Does some debouncing if called twice in succession
;
;   NOTE   - Does not return at bottom of code, return is in middie
;            Interupts will be off for a while when call to DECODE is performed.
;
;   Callers   - This has different input parameters than OS-7 and
;               the controller map is ordered differently.
;
;
;Stack Usage:
;  will use 4 words   (2 pushes,  2  call)
;
;Calis:
;  __DECODER
;  DEBOUNCE
;  READ_N_DEBOUNCE      (a routine that is nested in _POLLER)
;
;Input  Parameters:
;  IX  - pointer to 1st byte of users controller map  (10  bytes)
;   A  - controller enabled and spinner enable
;          bit  O  - set if want controller O enabled
;          bit  1  - set if want controller 1 enabled
;          bit  7  - set if want spinner enabled for controllers which are  enabled
;
;Returns:
;
;  Data  in users   controller   map  is  like  this off  of  entry   IX value
;             IX+O   - joystick   O
;             IX+1   - fire  O
;             IX+2   - arm  O
;             IX+3   - keyboard   O
;             IX+4   - spinner   count  O
;             IX+5   - joystick   1
;             IX+6   - fire  1
;             IX+7   - arm  1
;             IX+8   - keyboard  1
;             IX+9   - spinner count  1
;
;   IX -  points to 1 byte past users data table of highest enabled controller
;
;
;   all  but  IY - destroyed
;
;Date:
;  9/24/83     11:14     JKL
;

CONTROLLER_O_MASK    EQU   1H                             
CONTROLLER_1_BIT     EQU   1                              
SPINNER_ENABLE_BIT   EQU   7                              

__POLLER:                                                 
                     LD    HL                             
                     LD    C,A                            
                     AND   CONTROLLER_0_MASK              
                     JR    Z,NOT_CONTROLLER_0             ;If not  then check   to see  if controller    1  is
                     DEC   A                              
                     CALL  READ_N_DEBOUNCE                
                     BIT   CONTROLLER_1_BIT,C             ;see ifcontroller   1 is active
                     RET   Z                              
POLL_CONTROLLER_1:                                        ;getdata for controller    1
                     LD    A,01H                          
READ_N_DEBOUNCE:                                          
                     PUSH  BC                             
                     PUSH  HL                             
                     CALL  __DECODER                      
                     LD    C,H                            
                     LD    A,L                            
                     POP   HL                             
                     CALL  DEBOUNCE                       
                     POP   BC                             
                     BIT   SPINNER                        
                     JR    2,NEXT_IX                      
                     LD    A,E                            
                     ADD   A,[IX+0]                       
                     LD    [IX+0],A                       
NEXT_IX:             INC   IX                             
                     RET                                  


                     BIT   CONTROLLER_1_BIT,C             ;see if controller  1 itsenabled
                     RET   Z                              
                     LD    DE,0004H                       
                     ADD   HL,DE                          
                     INC   DE                             
                     ADD   IX,DE                          
                     JP    POLL_CONTROLLER   1            

;
;DEBOUNCE
;           This  wilL  check     for  equal  data on two passes,    and  if
;           the  data  its  the   same  then  the users buffer   is  updated.
;
;           This  is  done   by   check  for  equal data, if   the  data  is
;           different   on   each    call  then the data on   this  call  is
;           stored  so  that    the   next  call can use this   new  data.
;           If the  data    is  equa!   then  the data is stored    with  the
;           ni bit  (bit    7)  set   so that  the next calli  will  yield
;           different   data    (IE   there  could never be   a match  on  the
;           next  cal)).
;
;Stack   Usage:
;   1 word   (subroutine     cali)
;
;Input    Parameters:
;   HL  -  PoInter   to debounce      buffer
;   IX  -  Potnter   to users     controller   map
;   A   -  joystick   data
;   B   -  arm data
;   C   -  fire  data
;   D   -  keyboard   data
;
;Returns:
;   HL    - PoInting   to   next   buffer   (entry value +  4)
;   IX    - Pointing   to   next   data  area  (entry value   + 4)
;   A  is  changed
;   No  others   are  modified
;
;   Calls   self  as  a nested     subroutine   CHECK
;
;Date:
; 9/24/83       11:14       JKL
;
;
DEBOUNCE:                                                 
                     CALL  CHECK                          ;debounce    joystick   data
                     LD    A,C                            ;debounce    fire  data
                     CALL  CHECK                          
                     LD    A,B                            ;debounce    arm  data
                     CALL  CHECK                          
                     LD    A,D                            ;debounce    keyboard   data
                                                          ;fall   thru  to  check   (return   imp!ied)
CHECK                                                     
                     CP    [HL]                           ;see  if  data   was the   same  as  last   time
                     JR    NZ,NOT   SAME                  

                     OR    80H                            ;set  hi_order    bit  if  same,  so  not  equal    on   next   cal!
NOT_SAME                                                  
                     LD    [HL],A                         ;update   local   debounce   buffer
                     INC   IX                             ;point   to  next  buffer   location
                     INC   HL                             ;        in  debounce   buffer   as  wel!
                     RET                                  

;
;Update_Spinner   - Controller spin switch interrupt  service routine
;
;  This routine  processes the spinner switch interrupt and updates
;    the data needed by both DECODER and POLLER
;
; Ram area used:  Updates SPIN_SW0_CNT and SPIN_SW1_CNT
;
; The spinner switch maskable interrupt is RST 38H
;
; Destroys AF, BC,  HL
;
DIR_MASK             EQU   00100000B                      ;bit 5 tells us  the direction
INTBIT               EQU   4                              ;bit that tells which   spinner   interrupted

__UPDATE_SPINNER                                          
                     LD    BC,[CONTROLLER_0_PORT]         ;Get port values  for both  controllers
                     IN    A,[C]                          ;Input data from  controller   O
                     LD    HL,SPIN SWO_CT                 ;Poitntto spinner  update  data
                     BIT   INT_BIT,A                      ;Was this the controller   that   interrupted   ?
                     JR    NZ,GET_CONTROLLER_1            ;If not then check  controller    1
                     AND   DIR_MASK                       ;Check direction  bit
                     JR    NZ,INCREMENT_0_OIRECTION       ;If set then tncrement   direction
                     DEC   [HL]                           ;Else decrement direction
                     DEC   [HL]                           ;Decrement once more  to  fall  through   tncrement

INCREMENT_0          DIRECTION:                                
                     INC   [HL]                           ;Increment direction

GET_CONTROLLER_1                                          
                     LD    C,B                            ;Get controller  1 port  into  C
                     IN    A,[C]                          ;Get controller  1 data
                     INC   HL                             ;Point HL to controller   1 update   area
                     BIT   INT_BIT,A                      ;Is thIs the controller   that  interrupted    me?
                     RET   NZ                             ;Return if not, Also  don’t   assume
                                                          ; either controller  if  no bit  is  set
                     AND   DIR_MASK                       ;Check direction  bit
                     JR    NZ,INCREMENT_1_DIRECTION       ;I1fset then go  increment  direction
                     DEC   [HL]                           ;Else decrement direction
                     RET                                  ;Then return

INCREMENT_1_DIRECTION                                      
                     INC   [HL]                           ;Increment direction
                     RET                                  ;Exit



;SESS   H SESS HEH HEHEHE HHS HEHEHE  HEHEHE  HEHE EEE EHH  HEHEHE   HEHEHE  EEESESEEHHEEEEE      HE HES

;                             NOTES TO SOUND PROGRAMMERS

;     The only differences between the OS7 version and this ADAM version
;     are transparent to the game programmer and important to the
;     sound programmer. Formerly CALL’s to PLAY_SONGS and SND_MANAGER
;     were necessary to update the sounds. Now a CALL to SOUNDS runs
;     the same code.   Formerly CALL’s to LEAVE_EFFECT and EFXOVER were
;     needed to end a SPECIAL EFFECT.  Now EFFECT_OVER runs the same code.
;     Independent CALL’s to PLAY_SONGS, SNO  MANAGER, LEAVE_EFFECT and
;     EFXOVER do not run in this module as before!!!!!

; PAC  OOO  EEE   OOOO  EERE   SEE   EEEEERESESEDERESSEREHEREESSEOREFEEEE             ORES    EEE EEERS

;          Operating     system     sound   routine    EQUATES

OFF                  EQU   0FH                            ;Off,  no   sound

;          Special    byte   O  codes

INACTIVE             EQU   0FFH                           
;@@e@  SEFFECT               EQU               62
ENDSDATA             EQU   0                              

;          Offsets    within    an   SxDATA    song  data    area

;@ee@  CH                    EQU               Oo
;@e@   SONGNO                EQU               O
;@@@   NEXTNOTEPTR           EQU               1
FREQ                 EQU   3                              
ATN                  EQU   4                              
CTRL                 EQU   4                              
NLEN                 EQU   5                              
;@e@e  FPS                   EQU               6
FPSV                 EQU   6                              
FSTEP                EQU   7                              
;Oe     ALEN                 EQU               8
ASTEP                EQU   8                              
;@@e@  APS                   EQU               9
APSV                 EQU   9                              

;          song   end  codes

;@ee@  CHOEND                EQU               00010000B
;@ee@  CHIEND                EQU               01010000B
;@e@@  CH2END                EQU               10010000B
;@e@e@ CH3END                EQU               11010000B
;@@@   CHOREP                EQU               00011000B
;@e@e@ CHIREP                EQU               01011000B
;@@@   CH2REP                EQU               10011000B
;@@e@  CH3REP                EQU               11011000B

;          channel    numbers,     87   -B6

;@e@e@ CHO                   EQU               O
;@eeCH1             EQU        01000000B
;@eeCH2             EQU        10000000B
;ee@CH3             EQU        11000000B



;,SSeS S SHE SESE  HEHEHE  SHES  EH HERS
;-2          FREQ  SWEEP                 *
;,SSSSS  SSH   SEHHEHEHE   KES  EHHEHEED

;-See  Users’    Manual      for  description
;-RETs   2 SET:    {f   note   over
;-RETs   2 RESET:      if  sweep    in  progress     or  note    not  over

FREQ_SWEEP                                                

;         *   if  freq    not   swept,    dec   NLEN   and   RET   [setting     Z  flag]

                     LD    A,[IX+FSTEP]                   ;check     for   no  sweep    code
                     OR    A                              ;SET   Z  flag   if  FSTEP    =  O
                     JR    NZ,L20                         ;if  PSW   is  zero   note    not   to   be  swept
                     LD    A,[IX+NLEN]                    ;dec   NLEN   and
                     DEC   A                              ;SET   Z flag    if  NLEN   =  O
                     RET   Z                              ;leave    if  note   over   with    Z  flag     SET
                     LD    [IX+NLEN],A                    ;store   decremented       NLEN
                     RET                                  ;RET   with   Z  flag   RESET    [note    not    over]

                     ENDIF                                

;          ¢  sweep     going.    so   dec   FPSV

L20                                                       
                     PUSH  IX                             ;point   HL   to  FPSV
                     POP   HL                             
                     LD    DE,FPSV                        
                     ADD   HT,DE                          
                     CALL  LOCL_DECLSN                    ;dec   FPSV
;ees %    JR           NZ,L21                  -if  PSW   is  zero   FPSV   has    timed    out
                     RET   NZ                             ;Added   u0S

;             *  dec    NLEN   and   leave    if  sweep    is  over

                     CALL  LOCL_MSNTOLSN                  ;reload    FPSV   from   FPS
                     DEC   HL                             ;point    to   NLEN   [#  steps    in   the   sweep]
                     LD    A,[HL]                         ;dec   NLEN    and
                     DEC   A                              ;SET    Z flag    {tf NLEN   =  O
                     RET   2                              ;leave   if   sweep   over   with    Z   flag    SET

;               *  sweep     not  over,    so   add   FSTEP   to  FREQ

                     LD    [HL],A                         ;store    decremented      NLEN
                     DEC   HL                             ;poitnt   HL
                     DEC   HL                             ;to   FREQ
                     LD    A,[IX+FSTEP]                   ;A   = FSTEP    [two’s    complement       step    size]
                     CALL  LOC_ADD816                     ;FREQ    = FREQ    + FSTEP
                     INC   HL                             ;point    HL   to  hi  FREQ
                     RES   2,[HL]                         ;RESET    82   itn hi  FREQ    in  case    add    caused    >  10  bit   FREQ
                     OR    OFFH                           ;RESET    Z  flag,    sweep   not    over    yet

                     ENOIF                                
;@@@  121
                     RET                                  
;       ENO FREQSWE


;, eet  eeeeereeeeeeeeeeeeeeseres
;*            ATN_SWEEP                  *
; ee   eeeresereeeeeeereeesesers

;See   User's     Manual!   for  description
;RETs     Z  SET:    tf byte    8  is  O  [means     sweep     is  over,    or   note    was    never   swept]
;RETs     Z  RESET:     if sweep    in  progress

ATN_SWEEP                                                 

;            *  RET   with   Z  SET   if  byte    8  =  00

                     LD    A,[1X+8]                       ;check    byte    8  for   no   sweep     code
                     OR    A                              ;Z2  1s  set   if   byte   8   = O
                     RET   2                              ;leave     if  Z  set,    sweep    not    going

;            *  sweep   going,    so   dec   APSV

                     PUSH  IX                             ;point    HL   to   APSV
                     POP   HL                             
                     LD    DE,APSV                        
                     ADD   HL,DE                          
                     CALL  LOCL  DECLSN                   ;dec   APSV     [LSN   of   byte    9]
;*eee8        JR         NZ,L22                   ;1f  PSW    ts  zero    APSV    has   timed     out
                     RET   NZ                             ;Added    u0S

;            *  dec   ALEN   to  see   if  sweep     over

                     CALL  LOCL  MSNTOLSN                 ;reload      APSV   from    APS
                     DEC   HL                             ;point     to  ALEN     [4  of   steps     in   the  sweep]
                     CALL  LOCL_DECLSN                    ;dec   ALEN     [LSN   byte    8]
                     JR    Z,L23                          ; if  PSW    is  non-zero      sweep    not    over    yet

;            *  add   ASTEP   to  ATIN

                     LD    A,[HL]                         ;>MSN   A  =  ASTEP
                     AND   OF OH                          ;mask    USN
                     LD    E,A                            ;E   =  ASTEP       O
                     DEC   HL                             ;point     HL  to   ATN
                     DEC   HL                             
                     DEC   HL                             
                     DEC   HL                             
                     LD    A,[HL]                         ;>MSN   A  =  ATN
                     AND   OF OH                          ;A   =  ATN      Oo
                     ADD   A,E                            ;MSN    A  =  [ASTEP     +  ATN]       Oo
                     LD    E,A                            ;E   =  [ASTEP    +   ATN]       O
                     LD    A,[HL]                         ;A   =  ATTN.    freq    or   CTRL
                     AND   OFH                            ;smask   old   ATN      A  =0      freq     or   CTRL
                     OR    E                              ;OR   in   new   ATN
                     LD    [HL],A                         ;store     updated      value   back     into    song   data    area
                     OR    OF FH                          ;RESET     Z  flag.     sweep    not  over     yet
;*ee08        JR         L22
                     RET                                  ;Added     uO0S

;            ELSE       Z2 flag   is  SET:     sweep    over

L23                                                       
                     LD    [HL],0                         ;set byte 8  to  O to indicate  end  sweep

;       ENDIF
;       ENDIF

;@ee@122
                     RET                                  

;       END ATNSWEE



;seSSSSS SSS SHH HEHESSEHTSEHHHEEEES
;°8        UPATNCTRL                +
; SSSSSHSHEHESSS  EES       EHEE EES

;Perform  single    byte  update    of  the   snd  chip  notse   contro!    register      or  any
;attenuation    register.    IX  is  passed    pointing    to byte    O of  a  song   data    area,    MSN
;register   C  = formatted    channel    attenuation     code.

UPATNCTRL                                                 
                     LD    A,[1X+4]                       ;MSN   A  = ATN,   LSN  may   be  CTRL   data
                     BIT   4,C                            ;test   for   AITN
                                                          ;>{f   PSW  is  non-zero    ATN   is  to  be  sent,
                                                          ; move    it  to  the  LSN
                     JR    Z,L24                          
                     RRCA                                 ;Swap   nibbles
                     RRCA                                 
                     RRCA                                 
                     RRCA                                 ;°>LSN  A  = ATN

;        ENDIF

L24                                                       
                     AND   OFH                            ;mask   MSN
                     OR    C                              ;4   = formatted    registers       ATN   or  CTRL
;sees     CALL       OUT_TO_SOUNO   PORT       ;Output   ATN  or  CTRL   data
;Seeses   RET
                     JP    QUT _TO_SOUND   PORT           ;output   ATN  or  CTRL   data



;,F8teseseseeeeereseeeeeeeeese
;*          UPFREQ                    *
;,Ses  eeeereseeeeeeereeeresesese

;Perform    double    byte   update     of  a sound   chip    frequency      register.       IX   its passed
;pointing     to  byteO   of   a  song   data  area,   MSN    register     D  =  formatted      channel!
;frequency     code.

UPFREQ                                                    
                     LD    A,[IX+FREQ]                    ;A =  F2  F3   F4  FS   F6   F7  FB  FIO
                     AND   OFH                    7A =   0   O     O   O  F6   F7  FB  FQ 
                     OR    D                              ;A =   formatted      reg/#      F6  F7   FB  FO
                     CALL  OUT_TO_  SOUND    PORT     =   ;output   first    freq   byte
                     LD    A,[IX+FREQ]                    ;A =  F2  F3   F4  FS  F6    F7  F8  FO   again
                     AND   OFOH                   :A =  F2  F3   F4  F5    0    0   0    O 
                     LD    DA                             ;save  in  D
                     LD    A,[IX+FREQ+1]                  ;LSN  A  =O     O  FO  Fi
                     AND   OFH                    “A=    0   0    0   0    0    OFO    FI! 
                     OR    D                              ;A =  F2  F3   F4  FS    O    O  FOF!
                     RRCA                                 ;Swap  nibbles
                     RRCA                                 
                     RRCA                                 
                     RRCA                                 ;A =   O   O   FO  F1  F2   F3   F4  F5
;*e%%       CALL       OUT_TO_SOUND     PORT     ;output     2nd   [most    significant]       freq    byte
;eee        RET
                     JP    OUT_TO_SOUND_PORT              ;output     2nd   [most    significant]       freq    byte



;eSSSESHHHSSSESEEHHESESHSEES
;¢       LOCL_DECLSN       *
;SSSSSHESSHSSSHESSSHHHSHEEOS

;Without affecting the MSN, decrement  the LSN of  the  byte   pointed to by   HL.
;HL remains the same.
;RET with Z flag set if dec LSN results  in O, reset   otherwise.
;RET with C flag set if dec LSN results  in -f,  reset  otherwise.

__DECLSN:                                                 
LOCL_DECLSN                                               
                     XOR   A                              
                     RRD                                  ;& = 0    LSN [HL]
                     SUB   1               :2 FLAG  SET [TF DEC  TO O,C  FLAG IF DEC   TO  -!1 
                     PUSH  AF                             ;save  Z and C flags
                     RLD                                  ;[Ht}) = old MSN    new  LSN
                     POP   AF                             ;restore  Z and  C flags.   A    O   new LSN
                     RET                                  



;eeeeeeeseeeesetesreoeseseresese
;*       LOCL_DECMSN       *
;eeeeeeseseaseesesrereeresee

;Without affecting the LSN, decrement the MSN of the byte potnted to by HL.
;HL remains the same.
;RET with Z flag set if dec MSN results in O, reset otherwise.
;RET with C flag set if dec MSN results im -1, reset otherwise.

DECMSN                                                    
LOCLDECMSN                                                
                     XOR   A                              
                     RLD                                  ;A = O   MSN [HL]
                     SUB   1                              ;2 flag set if dec to O, C flag set if dec  -i
                     PUSH  AF                             ;save Z and C flags
                     RRD                                  ;{HtL)= new MSN   old LSN
                     POP   AF                             ;srestoreZ and C flags, A =0    new MSN
                     RET                                  



;,tHeeeeeseceseseeeesereeress
;*       LOCL_MSNTOLSN     :


;Copy MSN of the byte pointed to by HL to tne iSN of that byte      Hi  remains
;the same.

MSNTOLSN                                                  
LOCi_MSNTOLSN                                             
                     LD    AA[HT]                         ;A = MSN   LSN to be changed
                     AND   OFOH            >A = MSN   0   
                     LD    8A                             ;save in B
                     RRCA                                 ;Swap nibbles
                     RRCA                                 
                     RRCA                                 
                     RRCA  7A = 0   MSN                   
                     OR    8                              ;& = MSN   MSN
                     LD    [HIL],AA                       ;(HtL]= MSN   MSN
                     RET                                  



;5SSSSeSHEHESSSHEHHEHEHEHHEEE
;*       LOC_aDD816        e
; SSS     SSSHSHEHEEHEEEEE HE

;Adds 8 bit two’s complement signed vaiue passed in A to the 16 bit    location
;pointed to by HL.

ADDB16                                                    
LOC_ADDB16                                                
                     LD    B,0                            ;set B for positive value inA
                     BIT   7,A                            ;1f A is positive
                     JR    Z,POS                          ;skip
;eee8    LD  b,0FFh                    7A 16 neg: extend sign bit thru 8
                     DEC   B                              ;Added u0S
POS                                                       
                     ADD   A,[HL]                         ;do 8 bit add [and set Carry]
                     LD    [HL],A                         ;store result into LSB 16 bit number
                     INC   HL                             ;put SB
                     LD    A,[HL]                         ;into A
                     ADC   A,B                            ;A = MSB + Carry + B [8B{tsO or FF)
                     LD    [HL],A                         ;store result into MSB
                     DEC   HL                             ;re-point HL to LSB 16 bit number
                     RET                                  



; eeeeeeveseereseereseresretes
;*     PT_IX_TO_SxDATA     +
;,Seeeeeeeeseraeeeeseseeeresers

;SONGNO passed in 8.       
;Potnt IX to byte O tn SONGNO‘s song data area.
;:RETwith both DE and IX potnting to SxDATA,
;HL pointing to MSB SxDATA entry itnLST_OFSND ADORS.

PT_IX_TO_SxDATA                                           

;       * IX & DE := addr of byte O itnSONGNO’s song  data  area,
;       HL pointing to MSB SxDATA entry in LST_OFSND_ADDRS.

                     LD    HL,[PTR_TO_LST_OF_SNOD_ADDRS]  ;poftntHL to  start  LST_OF_SNO_ADORS
                     DEC   HL                             ;init HL for addition
                     DEC   HI                             
                     LD    C,,8            :FORM 4 ¢ SONGNO IN C 
                     LD    B,O                            
                     RLC   C                              
                     RLC   C                              
                     ADD   HL,BC           :HL PTS TO SXDATA’S ENTRY  IN LST_OF SND ADORS 
                     LD    E,[HT]                         ;move addr SxDATA to IX thru  DE
                     INC   HL                             
                     LD    D,[HT]                         
                     PUSH  DE                             
                     POP   IX                             
                     RET                                  



;,seeteeeeasereseereeresesece
;*      AREA SONG   _IS         «
; eeeeeeeeeseeseeeereseseresce

;The address   of  byte  0  of a song  data   area   is passed    in  IX.   The  song  number  of
;the song  using   that  area  is returned    in  A  [OFFH   {f  inactive].     If a  special
;effect was  using   that   area, 62   is returned    in  A  and  HL  {ts returned   with the
;address of  the   special   sound  effect  routine.

AREA_SONG_IS                                              
                     LD    A,[1IX+0]          7A  := CHA      SONGNO   OR  62,OR  A  := FF 
                     CP    OFFH                           
                     RET   2                              ;leave   with   A =  FF  if  area   inactive
                     AND   00111111B          SMASK  CHA  
                     CP    62                             
                     RET   NZ                             ;leave   with  A  =  SONGNO   if  not  a  special  effect   [62]

;       special   effect,    so set  Hl to  addr   effect,    stored  in   bytes  1&2

                     PUSH  IX                             ;point   HL  to  byte   1
                     POP   HL                             
                     INC   HL                             
                     LD    E,[HL]                         ;save  LSB   effect   addr   ine
                     INC   HL                             ;HL  to  byte  2
                     LD    D,[HL]                         ;save  MSB   effect   addr   inoO
                     EX    DE,HL                          ;HL  :=  addr  special    effect
                     RET                                  

;       END  UTIL



;****************************
;*       INIT_SOUND         *
;****************************

;See Users’ Manuai for description;   includes ENTRY_POINT_ALL_OFF
;addr LST_OF_SND_ADDRS passed in HL
;n = # of song data areas to init, passed in B

;       *** Sound chip register   code EQUATES ***

;       Tone generator frequency   and attenuation formatted register   codes

SRIFRQ               EQU   10000000B                      ;BIT7 = 1, BIT6-4 = TONE GEN 1 FREQ  CODE
SRIATN               EQU   10010000B                      ;BIT7 = 1, BIT6-4 = TONE GEN 1 ATTN  CODE
SR2FROQ              EQU   10100000B                      ;BIT7 = 1, BIT6-4 = TONE GEN 2 FREQ  CODE
SR2ATN               EQU   10110000B                      ;BIT7 = 1, BIT6-4 = TONE GEN 2 ATTN  CODE
SR3FRQ               EQU   11000000B                      ;BIT7 = 1, BIT6-4 = TONE GEN 3 FREQ  CODE
SR3AIN               EQU   11010000B                      ;BIT7 = 1, BIT6-4 = TONE GEN 1 ATTN  CODE

;       Noise generator control and attenuation formatted register codes
                     .                                    
SRNCTL               EQU   111000008                      ;BIT7 = 1, BIT6-4 = NOISE GEN  CONTROL  CODE
SRNATN               EQU   111100008                      ;BIT7 = 1, BIT6-4 = NOISE GEN  ATTN  CODE


;eee INITSOUND

;    :  ¢ inittalize PTR_TO_LST_OF  SND _ADORS with value passed  in  HL

                     LD    [PTR_TO_LST_OF_SND_ADDRS],HL   

;       * store inactive code   at byte O of each of the n data  areas  [B  = n)

                     INC   HL                             ;pt HL to song 1 data area entry   in LST_OF_SND_ADDRS
                     INC   HL,                            
                     LD    —,[HL]                         ;pt DE to byte 0 in first song  data  area
                     INC   HL                             
                     LD    0D[HL]                         
                     EX    DEHL                           ;pt HL to byte O in first song  data  area
                     LD    DE,10                          ;set DE for 10 byte increment
                     LD    A,OFFH                         ;Added u0S
B1:                                                       
                     LD    [HL],A                         ;Geactivate area  *** Added u0S
                     ADD   HL,DE                          ;pt HL to byte O next area (10  bytes  away)
                     DJNZ  B1                             ;do this for the n (passed in B)  data  areas

;       *¢store end of data  area  code (0) at first byte after  last  song  data  area

                     LD    [HL],0                         ;store end of data area code  in byte  O data   area  n+   1

;       * set the 4 channel! data  area pointers to a dummy, inactive   data  area

                     LD    HL,DUMAREA                     ;point HL to inactive byte below  [after   the  RET]
                     LD    [PTR TOS ON _O],HL             ;store addr DUMAREA at PTR_TOS  ON  _O
                     LD    [PTR_TO_SON _1],HL             ;store addr DUMAREA at PTR_TO_S ON 1
                     LD    [PTR_TO_SON 2],HL              ;store addr f  ‘REA at PTR_TO_S ON  2
                     LD    [PTR_TO_SON_3],HL              ;store addr  DUMAREA at PTR TO SON  3

;       *  initializeSAVECTRL

;eeses   LD      A,OFFH          ;note: this  ts only time MSN SAVE CTRL  will be non zero,
;*see¢                           ;Out uOS (loaded  earlier)

                     LD    [SAVE CTRL],A                  ;thus ensuring  PLAYSONGS  will output  ist real CTRL data
__TURN_OFF_SOUND:                                         
;@e@eALLOFF

;       * turn off all 4 sound generators

                     LD    A,[SOUNODPOR]                  ;Added u0S
                     LD    C,A                            ;Added u0S
                     LD    A,OFF+SRIATN                   ;form off code  for tone generator  1
                     OUT   [C],A                          ;send {ftout
                     LD    A,OFF+SR2ATN                   ;form off code  for tone generator  2
                     OUT   [C],A                          ;send it out
                     LD    A,OFF+SR3ATN                   ;form off code  for tone generator  3
                     OUT   [C],A                          ;s8endit out
                     LD    A,OFF+SRNATN    :FORM OFF CODE  FOR NOISE GENERATOR,N 
                     OUT   [C],A                          ;send it out
                     RET                                  

DUMAREA              DEFB  INACTIVE                       

;       END INITSOU
                                                          ;


eeeeeeeeeeeresereseeeeereees                                      
;*        JUKE  _BOX               ‘
,EEE                 eeereeesreeeseeereeereees                                

;see  Users’  Manual!   for  description
;SONGNO  passed  in   B

PLAY                 _IT                                  
JUKE                 BOX                                  

;        * RET   if  song   already    in progress

                     PUSH  BC                             ;save  SONGNO  on  stack
                     CALL  PT_IX_TO_SXDATA                ;point   IX to SONGNO’s   song  data  area
                     LD    A,[1XX+0]                      ;A  := CH#  [if any]     SONGNO   [if any]
                     AND   3FH                  >A  := 0 O SONGNO 
                     POP   BC                             ;B  := SONGNO
                     CP    8                              ;test   ifalready    in progress
                     RET   2                 '   IF   SO,LEAVE 

;        *  load  first   note   and  set  NEXT_NOTE  PTR   [thru  LOAD  NEXT_NOTE]

                     LD    [1X+0],B                       ;store  SONGNO  in  byte  O
                     DEC   HL                    >-HL  LEFT BY  PT_IX_TO_SXDATA     POINTING   TO  MSB  SXDATA 
                     DEC   HL                             ;-entry   in LST_OF_SNO_ADDRS     point  Ht  to  note  list
                     LD    D,[HT]                         ;"Starting  addr  entry   in  LST_OF_SND_ADDRS     and  save   this
                     DEC   HL                             ;-addr  in DE
                     LD    E,[HL]                         ;DE  now has  the  initial   value  for  NEXT _NOTE_PTR
                     LD    [IX+1],€                       ;set  NEXT_NOTE PTR   for  first   note  in  song
                     LD    [I1X+2],D0                     
                     CALL  LOAD  _NEXT_NOTE               ;load  note,  byte  0 :=  CH#  SONGNO,   set  new  NEXT NOTE  PTR
                     JR    UP_CH_DATA_PTRS                ;new  song, so  update   channel!  data  ptrs
                                                          ;
;        END  JUKEBOX



;FSSeeeeeeee eee eeaeeee eeeeese
;*      PLAY SONGS  _          *
;,Seeeeeseseseseeseeeeseseeeseeeens

;       **¢  Sound  chip  register   code  EQUATES

;@@@ WHITE        EQU        00000 1008     ;BIT2  =  1, white  noise   code
;@@e@PERIOD       EQU        000000008      ;BIT2  = O,  periodic   noise   code
;@@e@NSRHI        EQU        000000008      :B:TO-1  Set  for  highest   noise    shift   rate   {N/512]
;ee@@NSRMED       EQU        0000000  18    ;BITO-1  Set  for  medium   noise   shift    rate   [N/1024]
;ee@ NSRLOW       EQU        000000  108    ;BITO-1  Set  for   lowest  noise   shift    rate   [N/2048]
;ee@ NSRTG3       EQU        000000  11B    :BITO-1  Set  for  shift   from   tone  gen   3  output

SOUNDS                                                    
;@e@@PLAYSONGS   _

;       * output   CH! attenuation     and frequency

                     LD    A,OFFTSRIATN                   ;format  CH!  OFF  byte   into A
                     LD    ,C,SR1IATN                     ;format  MSN  C  for  CH1iattenuation
                     LD    D,SRIFRO                       ;format  MSN  O  for  CHi frequency
                     LD    IX,[PTR_TO_S   ON  _1]         ;point   IX  to byte  O  data  area   of  song   for  CH!
                     CALL  TONEOUT                        

;       * output   CH2 attenuation     and frequency

                     LD    A,OFF+SR2ATN                   ;format  CH2  OFF  byte   into A
                     LD    C,SR2ATN            :FORMAT  MSN  C  FOR CH2,ATTENUATION 
                     LD    D,SR2FRO                       ;format  MSN  D  for CH2  frequency
                     LD    IX,[PTR_TO_S   ON 2]           ;point  IX  to  byte  O  data  area   of  song   for  CH2
                     CALL  TONE_OUT                       

;       * output   CH3 attenuation     and frequency

                     LD    A,OFF+¢SR3ATN                  ;format  CH3  OFF  byte  into  A
                     LD    C,SR3ATN            >FORMAT  MSN  C  FOR CH3  ATTENUATION 
                     LD    D,SR3FROQ           >FORMAT  MSN  D  FOR CH?  FREQUENCY 
                     LD    ,IX,[PTR_TO_S  ON  3]          ;potnt  IX  to  byte  O data   area   of  song   for  CH3
                     CALL  TONE_OUT                       

;       * output   CHO [noise]   ATN   [and CTRL,   if  different   from   last   time]
                     .                                    
                     LD    A,OFF+SRNATN                   ;>format CHO  OFF  byte  into  A
                     LD    C,SRNATN                       ;format  MSN  C for  CHO  attenuation
                     LD    IX,[PTR_TO_S_  ON _O]          ;point  IX  to  byte  O data   area   of  song   for  CHO
                     LD    E,[1X+0]                       ;look for  inactive    code,  OFFH
                     INC   3=€                            ;this  sets  Z  flag   if E  = OFFH
                     JR    NZ,LS                          ;{f PSW  1s zero   song  data  area  is   inactive
                     CALL  OUTTO  SOUND   PORT            ;turn  off  CHO
                     JR    L6                             ; SND_MANAGER

;       ELSE

L5                                                        
                     CALL  UPATNCTRL                      ;send  out  current   ATN
                     LD    &,EIUX4+CTRL]                  ;LSN  A  = current   CTRL  data
                     AND   OFH                            ;mask  MSN
                     LD    HL,SAVE CTRL                   ;point  to  last CTRL    data  sent
                     CP    [HT J                COMPARE   
                     JR    7,16             >IF PSW   IS ZERO  CTRL  HAS   NOT  CHANGED     [DONE] 
                     LD    [HLJ],A                        ;SAVE CTRL   = new  CTRL   data
                     LD    C,SRNCTL                       ;send  new CTRL  data
                     CALL  UPATNCTRL                      
                     JR    L6                   SNO_ MANAGER 

;         ENDIF
;         ENDIF

TONE                 OUT                                  
                     LD    E,[1X+0]                       ;look   for  inactive  code,   OFFH
                     INC   E                              ;this  sets  Z  flag   if  E = OFFH
                     JR    NZ,L7                          ;if  PSW  is zero  song    data  area    is  inactive
;#448      CALL      OUT_TO_  SOUND PORT     =;turn off  CHx
;*ees      JR      ~—~6t8s
                     JP    OUT_TO_SOUND_PORT              ;turn  off  CHx

;         ELSE  send  out  current    ATN and  FREQ

L7                   .                                    
                     CALL  UPATNCTRL           :SEND  OUT  ATTENUATION 
                     JP    UPFREQ                         ;send  out  frequency
*EE8                 CALL  UPFREQ                         ;send  out  frequency
L8                                                        
SESS                 RET   -                              
;         ENDIF
;eeeeeeeeeeseseseeeeerereseese

;:¢      SNO_MANAGER         ‘


;See Users’ Manual  for description

16                                                        
SNO_MANAGER                                               

;       * IX  :* addr of song  #1  data  area  [SiDATA]

                     LD    B,1               :PT  IX  TO BYTE  O SONG   DATA  AREA  FOR  SONG 14 
                     CALL  PT_[X_TO_SXDATA                

LI                                                        ;LOOP  until  end  of  song  data   areas
                     LD    A,ENOSDATA                     ;check  for  end  of  song  data  areas
                     CP    [1X+0]            :SET  Z FLAG  IF  INACTIVE 
                     RET   ZZ                :LEAVE   [Z SET],IF  ALL  DATA  AREAS   HAVE BEEN  PROCESSED 

;       * process  active song   data areas

                     CALL  PROCESSDATA_AREA               ;   update   counters   or call   effect  get  next  note

;       * point  IX to byte  O next  song  data  area

                     LD    DE,10                          
                     ADD   IX,DE                          
                     JR    LF                             ;REPEAT  LOOP



;Seeeeeaeeeeseeeeeeeeeseserss
;*     UP_CH DATA   _PTRS       -


;For each active   data  area,   starting    with   SIDATA  and  proceeding     in order,    toad
;the associated   channel!  data   area  pointer    [PTR_TO_S  ON x}   with   the  address    of
;byte O.This  routine    is called    by JUKE BOX,    when  a  song  starts   and
;PROCESSDATA_AREA     when  the  channel    using  a  data  area  has  changed    as  a  result   of
;calling LOAD_NEXT_NOTE     [this   happens   when   a song  finishes    and  when   it switches
;back and forth   between   noise   and   tone notes].

UP_CHDATA            _PTRS                                
                     PUSH  IX                             ;Save  curent   IX
                     LD    HI,DUMAREA                     ;set  all  4 ch  data  ptrs   to dummy    inactive    area
                     LD    [PTR_TO_S  ON  _O],HL          
                     LD    [PTR_1O_  SON  1],HL           
                     LD    [PTR_TO_S  ON  2],HL           
                     LD    [PTR _TO_S ON  3],HL           
                     LD    A                              ;set  IX  to byte   O SIDATA
                     CALL  PTIX_TO_SXDATA                 ;RETS  with   IX addr  byte  O  song   1

L2                                                        ;LOOP  until   end  of song  data   areas
                     LD    A,[1IX+0]                      ;test  for  end  of  song  data  araes
                     OR    A                              ; #00   CP        ENDSDATA
                     JR    Z,O00NE_SNOMAN                 ;leave  loop   if all  data  areas   checked

;       *  {f area  active,   set   appropriate    channel!  data  area   pointer

                     INC   A                              ; #888    cP         INACTIVE            ;check   for  inactive    data   area:   don’t  up date   ptr if  so
                     JR    Z,,L9                          ;tf PSW   is non-zero   area   is active:    update    channe!   data  ptrs
                     LD    A,[1X+0]                       ;get  CHW  in  A
                     AND   OCOH                           ;87  - BE   tn  A   = CHA
                     RLCA                                 ;form  CH¥   *  2   inaA,  t.e.,   the  offset   from
                     RLCA                                 ;PTR_TO  S ON_O    of  the   channel    data  area   pointer
                     RLCA  >THAT  POINTS    TO  CHANNEL    CH” 
                     LD    E,A                            ;add  offset   to addr  of  PTR_TO_S  ON_O
                     LD    0,0                            
                     LD    HL,PTR  TO   _SON  O           
                     ADD   HL,DE                          ;-HLpoints   to   proper   channel    data   area   pointer
                     PUSH  IX                             ;store  this  song   data  area’s   byte   O   addr    there
                     POP   DE                             
                     LD    [HL],€                         
                     INC   HL                             
                     LD    [HL],O                         

;       ENOIF

;       ¢ point   IX to  byte  O  next   song  data  area

9                                                         
                     LD    DE,10                          
                     ADD   IX,DE                          
                     JR    L2                    -REPEAT  LOOP 

DONESNOMAN                                                
                     POP   IX                             ;restore   Ix
;@@@ L112
                     RET                                  



;******************************
;*      LEAVE_EFFECT          *
;******************************

;LEAVEEFFECT,  called by a special sound effect routine when it’s finished,
;restores the SONGNO of the song to which the effect note belongs to B5 - BO  of
;byte 0 in the effect’s data area, and loads bytes 1 and 2 with the address  of
;the next note in the  song.  The address of the 1 byte SONGNO (saved by the
;effect when first called) is passed in DE.  The 2 byte address of the next note
;in the song, also saved by the effect, is passed in HL.  IX is assumed to  be
;pointing to byte O of the data area to which the song number is to be restored.
;Bits 7 and 6 of the saved SONGNO are ignored, and therefore may be used by the
;effect to store flag information during the course of the note.

__EFFECT_OVER                                             
;@@@ LEAVEEFFECT
                     LD    [IXX+T4],B                     ;LSB NEXT_NOTEPTR     LSB addr next note  in song
                     LD    [IX+2],H                       ;MSB NEXTNOTE PTR  := MSB addr next note  in song
                     LD    A,[0E]             >= =X=XSONGNO [I,E,,THE SAVED,ORIGINAL  SONGNO] 
                     AND   O3FH               :® O O SONGNO 
                     LD    B,A                := 0 O SONGNO [B NOW = ORTGINAL SONGNO] 
                     LD    A,[1X+0],= CHA   62 [ALL EFFECT NOTES HAVE SONGNO  =  62] 
                     AND   0C0H                  CH¥ O00 0000 
                     OR    B                     CHA   SONGNO 
                     LD    [IX+0],A                       ;restore the song number
                     JR    EFXOVER                        



;eeeeeeeeereaeeseseeresereees
;*    PROCESS   DATA_AREA           *
;Steerer eserregeeseoeueeeeees

;See  Users’   Manual    for   description
;Terminology:     SFX   2  address    of  sound  effect     routine

PROCESS              DATA_AREA                                
                     CALL  AREA_SONG_IS                   ;return    area’s    SONGNO     in A   [and   addr   SFX  in  HL]
                     CP    INACTIVE                       ;test   for   inactive     code
                     RET   Z                              ;RET,   no   processing      if  area   inactive

;         *  if special     effect,    call   it to   process     the  data   area

                     CP    62                             ;test   for   special     sound   effect
                     JR    NZ,L10                         ;1f  PSW    is zero    data   area   used   by  sound   effect
                     LD    DE,7                           ;pt  HLto    SFX+7,    starting    adr   of   the  effect’s     cod  e
                     ADD   HL,DE                          
                     JP    [HL ]                 -DO  1  PASS   THRU    EFFECT,RET   FROM   EFFECT 

;          ENDIF

;         * else   process     a non-effect     note

L10                                                       
                     CALL  ATN_SWEEP                      ;process     atn  sweep    data,    if  any
                     CALL  FREQ  SWEEP                    ;proc   frq   sweep   data,     if any,    &  note  dura    timer  s
;         JR        NZ,L12                ;'f  PSW   {ts zero    note   is  over
                     RET   NZ                             
EFXOVER                                                   
                     LD    A,[IX+O]                       ;A  := CH#                 this   note
                     PUSH  AF                             ;save  on    stack
                     CALL  LOAD_NEXT   NOTE               ;load  data    for   next   note
                     POP   BC                             ;B  := CHA       SONGNO    previous     note
                     LD    A,[1X+0]                       ;A  :® CHA#      SONGNO    new   note   [may   be  inactive]
                     CP    8                              ;check    against    new   note’s    CHé#     SONGNO
ESE                  JR    Z,L12                 >1F  PSW   IS  NON-ZERO     CHANGE    TO/FROM     TONE/EFX/NOISE 
                     RET   Z                              
                     JR    UP_CH_DATA_PTRS                ;to  maintain     data   area    priority     system

;         ENDIF
;         END  SNOMAN



;eee  eeeeeereeeeeseseeeeseges
;*        LOAD  _NEXT  NOTE           .
;eeeeeseeeereseseeseeeeeeees

;see   Users’    Manual    for  description
;SFX   refers    to  the   beginning     address     of  a  special     sound   effect    routine

LOAD_NEXT_NOTE                                            

;          *  deactivate     area,    save   SONGNO    on   stack

                     LD    A,[1X+0]                       ;A  :=  byte   O
                     AND   00111111B                      ;mask   CH#,    if  any
                     PUSH  AF                             ;save   SONGNO    on   stack
                     LD    [IX+O0],INACTIVE               ;deactivate      area

;          *  A  :®  header    new   note

                     LD    L,[1X+1]               -HL   := ADDR    NEW   NOTE    IN ROM 
                     LD    H,[1X+2]                       
                     LD    A,[HL]                -A   :=  HEADER    NEW   NOTE 

;          *  save   header    of  new   note   in  song    on  stack    and   load    its  data  CASE     note    type

                     LD    B,A                            ;save    header    new   note    in  B
                     BIT   5,A                            ;test    for   rest
                     JR    Z,L13                          ;1f   PSW   is  non-zero     note    is  a  rest

;@@@   REST
                     PUSH  BC                             ;save    header    on   stack
                     AND   000111118                      ;mask    al!   but   duration     bits

;          *  set   up NEXT_NOTE     PTR

                     INC   HL                             ;HL   =  address     of  the   header    of  the   note    after     this   note
                     LD    [IXX+T],B                      ;Store    in  NEXT_NOTE     PTR
                     LD    [1X+2],H                       

;          *  move   this   note’s    data   and   fill   in   bytes   where    necessary

                     LD    [ IX+ATN],OFOH                 ;set   atn   off
                     LD    [ IX+NLEN],A                   ;NLEN    :=  5  bit   duration
                     LD    [ IX+FSTEP],O                  ;indicate      freq   not   to  be  swept
                     LD    [ IX+ASTEP],0                  ;indicate      atn   not  to   be  swept
                     JP    MODBO                          
                     .                                    
;          ENOIF

L13                                                       
                     BIT   4,8                    -TEST    FOR  END 
                     JR    Z,L14                          ;if  PSW    is  non-zero     end   of  song
                     BIT   3,A                            ;test    for   repeat
                     JR    2,ENONOREP                     ;1f  PSW    is  non-zero     repeat    song
;@@@   ENDREP
                     POP   BC                             ;B  :=  SONGNO
                     JP    JUKE  BOX                      ;to  reload     is*   note   of   this   song

;       RET                           ; to PROCESS  DATA   _AREA,  don’t   save  header
;       ENDIF

ENONOREP                                                  
                     LD    A,INACTIVE                     
                     PUSH  AF                             ;Save   inactive   code   to end  song
                     JP    MODBO                          ;to  load  byte   O

;       ENDIF
;       -  test  for  special   sound  effect

L14                                                       
                     AND   001111008           SMASK   IRRELEVANT    BITS 
                     CP    00000  1008                    ;test   for  BS  - B2  = OOO!
                     JR    NZ,L15                         ;1f  PSW  is  zero  note   is a  special   effect
;e@@ EFFECT
                     POP   IY                             ;TY  :=  SONGNO
                     PUSH  IY                             ;put  SONGNO   back  on  stack
                     PUSH  BC                             ;Save  header   on  stack   NEXT_NOTE  PTR    := SFX,  DE  :=  SFX
                     INC   HL                             ;-pt  HL  to  next  byte   [LSB  addr  SFX]
                     LD    E,[HT]                         ;-E  :*  LSB  SFX
                     LD    [IXX+1],€                      ;-put  LSB  of  SFX   in byte   1 of  SxDATA   ([NEXT_NOTE_PTR]
                     INC   HL                             ;"pt  HL  to  MSB  SFX
                     LD    D,[HL]                         ;-D  :=  MSB  SFX
                     LD    [IXX+2],D                      ;-put  MSB  SFX   in byte   2 of  SxDATA
                     INC   HL                             ;point   HL  to next   note  [after   this  new  note]
                     PUSH  IY                             ;A  :2 SONGNO
                     POP   AF                             
                     PUSH  DE                             ;1Y  :=  SFX
                     POP   IY                             
                     LD    DE,PASS1                       ;create   “CALL   [IV]"  with  RET  to  PASS1  by  storing
                     PUSH  DE                             ;PASS1  on  the  stack
                     JP    [LY]                           ;ist  7 bytes   SFX  will  save   addr  next  note  &  SONGNO
PASS!                                                     
                     LD    DE,7                           ;in same   fashion,   create   a  “CALL  (1Y+7)*
                     ADD   IY,DE                          ;to allow   SFX  to  load   initial  values
                     LD    DE,MODBO                       ;RET   to  MODBO
                     PUSH  DE                             
                     JP    [IY]                           

;      ENDIF

;       - 1f  here,  note   is type  0  - 3

L15                                                       
                     PUSH  BC                             ;Save   header   on  stack
                     LD    A,B                            ;A  :=  fresh  copy   header
                     AND   000000  1 1B                   ;mask   all  but  type  number
                     OR    A                              ;test   for  type  O
                     JR    NZ,L16              7          ;if PSW   is zero  note   is  type  O: fixed   freq  and  atn

;@ee TYPEO                                   ;5e@t up NEXT_NOTE   PTR
                     INC   HL                             ;next   note  [after   this  new  note]   ts 4 bytes   away,
                     INC   HL                             ;point   HL  to  it     .
                     INC   HL                             
                     INC   HL                             
                     LD    [IX+T],B                       ;put  addr    in NEXT_NOTE_PTR
                     LD    [IX+2],H                       

;          * move    new   note   data    and   fill   in  bytes   where    necessary

                     DEC   HL                             ;point   HL  back    to  ist  ROM   data    to  move,   NLEN
                     LD    DE,O5                          ;point   DE  to  destination:       bytes    5,  4,   and  3
                     CALL  DE TO  DEST                    
                     LD    BC  3                          ;move  3  bytes
                     LDDOR                                
                     LD    [IX+FSTEP],0O                  ;set  for   no  freq   sweep
                     LD    [IX+ASTEP],0                   ;set  for   no  atn   sweep
                     JR    MODBO                          

;          ENDIF

Li6                                                       
                     CP    1                              ;test  for   type    1
                     JR    NZ,L17                         ;if  PSW  is  zero    note   is   type   1:  swept
                                                          ;  freq,   fixed    attenuation
;e@e@   TYPE!                                         ;  set  up   NEXT_NOTE    PTR
                     LD    DE,6                    :NOTE  AFTER    THIS   NOTE    IS  6 BYTES    AWAY, 
                     ADD   HL,DE                          ;pt  HL  to  it
                     LD    [IX+T],B                       ;Store    in  NEXT_NOTE    PTR
                     LD    [IX+2],H                       

;          *  move    new  note    data    and  fill    in bytes    where    necessary

                     DEC   HL                             ;point   HL   back   to   ist  ROM   data   to   move,   FSTEP
                     INC   E                              ;E;  point    DE  to  destination:       bytes    7   - 3
                     CALL  DE TO  DEST                    
                     LD    BC,5                           ;move   5  bytes
                     LDDR                                 
                     LD    [IX+ASTEP],0                   ;set   for  no   atn  sweep
                     JR    MODBO,                         

;          ENDIF

117                                                       
                     CP    2                              ;test   for   type   2                                 
                     JR    NZ,TYPE3                       ;if  PSW   is  zero   note    is  type   2:   fixed    freq,  swept  attenvation
;@e@e   TYPE2                                         ;set   up  NEXT  _NOTE  PTR
                     LD    DE,6                           ;pt  HL  to   note   after    this   note,    since    it’s  6 bytes   away,
                     ADD   HL,DE                          ;pt  HL  to   it  by  adding    6
                     POP   AF                             ;A  :=  header    this   note   [CH¢      SONGNO   }
                     PUSH  AF                             ;put   back   on  stack
                     AND   110000008                      ;mask   SONGNO,     leaving    CHA
                     JR    NZ,L18                         ;1f  PSW   is  zero   this    its a  noise   note,     which  is  only  5  ROM    bytes     iong
                     DEC   HL                             ;SO  move   HL  back    1 byte

;          ENDIF

118                                                       
                     LD    [IX+1],T                       ;put   addr   in  NEXT_NOTE_PTR
                     LD    [1X+2],H                       

;          *  move    new  note   data     and  fill   int      ‘s  where   necessary

                     DEC   HL                             ;pointHi back   to  ist  ROM  data   to move,  APS
                     LD    E,9                            ;point DE to  destination:     bytes   9,8,5  - 3
                     CALL  DETO DEST                      
                     LD    BC,2                           ;move 2 bytes
                     LDDR                                 ;when done,  DE  points   to  FSTEP,   HL to  ROM NLEN
                     XOR   A                              
                     LD    [DE],A                         ;FSTEP := O  for  no  freq  sweep
                     DEC   DE                             ;pt DE to RAM   NLEN
                     DEC   DE                             
                     LD    C,3                            ;     last  3 ROM  bytes    if this   is a noise  note,   garbage
                     LDDR                                 ;will be loaded   into   byte  3,  buts  that’s  OK
                     JR    MODBO                          

;        ENOIF

;       if here,   note  is  type  3:  swept fred,  swept   attenuation

TYPE3                                                     ;set up NEXT NOTE   PTR
                     LD    DE,8                           ;snoteafter  this  note   is  8 bytes   away,
                     ADD   HL,DE                          ;pt HL to  it
                     LD    [IXX4+4],0                     ;put addr  in NEXT_NOTE   PTR
                     LD    [1X+2],H                       

;       * move  new  note  data   and  fill in bytes   where   necessary

                     DEC   HL                             ;point HL back   to  ist  ROM  data   to move,  APS
                     PUSH  ~=E'IK                         ;point DE to  destination:     bytes   9 - 3
                     POP   IY                             ;I1Y:= addr  byte  O   [and DE  =  6]
                     INC   E                              ;DE  :9
                     ADD   IY,DE                          ;IY  :=addr  byte  9   [APS]
                     PUSH  LY                            A 
                     POP   DE                             ;DE  :=addr  APS
                     LD    BC,7                           ;move 7 bytes
                     LDDR                                 

;       * modify   byte O  basis   header  new note

MODBO                                                     
                     PUSH  IX                             ;pt HL to byte   O
                     POP   HL                             
                     POP   AF                             ;A := header  new  note
                     POP   BC                             ;B :2=SONGNO                                             
                     CP    INACTIVE            -TEST FOR  INACTIVE    [SONG  OVER,AS DETECTED   ABOVE] 
                     RET   Z                              
                     LD    D,A                            ;save header   in D
                     AND   3FH                            ;Rid channel  bits
                     CP    04                  -SPECIAL EFFECT 
                     JR    NZ,L20_ LOAD  _NEX             
                     LD    B,62                           

L20_LOAD_NEX:                                             
                     LD    A,D                            ;restore A  to  header
                     AND   OCOH                -A  :=CHA    GOQOOO0OO00O 
                     OR    B                              ;A  :=mew CH#     SONGNO
                     LD    [HL],A                         ;store back  in  byte  O

;         ENDIF

;@ee@ 119
                     RET                                  

DETO_DEST                                                 ;DE  passed = offset  from byte  0,  RETed w  addr  byte  offset
                     PUSH  _—IX                           
                     POP   IY                             ;1Y     addr byte  O [and DE  = offset]
                     ADD   IY,DE                          ;1Y     addr byte  O + offset
                     PUSH  —SI‘TY                         
                     POP   DE                             ;DE     addr of destination   byte  in SxDATA
                     RET                                  

                     END   LOADNEX                        


;5 rrr                      rr      re        rrre  ee ee  ee   eee  ee eeee ee   eee
;
;  Out_to_sound_    port
;                   input:   a=sound   port   data  to  output
;                  register    usage:  n.a.
;
OUT_TO_SOUND_PORT:                                        
                     PUSH  BC                             ;SAVE  BC
                     LD    B,A                            ;THE  IDEA   IS  TO  GET  THE
                     LD    A,[SOUNDPORT ]              —  ; INDIRECT    PORT  ADDRESSING
                     LD    C,A                            ;THRU  THE   PORT   TABLE  IN   EOS
                     OUT   [C],8                          
                     LD    A,B                            
                     POP   BC                             
                     RET                                  
;
;,SSRSHS ST SSSR  SSSCESTESTSS  SSSSS SSSSS SSS SSSSS SSS STS SSS  SsSlsessSessssrze
;»SSSSSSSSESSSSSSPSSSSESSSSSSSSS       SSS SPSSTssssssescssessssssezseeszer=2et2zee2
;,BBSSPSSSSECTPTPSFESSSSSSSSSSP SHSSS STSST SSSSSSSSTessersersesstestsseeexse22eze22222
;


                                                          ;GLB         _  QUERY    FILE,       SET    FILE,      MAKE    FILE
                                                          ;GLB         __FILE    QUERY
                                                          ;EXT          FCB  _HEAD   _ADDR,FCB_       DATA_ADOR
                                                          ;EXT          SCAN_FOR_FILE
                                                          ;EXT         BLOCKS    REQ,USER        BUF   ,USER    NAME
                                                          ;EXT         BUF  START    ,BUF    END
                                                          ;EXT         STRCMP    ,BASECMP
                                                          ;EXT         NEW   HOLE   SIZE,NEW         HOLE   START,HOLE        FILE    NAME
                                                          ;EXT         EOS   YEAR,EOS      MONTH,EOS        DAY
                                                          ;EXT         BLK_STRT_PTR,VOL            BLK   S2           -DLS(8/29/83)
                                                          ;EXT         READ_BLOCK.,WRITE           BLOCK,CHECK        IF   OIRECTORY
                                                          ;EXT         DIR_BLOCK_NO,FOUND             AVAIL    ENTRY
                                                          ;EXT         FILENAME     CMPS

;-------------------------------------------------------------------------------------------------
;
;  __QUERY_FILE -- Read the file’s directory entry.  (USES STRCMP FOR FILE NAME COMPARISIONS)
;  __FILE_QUERY -- SAME AS ABOVE BUT SETS UP SCAN_FOR_FILE FOR BASE COMPARES ( USES BASECMP )
;
;  CALLING PARAMETERS:        Device number in A
;                             address of name string in DE
;                             address of buffer in HL
;
;  EXIT PARAMETERS:       if no errors -- Z = 1;  A = 0; BCDE = file’s start block:
;                                  directory entry in caller’s buffer
;                         if errors    -- Z = 0;  A = error code;  DE =  junk;
;                                  caller’s buffer undefined
;
;-------------------------------------------------------------------------------------------------

__FILE_QUERY:                                             
                     SCF                                  ;  THIS    ENTRY    DOES    NOTHING      MORE     THAN    SET   CARRY     FLAG
                     JR    QUEER,                         

__QUERY_FILE                                              
                     SCF                                  ;  THIS    ENTRY     CLEARS     CARRY     FLAG
                     CCF                                  
QUEER:                                                    
                     PUSH  HL                             ;SAVE     REG’‘S
                     PUSH  IX                             

                     PUSH  AF                                              ] 

                     JR    C,SET     UP_A      -          ;  DID    WE  COME     IN  AT   FILE   QUERY

                     XOR   A                              ;  USE   STRCMP     FOR    FILE    NAME     COMPARE
SET_UP_A:            !                                    
                     LD    [FILENAME_CMPS],A              ;  O  =  COMPARE      COMPLETE       FILE    NAME
                                                          ;  NOT   O   -  COMPARE      ONLY    THE    BASE
                     POP   AF                             

                     LD    [USER_BUF  ],HL                ;SAVE     USER’S     DATA    ADDRESS

                     LD    IX,[FCB_HEAD      ADDR]        ;POINT     TO   SYSTEM’S       FCB
                     LD    H,D                            ;GET    NAME    POINTER      IN   HL
                     LD    L,E                            
                     CALL  SCAN_FOR_FILE                  ;LOOK     IN  TH’     ‘RECTORY
                     JR    NZ,Q_ERROR                     ;BRANCH IF ERROR RETURNED

                     PUSH  DE              >SAVE START BLOCK OF FILE 
                     PUSH  BC                             

                     LD    DE,[USERBUF ]                  ;GET BUFFER ADDRESS IN DOE
                     LD    L,[1IX+FCPOINTER]              ;GET ADDR OF ENTRY IN  HL
                     LD    H,[IX+FCB_POINTER+1]           
                     LD    BC,OIR_ENT_LENGTH-3            ; SET BYTE COUNT TO  LOAD  ONLY  VALID INFO  THAT
                                                          ; THAT WAS STORED ON THE  DEVICE

                     LDIR                                 ;COPY DATA TO CALLER’S BUFFER

                     POP   BC                             ;GET FILE’S START BLOCK
                     POP   DE                             

                     XOR   A                              ;SHOW NO ERROR
                     LD    [FILENAME_CMPS],A              ; DEFAULT FOR SCAN FOR  FILE
Q_ERROR:                                                  
                     POP   IX                             ;sRESTOREREG‘S
                     POP   HL                             
                     RET                                  


;-----------------------------------------------------------------
;
;  _SET_FILE    --   Re-write the file’s directory entry.
;
; CALLING  PARAMETERS:      Device number in A
;                           address of name string in DE
;                           address of buffer in HL
;
; EXIT  PARAMETERS:      tf no  errors    --  Z = 1; A = 0;
;                             directory entry updated
;                        if errors        --  Z = 0; A =  error code;
;                             directory entry unchanged
;
;-----------------------------------------------------------------

_SET_FILE                                                 
                     PUSH  BC                             ;SAVE  REG’S
                     PUSH  DE                             
                     PUSH  HL                             
                     PUSH  IX                             
                     LD    [USER BUF],HL                  ;SAVE  ADDR  OF   USER’S   DATA

                     LD    IX,[FCB_HEAD_ADDR]             ;POINT  TO  SYSTEM’S     FCB

                     LD    H,D                            ;GET  STRING   ADDRESS    IN  HL
                     LD    AE                             
                     CALL  SCAN_FOR  FILE                 ;GET  THE  DIR  ENTRY
                     JR    NZ,S_ ERROR                    ;BRANCH   IF ERROR

                     LD    HL,[USER  BUF  ]               ;GET  BUFFER   ADDRESS
                     LD    E,[IX+FCB_   POINTER]          ;GET  ENTRY  ADDR    IN  DE
                     LD    D,[IX+FCB_POINTER+1]           
                     LD    BC,DIR_ENT_LENGTH-3            ;SET BYTE   COUNT
                     LDIR                                 ;COPY  THEIR   BUFFER   TO   BLOCK   BUFFER

TAPE_TIMED_OUT:                                           
                     LD    A,[IX+FCB_DEVICE]              ;SET   DEVICE  NUMBER
                     LD    HI,[FCB_DATA_ADOR]             ;GET  ADDR  OF  MY  BUFFER
                     LD    E,[IX+FCB_BLOCK]               ;GET  BLOCK   ADDRESS    IN  BCDE
                     LD    D,[IX+FCB_BLOCK+1]             
                     LD    C,[IX+FCB_BLOCK+2]             
                     LD    B,[1X+FCB_BLOCK+3]             
                     CALL  WRITE_BLOCK                    ;RE-WRITE   THE   DIRECTORY     BLOCK

                     JR    NZ,WRITE_ERRORS                
                     XOR   A                              ;SHOW  NO  ERRORS

WRITE                ERRORS:                                
SERROR                                                    

                     POP   IX                             ;RESTORE   REG‘S
                     POP   HL                             
                     POP   DE                             
                     POP   BC                             
                     RET                                  


;---------------------------------------------------------------------------------
;
;  _MAKE_FILE: creates a file in the directory.
;
;  ENTRYPARAMETERS:   called with device ID in A:  address of name
;                  string in HL;  file size (in bytes) in BC DE.
;
;   NOTE:    IF FILE SIZE = O (BC DE), THEN THE REMAINDER OF THE TAPE IS
;            ALLOCATED TO THE FILE
;
;  EXIT PARAMETERS:  CONDITION   FLAGS
;                       Z    -   NO  ERRORS
;                      NZ    -   ERRORS
;                                 A  = ERROR CODE
;
;        ALL REGISTERS ARE PRESERVED EXCEPT AF
;
;---------------------------------------------------------------------------------

FOUND_ENTRY          EQU   0                              ; BIT   INOICATING   DELETED   FILE FOUND  FOR  OVERLAYING

_MAKE_FILE                                                
                     PUSH  IY                             ;SAVE  REGISTERS
                     PUSH  IX                             
                     PUSH  HL                             
                     PUSH  DE                             
                     PUSH  BC                             

                     LD    IX,[FCB_HEAD_ADDR]             ;POINT  TO  SYSTEM   FCB
                     LD    [IX+FCB_MODE],0         >  INIT  IT IN  CASE   IT WAS SET 

                     LD    [IX+FCB_DEVICE],A              ;SAVE  DEVICE  NUMBER
                     LD    [USER_NAME],HL                 ;SAVE  POINTER   TO  NAME

                     LD    A,B                            ; CHECK   IF TO  ALLOCATE   REST  OF TAPE
                     OR    C                              
                     JR    NZ,GOT_ FILE SIZE              ; NOPE,  GOT  SIZE

                     LD    A,E                            
                     OR    D                              
                     JR    NZ,GOT FILE  SIZE              
                     SET   MODEREMAINDER   _BIT,[IX+FCB_   MODE] ;  FLAG  IT

                     JR    SET_UP_DIR                     


;   SINCE  WE ARE  CALLED  WITH  A BYTE  COUNT,   DIVIDE  IT  BY  1024
;   (SHIFT  RIGHT  10 BITS)  TO  GET  A BLOCK  COUNT.

GOT_FILE_SIZE:                                            
                     LD    E,D                            ;D0  A QUICK   SHIFT  BY  8
                     LD    D,C                            
                     LD    C,B                            
                     LD    B,O                            
                     SRL   C                              ;SHIFT  ONE  MORE
                     RR    D                              
                     RR    E                              
                     SRL   CC                             ;THEN  ONE   LAST   TIME
                     RR    A]                             
                     RR    E                              

; FOR THIS   TO BE  A LEGAL   FILE   SIZE,   IT  MUST  FIT   INTO  DE.

                     LD    A,C                            ;CHECK   FOR  TOO  BIG
                     OR    A                              
                     JP    NZ,TOO  BIG                    ;JUMP   IF TOO   BEEG,   SENOR
                     INC   DE                             ;ROUND   UP  IN  CASE  THERE   WAS   A FRACTION
                     LD    A,E                            ;CHECK   FOR  TOO  BIG  AGAIN
                     OR    D                              
                     JP    Z2,T0BIG                       
                     LD    [BLOCKS  REQ],DE               ;ELSE  SAVE   THE  BLOCK   COUNT

SET_UP_DIR:                                               
                     LD    DE,O                           ; ZERO  OUT   HI  ADDRESS
                     LD    [BLOCKS  _REQ+2],DE            
                     LD    [DIR_BLOCK_NO],DE              
                     XOR   A                              
                     LD    [FOUND_AVAIL_ENTRY],A          

                     LD    [IX+FCB_BLOCK],1               ;INIT  NUMBER    OF  FIRST   DIR  BLOCK
                     LD    [IX+FCB_BLOCK+1],A          ZERO   IT  OUT 
                     LD    [IX+FCB_BLOCK+2],A             
                     LD    [IX+FCB_BLOCK+3],A             

                     LD    [IX+FCB_START_BLOCK],1         ;INIT  NUMBER    OF  FIRST   DIR  BLOCK
                     LD    [IX+FCB_START_BLOCK+1],A       
                     LD    [IX+FCB_START   BLOCK+2],A     
                     LD    [IX+FCB_START   BLOCK+3],A     

                     LD    DE,[FCB_DATA_ADDR]             ;INIT   POINTER    TO BUFFER
                     LD    [IX+FCB_POINTER],€             
                     LD    [IX+FCB_POINTER+1],0           

                     LD    [BUF_START],DE                 ;ALSO   INIT   HERE  WITH   SAME
                     LD    HL,1024                        ;CALC   ADDR   OF  END  OF  BUFFER   TOO
                     ADD   HL,DE                          
                     LD    [BUF_END],HL                   ;AND   SAVE  IT

;THIS LABEL   NOT  USED  IN THIS   ROUTINE,    NOT  DECLARED    GLOBAL
;REMOVED  BECAUSE   IT CONFLICTS    WITH   IDENTICAL    LABEL   ELSEWHERE
;READ_TIMEOUT:
                     LD    A,[IX+FCB_DEVICE]              ;GET  PARAMETERS     FROM  FCB
                     LD    L,[IX+FCB_POINTER]             
                     LD    H,[IX+FCB  POINTER+1]          
                     LD    E,[IX+FCB  BLOCK]              
                     LD    0,[1X+FCB_BLOCK+1]             
                     LD    C,[IX+FCB_BLOCK+2]             
                     LD    B,[IX+FCB_BLOCK+3]             
                     CALL  READBLOCK                      ;THEN   READ   THE  FIRST   BLOCK

                     JP    NZ,MAKE_ERROR                  IF  ERROR 

SET_UP_FCB:                                               
                     LD    IY,[FCB _DATA_ADDR]            ;POINT       THE  BUFFER

                     LD    A,[IY+VOL_DIRSIZE]             ;GET   THE   DIR  SIZE    BYTE
                     AND   7FH                            ;ZERO   THE   PERM   BIT
                     INC   A                        :BECAUSE    WE   START    IN  BLOCK    1 
                     DEC   A                              ;TO  SOLVE    PICKET    FENCE    PROBLEM
                     LD    LIX+FCB_LAST       BLOCK],A    ;SET   THE   LAST   BLOCK    #
                     LD    [IX+FCB_LAST_BLOCK+1],0        ;OTHER    BYTES    WILL   BE  ZERO
                     LD    [ IX+FCB_LAST_BLOCK+2],0       
                     LD    [I1X+FCB_LAST_BLOCK+3],0       

                     CALL  CHECK_IF_DIRECTORY             ;  CHECK    IF  DIRECTORY     EXISTS
                     JP    NZ,MAKE_ERROR                  

                     LD    B,ENT_PER_BLOCK-       1       ;INIT   ENTRY    COUNT,    ALLOW   FOR   vOL   ID

NEXT_ENT                                                  
                     LD    L,[IX+FCB_POINTER]             ;GET   CURRENT    POINTER
                     LD    H,[IX+FCB_POINTER+1]           
                     LD    DE,DIR_ENT_LENGTH              ;GET   LENGTH     OF  AN  ENTRY
                     ADD   HL,DE                          ;ADVANCE    POINTER     TO  NEXT   ENTRY
                     LD    [IX+FCB_POINTER],L             ;AND   SAVE   IT  AGAIN
                     LD    [IX+FCB_POINTER+1],H           

CHECK_ENT                                                 
                     LD    L,[IX+FCB_POINTER]             ;GET   POINTER    INTO    IY  THE   LONG   WAY
                     LD    H,[IX+FCB_POINTER+1]           
                     PUSH  HL                             
                     POP   IY                       SFT!  

                     LD    A,[IY+DIR_ATTR]                ;GET   THE  ATTRIBUTE      BYTE   FOR   THIS   ENTRY
                     LD    C,A                            ;SAVE   IT  HERE    FOR  NOW
                     BIT   ATTR_HOLE     BIT,A            ; CHECK    IF  HOLE
                     JP    NZ,FOUND  _HOLE                ;BRANCH    IF   IT‘S   A  HOLE!!!    << ewereaxaz

                     BIT   MODE  REMAINDER      BIT,[IX+FCB_MODE] ;  DO  WE   ALLOCATE     REST   OF   TAPE?
                     JR    NZ,0_FILE                      ; YUP,   DON’T    BOTHER    CHECKING

                     BIT   ATTR_DEL_BIT,C                 ;IS  IT  A  DELETED     FILE?
                     JR    Z,ACTIVE    FILE               ;NOPE,   AN   ACTIVE   ONE

;             LET’S     LOOK   FOR   DELETED     FILE   TO  USE

                     LD    L,[1¥+DIR_MAX_LENGTH]          ;  GET   ALLOCATED     SIZE
                     LD    H,[IY+DIR_MAX_LENGTH#1]        

                     LD    DE,[BLOCKS   REQ]              ;  MIN  NO  OF   BLOCKS    NEEDED
                     OR    A                              ;clear    carry    flag
                     SBC   HL,DE                          ;  WILL   WE  FIT?)
                     JR    C,D  FILE                      ;  NOPE,   LOOK    FOR  ANOTHER     ENTRY

                     LD    HL,FOUND   AVAIL    _ENTRY,FLAG   BYTE 
                     BIT   FOUND_ENTRY,[HL]               ;  DO  WE  ALREADY     HAVE   FIRST    FIT?
                     JR    NZ,D_FILE                              YUP,DON’T    EVEN   CONSIDER     THIS   ONE 

                     SET   FOUND_ENTRY,[HL  ]             
                     LD    E,[1X+FCB_BLOCK]               ;GIT   BLOCK   NO   OF  THIS   DIRECTORY
                     LD    D,[1X+FCB_BLOCK+1]             

                     LD    [OIR_BLOCK_NO],DE              ; SAVE  IT
                     JR    D_FILE                         


; IF THIS  IS  A REAL FILE,  WE  CAN  SEE  IF  ITS NAME MATCHES    THE
; ONE  WE ARE  ABOUT TO MAKE   --  IT’S AN  ERROR  IF SO.

ACTIVE_FILE:                                              
                     LD    E,[IX+FCB_ POINTER]            ;POINT TO  THIS  ENTRY
                     LD    OD[IX+FCB_POINTER+1]           
                     LD    HL,[USER_NAME]                 ;POINT  TO DESIRED  NAME
                     CALL                                 ;COMPARE  THE  BASE OF  THE   FILENAMES
                     JP    Z,FILE_EXISTS                  ;BRANCH   IFTHEY’RE   THE  SAME
DFILE                                                     
                     DJNZ  = NEXT_ENT                     ;ELSE  GO TO NEXT  ENTRY   (IF  IT  EXISTS)

                     LD    HL,[BUF_START]                 ;IF NOT  RESET  FCB  FOR NEXT   BLOCK
                     LD    [IX+FCB_POINTER],L             
                     LD    [IX+FCB_POINTER+1],H           
                     INC   [IX+FCB_BLOCK]                 ;INC  THE BLOCK  -- NO  CARRY   OUT

; DO 4-BYTE   COMPARE OF FCB BLOCK    VS FCB_LAST  BLOCK   TO SEE
; IF THERE’S   MORE FILE LEFT.

                     LD    A,[IX+FCB_LAST_BLOCK+3]        ;COMPARE MS  BYTES
                     CP    [IX+FCB_BLOCK+3]               
                     JP    C,FULL_DIR                     ;BRANCH  IF BLOCK   IS LARGER
                     LD    A,[IX+FCB_LAST_BLOCK+2]        ;COMPARE  NEXT  BYTES
                     CP    [IX+FCB_BLOCK+2]               
                     JP    C,FULL_DIR                     ;BRANCH  IF BLOCK   IS LARGER
                     LD    A,[IX+FCB_LAST_BLOCK+1]        ;COMPARE  NEXT  BYTES
                     CP    [IX+FCB_BLOCK+1]               
                     JP    C,FULL_DIR-                    ;BRANCH  IF BLOCK  IS  LARGER
                     LD    A,[IX+FCB_LAST_BLOCK+0]        ;COMPARE  LS  BYTES
                     CP    [1X+FCB_BLOCK+0]               
                     JP    C,FULL_DIR                     ;BRANCH  IF BLOCK  IS  LARGER
; IF WE  FALL  OUT, FCB_BLOCK  <=  FCB_LAST  BLOCK.
DOREAD               AGAIN:                                

                     LD    A,[IX+FCB_DEVICE]              ;SET  UP THE  PARAMETERS
                     LD    L,[IX+FCB_POINTER]             
                     LD    H,[IX+FCB_POINTER+1]           
                     LD    E,[IX+FCB_BLOCK]               
                     LD    D,[1X+FCB_BLOCK+1]             
                     LD    C,[IX+FCB_BLOCK+2]             
                     LD    B,[IX+FCB_BLOCK+3]             
                     CALL  READ_BLOCK                     ;AND READ  THE  NEXT BLOCK   OF  ENTRIES
                     JP    NZ,MAKE_ERROR                  ; NOPE,  A REAL  ERROR

NOTIMEOUT:                                                
                     LD    B,ENTPER  BLOCK                ;SET  THE ENTRY  COUNTER
                     JP    CHECK_ENT                      ;AND GO  CHECK  THE NEW  ENTRY

FULLDIR:                                                  
                     LD    HL,FOUND AVAIL  _ENTRY         
                     BIT   FOUND_ENTRY,[HL]               ‘E WE FOUND   AN  ENTRY? 
                     JP    Z,FULL_DIR_EXIT                ; NOPE,  EXIT
                     JR    USE_ENTRY                      ; YUP,  CREATE   NEW   ENTRY    THERE

; ARRIVE   HERE   WHEN  WE’VE   FOUND   THE  HOLE   ENTRY   IN  THE  OIRECTORY.
; IV  IS  STILL   POINTING   TO  THE  ENTRY    IN  THE  BUFFER.

FOUND_HOLE                                                
                     LD    HL,FOUND  _AVAIL_ENTRY         
                     BIT   FOUND ENTRY,[HL]               ; HAVE  WE  FOUND    A DELETED     ENTRY   WE  COULD  USE?
                     JR    Z,USE_HOLE                     ; NOPE,  STICK    IT  IN  THE   END

USE                  ENTRY:                                
                     RES   FOUND_ENTRY,[HL ]              ; RESET  FOR   NEXT   TIME

                     LD    L,[1X+FCB_BLOCK]               ; GET THE   CURRENT    BLOCK                                                             '
                     LD    H,[IX+FCB_BLOCK+   1]          

                     LD    DE,[OIR_BLOCK_NO]              ; BLOCK  NO  WHERE    WE  HAVE   ENTRY    TO  USE
                     OR    A                              ;Clear  carry   flag
                     SBC   HL,DE                          ; SAME  BLOCK?

                     LD    HL,[BUF  START]                ; POINT  TO  START    OF  BLOCK
                     LD    [IX¢FCB_ POINTER],L            
                     LD    [IX+FCB_POINTERT1],H           
                     )                                    
                     JR    Z,GOT_BLOCK                    ; YUP,  DON’T    NEED   TO  READ   IN   ANOTHER   BLOCK

                     LD    [IX+FCB_BLOCK],E               ;  GET THIS   BLOCK
                     LD    [IX+FCB_BLOCK+1],D             

                     LD    BC,O                           
                     LD    A,[IX+FCB_DEVICE    ]          ;  DEVICE  ID

                     CALL  READ_BLOCK                     
                     JP    NZ,MAKE ERROR                  
                     JR    GOT_BLOCK                      ;  READ  IN  NEW  DIRECTORY

NEXT_DIR:                                                 
TOOSMALL:                                                 
                     LD    L,[IX+FCB_POINTER]             ;  GET POINTER    TO  DIR   ENTRY
                     LD    H,[IX¢FCB_POINTER+1]           

                     LD    DE,OIR_ENT_LENGTH              ;  LENGTH  OF   ENTRY

                     ADD   HL,DE                          ;  POINT  TO  NEXT   ENTRY

                     LD    [IX+FCB_POINTER],L             
                     LD    [1X+FCB_POINTER+1],H           

GOTBLOCK:                                                 
                     PUSH  HL                             
                     POP   IY                             

                     BIT   ATTRDEL   BIT,[1Y+#DIR   ATIR] ;  IS  IT  DELETED?
                     JR    Z,NEXT_DIR                     ; NOPE,    LOOK   FOR   ANOTHER   DLETED    ENTRY

                     LD    L,[1Y+DIR MAX  LENGTH]                  - GET   ALLOCATED     AMOUNT    OF  DELETED   FILE 
                     LD    H,[1Y+DIR_MAX_LENGTH+      1]  

                     LD    DE,[BLOCKS  REQ]               ; MIN   AMOUNT    NEEDED

                     PUSH  HL                             
                     OR    &                              ;Clear  carry    flag
                     SBC   HL,DE                          ; WILL   IT  FIT?
                     POP   HL                             

                     JR    C,TOO_SMALL                    ; NOPE,   TRY  ANOTHER    ONE

                     LD    [BLOCKS  REQ],HL               ; FORCE   ALLOCATED     AMOUNT

                     CALL  LOAD_NEW_ENTRY_INFO            
                     '                                    
                     JP    NZ,MAKE  ERROR                 

                     JP    TIME_TO_WRITE                  

; COMPARE    FCB_BLOCK   TO  FCB LAST   BLOCK.     GO   TO MORE  BLOCKS
; IF  FCB _LAST  BLOCK   > FCB BLOCK.

USE_HOLE:                                                 
                     LD    A,[ IX+FCB_BLOCK+3]            
                     CP    [IX+FCB_LAST_BLOCK+3]          
                     JR    C,MORE  BLOCKS                 
                     LD    A,[IX*FCB_BLOCK+2]             
                     CP    [IX+FCB_  LAST  BLOCK+2]       
                     JR    C,MORE_BLOCKS                  
                     LD    A,[IX*FCB_BLOCK+    1]         
                     CP    [IX*FCB_LAST_BLOCK+1]          
                     JR    C,MORE_BLOCKS                  
                     LD    A,[IX+FCB_  BLOCK]             
                     CP    IX*FCB_LAST_BLOCK]             
                     JR    C,MORE  BLOCKS                 

; FALL   THROUGH   IF THIS   IS  THE  LAST   BLOCK  OF   THE  FILE.

                     LD    A,B                            ;LOOK   AT ENTRY   COUNTER
                     CP    1                              
                     JP    2,TAPE_FULL                    ;ERROR   IF  NO  ENTRIES   LEFT   VACANT

MORE                 BLOCKS                                
                     LD    L,[1Y¥+DIR_MAX_LENGTH]         ;GET  THE  SIZE   OF  THE  HOLE
                     LD    H,[1¥+DIR_MAX_LENGTH+1]        

                     BIT   MODE _REMAINOER_BIT,[IX+FCB_       MODE] ; NEED   TO  ALLOCATE    REST   OF TAPE?
                     JR    2,CHECK_HOLE   SIZE            ; NOPE

                     LD    AH                             ; YUP,   CHECK   IF  THERE   ARE  ANY  BLOCKS    LEFT
                     OR    L                              
                     JP    2,TAPE _FULL                   ; TAPE   FULL

                     LD    [BLOCKS  REQ],HL               ; NOT   FULL,  REQUEST    REST   OF  TAPE
                     RES   MODE REMAINDER    BIT,[IX+TFCB    MODE] 

CHECK_HOLE           SIZE:                                
                     LD    DE,[BLOCKS  REQ]               ;GET  THE  REQUESTED    SIZE
                     OR    A                              
                     SBC   HL,DE               -COMPARE   THEM 
                     JP    C,TAPE_FULL                    ;BRANCH   IF  THE  HOLE   IS  TOO  SMALL
                     LD    [NEW_HOLE_SIZE],HL             ;ELSE  SAVE   THE  RESULT


; ADD BLOCKS  REQ   TO DIR_START    BLOCK    TO  FIND  THE  HOLE‘S    NEW
; START  BLOCK.    NOTICE  HOW   STOOOPID    THE  Z80  IS  WITH   ADDITION!
                     LD    HL,BLOCKS REQ                  ;POINT    TO THE  NUMBER    TO  ADD
                     LD    A,[IY¥+DIR_START_BLOCK]        
                     ADD   A,[HL]                         
                     INC   HL                             
                     LD    [NEW_HOLE  START],A            
                     LD    A,[IV+DIR_START_BLOCK+1]                                                                                                ‘ 
                     ADC   A,[HL]                         
                     INC   HL                             
                     LD    [NEW _HOLE START+1],A          
                     LD    A,[IY+DIR_START_BLOCK+2]       
                     ADC   A,[HL]                         
                     INC   HL                             
                     LD    [NEW_HOLE  START+2],A          
                     LD    A,[IY#DIR_START_BLOCK+3]       
                     ADC   A,[HL]                         
                     INC   HL                             
                     LD    [NEW HOLE  START+3],A          

                     PUSH  BC                             ;SAVE   ENTRY   COUNT   (IN  B)

                     CALL  LOAD_NEW_ENTRY_INFO            

                     POP   BC                             ;RESTORE    ENTRY   COUNT

                     JP    NZ,MAKE  ERROR                 

                     LD    L,[IX+FCB_POINTER]             ;GET   CURRENT   POINTER


                     LD    H,[1X+FCB_POINTER+1]           
                     LD    DE,OIR_ENT_LENGTH              ;GET  LENGTH   OF  AN  ENTRY
                     ADD   HL,DE                          ;ADVANCE    POINTER   TO  NEXT   ENTRY
                     LD    [IX+¢FCB_POINTER],L            ;AND   SAVE  IT  AGAIN
                     LD    [I1X+FCB_POINTER+1],H          

                     DJNZ  NOT_END                        ;UUMP   IF  THERE  ARE   MORE   ENTRIES

;THIS LABEL  NOT   USED  IN THIS   ROUTINE,    NOT  DECLARED    GLOBAL
;REMOVED  BECAUSE   IT CONFLICTS    WITH   IDENTICAL    LABEL   ELSEWHERE
;WRITE_AGAIN:
                     LD    A,[IX+FCB_ DEVICE]             ;GET   PARAMETERS    FROM   FCB
                     LD    HL,[BUF START]                 
                     LD    E,[1X+FCB_ BLOCK]              
                     LD    D,[1X+FCB_BLOCK+1]             
                     LD    C,[1X+FCB_  BLOCK+2]           
                     LD    B,[1X+FCB_  BLOCK+3]           

                     CALL  WRITE BLOCK                    

                     JP    NZ,MAKE_ERROR                  ;NOPE,    A REAL  LIVE    ERROR


RESET_THE_POINTER:                                        
                     LD    HL,[BUF_START]                 ;RESET   THE  POINTER
                     LD    [IX¢FCB_POINTER],L             
                     LD    [ IX+FCB_POINTER+1],H          

                     INC   [IX¢FCB_BLOCK]                 ;INC   BLOCK   -- NO  CARRY  OUT

TIMEOUT_IN_READ:                                          
                     LD    A,[IX+FCB_DEVICE]              ;GET  PARAMETERS    FROM   FCB
                     LD    L,[ IX+FCB_POINTER]            
                     LD    H,[IX+FCB_POINTER+1]                                                                                                           ' 
                     LD    E,[IX+FCB_BLOCK]               
                     LD    D,[IX+FCB_BLOCK+1]             
                     LD    C,[ IX+FCB_BLOCK+2]            
                     LD    B,[IX+FCB_BLOCK+3]             
                     CALL  READ BLOCK                     ;AND   READ  THE  NEXT  BLOCK

                     JR    NZ,MAKE_ERROR                  ;  NOPE,  ERRORIIIII!


                     LD    L,[IX*FCB_POINTER]             ;GET  POINTER    INTO  IY  THE   LONG WAY
                     LD    H,[IX+FCB_POINTER+1]           

NOT_END:                                                  
                     PUSH  HL                             
                     POP   IY                  STAT       

;*
;*  STILL  TRYING    TO CALC  THE  NEW   START   ADOR
;=                    .
                     LD    HL,[NEW_HOLE SIZE]             
                     LD    [IY+DIR_MAX_LENGTH],L          ;  BLOCKS   LEFT   ON TAPE
                     LD    [IY+DIR_MAX_LENGTH+1],H        

                     LD    A,[NEW_HOLE_START]             
                     LD    [IY+DIR_START_BLOCK],A         
                     LD    A,[NEW_HOLE_START+1]           
                     LD    [IY+DIR_START_BLOCK+1],A       
                     LD    A,[NEW_HOLE_START+2]           
                     LD    [IY+DIR_START_BLOCK+2],A       
                     LD    A,[NEW_HOLE_START+3]           
                     LD    [IY+DIR_START_BLOCK+3],A       

                     LD    [IY+DIR_ATTR],ATTR_HOLE        ; SET  HOLE   UP

                     PUSH  IY                             
                     POP   DE                             

                     LD    HL,HOLE_FILE_NAME              
                     LD    BC,12                          
                     LDIR                                 

TIME_TO_WRITE:                                            
                     LD    A,[IX+FCB  DEVICE]             ;GET PARAMETERS  FROM  FCB
                     LD    HI,[BUF START]                 
                     LD    E,[IX+FCB_BLOCK   ]            
                     LD    0,[1X+FCB_BLOCK+   1]          
                     LD    C,[1X+FCB_BLOCK+2]             
                     LD    8B[IX+FCB_BLOCK+3]             
                     CALL  WRITE  _BLOCK                  ;WRITE  THE BLOCK OUT

                     JR    NZ,MAKE ERROR                  ; IT’S A BOO BOO! !
                     XOR   A                              ;SHOW NO  ERROR

LETS_GET_OuT:                                             
MAKE_ERROR:                                               
                                                          ;RESTORE  THE REGISTERS
                     OR    A                                                                                                             ‘ 
                     POP   BC                             
                     POP   DE                             
                     POP   HL                             
                     POP   IX                             
                     POP   RY                             
                     RET                                  

TOO_BIG                                                   
                     LD    A,TOO_BIG_ERR                  ;SHOW AN  ERROR
                     JR    MAKE_ERROR                     


FILE_EXISTS                                               
                     LD    A,FILE_ EXISTS_ERR             
                     JR    MAKE_ERROR                     

FULL_DIR_EXIT:                                            
                     LD    A,FULL_DIR_ERR                 
                     JR    MAKE_ERROR                     

TAPE_FULL                                                 
                     LD    A,FULL_TAPE_ERR                
                     JR    MAKE_ERROR                     
;«+
;¢
;*    SUBROUTINE   NAME:  GET  FILE   NAME  LENGTH
;*
;«      ENTRY:   HL- POINTS   TO  TEXT  STRING
;*      EXIT:    Z=1=FOUND   AND  PROPER   SIZE  (1-12)
;*                 BC=BYTE   COUNT
;                  A=TRASHED
;*
;*               Z=O=ERROR
;*                 BC=TRASH
;»                 A=FILE  NAME  _TOO LONG
;* DLS(8/28/83)
;*
GET_FILE_NM_LEN:                                          
                     PUSH  HL                             ;SAVE  THE POINTER  TO  FILE NAME
                     LD    B,12                           ;SCAN  UP TO 12 BYTE
                     LD    C,1                            ;SET COUNT  TO 1
SRCH_LOOP:                                                
                     LD    A,[HL]                         ;GET FN(1)
                     CP    03                         SETX 
                     JR    2,GOT_IT                       
;*
                     INC   C                              
                     INC   HL                             ;ADVANCE POINTER  TO FILE  NAME  STRING
                     DJNZ  SRCH_LOOP                      
;
ERR_GFN                                                   
                     LD    A,FILE_NM_ERR                  
                     OR    A                              ;SHOW ERROR
                     POP   HL                             
                     RET                                  
;*
GOT_IT                                                    
                     LD    A,C                            
                     CP    1                              ;ETX ALONE  IS NOT VALID
                     JR    2,ERR_GFN                      
                     LD    8,0                            
                     XOR   A                              ;SHOW OK
                     POP   HL                             
                     RET                                  




LOAD_NEW_ENTRY_INFO:                                      
                     PUSH  IY                             ;GET   NAME   ADORESS     INTO    DE
                     POP   DE                             

                     LD    HL,[USER_    NAME]             ;GET   USER’S    STRING    ADDRESS
;«
                     CALL                                 ; DLS(8/28/83)
                     JP    NZ,MAKE  ERR   1               
;*
                     LDIR                                 ;COPY   USER’S    NAME    INTO   DIR   ENTRY

                     LD    A,ATTR_USER                    ;SET   THE  DEFAULT     ATTRIBUTE
                     LD    [1Y+OIR_ATTR],A                
                     é                                    
                     LD    BC,[BLOCKS   REQ]              ;GET   NEW   FILE’S    MAX   SIZE
                     LD    [I¥+DIR_MAX_LENGTH],C          ;PUT   INTO    DIR
                     LD    [1Y¥*DIR_MAX_LENGTH+1],8       


                     LD    [1¥+DIR_USED_LENGTH],1         ;INIT   COUNT    OF   BLOCKS    USED
                     LD    [1¥*DIR_USED_LENGTHT1],0       

                     LD    [I¥+DIR_LAST_COUNT],O          ;INIT   BYTECOUNT      IN   LAST   BLOCK
                     LD    [1 ¥*#DIR_LAST_COUNT+1],0      

                     LD    A,[EOS  YEAR]           >INSERT    THE   DATE 
                     LD    [IV+DIR_VEAR],A                
                     LD    A,[EOS  MONTH]                 
                     LD    [1¥*#DIR_  MONTH],A            
                     LD    A,[EOS  DAY]                   
                     LD    [1V¥+DIR_DAY],A                



__MAKE_ERR_1:                                             
                     RET                                  

;
;***********************************************************************************
;***********************************************************************************
;***********************************************************************************
;


                                                          ;GLB       _OPEN_FILE, _CLOSE_FILE, _RESET_FILE
                                                          ;EXT       FCB_HEAD_ADDR,FCB_DATA_ADDR
                                                          ;EXT       BUF START, _FMGR_DIR_ENT
                                                          ;EXT       __QUERY_FILE,  MODE_CHECK,READ_BLOCK, WRITE_LOCK
                                                          ;EXT       __SET_FILE
                                                          ;EXT       FILE_NAME_ADDR

;-----------------------------------------------------------------------------------------
;
;  _OPEN_FILE    --  Sets up an FCB for the caller to access a file.
;
;  CALLING  PARAMETERS: device number in A;   address of name string
;                    in HL;  mode in B.
;
;  EXIT  PARAMETERS:     if no error   --  Z = 1;  A  =  file number                                                                                      '
;                        if error      --  Z = 0;  A  =  error code;    B  =  junk
;
;-----------------------------------------------------------------------------------------

;  NEXT_FCB   CHANGED   TO  O NEXT   _FCB   TO  PREVENT    CONFLICT      WITH
;  IDENTICAL    LABEL  ELSEWHERE

_OPEN_FILE                                                
                     PUSH  IY                             ;SAVE    REGISTERS
                     PUSH  HL                             
                     PUSH  IX                             
                     PUSH  DE                             

                     PUSH  AF                             ;SAVE   DEVICE     NUMBER
EA07                 CS    4282              PUSH      BC ;SAVE   MODE

;  FIRST,  WE  HAVE  TO   LOCATE   A  FREE   FCB.
EA08                 DD2AFDFO 4258              LO        IX,[FCB_HEAD_ADOR] ;GET  POINTER     TO   FIRST   FCB’S   HEAD
                     LD    DE,FCB_LENGTH                  
                     ADD   IX,DE                          ;  SKIP   OVER   IT   --  BELONGS     TO  SYSTEM

                     LD    I¥,[FCB_DATA_ADDR]             ;:GET  POINTER     TO   FIRST   FCB’S   BODY
                     LD    DE,1024                        
                     ADD   IY,DE                          ;  SKIP   OVER   IT   TOO

                     LD    BI                             ;SET   FCB   NUMBER
O_NEXT_FCB                                                
                     LD    A,[IX+FCB_   MODE]             ;GET   THE   MODE   BYTE    FROM   FCB
                     OR    A                              ;CHECK    IT
                     JR    Z,GOT_ONE                      ;BRANCH     IF  THIS   ONE   IS  FREE

                     LD    DE,FCB_LENGTH                  ;ELSE     SKIP   OVER    IT
                     ADD   1X,DE                          
                     LD    DE,1024                        
                     ADD   IY,DE                          

                     INC   8                     -INC   THE   FCB  NUMBER 
                     LD    A,B                            
                     CP    NUM FCBS              SARE   THERE    MORE   FCBS   TO  CHECK? 
                     JR    C,0 NEXT   FCB                 ;LOOP   UNTIL    WE’VE    SEEM   THEM   Ait
NO_FCBS              :                                    
                     POP   BC                    RESTORE      RP    § 
                     POP   AF                             
                     POP   DE                             
                     POP   IX                             
                     POP   HL                             
                     POP   IY                             

                     LD    A,NO_FCB_ERR                   ;SET  THE ERROR CODE
                     OR    A                              ;SET  THE CONDITIONS
EA3D                 C9    4268          RET              

GOT_ON                                                    
                     LD    [BUF_START],IY                 ;SAVE  THE FCB BUFFER’S  ADDRESS

                     POP   AF                             ;GET THE  MODE
                     LD    [IX+FCB_MODE],A                ;PUT  IT INTO FCB                                                                       '
                     POP   AF                             ;GET THE  DEVICE
                     LD    [IX+FCB_DEVICE],A              ;PUT IT INTO FCB

                     PUSH  BC                             ;SAVE  THE FCB NUMBER

                     PUSH  HL                             
                     POP   DE                             ; ADDRESS  OF NAME STRING

                     PUSH  IX                             ;POINT  TO FCB NAME (ASSUME  OFFSET  =  0)
                     POP   HL                             
                     LD    A,[IX+FCB_DEVICE]              ;GET  DEVICE NUMBER
                     CALL  __QUERYFILE                    ;GET THE  FILE’S DIR  ENTRY
                     JP    NZ,OP_ERR                      ;BRANCH  IF THERE WAS  AN ERROR
                                                          ;#** SET  PARAMS ees
                     CALL  MODECHECK                      ;SEE IF  MODE MATCHES  ATTRIBUTES
                     JP    NZ,OP_ERR                      ;BRANCH  IF NOT

                     LD    A,[IX+FCB_USED_ LENGTH]        ;CALC. & SET  LAST BLOCK
                     ADD   A,[IX+FCB_FIRST BLOCK]         
                     LD    [IX+FCB_LAST BLOCK],A          
                     LD    A,[IX+FCB_FIRST  BLOCK+1]      
                     ADC   A,[IX+FCB_USED LENGTH+T1]      
                     LD    [IX+FCB_LAST BLOCK+1],A        
                     LD    A,[IX+FCB_FIRST BLOCK+2]       
                     ADC   A,O                            
                     LD    [IX+FCB_LAST_BLOCK+2],A        
                     LD    A,[IX+FCB_FIRST_BLOCK+3]       
                     ADC   A,O                            
                     LD    [IX+FCB_LAST BLOCK+3],A        

                     LD    A,[IX+FCBLAST  BLOCK+TO]       
                     SUB   1                              
                     LD    [IX+FCB_LAST BLOCK+O],A        

                     LD    A,[IX+FCB_LAST BLOCK+I]        
                     SBC   A,O                            
                     LD    [IX+FCB_LAST BLOCKTI],A        

                     LD    A,[IX+FCLAST  BLOCK+T2]        
                     SBC   A,O                            
                     LB    [I1X+FCBLAST BLOCK+2],A        

                     LD    A,[IX*FCB_LAST_BLOCK+3]        
                     SAC   A,O                            
                     LD    [IX+FCB_LAST  BLOCK+3],A       

                     LD    DE,[BUF_START]                 ;INIT   BUFFER  POINTER
                     LD    [IX+FCB_POINTER],E             
                     LD    [IX+FCB_POINTER+1],0           

                     LD    A,[IX+FCB_FIRST_  BLOCK]       ;SET  BLOCK   TO FIRST BLOCK
                     TO    [IX*FCB_BLOCK],A               
                     LD    A,[IX+FCB_FIRST  BLOCK+1]      
                     LD    [IX+FCB  BLOCK+1],A            
                     LD    A,[IX+FCB_FIRST_BLOCK+2]       
                     LD    [IX+FCB  BLOCK+2],A            
                     LD    A,[IX*FCB_FIRST_BLOCK+3]                                                                                        : 
                     LD    [IX+FCB_BLOCK+3],A,            

                     LD    A,[IX+FCB_MODE]                ;LOOK  AT  THE  MODE
                     AND   MODE MODE                      
                     CP    MODE WRITE                     ;IS  IT  WRITE  MODE?
                     JR    2,OPENS                        ;JUMP   IF SO  --  NO PRE-READ  NECESSARY

READ_TIMEOUT:                                             
;*                    Tf FCB_USED  LENGTH    = 1  (file  size  of  one block)
                     XOR   A                              ;load  Acc with zero
                     CP    [IX+FCB_USED_LENGTH+   1]              SHIGH  ORDER MUST BE ZERO 
                     JR    NZ,NOT_SIZE  1                 ;I1f not then past bitset
                     INC   &                              ;Inc  Acc to a  1
                     CP    [IX+¢FCB_USED_LENGTH]          ;Compare  with low order
                     JR    NZ,NOT_SIZE_1                  ;If not  equal then exit

;+                    Then  set  last block   bit  in mode
                     SET   MODE  LAST  BLOCK BIT,[IX+FCB_MODE] ;Set  it
;+                    Endif
NOT_SIZE_1:                                               

                     LD    A,[IX*FCB_DEVICE]              ;GET  THE  DEVICE   NUMBER
                     LD    HL,[BUF_ START]                ;GET  BUFFER  ADDRESS
                     LD    E,[IX+FCB_BLOCK]               ;GET  BLOCK  NUMBER
                     LD    O,[IX+FCB_BLOCK+   1]          
                     LD    C,[IX+FCB  BLOCK+2]            
                     LD    8,[IX+FCB_BLOCK+3]             
                     CALL  READ_BLOCK                     ;READ  THE  FIRST  BLOCK

