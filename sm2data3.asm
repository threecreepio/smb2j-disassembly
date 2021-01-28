;SMB2J DISASSEMBLY (SM2DATA3 portion)

;-------------------------------------------------------------------------------------
;DEFINES

OperMode              = $0770
OperMode_Task         = $0772
ScreenRoutineTask     = $073c
DiskIOTask            = $07fc

VRAM_Buffer1          = $0301
VRAM_Buffer_AddrCtrl  = $0773
DisableScreenFlag     = $0774
SelectTimer           = $0780
ScreenTimer           = $07a0
WorldEndTimer         = $07a1
FantasyW9MsgFlag      = $07f5

IRQUpdateFlag        = $0722
IRQAckFlag           = $077b

FDSBIOS_DELAY     = $e149
FDSBIOS_LOADFILES = $e1f8
FDSBIOS_WRITEFILE = $e239
NameTableSelect   = $077a
CompletedWorlds   = $07fa
HardWorldFlag     = $07fb
FileListNumber    = $07f7

GamePauseStatus   = $0776

ObjectOffset        = $08
Enemy_ID            = $16
Enemy_Y_Position    = $cf
Enemy_Rel_XPos      = $03ae
Enemy_SprDataOffset = $06e5

SelectedPlayer      = $0753
NumberofLives       = $075a
DigitModifier       = $0134
WorldNumber         = $075f

;sound related defines
Squ2_NoteLenBuffer      = $0610
Squ2_NoteLenCounter     = $0611
Squ2_EnvelopeDataCtrl   = $0612
Squ1_NoteLenCounter     = $0613
Squ1_EnvelopeDataCtrl   = $0614
Tri_NoteLenBuffer       = $0615
Tri_NoteLenCounter      = $0616
Noise_BeatLenCounter    = $0617
FDSSND_LenBuffer        = $05f2
FDSSND_LenCounter       = $05f1
FDSSND_MasterEnvTimer   = $05f3
FDSSND_ModTableNumber   = $05f6
FDSSND_MasterEnvSet     = $05f7
FDSSND_VolumeEnvTimer   = $05f8
FDSSND_VolumeEnvOffset  = $05f9
FDSSND_SweepModTimer    = $05fa
FDSSND_SweepModOffset   = $05fb

PauseSoundQueue       = $fa
Square1SoundQueue     = $ff
Square2SoundQueue     = $fe
NoiseSoundQueue       = $fd
AreaMusicQueue        = $fb
EventMusicQueue       = $fc

Square1SoundBuffer    = $f1
Square2SoundBuffer    = $f2
NoiseSoundBuffer      = $f3
AreaMusicBuffer       = $f4
EventMusicBuffer      = $07b1
PauseSoundBuffer      = $07b2
AltMusicBuffer        = $0608

PatternNumber         = $061d

MusicData             = $66
MusicDataLow          = $66
MusicDataHigh         = $67
WaveformData          = $68
FDSSND_VolumeEnvData  = $6a
FDSSND_SweepModData   = $6c
MusicOffset_Square2   = $060a
MusicOffset_Square1   = $060b
MusicOffset_Triangle  = $060c
MusicOffset_Noise     = $060d
MusicOffset_FDSSND    = $061f

NoteLenLookupTblOfs   = $f0
DAC_Counter           = $07c0
NoiseDataLoopbackOfs  = $061b
NoteLengthTblAdder    = $0609
AreaMusicBuffer_Alt   = $07c5
PauseModeFlag         = $07c6
GroundMusicHeaderOfs  = $07c7
AltRegContentFlag     = $07ca

WaveformID            = $060e

MsgCounter            = $0719
MsgFractional         = $0749

EndControlCntr        = $0761
BlueColorOfs          = $0762
BlueDelayFlag         = $0763
MushroomRetDelay      = $0764
MRetainerOffset       = $0762
CurrentFlashMRet      = $0763

MHD = MusicHeaderOffsetData

GameOverMode          = 3

SND_REGISTER          = $4000
SND_SQUARE1_REG       = $4000
SND_SQUARE2_REG       = $4004
SND_TRIANGLE_REG      = $4008
SND_NOISE_REG         = $400c
SND_DELTA_REG         = $4010
SND_MASTERCTRL_REG    = $4015

SPR_DMA               = $4014
JOYPAD_PORT           = $4016
JOYPAD_PORT1          = $4016
JOYPAD_PORT2          = $4017

FDS_IRQTIMER_LOW      = $4020
FDS_IRQTIMER_HIGH     = $4021
FDS_IRQTIMER_CTRL     = $4022
FDS_CTRL_REG          = $4025
FDS_STATUS            = $4030
FDS_DRIVE_STATUS      = $4032

FDSSND_VOLUMECTRL      = $4080
FDSSND_FREQLOW         = $4082
FDSSND_FREQHIGH        = $4083
FDSSND_SWEEPCTRL       = $4084
FDSSND_SWEEPBIAS       = $4085
FDSSND_MODFREQLOW      = $4086
FDSSND_MODFREQHIGH     = $4087
FDSSND_MODTBLAPPEND    = $4088
FDSSND_WAVEENABLEWR    = $4089
FDSSND_WAVERAM         = $4040

Sfx_ExtraLife          = %01000000
Sfx_CoinGrab           = %00000001
VictoryMusic           = %00000100

; imports from other files
.import MoveSpritesOffscreen
.import FreqRegLookupTbl
.import NextWorld
.import WriteTopStatusLine
.import WriteBottomStatusLine
.import GetAreaPalette
.import GetBackgroundColor
.import EndAreaPoints
.import JumpEngine
.import Square2SfxHandler
.import PrintStatusBarNumbers
.import DiskIDString
.import EnemyGfxHandler
.import SoundEngine
.import DiskScreen
.import WaitForEject
.import WaitForReinsert
.import ResetDiskVars
.import DiskErrorHandler
.import AttractModeSubs
.import SoundEngineJSRCode
.import InitScreenPalette

; exports to other files
.export EraseLivesLines
.export RunMushroomRetainers
.export EndingDiskRoutines
.export AwardExtraLives
.export PrintVictoryMsgsForWorld8
.export FadeToBlue
.export ScreenSubsForFinalRoom
.export WriteNameToVictoryMsg
.export UnusedAttribData
.export FinalRoomPalette
.export ThankYouMessageFinal
.export PeaceIsPavedMsg
.export WithKingdomSavedMsg
.export HurrahMsg
.export OurOnlyHeroMsg
.export ThisEndsYourTripMsg
.export OfALongFriendshipMsg
.export PointsAddedMsg
.export ForEachPlayerLeftMsg
.export PrincessPeachsRoom
.export FantasyWorld9Msg
.export SuperPlayerMsg
.export E_CastleArea9
.export E_CastleArea10
.export E_GroundArea25
.export E_GroundArea26
.export E_GroundArea27
.export E_WaterArea6
.export E_WaterArea7
.export E_WaterArea8
.export L_CastleArea9
.export L_CastleArea10
.export L_GroundArea25
.export L_GroundArea26
.export L_GroundArea27
.export L_WaterArea6
.export L_WaterArea7
.export L_WaterArea8

;-------------------------------------------------------------------------------------

PrintWorld9Msgs:
       lda OperMode              ;if in game over mode, branch
       cmp #GameOverMode         ;note this routine only runs after world 8 and replaces
       beq W9GameOver            ;the routine DemoReset in memory
       lda FantasyW9MsgFlag      ;if world 9 flag was set earlier, skip this part
       bne NoFW9
       lda #$1d                  ;otherwise set VRAM pointer to print
       sta VRAM_Buffer_AddrCtrl  ;the hidden fantasy "9 world" message
       lda #$10
       sta ScreenTimer
       inc FantasyW9MsgFlag      ;and set flag to keep it from getting printed again
NoFW9: lda #$00
       sta DisableScreenFlag     ;turn screen back on, move on to next screen sub
       jmp NextScreenTask

W9GameOver:
    lda #$20
    sta ScreenTimer
    lda #$1e                  ;set VRAM pointer to print world 9 goodbye message
    sta VRAM_Buffer_AddrCtrl
    jmp NextOperTask          ;move on to next task

ScreenSubsForFinalRoom:
    lda ScreenRoutineTask
    jsr JumpEngine

    .word InitScreenPalette
    .word WriteTopStatusLine
    .word WriteBottomStatusLine
    .word DrawFinalRoom
    .word GetAreaPalette
    .word GetBackgroundColor
    .word RevealPrincess

DrawFinalRoom:
    lda #$1b                   ;draw the princess's room
    sta VRAM_Buffer_AddrCtrl
    sta IRQUpdateFlag
NextScreenTask:
    inc ScreenRoutineTask
    rts

RevealPrincess:
    lda #$a2                   ;print game timer
    jsr PrintStatusBarNumbers
    lda #>AlternateSoundEngine
    sta SoundEngineJSRCode+2      ;change sound engine address
    lda #<AlternateSoundEngine ;to run the alt music engine on every NMI
    sta SoundEngineJSRCode+1
    lda #$01
    sta AreaMusicQueue         ;play the only song available to it
    lda #$00                   ;aka the victory music
    sta $0c                    ;residual, this does nothing
    sta NameTableSelect
    sta IRQUpdateFlag          ;turn screen back on but without IRQs
    sta DisableScreenFlag
NextOperTask:
    inc OperMode_Task
    rts

PrintVictoryMsgsForWorld8:
         lda MsgFractional          ;if fractional not looped to zero
         bne IncVMC                 ;then branch to increment it
         ldy MsgCounter
         cpy #$0a                   ;if message counter gone past a certain
         bcs EndVictoryMessages     ;point, branch to set timer and stop printing messages
         iny
         iny
         iny                        ;add 3 to message counter to print the messages
         cpy #$05                   ;for world 8 (as opposed to worlds 1-7)
         bne PrintVM
         lda #VictoryMusic          ;residual code from original smb source, this will not
         sta EventMusicQueue        ;be checked due to alternate vector for sound engine
PrintVM: tya
         clc
         adc #$0c                   ;get appropriate range for victory messages
         sta VRAM_Buffer_AddrCtrl
IncVMC:  lda MsgFractional
         clc
         adc #$04                   ;add four to counter's fractional
         sta MsgFractional
         lda MsgCounter             ;add carry to the message counter itself
         adc #$00
         sta MsgCounter
         rts

EndVictoryMessages:
        lda #$0c                   ;set interval timer, then move onto next task
        sta WorldEndTimer
ExAEL:  inc OperMode_Task

EraseEndingCounters:
        lda #$00
        sta EndControlCntr
        sta MRetainerOffset
        sta CurrentFlashMRet
NotYet: rts

AwardExtraLives:
    lda WorldEndTimer          ;wait until timer expires before running this sub
    bne NotYet
    lda NumberofLives          ;if counted all extra lives, branch
    bmi ExAEL                  ;to run another task in victory mode
    lda SelectTimer
    bne NotYet                 ;if short delay between each count of extra lives
    lda #$30                   ;not expired, wait, otherwise, reset the timer
    sta SelectTimer
    lda #Sfx_ExtraLife
    sta Square2SoundQueue
    dec NumberofLives          ;count down each extra life
    lda #$01                   ;give 100,000 points to player for each one
    sta DigitModifier+1
    jmp EndAreaPoints

BlueTransPalette:
    .byte $3f, $00, $10
    .byte $0f, $30, $0f, $0f, $0f, $30, $10, $00, $0f, $21, $12, $21, $0f, $27, $17, $00
    .byte $00

BlueTints:
    .byte $01, $02, $11, $21

TwoBlankRows:
    .byte $22, $86, $55, $24
    .byte $22, $a6, $55, $24
    .byte $00

FadeToBlue:
          inc EndControlCntr   ;increment a counter
          lda BlueDelayFlag    ;if it's time to fade to blue, branch
          bne BlueUpdateTiming
          lda EndControlCntr
          and #$ff             ;otherwise wait until counter wraps
          bne ExFade           ;then set the flag
          inc BlueDelayFlag
          jmp BlueUpd          ;skip over next part if the flag was just set

BlueUpdateTiming:
           lda EndControlCntr
           and #$0f               ;execute the next part only every 16 frames
           bne ExFade
BlueUpd:   ldx #$13
BlueULoop: lda BlueTransPalette,x ;write palette to VRAM buffer
           sta VRAM_Buffer1,x
           dex
           bpl BlueULoop
           ldx #$0c 
           ldy BlueColorOfs       ;get color offset
NextBlue:  lda BlueTints,y        ;set background color based on color offset
           sta VRAM_Buffer1+3,x
           dex                    ;be sure to set the same background color
           dex                    ;in all four palettes (even though only the first
           dex                    ;one is acknowledged)
           dex
           bpl NextBlue
           inc BlueColorOfs       ;increment to next color which will show up
           lda BlueColorOfs       ;16 frames later, thus causing a slow color change
           cmp #$04               ;if not changed to last color, leave
           bne ExFade
           inc OperMode_Task      ;otherwise move on to the next task
ExFade:    rts

EraseLivesLines:
     ldx #$08                  ;erase bottom two lines
ELL: lda TwoBlankRows,x
     sta VRAM_Buffer1,x
     dex
     bpl ELL
     inc OperMode_Task
     jsr EraseEndingCounters   ;init ending counters
     lda #$60
     sta MushroomRetDelay      ;wait before flashing each mushroom retainer in next sub
     rts
    
RunMushroomRetainers:
       jsr MushroomRetainersForW8  ;draw and flash the seven mushroom retainers
       lda AltMusicBuffer          ;if still playing victory music, branch to leave
       bne ExRMR
       lda HardWorldFlag           ;if on world D, branch elsewhere
       bne BackToNormal
       inc OperMode_Task           ;otherwise just move onto the last task
ExRMR: rts

EndingDiskRoutines:
    lda DiskIOTask
    jsr JumpEngine

    .word DiskScreen
    .word UpdateGamesBeaten
    .word WaitForEject
    .word WaitForReinsert
    .word ResetDiskVars

SaveFileHeader:
    .byte $0f, "SM2SAVE "
    .word $d29f
    .byte $01, $00, $00
    .word $d29f
    .byte $00

UpdateGamesBeaten:
    lda #$07               ;set file sequential position
    jsr FDSBIOS_WRITEFILE  ;save number of games beaten to SM2SAVE
    .word DiskIDString
    .word SaveFileHeader

;execution continues here
    beq BackToNormal       ;if no error, continue
    inc DiskIOTask         ;otherwise move on to next disk task
    jmp DiskErrorHandler   ;and jump to disk error handler

BackToNormal:
    lda #>SoundEngine        ;reset sound engine vector
    sta SoundEngineJSRCode+2  ;to run the original one
    lda #<SoundEngine
    sta SoundEngineJSRCode+1
    lda #$00
    sta DiskIOTask           ;erase task numbers
    sta OperMode_Task
    lda HardWorldFlag        ;if in world D, branch to end the game
    bne EndTheGame
    lda CompletedWorlds      ;if completed all worlds without skipping over any
    cmp #$ff                 ;then branch elsewhere (note warping backwards may
    beq GoToWorld9           ;allow player to complete skipped worlds)
EndTheGame:
    lda #$00
    sta CompletedWorlds      ;init completed worlds flag, go back to title screen mode
    sta OperMode
    jmp AttractModeSubs      ;jump to title screen mode routines
GoToWorld9:
    lda #$00
    sta CompletedWorlds      ;init completed worlds flag
    sta NumberofLives        ;give the player one life
    sta FantasyW9MsgFlag
    jmp NextWorld            ;run world 9

FlashMRSpriteDataOfs:
    .byte $50, $b0, $e0, $68, $98, $c8

MRSpriteDataOfs:
    .byte $80, $50, $68, $80, $98, $b0, $c8

MRetainerYPos:
    .byte $e0, $b8, $90, $70, $68, $70, $90

MRetainerXPos:
    .byte $b8, $38, $48, $60, $80, $a0, $b8, $c8

MushroomRetainersForW8:
    lda MushroomRetDelay        ;wait a bit unless waiting is already done
    beq DrawFlashMRetainers
    dec MushroomRetDelay
    rts

DrawFlashMRetainers:
    jsr MoveSpritesOffscreen   ;init sprites
    ldx MRetainerOffset
    cpx #$07                   ;if 7 mushroom retainers added, branch elsewhere
    beq FlashMRetainers
    lda EndControlCntr
    and #$1f                   ;execute this part once every 32 frames
    bne DrawMRetainers
    inc MRetainerOffset        ;add another mushroom retainer
    lda #Sfx_CoinGrab
    sta Square2SoundQueue      ;play the coin grab sound
    jmp DrawMRetainers

FlashMRetainers:
    lda EndControlCntr
    and #$1f                   ;execute this part once every 32 frames also
    bne DrawMRetainers         ;after the counter reaches a certain point
    inc CurrentFlashMRet
    lda CurrentFlashMRet       ;increment what's now being used to select a
    cmp #$0b                   ;mushroom retainer to flash, if not yet at $0b/11
    bcc DrawMRetainers         ;then go ahead to next part
    lda #$04
    sta CurrentFlashMRet       ;otherwise reset to 4
DrawMRetainers:
    inc EndControlCntr         ;be sure to count frames
    lda WorldNumber
    pha                        ;save world number and initial retainer offset
    lda MRetainerOffset
    pha
    tax                        ;use second counter as offset to one of the spr data offset lists
DrawMRetLoop:
    lda CurrentFlashMRet       ;if offset not yet at 4 (first time it starts at 0), branch to skip this
    cmp #$04                   ;thus adding a delay between the appearance
    bcc SetupMRet              ;of mushroom retainers and their "flashing"
    sbc #$04
    tay                        ;otherwise subtract 4 to get the offset proper
    lda FlashMRSpriteDataOfs,y ;if the sprite obj data offset pointed at by the current flashing retainer
    cmp MRSpriteDataOfs,x      ;matches the one pointed at by the offset of the retainer being checked
    beq NextMRet               ;then branch to skip, do not draw that mushroom retainer
SetupMRet:
    ldy MRSpriteDataOfs,x      ;get sprite data offset of the current mushroom retainer
    sty Enemy_SprDataOffset
    lda #$35
    sta $16                    ;set mushroom retainer object ID
    lda MRetainerYPos,x
    sta Enemy_Y_Position       ;use enemy object 0 for mushroom retainer temporarily
    lda MRetainerXPos,x
    sta Enemy_Rel_XPos
    ldx #$00                   ;set world number and object offset for the graphics handler
    stx WorldNumber            ;to prevent graphics handler from drawing princess instead
    stx ObjectOffset
    jsr EnemyGfxHandler        ;now draw the mushroom retainer
NextMRet:
    dec MRetainerOffset        ;move to next mushroom retainer using offset
    ldx MRetainerOffset
    bne DrawMRetLoop           ;if not drawn all retainers yet, loop to do so
    pla
    sta MRetainerOffset        ;reset initial offset
    pla
    sta WorldNumber            ;return world number to what it was to draw princess
    lda #$30
    sta Enemy_SprDataOffset
    lda #$b8                   ;return original settings princess uses (note X position
    sta Enemy_Y_Position       ;will be returned later in enemy object core)
    rts

EndPlayerNameData:
    .byte $16, $0a, $1b, $12, $18
    .byte $15, $1e, $12, $10, $12

WriteNameToVictoryMsg:
        lda #$00
        sta ScreenRoutineTask    ;init screen routine task
        ldx #$04
        lda SelectedPlayer       ;check selected player
        beq SNameL               ;if mario, use by default
        ldx #$09                 ;otherwise use luigi's name
SNameL: ldy #$04
VMsgNL: lda EndPlayerNameData,x
        sta ThankYouMessageFinal+13,y  ;overwrite name of player in two
        sta HurrahMsg+14,y             ;of the victory messages
        dex
        dey
        bpl VMsgNL
        rts

;-------------------------------------------------------------------------------------

UnusedAttribData:
    .byte $23, $c0, $48, $55
    .byte $23, $c2, $01, $d5
    .byte $00

FinalRoomPalette:
    .byte $3f, $00, $10
    .byte $0f, $0f, $0f, $0f, $0f, $30, $10, $00
    .byte $0f, $21, $12, $02, $0f, $27, $17, $00
    .byte $00

ThankYouMessageFinal:
    .byte $20, $e8, $10
    .byte $1d, $11, $0a, $17, $14, $24, $22, $18, $1e, $24
    .byte $16, $0a, $1b, $12, $18, $2b

    .byte $23, $c8, $48, $05
    .byte $00

PeaceIsPavedMsg:
    .byte $21, $09, $0e
    .byte $19, $0e, $0a, $0c, $0e, $24, $12, $1c, $24
    .byte $19, $0a, $1f, $0e, $0d
    .byte $23, $d0, $58, $aa
    .byte $00

WithKingdomSavedMsg:
    .byte $21, $47, $12
    .byte $20, $12, $1d, $11, $24, $14, $12, $17, $10, $0d, $18, $16, $24
    .byte $1c, $0a, $1f, $0e, $0d
    .byte $00

HurrahMsg:
    .byte $21, $89, $10
    .byte $11, $1e, $1b, $1b, $0a, $11, $24, $1d, $18, $24, $24, $16, $0a
    .byte $1b, $12, $18
    .byte $00

OurOnlyHeroMsg:
    .byte $21, $ca, $0d
    .byte $18, $1e, $1b, $24, $18, $17, $15, $22, $24, $11, $0e, $1b, $18
    .byte $00

ThisEndsYourTripMsg:
    .byte $22, $07, $13
    .byte $1d, $11, $12, $1c, $24, $0e, $17, $0d, $1c, $24, $22, $18, $1e
    .byte $1b, $24, $1d, $1b, $12, $19
    .byte $00

OfALongFriendshipMsg:
    .byte $22, $46, $14
    .byte $18, $0f, $24, $0a, $24, $15, $18, $17, $10, $24, $0f, $1b, $12
    .byte $0e, $17, $0d, $1c, $11, $12, $19
    .byte $00

PointsAddedMsg:
    .byte $22, $88, $10
    .byte $01, $00, $00, $00, $00, $00, $24, $19, $1d, $1c, $af, $0a, $0d
    .byte $0d, $0e, $0d

    .byte $23, $e8, $48, $ff
    .byte $00
    
ForEachPlayerLeftMsg:
    .byte $22, $a6, $15
    .byte $0f, $18, $1b, $24, $0e, $0a, $0c, $11, $24, $19, $15, $0a, $22
    .byte $0e, $1b, $24, $15, $0e, $0f, $1d, $af
    .byte $00

PrincessPeachsRoom:
    .byte $20, $80, $60, $5e
    .byte $20, $a0, $60, $5d
    .byte $23, $40, $60, $5e
    .byte $23, $60, $60, $5d
    .byte $23, $80, $60, $5e
    .byte $23, $a0, $60, $5d
    .byte $23, $c0, $50, $55
    .byte $23, $f0, $50, $55
    .byte $00

FantasyWorld9Msg:
    .byte $22, $24, $18
    .byte $20, $0e, $24, $19, $1b, $0e, $1c, $0e, $17, $1d, $24, $0f, $0a
    .byte $17, $1d, $0a, $1c, $22, $24, $20, $18, $1b, $15, $0d

    .byte $22, $66, $13
    .byte $15, $0e, $1d, $f2, $1c, $24, $1d, $1b, $22, $24, $76, $09, $24
    .byte $20, $18, $1b, $15, $0d, $75

    .byte $22, $a9, $0e
    .byte $20, $12, $1d, $11, $24, $18, $17, $0e, $24, $10, $0a, $16, $0e
    .byte $af
    .byte $00

SuperPlayerMsg:
    .byte $21, $e0, $60, $24
    .byte $22, $40, $60, $24
    .byte $22, $25, $16
    .byte $22, $18, $1e, $f2, $1b, $0e, $24, $0a, $24, $1c, $1e, $19, $0e
    .byte $1b, $24, $19, $15, $0a, $22, $0e, $1b, $2b
    .byte $22, $69, $0d
    .byte $20, $0e, $24, $11, $18, $19, $0e, $24, $20, $0e, $f2, $15, $15
    .byte $22, $a9, $0e
    .byte $1c, $0e, $0e, $24, $22, $18, $1e, $24, $0a, $10, $0a, $12, $17
    .byte $af
    .byte $22, $e8, $10
    .byte $16, $0a, $1b, $12, $18, $24, $0a, $17, $0d, $24, $1c, $1d, $0a
    .byte $0f, $0f, $af
    .byte $00

;-------------------------------------------------------------------------------------

; unused space
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

;level 9-3
E_CastleArea9:
    .byte $1f, $01, $0e, $69, $00, $1f, $0b, $78, $2d, $ff

;cloud level used in level 9-3
E_CastleArea10:
    .byte $1f, $01, $1e, $68, $06, $ff

;level 9-1 starting area
E_GroundArea25:
    .byte $1e, $05, $00, $ff

;two unused levels that have the same enemy data address as a used level
E_GroundArea26:
E_GroundArea27:

;level 9-1 water area
E_WaterArea6:
    .byte $26, $8f, $05, $ac, $46, $0f, $1f, $04, $e8, $10, $38, $90, $66, $11, $fb, $3c
    .byte $9b, $b7, $cb, $85, $29, $87, $95, $07, $eb, $02, $0b, $82, $96, $0e, $c3, $0e
    .byte $ff

;level 9-2
E_WaterArea7:
    .byte $1f, $01, $e6, $11, $ff

;level 9-4
E_WaterArea8:
    .byte $3b, $86, $7b, $00, $bb, $02, $2b, $8e, $7a, $05, $57, $87, $27, $8f, $9a, $0c
    .byte $ff

;level 9-3
L_CastleArea9:
    .byte $55, $31, $0d, $01, $cf, $33, $fe, $39, $fe, $b2, $2e, $be, $fe, $31, $29, $8f
    .byte $9e, $43, $fe, $30, $16, $b1, $23, $09, $4e, $31, $4e, $40, $d7, $e0, $e6, $61
    .byte $fe, $3e, $f5, $62, $fa, $60, $0c, $df, $0c, $df, $0c, $d1, $1e, $3c, $2d, $40
    .byte $4e, $32, $5e, $36, $5e, $42, $ce, $38, $0d, $0b, $8e, $36, $8e, $40, $87, $37
    .byte $96, $36, $be, $3a, $cc, $5d, $06, $bd, $07, $3e, $a8, $64, $b8, $64, $c8, $64
    .byte $d8, $64, $e8, $64, $f8, $64, $fe, $31, $09, $e1, $1a, $60, $6d, $41, $9f, $26
    .byte $7d, $c7, $fd

;cloud level used by level 9-3
L_CastleArea10:
    .byte $00, $f1, $fe, $b5, $0d, $02, $fe, $34, $07, $cf, $ce, $00, $0d, $05, $8d, $47
    .byte $fd

;level 9-1 starting area
L_GroundArea25:
    .byte $50, $02, $9f, $38, $ee, $01, $12, $b9, $77, $7b, $de, $0f, $6d, $c7, $fd

;two unused levels
L_GroundArea26:
    .byte $fd
L_GroundArea27:
    .byte $fd

;level 9-1 water area
L_WaterArea6:
    .byte $00, $a1, $0a, $60, $19, $61, $28, $62, $39, $71, $58, $62, $69, $61, $7a, $60
    .byte $7c, $f5, $a5, $11, $fe, $20, $1f, $80, $5e, $21, $80, $3f, $8f, $65, $d6, $74
    .byte $5e, $a0, $6f, $66, $9e, $21, $c3, $37, $47, $f3, $9e, $20, $fe, $21, $0d, $06
    .byte $57, $32, $64, $11, $66, $10, $83, $a7, $87, $27, $0d, $09, $1d, $4a, $5f, $38
    .byte $6d, $c1, $af, $26, $6d, $c7, $fd

;level 9-2
L_WaterArea7:
    .byte $50, $11, $d7, $73, $fe, $1a, $6f, $e2, $1f, $e5, $bf, $63, $c7, $a8, $df, $61
    .byte $15, $f1, $7f, $62, $9b, $2f, $a8, $72, $fe, $10, $69, $f1, $b7, $25, $c5, $71
    .byte $33, $ac, $5f, $71, $8d, $4a, $aa, $14, $d1, $71, $17, $95, $26, $42, $72, $42
    .byte $73, $12, $7a, $14, $c6, $14, $d5, $42, $fe, $11, $7f, $b8, $8d, $c1, $cf, $26
    .byte $6d, $c7, $fd

;level 9-4
L_WaterArea8:
    .byte $57, $00, $0b, $3f, $0b, $bf, $0b, $bf, $73, $36, $9a, $30, $a5, $64, $b6, $31
    .byte $d4, $61, $0b, $bf, $13, $63, $4a, $60, $53, $66, $a5, $34, $b3, $67, $e5, $65
    .byte $f4, $60, $0b, $bf, $14, $60, $53, $67, $67, $32, $c4, $62, $d4, $31, $f3, $61
    .byte $fa, $60, $0b, $bf, $04, $30, $09, $61, $14, $65, $63, $65, $6a, $60, $0b, $bf
    .byte $0f, $38, $0b, $bf, $1d, $41, $3e, $42, $5f, $20, $ce, $40, $0b, $bf, $3d, $47
    .byte $fd

;-------------------------------------------------------------------------------------

; unused space

.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

AlternateSoundEngine:
    lda GamePauseStatus     ;check to see if game is paused
    beq RunAltSoundRoutines ;branch to play sfx and music if not
    lda #$80
    sta FDSSND_VOLUMECTRL   ;otherwise, silence everything
    lsr
    sta SND_MASTERCTRL_REG
    rts

RunAltSoundRoutines:
    lda #$ff                ;disable irqs from apu and set frame counter mode
    sta JOYPAD_PORT2
    lda #$0f
    sta SND_MASTERCTRL_REG  ;enable first four channels
    jsr Square2SfxHandler   ;play sfx on square channel 2
    jsr AltMusicHandler
    lda #$00
    sta AreaMusicQueue
    sta Square2SoundQueue
    rts

ContinueMusic:
    jmp HandleSquare2Music

AltMusicHandler:
    lda AreaMusicQueue
    bne PlayMusic
    lda AltMusicBuffer
    bne ContinueMusic
    rts

PlayMusic:
    ldy #$00                ;init song pattern number
    sty PatternNumber
    sta AltMusicBuffer      ;dump queue contents into buffer
NextPattern:
    inc PatternNumber
    ldy PatternNumber
    cpy #$0c
    bne LoadPatternHeader
    jmp StopMusic

LoadPatternHeader:
    lda MusicHeaderOffsetData-1,y  ;load pattern header offset using an address
    tay                            ;one byte behind (because Y starts at 1)
    lda MusicHeaderData-$b,y                    
    sta NoteLengthTblAdder
    lda MusicHeaderData-$a,y       ;now load the pattern header data using addresses
    sta MusicDataLow               ;that are relative of where the offset data is
    lda MusicHeaderData-9,y        ;plus the offset data itself that was loaded
    sta MusicDataHigh
    lda MusicHeaderData-8,y
    sta MusicOffset_Triangle
    lda MusicHeaderData-7,y
    sta MusicOffset_Square1
    lda MusicHeaderData-6,y
    sta MusicOffset_Noise
    sta NoiseDataLoopbackOfs
    lda MusicHeaderData-5,y
    sta MusicOffset_FDSSND
    lda MusicHeaderData-4,y
    sta WaveformID                 ;value here is not used, but retained (probably for testing)
    sta $01
    jsr ProcessWaveformData
    lda #$01                       ;init note length counters
    sta Squ2_NoteLenCounter
    sta Squ1_NoteLenCounter
    sta Tri_NoteLenCounter
    sta Noise_BeatLenCounter
    sta FDSSND_LenCounter
    lda #$00
    sta MusicOffset_Square2
    lda #$0b
    sta SND_MASTERCTRL_REG         ;disable and reenable triangle channel
    lda #$0f
    sta SND_MASTERCTRL_REG

HandleSquare2Music:
    dec Squ2_NoteLenCounter   ;if note length not expired, skip ahead to envelope
    bne MiscSqu2MusicTasks
    ldy MusicOffset_Square2
    inc MusicOffset_Square2   ;get next byte in music data
    lda (MusicData),y
    beq EndPattern            ;if end terminator, branch to play the next pattern or stop
    bpl Squ2NoteHandler       ;if positive, data is note, branch to play it
    bne Squ2LengthHandler     ;otherwise data is length, branch to process length
EndPattern:
    lda AltMusicBuffer        ;if music buffer still set, branch
    bne NextPatternJump
StopMusic:
    lda #$00                  ;otherwise init sound and sound related variables
    sta AltMusicBuffer        ;to silence everything
    sta SND_TRIANGLE_REG
    sta MusicDataHigh
    sta MusicDataLow
    sta MusicOffset_Square2
    sta MusicOffset_Square1
    sta MusicOffset_Triangle
    sta MusicOffset_Noise
    lda #$90
    sta SND_SQUARE1_REG
    sta SND_SQUARE2_REG
    lda #$80
    sta FDSSND_VOLUMECTRL
    rts

NextPatternJump:
    jmp NextPattern

Squ2LengthHandler:
    jsr ProcessLengthData     ;store length of note
    sta Squ2_NoteLenBuffer
    ldy MusicOffset_Square2
    inc MusicOffset_Square2   ;fetch another byte (MUST NOT BE LENGTH BYTE!)
    lda (MusicData),y

Squ2NoteHandler:
    ldx Square2SoundBuffer    ;if playing sound on square 2 channel, skip
    bne SkipFqL1
    jsr SetFreq_Squ2          ;otherwise play a note on square 2
    beq Rest
    lda #$10                  ;set envelope counter and regs for square 2
    ldx #$82
    ldy #$7f
Rest:
    sta Squ2_EnvelopeDataCtrl
    jsr Dump_Sq2_Regs
SkipFqL1:
    lda Squ2_NoteLenBuffer    ;save length to counter
    sta Squ2_NoteLenCounter

MiscSqu2MusicTasks:
    lda Square2SoundBuffer    ;if playing sound on square 2 channel, skip
    bne HandleSquare1Music
    ldy Squ2_EnvelopeDataCtrl ;get envelope counter
    beq NoDecEnv1             ;use to update envelope on square 2 unless expired
    dec Squ2_EnvelopeDataCtrl
NoDecEnv1:
    lda VictoryMusEnvData,y
    sta SND_SQUARE2_REG

HandleSquare1Music:
    ldy MusicOffset_Square1   ;get offset, skip if none was ever loaded
    beq HandleTriangleMusic
    dec Squ1_NoteLenCounter   ;if note length not expired, skip ahead to envelope
    bne MiscSqu1MusicTasks
    ldy MusicOffset_Square1
    inc MusicOffset_Square1
    lda (MusicData),y         ;get note and encoded length
    jsr LengthDecoder         ;decode it
    sta Squ1_NoteLenCounter   ;save length
    txa
    and #$3e
    jsr SetFreq_Squ1          ;play a note on square 1
    beq SkipCtrlL
    lda #$10                  ;set envelope counter and regs for square 1
    ldx #$82
    ldy #$7f
SkipCtrlL:
    sta Squ1_EnvelopeDataCtrl              
    jsr Dump_Squ1_Regs
MiscSqu1MusicTasks:
    ldy Squ1_EnvelopeDataCtrl ;get envelope counter
    beq NoDecEnv2             ;use to update envelope on square 1
    dec Squ1_EnvelopeDataCtrl
NoDecEnv2:
    lda VictoryMusEnvData,y
    sta SND_SQUARE1_REG
    lda #$7f
    sta SND_SQUARE1_REG+1

HandleTriangleMusic:
    lda MusicOffset_Triangle  ;get offset, skip if none was ever loaded
    beq HandleFDSMusic
    dec Tri_NoteLenCounter    ;if note length not expired, skip ahead
    bne HandleFDSMusic
    ldy MusicOffset_Triangle
    inc MusicOffset_Triangle  ;get next byte in music data
    lda (MusicData),y
    beq LoadTriCtrlReg        ;if zero, skip all this and move on to the FDS channel
    bpl TriNoteHandler        ;if positive, branch to process note
    jsr ProcessLengthData     ;otherwise process length
    sta Tri_NoteLenBuffer
    ldy MusicOffset_Triangle
    inc MusicOffset_Triangle  ;get next byte in music data (must not be length byte!)
    lda (MusicData),y
    beq LoadTriCtrlReg        ;if zero, skip, as before
TriNoteHandler:
    jsr SetFreq_Tri           ;play a note on triangle
    ldx Tri_NoteLenBuffer
    stx Tri_NoteLenCounter    ;save length to counter
    txa
    cmp #$12                  ;if playing a note longer than 12 frames, 
    bcs LongN                 ;branch to set triangle reg to $ff
    lda #$18
    bne LoadTriCtrlReg        ;otherwise set triangle reg to $18 for short notes
LongN:
    lda #$ff
LoadTriCtrlReg:
    sta SND_TRIANGLE_REG

HandleFDSMusic:
    lda MusicOffset_FDSSND       ;if no offset loaded, skip to handle noise channel
    bne CheckForCutoff
    jmp HandleNoiseMusic

CheckForCutoff:
    lda FDSSND_LenCounter        ;check to see if length at specific point in note
    cmp #$02                     ;if not, skip this part
    bne RunFDSChannel
    lda #$00                     ;otherwise perform note cutoff
    sta FDSSND_VOLUMECTRL
RunFDSChannel:
    dec FDSSND_LenCounter        ;if length not expired, skip ahead
    bne FDSSND_EnvModRun
    ldy MusicOffset_FDSSND
    inc MusicOffset_FDSSND       ;get next byte in music data
    lda (MusicData),y
    bpl FDSSND_NoteHandler       ;if positive, branch to process note
    jsr ProcessLengthData        ;otherwise process length
    sta FDSSND_LenBuffer
    ldy MusicOffset_FDSSND
    inc MusicOffset_FDSSND       ;get next byte in music data (must not be length byte!)
    lda (MusicData),y
FDSSND_NoteHandler:
    jsr SetFreq_FDS              ;play a note on the FDS channel
    tay
    bne FDSSND_EnvModStart       ;if frequency high was nonzero, branch
    ldx #$80
    stx FDSSND_VOLUMECTRL        ;otherwise play a rest, use zero from frequency low data
    bne InitialEnvData           ;to be loaded into envelope timer
FDSSND_EnvModStart:
    jsr GetModulationTable       ;reload modulation table
    ldy FDSSND_MasterEnvSet
InitialEnvData:
    sty FDSSND_MasterEnvTimer    ;dump value from header data or zero if rest
    ldy #$00                     ;as value into the timer
    sty FDSSND_VolumeEnvOffset   ;init envelope and sweep counter offsets
    sty FDSSND_SweepModOffset
    lda (FDSSND_VolumeEnvData),y ;get volume and sweep envelope data for the start of the note
    sta FDSSND_VOLUMECTRL
    lda (FDSSND_SweepModData),y
    sta FDSSND_SWEEPCTRL
    lda #$00
    sta FDSSND_SWEEPBIAS         ;set no sweep bias
    iny
    lda (FDSSND_VolumeEnvData),y ;get timing for volume and sweep envelopes
    sta FDSSND_VolumeEnvTimer
    lda (FDSSND_SweepModData),y
    sta FDSSND_SweepModTimer
    sty FDSSND_VolumeEnvOffset   ;set current offset
    sty FDSSND_SweepModOffset
    lda FDSSND_LenBuffer
    sta FDSSND_LenCounter        ;dump length of note
FDSSND_EnvModRun:
    lda FDSSND_MasterEnvTimer    ;get master counter, skip over this if at zero
    beq HandleNoiseMusic
    dec FDSSND_MasterEnvTimer    ;decrement the master counter
    dec FDSSND_VolumeEnvTimer    ;if envelope counter not expired, branch to skip this
    bne SweepModCtrl
VolumeEnvCtrl:
    inc FDSSND_VolumeEnvOffset
    ldy FDSSND_VolumeEnvOffset   ;get next byte of data
    lda (FDSSND_VolumeEnvData),y ;if positive, write and continue
    bpl VolumeEnvTiming
    sta FDSSND_VOLUMECTRL        ;otherwise, write and loop to get another byte
    bne VolumeEnvCtrl
VolumeEnvTiming:
    sta FDSSND_VOLUMECTRL        ;write to control the envelope of FDS channel
    iny
    lda (FDSSND_VolumeEnvData),y ;get another byte of data, set counter
    sta FDSSND_VolumeEnvTimer
    sty FDSSND_VolumeEnvOffset   ;save offset for later
SweepModCtrl:
    dec FDSSND_SweepModTimer
    bne HandleNoiseMusic         ;decrement sweep/modulation counter, skip if not expired
    inc FDSSND_SweepModOffset
    ldy FDSSND_SweepModOffset    ;get some more data
    lda (FDSSND_SweepModData),y  ;save to sweep control, and mod frequency low and high
    sta FDSSND_SWEEPCTRL
    iny
    lda (FDSSND_SweepModData),y
    sta FDSSND_MODFREQLOW
    iny
    lda (FDSSND_SweepModData),y
    sta FDSSND_MODFREQHIGH
    iny
    lda (FDSSND_SweepModData),y  ;get another byte of data, set counter
    sta FDSSND_SweepModTimer
    sty FDSSND_SweepModOffset    ;save offset for later

HandleNoiseMusic:
    dec Noise_BeatLenCounter     ;if length not expired, branch to leave
    bne ExitMusicHandler
FetchNoiseBeatData:
    ldy MusicOffset_Noise
    inc MusicOffset_Noise        ;get next byte in beat data
    lda (MusicData),y
    bne ProcBeatData             ;if nonzero, branch to process beat data
    lda NoiseDataLoopbackOfs
    sta MusicOffset_Noise        ;otherwise zero is loop, dump offset to loop
    bne FetchNoiseBeatData       ;the pattern and loop back, refetch data
ProcBeatData:
    jsr LengthDecoder            ;decode length and save it
    sta Noise_BeatLenCounter
    txa
    and #$3e                     ;get beat data
    beq PlayBeat                 ;if none, branch to play silent beat
    lda #$1c
    ldx #$03                     ;otherwise play only one kind of beat
    ldy #$18
PlayBeat:
    sta SND_NOISE_REG
    stx SND_NOISE_REG+2          ;dump to noise regs
    sty SND_NOISE_REG+3
ExitMusicHandler:
    rts

ProcessWaveformData:
    lda $01                ;if last value in header was set to zero, leave
    bne GetWaveformHeader  ;otherwise, use to load header for waveform
    rts                    ;and data for the envelope and modulation

GetWaveformHeader:
    ldy #$00
FindHeader:
    iny
    lsr                           ;increment offset for every clear bit in value loaded
    bcc FindHeader
    lda WaveformHeaderOffsets-1,y ;get offset to header
    tay
    lda WaveformHeaderData-2,y
    sta WaveformData              ;get header
    lda WaveformHeaderData-1,y
    sta WaveformData+1
    lda WaveformHeaderData,y
    sta FDSSND_MasterEnvSet
    lda WaveformHeaderData+1,y
    sta FDSSND_VolumeEnvData
    lda WaveformHeaderData+2,y
    sta FDSSND_VolumeEnvData+1
    lda WaveformHeaderData+3,y
    sta FDSSND_SweepModData
    lda WaveformHeaderData+4,y
    sta FDSSND_SweepModData+1
    lda WaveformHeaderData+5,y
    sta FDSSND_ModTableNumber
    jsr GetWaveformData
    lda #$02                      ;set volume, overwriting the setting from sub
    sta FDSSND_WAVEENABLEWR       ;that just got returned from
    rts

GetWaveformData:
          lda #$80                ;enable writes to FDS waveform RAM
          sta FDSSND_WAVEENABLEWR
          lda #$00                ;init first byte of it
          sta FDSSND_WAVERAM
          ldy #$00
          ldx #$3f
GWDLoop:  lda (WaveformData),y    ;write each byte of data to the waveform RAM
          sta FDSSND_WAVERAM+1,y  ;both from start to middle and from end to middle
          iny                     ;so that the data eventually converge and mirror
          cpy #$20
          beq SetWMVol
          sta FDSSND_WAVERAM,x
          dex
          bne GWDLoop
SetWMVol: lda AltMusicBuffer      ;if d6 was clear, branch to lower the volume
          and #$40                ;otherwise set for full volume
          beq LowV
          lda #$00                ;this may have been used once for testing but is
          beq FullV               ;irrelevant now because the setting is overwritten
LowV:     lda #$03
FullV:    sta FDSSND_WAVEENABLEWR ;then fall through to next routine

GetModulationTable:
         lda #$80                  ;disable modulation
         sta FDSSND_MODFREQHIGH
         lda #$00
         sta FDSSND_SWEEPBIAS      ;set no sweep bias
         ldx #$20
         ldy FDSSND_ModTableNumber ;get value from header
         sty $02
MTableL: lda $02                   ;divide loaded value by 2, use as counter and offset
         lsr                       ;(original value is * 2 because it shifts LSB for odd/even)
         tay
         lda ModTableData,y        ;get data, use lower nybble on every odd count
         bcs OddT                  ;and the upper nybble on every even count
         lsr
         lsr                       ;otherwise shift upper nybble to use it instead
         lsr
         lsr
OddT:    and #$0f                  ;write to modulation table
         sta FDSSND_MODTBLAPPEND
         inc $02                   ;increment loaded value
         dex
         bne MTableL
         rts

ModTableData:
ModTable1: .byte $07, $07, $07, $07, $01, $01, $01, $01, $01, $01, $01, $01, $07, $07, $07, $07
ModTable2: .byte $77, $77, $77, $77, $11, $11, $11, $11, $11, $11, $11, $11, $77, $77, $77, $77

LengthDecoder:
    tax
    ror
    txa
    rol
    rol
    rol
ProcessLengthData:
    and #$07                     ;save 3 LSB, add to header data loaded earlier
    clc                          ;then use as offset to load note length
    adc NoteLengthTblAdder
    tay
    lda MusicLengthLookupTbl,y
    rts

Dump_Squ1_Regs:
    sty SND_SQUARE1_REG+1    ;set regs for envelope on square 1 channel
    stx SND_SQUARE1_REG
    rts

    jsr Dump_Squ1_Regs       ;dead code, nothing branches here
SetFreq_Squ1:
    ldx #$00
Dump_Freq_Regs:
    tay
    lda FreqRegLookupTbl+1,y
    beq NoTone
    sta SND_REGISTER+2,x
    lda FreqRegLookupTbl,y
    ora #$08
    sta SND_REGISTER+3,x
NoTone:
    rts

Dump_Sq2_Regs:
    stx SND_SQUARE2_REG       ;set regs for envelope on square 2 channel
    sty SND_SQUARE2_REG+1
    rts

    jsr Dump_Sq2_Regs         ;dead code, nothing branches here
SetFreq_Squ2:
    ldx #$04                  ;set frequency regs for square 2 channel to play note
    bne Dump_Freq_Regs
SetFreq_Tri:
    ldx #$08                  ;if branched here, do that for triangle channel
    bne Dump_Freq_Regs
SetFreq_FDS:
    ldx #$80                  ;if branched here, start off by silencing the FDS channel
    stx FDSSND_FREQHIGH
    tay
    lda FDSFreqLookupTbl,y    ;now set the frequency regs for FDS channel
    sta FDSSND_FREQHIGH
    lda FDSFreqLookupTbl+1,y
    sta FDSSND_FREQLOW
    rts

;-------------------------------------------------------------------------------------

MusicHeaderOffsetData:
    .byte VictoryPart1AHdr-MHD, VictoryPart1AHdr-MHD, VictoryPart1BHdr-MHD, VictoryPart1AHdr-MHD
    .byte VictoryPart2AHdr-MHD, VictoryPart2BHdr-MHD, VictoryPart2AHdr-MHD, VictoryPart2BHdr-MHD
    .byte VictoryPart2CHdr-MHD, VictoryPart2AHdr-MHD, VictoryPart2DHdr-MHD

;header format here is as follows: 
;1 byte - length byte offset
;2 bytes - music data address
;1 byte - triangle data offset
;1 byte - square 1 data offset
;1 byte - noise data offset
;these two are unique to the sound engine in this file
;1 byte - FDS channel data offset 
;1 byte - waveform ID

MusicHeaderData:
VictoryPart1AHdr: .byte $00, <VictoryM_P1AData, >VictoryM_P1AData, $3e, $14, $b0, $24, $01
VictoryPart1BHdr: .byte $00, <VictoryM_P1BData, >VictoryM_P1BData, $50, $21, $61, $31, $02
VictoryPart2AHdr: .byte $00, <VictoryM_P2AData, >VictoryM_P2AData, $43, $1c, $b5, $29, $01
VictoryPart2CHdr: .byte $00, <VictoryM_P2CData, >VictoryM_P2CData, $50, $20, $61, $31, $02
VictoryPart2DHdr: .byte $08, <VictoryM_P2DData, >VictoryM_P2DData, $09, $04, $1e, $06, $01
VictoryPart2BHdr: .byte $08, <VictoryM_P2BData, >VictoryM_P2BData, $3a, $10, $9e, $28, $01

;residual data, probably from an old header
    .byte $00, $4b, $d0

;music data format here is the same as in sm2main file
;with a few exceptions: the value $00 does nothing special
;for square 1, and noise data format plays only one kind of
;beat for d5-d1 = nonzero, or rest for d5-d1 = 0

VictoryM_P1AData:
;square 2
    .byte $84, $12, $86, $0c, $84, $62, $10, $86
    .byte $12, $84, $1c, $22, $1e, $22, $26, $18
    .byte $1e, $04, $1c, $00
;square 1
    .byte $e2, $e0, $e2, $9d, $1f, $21, $a3, $2d
    .byte $74, $f4, $31, $35, $37, $2b, $b1, $2d
;FDS sound
    .byte $83, $16, $14, $16, $86, $10, $84, $12
    .byte $14, $86, $16, $84, $20, $81, $28, $83
    .byte $28, $84, $24, $28, $2a, $1e, $86, $24
    .byte $84, $20
;triangle
    .byte $84, $12, $14, $04, $18, $1a, $1c, $14
    .byte $26, $22, $1e, $1c, $18, $1e, $22, $0c
    .byte $14

VictoryM_P1BData:
;square 2
    .byte $81, $22, $83, $22, $86, $24, $85, $18
    .byte $82, $1e, $80, $1e, $83, $1c, $83, $18
    .byte $84, $1c, $81, $26, $83, $26, $86, $26
    .byte $85, $1e, $82, $24, $86, $22, $84, $1e
    .byte $00
;square 1
    .byte $74, $f4, $b5, $6b, $b0, $30, $ec, $ea
    .byte $2d, $76, $f6, $b7, $6d, $b0, $b5, $31
;FDS sound
    .byte $81, $10, $83, $10, $86, $10, $85, $08
    .byte $82, $0c, $80, $0c, $83, $0a, $08, $84
    .byte $0a, $81, $12, $83, $12, $86, $12, $85
    .byte $0a, $82, $0c, $86, $10, $84, $0c
;triangle
    .byte $84, $12, $1c, $20, $24, $2a, $26, $24
    .byte $26, $22, $1e, $22, $24, $1e, $22, $0c
    .byte $1e
;noise (also used by part 1A)
    .byte $11, $11, $d0, $d0, $d0, $11, $00

VictoryM_P2AData:
;square 2
    .byte $83, $2c, $2a, $2c, $86, $26, $84, $28
    .byte $2a, $86, $2c, $84, $36, $81, $40, $83
    .byte $40, $84, $3a, $40, $3e, $34, $00

VictoryM_P2BData:
;square 2
    .byte $86, $3a, $84, $36, $00
;square 1 of part 2A
    .byte $1d, $95, $19, $1b, $9d, $27, $2d, $29
    .byte $2d, $31, $23
;square 1 of part 2B
    .byte $a9, $27
;FDS sound of part 2A
    .byte $83, $20, $1e, $20, $86, $1a, $84, $1c
    .byte $1e, $86, $20, $84, $2a, $81, $32, $83
    .byte $32, $84, $2e, $32, $34, $28
;FDS sound of part 2B
    .byte $86, $2e, $84, $2a
;triangle of part 2A
    .byte $84, $1c, $1e, $04, $22, $24, $26, $1e
    .byte $30, $2c, $28, $26, $22, $28
;triangle of part 2B
    .byte $2c, $14, $1e

VictoryM_P2CData:
;square 2
    .byte $81, $40, $83, $40, $86, $40, $85, $34
    .byte $82, $3a, $80, $3a, $83, $36, $34, $84
    .byte $36, $81, $3e, $83, $3e, $86, $3e, $85
    .byte $36, $82, $3a, $86, $40, $84, $3a, $00
;square 1
    .byte $6c, $ec, $af, $63, $a8, $29, $c4, $e6
    .byte $e2, $27, $70, $f0, $b1, $69, $ae, $ad
    .byte $29
;FDS sound
    .byte $81, $1a, $83, $1a, $86, $1a, $85, $10
    .byte $82, $16, $80, $16, $83, $12, $10, $84
    .byte $12, $81, $1c, $83, $1c, $86, $1c, $85
    .byte $12, $82, $16, $86, $1a, $84, $16
;triangle
    .byte $84, $1c, $26, $2a, $2e, $34, $30, $2e
    .byte $30, $2c, $28, $2c, $2e, $28, $2c, $14
    .byte $28
;noise of part 2A, 2B and 2C
    .byte $11, $11, $d0, $d0, $d0, $11, $00

VictoryM_P2DData:
;square 2
    .byte $87, $3a, $36, $00
;square 1
    .byte $e9, $e7
;FDS sound
    .byte $87, $2e, $2a
;triangle
    .byte $83, $16, $1c, $22, $28, $2e, $34, $84
    .byte $3a, $83, $34, $22, $34, $84, $36, $83
    .byte $1e, $1e, $1e, $86, $1e
;noise of part 2D
    .byte $11, $11, $d0, $d0, $d0, $11, $00

WaveformData2:
    .byte $10, $2c, $2e, $27, $29, $2b, $2a, $28
    .byte $25, $29, $2f, $2d, $2c, $2a, $22, $24
    .byte $34, $3f, $31, $2d, $3a, $3b, $27, $12
    .byte $0a, $1f, $2c, $27, $23, $28, $22, $1e

VolEnvData2:
    .byte $a0, $04, $18, $60
VolEnvData1:
    .byte $94, $02, $44, $30, $0a, $50, $a0, $02
    .byte $36, $35, $80, $34

FDSFreqLookupTbl:
    .byte $01, $44, $01, $58, $01, $99, $02, $22
    .byte $02, $42, $02, $65, $02, $b0, $02, $d9
    .byte $03, $04, $03, $32, $03, $63, $03, $96
    .byte $03, $cd, $04, $07, $04, $44, $04, $85
    .byte $04, $ca, $05, $13, $05, $60, $05, $b2
    .byte $06, $08, $06, $64, $06, $c6, $07, $2d
    .byte $07, $9a, $08, $0e, $08, $88, $09, $95
    .byte $0a, $26, $00, $00

VictoryMusEnvData:
    .byte $97, $98, $9a, $9b, $9b, $9a, $9a, $99
    .byte $99, $98, $98, $97, $97, $96, $96, $95

;header format here is as follows:
;2 bytes - waveform data address
;1 byte  - master envelope timing (used with both volume envelope and sweep/modulation)
;2 bytes - volume envelope data address
;2 bytes - sweep envelope/mod frequency data address
;1 byte  - modulation table data offset * 2

WaveformHeaderOffsets:
    .byte Wave1Hdr-WaveformHeaderOffsets, Wave2Hdr-WaveformHeaderOffsets

WaveformHeaderData:
Wave1Hdr:     .byte <WaveformData1, >WaveformData1, $44, <VolEnvData1
              .byte >VolEnvData1, <SweepModData1, >SweepModData1, (ModTable2-ModTableData) * 2
Wave2Hdr:     .byte <WaveformData2, >WaveformData2, $60, <VolEnvData2
              .byte >VolEnvData2, <SweepModData2, >SweepModData2, (ModTable1-ModTableData) * 2
              .byte $00

WaveformData1:
    .byte $01, $02, $03, $04, $06, $07, $09, $0b
    .byte $0e, $10, $13, $18, $20, $2b, $34, $3c
    .byte $3f, $3f, $3e, $3d, $3a, $36, $32, $2f
    .byte $2c, $29, $26, $24, $21, $1e, $18, $19

SweepModData1:
    .byte $80, $1b, $81, $0a, $00, $04, $82, $10, $00, $60
SweepModData2:
    .byte $80, $02, $80, $00, $00, $60

MusicLengthLookupTbl:
    .byte $24, $12, $0d, $09, $1b, $28, $36, $12
    .byte $24, $12, $0d, $09, $1b, $28, $36, $6c