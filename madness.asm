
 processor 6502
 org  $7ffe
 word $8000
 sei
 stx $d016
 jsr $fda3
 jsr $fd50
 jsr $fd15
 jsr $ff5b

 lda #%11111111
 sta $D015
 sta $D01D
 sta $D017

 lda #$FF
 sta $D40E
 sta $D40F
 lda #$80
 sta $D412

 lda #%10000001
 sta $D404
 lda #%11110000
 sta $D406
 lda #%00100000
 sta $D405
       
 lda #7
 sta $D400
 sta $D401
 sta $D402
 sta $D403
 
 lda #%01000001
 sta $D40B
 lda #%11110000
 sta $D40D
 lda #%00100000
 sta $D40C
 
 lda #5
 sta $D407
 sta $D408
 sta $D409
 sta $D40A
 
 lda #%10000000
 sta $D404
 sta $D40B
        
 lda #%00001100
 sta $D418

 jmp NoCollision
DisplayScore
 lda #30
 adc $C005
 lda #48
 adc $C005
 sta $400+71
 lda #48
 adc $C004
 sta $400+72
 lda #48
 adc $C003
 sta $400+73
 lda #48
 adc $C002
 sta $400+74
 lda #48
 adc $C001
 sta $400+75
 lda #48
 adc $C000
 sta $400+76
 rts

AddPoint
 ldy $C000
 iny
 cpy #10
 beq Digit2
 sty $C000
 jmp DoneAddingPoint
Digit2
 ldy #0
 sty $C000
 ldy $C001
 iny
 cpy #10
 beq Digit3
 sty $C001
 jmp DoneAddingPoint
Digit3
 ldy #0
 sty $C001
 ldy $C002
 iny
 cpy #10
 beq Digit4
 sty $C002
 jmp DoneAddingPoint
Digit4
 ldy #0
 sty $C002
 ldy $C003
 iny
 cpy #10
 beq Digit5
 sty $C003
 jmp DoneAddingPoint
Digit5
 ldy #0
 sty $C003
 ldy $C004
 iny
 cpy #10
 beq Digit6
 sty $C004
 jmp DoneAddingPoint
Digit6
 ldy #0
 sty $C004
 ldy $C005
 iny
 sty $C005
DoneAddingPoint
 rts

DisplayScore2
 lda #30
 adc $C00B
 lda #48
 adc $C00B
 sta $400+40+71
 lda #48
 adc $C00A
 sta $400+40+72
 lda #48
 adc $C009
 sta $400+40+73
 lda #48
 adc $C008
 sta $400+40+74
 lda #48
 adc $C007
 sta $400+40+75
 lda #48
 adc $C006
 sta $400+40+76
 rts

AddPoint2
 ldy $C006
 iny
 cpy #10
 beq Digit22
 sty $C006
 jmp DoneAddingPoint2
Digit22
 ldy #0
 sty $C006
 ldy $C007
 iny
 cpy #10
 beq Digit32
 sty $C007
 jmp DoneAddingPoint2
Digit32
 ldy #0
 sty $C007
 ldy $C008
 iny
 cpy #10
 beq Digit42
 sty $C008
 jmp DoneAddingPoint2
Digit42
 ldy #0
 sty $C008
 ldy $C009
 iny
 cpy #10
 beq Digit52
 sty $C009
 jmp DoneAddingPoint2
Digit52
 ldy #0
 sty $C009
 ldy $C00A
 iny
 cpy #10
 beq Digit62
 sty $C00A
 jmp DoneAddingPoint2
Digit62
 ldy #0
 sty $C00A
 ldy $C00B
 iny
 sty $C00B
DoneAddingPoint2
 rts


FullCollision
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 adc $03F2
 cmp $033C
 bcs ColReset1
 lda #255
ColReset1
 clc
 sta $033C
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 sbc $03F2
 clc
 sta $033C
 lda $033E
 adc $03F3
 cmp $033E
 bcs ColReset2
 lda #255
ColReset2
 clc
 sta $033E
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 adc $03F2
 cmp $033C
 bcs ColReset3
 lda #255
ColReset3
 clc
 sta $033C
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
APointCollided
 rts

PointCollision
 lda #0
 sta $0340

 lda $033C
 cmp $033D
 bcc NotAboveX2
 lda $033D
 adc $03F0
 cmp $033D
 bcs ColReset4
 lda #255
ColReset4
 clc
 tax
 cpx $033C
 bcc NotBelowX2
 lda $033E
 cmp $033F
 bcc NotAboveY2
 lda $033F
 adc $03F1
 cmp $033F
 bcs ColReset5
 lda #255
ColReset5
 clc
 tax
 cpx $033E
 bcc NotBelowY2
 lda #1
 sta $0340
NotAboveX2
NotBelowX2
NotAboveY2
NotBelowY2
 rts
NoCollision

 ldx #0
 jmp LoadDataNo0
SpriteDataNo0
 byte #7,#192,#0
 byte #15,#100,#0
 byte #14,#38,#0
 byte #15,#102,#0
 byte #7,#198,#0
 byte #15,#134,#0
 byte #15,#134,#0
 byte #207,#143,#0
 byte #207,#134,#0
 byte #15,#134,#0
 byte #15,#192,#0
 byte #15,#192,#0
 byte #15,#224,#0
 byte #14,#224,#0
 byte #31,#120,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo0
 lda SpriteDataNo0,x
 sta $3000,x
 inx
 cpx #$3F
 bne LoadDataNo0

 ldx #0
 jmp LoadDataNo1
SpriteDataNo1
 byte #7,#192,#0
 byte #15,#96,#0
 byte #14,#32,#0
 byte #15,#96,#0
 byte #7,#192,#0
 byte #15,#130,#0
 byte #15,#143,#255
 byte #207,#143,#254
 byte #207,#130,#0
 byte #15,#128,#0
 byte #15,#192,#0
 byte #15,#224,#0
 byte #31,#240,#0
 byte #56,#28,#0
 byte #124,#31,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo1
 lda SpriteDataNo1,x
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
 byte #0,#3,#224
 byte #0,#38,#240
 byte #0,#100,#112
 byte #0,#102,#240
 byte #0,#99,#224
 byte #0,#97,#240
 byte #0,#97,#240
 byte #0,#241,#243
 byte #0,#97,#243
 byte #0,#97,#240
 byte #0,#3,#240
 byte #0,#3,#240
 byte #0,#7,#240
 byte #0,#7,#112
 byte #0,#30,#248
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo2
 lda SpriteDataNo2,x
 sta $3080,x
 inx
 cpx #$3F
 bne LoadDataNo2

 ldx #0
 jmp LoadDataNo3
SpriteDataNo3
 byte #0,#3,#224
 byte #0,#6,#240
 byte #0,#4,#112
 byte #0,#6,#240
 byte #0,#3,#224
 byte #0,#65,#240
 byte #255,#241,#240
 byte #127,#241,#243
 byte #0,#65,#243
 byte #0,#1,#240
 byte #0,#3,#240
 byte #0,#7,#240
 byte #0,#15,#248
 byte #0,#56,#28
 byte #0,#248,#62
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo3
 lda SpriteDataNo3,x
 sta $30C0,x
 inx
 cpx #$3F
 bne LoadDataNo3

 ldx #0
 jmp LoadDataNo4
SpriteDataNo4
 byte #48,#192,#0
 byte #24,#130,#0
 byte #9,#172,#0
 byte #63,#240,#0
 byte #15,#248,#0
 byte #127,#255,#0
 byte #31,#248,#0
 byte #11,#176,#0
 byte #25,#140,#0
 byte #17,#6,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo4
 lda SpriteDataNo4,x
 sta $3100,x
 inx
 cpx #$3F
 bne LoadDataNo4

 ldx #0
 jmp LoadDataNo5
SpriteDataNo5
 byte #7,#192,#0
 byte #15,#98,#0
 byte #14,#35,#0
 byte #15,#99,#0
 byte #7,#195,#0
 byte #15,#131,#0
 byte #15,#131,#0
 byte #111,#135,#128
 byte #111,#131,#0
 byte #15,#131,#0
 byte #15,#192,#0
 byte #15,#224,#0
 byte #31,#240,#0
 byte #56,#28,#0
 byte #124,#31,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo5
 lda SpriteDataNo5,x
 sta $3140,x
 inx
 cpx #$3F
 bne LoadDataNo5

 ldx #0
 jmp LoadDataNo6
SpriteDataNo6
 byte #0,#3,#224
 byte #0,#70,#240
 byte #0,#196,#112
 byte #0,#198,#240
 byte #0,#195,#224
 byte #0,#193,#240
 byte #0,#193,#240
 byte #1,#225,#246
 byte #0,#193,#246
 byte #0,#193,#240
 byte #0,#3,#240
 byte #0,#7,#240
 byte #0,#15,#248
 byte #0,#56,#28
 byte #0,#248,#62
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo6
 lda SpriteDataNo6,x
 sta $3180,x
 inx
 cpx #$3F
 bne LoadDataNo6

 ldx #0
 jmp LoadDataNo7
SpriteDataNo7
 byte #0,#0,#0
 byte #0,#0,#0
 byte #255,#255,#255
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo7
 lda SpriteDataNo7,x
 sta $31C0,x
 inx
 cpx #$3F
 bne LoadDataNo7

 ldx #0
 jmp LoadDataNo8
SpriteDataNo8
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#32,#0
 byte #0,#0,#0
LoadDataNo8
 lda SpriteDataNo8,x
 sta $3240,x
 inx
 cpx #$3F
 bne LoadDataNo8

 ldx #0
 jmp LoadDataNo9
SpriteDataNo9
 byte #0,#0,#0
 byte #0,#0,#0
 byte #7,#192,#0
 byte #15,#100,#0
 byte #14,#38,#0
 byte #15,#102,#0
 byte #7,#198,#0
 byte #15,#134,#0
 byte #15,#134,#0
 byte #207,#143,#0
 byte #207,#134,#0
 byte #7,#224,#0
 byte #7,#112,#0
 byte #51,#48,#0
 byte #62,#224,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo9
 lda SpriteDataNo9,x
 sta $32C0,x
 inx
 cpx #$3F
 bne LoadDataNo9

 ldx #0
 jmp LoadDataNo10
SpriteDataNo10
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#240,#0
 byte #1,#224,#0
 byte #99,#230,#0
 byte #99,#230,#0
 byte #7,#224,#0
 byte #7,#112,#0
 byte #51,#48,#0
 byte #62,#224,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo10
 lda SpriteDataNo10,x
 sta $3300,x
 inx
 cpx #$3F
 bne LoadDataNo10

 ldx #0
 jmp LoadDataNo11
SpriteDataNo11
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#126,#0
 byte #15,#254,#0
 byte #63,#121,#0
 byte #126,#253,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo11
 lda SpriteDataNo11,x
 sta $3340,x
 inx
 cpx #$3F
 bne LoadDataNo11

 lda #0
 sta $D021

 lda #2
 sta $D020

 lda #1

 sta $C00C
; THIS IS LINE

LoopNo13
 lda $C00C
 sta $CFFE
 lda #23
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo14
 jmp GotoNo14
BranchNo14
 jmp ExitLoopNo13


GotoNo14

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo15
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo15
 ldy #30
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
CompLoopNo16 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo16
 ldy #30
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo13
ExitLoopNo13

 lda #1

 sta $C00C
; THIS IS BGX

 lda #1

 sta $C00D
; THIS IS BGY

LoopNo17
 lda $C00D
 sta $CFFE
 lda #23
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo18
 jmp GotoNo18
BranchNo18
 jmp ExitLoopNo17


GotoNo18

LoopNo19
 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo20
 jmp GotoNo20
BranchNo20
 jmp ExitLoopNo19


GotoNo20

 lda $D41B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo21
 jmp GotoNo21
BranchNo21
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00D
CompLoopNo22
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo22
 ldy $C00C
 lda #104

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00D
CompLoopNo23 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo23
 ldy $C00C
 lda #11

 sta ($00FB),y

 lda $D41B
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo24
 jmp GotoNo24
BranchNo24
 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00D
CompLoopNo25 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo25
 ldy $C00C
 lda #12

 sta ($00FB),y

GotoNo24

GotoNo21

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo19
ExitLoopNo19

 lda #1
 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 lda $C00D

 clc
 adc #1

 sta $CFFF

 sta $C00D

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE

 jmp LoopNo17
ExitLoopNo17

 lda #77
 sta $C00E
 lda #65
 sta $C00F
 lda #68
 sta $C010
 lda #78
 sta $C011
 lda #69
 sta $C012
 lda #83
 sta $C013
 lda #83
 sta $C014
 lda #96
 sta $C015
 lda #67
 sta $C016
 lda #79
 sta $C017
 lda #77
 sta $C018
 lda #66
 sta $C019
 lda #65
 sta $C01A
 lda #84
 sta $C01B
 lda #0
 sta $C01C
; THIS IS STARTMESSAGE

 lda #0

 sta $C00C
; THIS IS STARTCURSOR

LoopNo26
 ldx $C00C
 lda $C00E,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo27
 jmp GotoNo27
BranchNo27
 jmp ExitLoopNo26


GotoNo27

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo28
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo28
 lda $C00C

 clc
 adc #8

 sta $CFFF

 tay
 ldx $C00C
 lda $C00E,x

;GARBAGE COLLECTION COMPLETE
;$C00E IS NOW FREE

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo29 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo29
 lda $C00C

 clc
 adc #8

 sta $CFFF

 tay
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo26
ExitLoopNo26

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo30 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo30
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo31 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo31
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo32 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo32
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo33 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo33
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo34 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo34
 ldy #35
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo35 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo35
 ldy #36
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo36 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo36
 ldy #31
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo37 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo37
 ldy #32
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo38 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo38
 ldy #33
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo39 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo39
 ldy #34
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo40 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo40
 ldy #35
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo41 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo41
 ldy #36
 lda #0

 sta ($00FB),y

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #192
 sta $7F8

 lda #1
 sta $D027

 lda #150
 sta $D001

 lda #100
 sta $D000

LoopNo42
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo43
 jmp GotoNo43
BranchNo43
 jmp RESETGAME

GotoNo43

 jmp LoopNo42
ExitLoopNo42

RESETGAME

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #192
 sta $7F8

 lda #196
 sta $7FF

 lda #2
 sta $D02E

 lda #0
 sta $D00E

 lda #0
 sta $D00F

 lda #1
 sta $D027

 lda #150
 sta $D001

 lda #100
 sta $D000

 lda #0

 sta $C00D
; THIS IS P1DIR

 lda #2

 sta $C00E
; THIS IS P1SPD

 lda #0

 sta $C00F
; THIS IS P1ATK

 lda #0

 sta $C010
; THIS IS P1BOUNCE

 lda #0

 sta $C011
; THIS IS P1COOL

 lda #10

 sta $C012
; THIS IS STEPTIME

 lda #0

 sta $C013
; THIS IS STEP

 jmp EXITMOVEPLAYER
MOVEPLAYER

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo44
 jmp GotoNo44
BranchNo44
 lda $C011

 sec
 sbc #1

 sta $CFFF

 sta $C011

GotoNo44

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo45
 jmp GotoNo45
BranchNo45
 lda $C00F

 sec
 sbc #1

 sta $CFFF

 sta $C00F

GotoNo45

 lda #%00000001
 bit $DC01
 beq BranchNo46
 jmp GotoNo46
BranchNo46
 lda $D001

 sec
 sbc $C00E

 sta $CFFF

 sta $D001

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo47
 jmp GotoNo47
BranchNo47
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo47

GotoNo46

 lda #%00000010
 bit $DC01
 beq BranchNo48
 jmp GotoNo48
BranchNo48
 lda $D001

 clc
 adc $C00E

 sta $CFFF

 sta $D001

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo49
 jmp GotoNo49
BranchNo49
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo49

GotoNo48

 lda #%00000100
 bit $DC01
 beq BranchNo50
 jmp GotoNo50
BranchNo50
 lda $D000

 sec
 sbc $C00E

 sta $CFFF

 sta $D000

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo51
 jmp GotoNo51
BranchNo51
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo51

 lda #1
 sta $C00D

GotoNo50

 lda #%00001000
 bit $DC01
 beq BranchNo52
 jmp GotoNo52
BranchNo52
 lda $D000

 clc
 adc $C00E

 sta $CFFF

 sta $D000

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo53
 jmp GotoNo53
BranchNo53
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

GotoNo53

 lda #0
 sta $C00D

GotoNo52

 lda $D000
 sta $CFFE
 lda #230
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo54
 jmp GotoNo54
BranchNo54
 lda #230
 sta $D000

GotoNo54

 lda $D000
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo55
 jmp GotoNo55
BranchNo55
 lda #10
 sta $D000

GotoNo55

 lda $D001
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo56
 jmp GotoNo56
BranchNo56
 lda #220
 sta $D001

GotoNo56

 lda $D001
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo57
 jmp GotoNo57
BranchNo57
 lda #50
 sta $D001

GotoNo57

 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo58
 jmp GotoNo58
BranchNo58
 lda $C013

 clc
 adc #1

 sta $CFFF

 sta $C013

 lda $C013
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo59
 jmp GotoNo59
BranchNo59
 lda #0
 sta $C013

GotoNo59

 lda #10
 sta $C012

GotoNo58

 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo60
 jmp GotoNo60
BranchNo60
 lda #192
 sta $7F8

 lda $C013
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo61
 jmp GotoNo61
BranchNo61
 lda #197
 sta $7F8

GotoNo61

GotoNo60

 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo62
 jmp GotoNo62
BranchNo62
 lda #194
 sta $7F8

 lda $C013
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo63
 jmp GotoNo63
BranchNo63
 lda #198
 sta $7F8

GotoNo63

GotoNo62

 lda #%00010000
 bit $DC01
 beq BranchNo64
 jmp GotoNo64
BranchNo64
 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo65
 jmp GotoNo65
BranchNo65
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo66
 jmp GotoNo66
BranchNo66
 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo67
 jmp GotoNo67
BranchNo67
 lda #%01000001
 sta $D40B


 lda #25
 sta $C00F

 lda #40
 sta $C011

 lda #1
 sta $C010

GotoNo67

GotoNo66

GotoNo65

 jmp P1DONTBOUNCE

GotoNo64

 lda #0
 sta $C010

P1DONTBOUNCE

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo68
 jmp GotoNo68
BranchNo68
 lda #1
 sta $C00E

 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo69
 jmp GotoNo69
BranchNo69
 lda #193
 sta $7F8

GotoNo69

 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo70
 jmp GotoNo70
BranchNo70
 lda #195
 sta $7F8

GotoNo70

GotoNo68

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo71
 jmp GotoNo71
BranchNo71
 lda #2
 sta $C00E

 lda #%01000000
 sta $D40B


GotoNo71

 rts
EXITMOVEPLAYER

 lda #0
 sta $C014
 lda #0
 sta $C015
; THIS IS LEFTX

 lda #50
 sta $C016
 lda #125
 sta $C017
; THIS IS LEFTY

 lda #0
 sta $C018
 lda #0
 sta $C019
; THIS IS LEFTATK

 lda #0
 sta $C01A
 lda #1
 sta $C01B
; THIS IS LEFTSTEP

 lda #192
 sta $7F9

 lda #192
 sta $7FA

 lda #15
 sta $D028

 lda #15
 sta $D029

 jmp EXITMOVELEFTS
MOVELEFTS

 ldx #0
 lda $C01A,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C01A,x


 ldx #0
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo72
 jmp GotoNo72
BranchNo72
 lda #0
 tay
 ldx #0
 tya
 sta $C01A,x


GotoNo72

 ldx #1
 lda $C01A,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C01A,x


 ldx #1
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo73
 jmp GotoNo73
BranchNo73
 lda #0
 tay
 ldx #1
 tya
 sta $C01A,x


GotoNo73

 ldx #0
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo74
 jmp GotoNo74
BranchNo74
 lda #0
 tay
 ldx #0
 tya
 sta $C018,x


GotoNo74

 lda #192
 sta $7F9

 ldx #0
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo75
 jmp GotoNo75
BranchNo75
 lda #197
 sta $7F9

GotoNo75

 ldx #1
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo76
 jmp GotoNo76
BranchNo76
 lda #0
 tay
 ldx #1
 tya
 sta $C018,x


GotoNo76

 lda #192
 sta $7FA

 ldx #1
 lda $C01A,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo77
 jmp GotoNo77
BranchNo77
 lda #197
 sta $7FA

GotoNo77

 ldx #0
 lda $C018,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo78
 jmp GotoNo78
BranchNo78
 lda #193
 sta $7F9

 lda #2
 tay
 ldx #0
 tya
 sta $C018,x


 lda #15
 sta $D028

GotoNo78

 ldx #1
 lda $C018,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo79
 jmp GotoNo79
BranchNo79
 lda #193
 sta $7FA

 lda #2
 tay
 ldx #1
 tya
 sta $C018,x


 lda #15
 sta $D029

GotoNo79

 lda $D41B
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo80
 jmp GotoNo80
BranchNo80
 ldx #0
 lda $C018,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo81
 jmp GotoNo81
BranchNo81
 lda #1
 tay
 ldx #0
 tya
 sta $C018,x


 lda #7
 sta $D028

GotoNo81

GotoNo80

 lda $D41B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo82
 jmp GotoNo82
BranchNo82
 ldx #1
 lda $C018,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo83
 jmp GotoNo83
BranchNo83
 lda #1
 tay
 ldx #1
 tya
 sta $C018,x


 lda #7
 sta $D029

GotoNo83

GotoNo82

 ldx #0
 lda $C014,x

 clc
 adc #5

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C014,x


 ldx #1
 lda $C014,x

 clc
 adc #4

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C014,x


 ldx #0
 lda $C014,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo84
 jmp GotoNo84
BranchNo84
 lda #0
 tay
 ldx #0
 tya
 sta $C014,x


GotoNo84

 ldx #1
 lda $C014,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo85
 jmp GotoNo85
BranchNo85
 lda #0
 tay
 ldx #1
 tya
 sta $C014,x


GotoNo85

 rts
EXITMOVELEFTS

 lda #230
 sta $C01D
 lda #230
 sta $C01E
; THIS IS RIGHTX

 lda #75
 sta $C01F
 lda #175
 sta $C020
; THIS IS RIGHTY

 lda #0
 sta $C021
 lda #0
 sta $C022
; THIS IS RIGHTATK

 lda #1
 sta $C023
 lda #0
 sta $C024
; THIS IS RIGHTSTEP

 lda #194
 sta $7FB

 lda #194
 sta $7FC

 lda #15
 sta $D02A

 lda #15
 sta $D02B

 jmp EXITMOVERIGHTS
MOVERIGHTS

 ldx #0
 lda $C023,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C023,x


 ldx #0
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo86
 jmp GotoNo86
BranchNo86
 lda #0
 tay
 ldx #0
 tya
 sta $C023,x


GotoNo86

 ldx #1
 lda $C023,x

 clc
 adc #1

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C023,x


 ldx #1
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo87
 jmp GotoNo87
BranchNo87
 lda #0
 tay
 ldx #1
 tya
 sta $C023,x


GotoNo87

 ldx #0
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo88
 jmp GotoNo88
BranchNo88
 lda #0
 tay
 ldx #0
 tya
 sta $C021,x


GotoNo88

 lda #194
 sta $7FB

 ldx #0
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo89
 jmp GotoNo89
BranchNo89
 lda #198
 sta $7FB

GotoNo89

 ldx #1
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo90
 jmp GotoNo90
BranchNo90
 lda #0
 tay
 ldx #1
 tya
 sta $C021,x


GotoNo90

 lda #194
 sta $7FC

 ldx #1
 lda $C023,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo91
 jmp GotoNo91
BranchNo91
 lda #198
 sta $7FC

GotoNo91

 ldx #0
 lda $C021,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo92
 jmp GotoNo92
BranchNo92
 lda #195
 sta $7FB

 lda #2
 tay
 ldx #0
 tya
 sta $C021,x


 lda #15
 sta $D02A

GotoNo92

 ldx #1
 lda $C021,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo93
 jmp GotoNo93
BranchNo93
 lda #195
 sta $7FC

 lda #2
 tay
 ldx #1
 tya
 sta $C021,x


 lda #15
 sta $D02B

GotoNo93

 lda $D41B
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo94
 jmp GotoNo94
BranchNo94
 ldx #0
 lda $C021,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo95
 jmp GotoNo95
BranchNo95
 lda #1
 tay
 ldx #0
 tya
 sta $C021,x


 lda #7
 sta $D02A

GotoNo95

GotoNo94

 lda $D41B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo96
 jmp GotoNo96
BranchNo96
 ldx #1
 lda $C021,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo97
 jmp GotoNo97
BranchNo97
 lda #1
 tay
 ldx #1
 tya
 sta $C021,x


 lda #7
 sta $D02B

GotoNo97

GotoNo96

 ldx #0
 lda $C01D,x

 sec
 sbc #4

 sta $CFFF

 tay
 ldx #0
 tya
 sta $C01D,x


 ldx #1
 lda $C01D,x

 sec
 sbc #5

 sta $CFFF

 tay
 ldx #1
 tya
 sta $C01D,x


 ldx #0
 lda $C01D,x

 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo98
 jmp GotoNo98
BranchNo98
 lda #230
 tay
 ldx #0
 tya
 sta $C01D,x


GotoNo98

 ldx #1
 lda $C01D,x

 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo99
 jmp GotoNo99
BranchNo99
 lda #230
 tay
 ldx #1
 tya
 sta $C01D,x


GotoNo99

 rts
EXITMOVERIGHTS

 lda #25

 sta $C01C
; THIS IS MOVETIME

 lda #25

 sta $C00C
; THIS IS MOVERESET

 lda #0

 sta $C025
; THIS IS SOUNDTIME

 lda #25

 sta $C026
; THIS IS BONUS

 lda #255

 sta $C027
; THIS IS ARROWTIME

 lda #0

 sta $C028
; THIS IS ARROWMOVE

 lda #155

 sta $C029
; THIS IS ARROWTIME2

 lda #0

 sta $C02A
; THIS IS ARROWMOVE2

 lda #1
 sta $D02D

 lda #1
 sta $D02C

 lda #199
 sta $7FE

 lda #201
 sta $7FD

 lda #0
 sta $D00C

 lda #0
 sta $D00D

 lda #0
 sta $D00A

 lda #0
 sta $D00B

LoopNo100
 lda $C027
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo101
 jmp GotoNo101
BranchNo101
 lda $C027

 sec
 sbc #1

 sta $CFFF

 sta $C027

GotoNo101

 lda $C027
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo102
 jmp GotoNo102
BranchNo102
 lda $C028
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo103
 jmp GotoNo103
BranchNo103
 lda $D000
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo104
 jmp GotoNo104
BranchNo104
 lda $D001
 sta $D00D

 lda #1
 sta $C028

 lda #10
 sta $D00C

 lda #199
 sta $7FE

GotoNo104

 lda $D000
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo105
 jmp GotoNo105
BranchNo105
 lda $D001
 sta $D00D

 lda #2
 sta $C028

 lda #240
 sta $D00C

 lda #199
 sta $7FE

GotoNo105

GotoNo103

GotoNo102

 lda $C028
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo106
 jmp GotoNo106
BranchNo106
 lda $D00C

 clc
 adc #2

 sta $CFFF

 sta $D00C

GotoNo106

 lda $C028
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo107
 jmp GotoNo107
BranchNo107
 lda $D00C

 sec
 sbc #2

 sta $CFFF

 sta $D00C

GotoNo107

 lda $D00C
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo108
 jmp GotoNo108
BranchNo108
 lda #0
 sta $C028

 lda $C027
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo109
 jmp GotoNo109
BranchNo109
 lda $D41B
 sta $C027

GotoNo109

 lda #50
 sta $D00C

 lda #0
 sta $D00D

GotoNo108

 lda $D00C
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo110
 jmp GotoNo110
BranchNo110
 lda #0
 sta $C028

 lda $C027
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo111
 jmp GotoNo111
BranchNo111
 lda $D41B
 sta $C027

GotoNo111

 lda #50
 sta $D00C

 lda #0
 sta $D00D

GotoNo110

 lda $C029
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo112
 jmp GotoNo112
BranchNo112
 lda $C029

 sec
 sbc #1

 sta $CFFF

 sta $C029

GotoNo112

 lda $C029
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo113
 jmp GotoNo113
BranchNo113
 lda $C02A
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo114
 jmp GotoNo114
BranchNo114
 lda $D001
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo115
 jmp GotoNo115
BranchNo115
 lda $D000
 sta $D00A

 lda #1
 sta $C02A

 lda #10
 sta $D00B

 lda #201
 sta $7FD

GotoNo115

 lda $D001
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo116
 jmp GotoNo116
BranchNo116
 lda $D000
 sta $D00A

 lda #2
 sta $C02A

 lda #240
 sta $D00B

 lda #201
 sta $7FD

GotoNo116

GotoNo114

GotoNo113

 lda $C02A
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo117
 jmp GotoNo117
BranchNo117
 lda $D00B

 clc
 adc #2

 sta $CFFF

 sta $D00B

GotoNo117

 lda $C02A
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo118
 jmp GotoNo118
BranchNo118
 lda $D00B

 sec
 sbc #2

 sta $CFFF

 sta $D00B

GotoNo118

 lda $D00B
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo119
 jmp GotoNo119
BranchNo119
 lda #0
 sta $C02A

 lda $C029
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo120
 jmp GotoNo120
BranchNo120
 lda $D41B
 sta $C029

GotoNo120

 lda #0
 sta $D00A

 lda #0
 sta $D00B

GotoNo119

 lda $D00B
 sta $CFFE
 lda #10
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo121
 jmp GotoNo121
BranchNo121
 lda #0
 sta $C02A

 lda $C029
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo122
 jmp GotoNo122
BranchNo122
 lda $D41B
 sta $C029

GotoNo122

 lda #0
 sta $D00A

 lda #0
 sta $D00B

GotoNo121

 lda $C026
 sta $CFFE
 lda #25
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo123
 jmp GotoNo123
BranchNo123
 lda $C026

 sec
 sbc #1

 sta $CFFF

 sta $C026

GotoNo123

 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo124
 jmp GotoNo124
BranchNo124
 lda $C01C

 sec
 sbc #1

 sta $CFFF

 sta $C01C

GotoNo124

 lda $C01C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo125
 jmp GotoNo125
BranchNo125
 jsr MOVELEFTS



 jsr MOVERIGHTS



 lda $C00C
 sta $C01C

GotoNo125

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo126
 jmp GotoNo126
BranchNo126
 lda $C025

 sec
 sbc #1

 sta $CFFF

 sta $C025

GotoNo126

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo127
 jmp GotoNo127
BranchNo127
 lda #0
 sta $D00E

 lda #0
 sta $D00F

 lda #%10000000
 sta $D404


GotoNo127

 ldx #0
 lda $C014,x

 sta $D002

 ldx #1
 lda $C014,x

 sta $D004

 ldx #0
 lda $C016,x

 sta $D003

 ldx #1
 lda $C016,x

 sta $D005

 ldx #0
 lda $C01D,x

 sta $D006

 ldx #1
 lda $C01D,x

 sta $D008

 ldx #0
 lda $C01F,x

 sta $D007

 ldx #1
 lda $C01F,x

 sta $D009

 jsr MOVEPLAYER



 lda #30
 sta $03F2
 lda #15
 sta $03F3
 lda #30
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D002
 sta $033D
 lda $D003
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D002
 sta $033C
 lda $D003
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo128
 jmp GotoNo128
BranchNo128
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo129
 jmp GotoNo129
BranchNo129
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo130
 jmp GotoNo130
BranchNo130
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo131
 jmp GotoNo131
BranchNo131
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo131

GotoNo130

 lda #0
 sta $C011

 ldx $C026
PointLoopNo131
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo131

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo133
 jmp GotoNo133
BranchNo133
 ldx #0
 lda $C014,x

 sta $D00E

 ldx #0
 lda $C016,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo133

 lda #0
 tay
 ldx #0
 tya
 sta $C014,x


 lda $D41B
 tay
 ldx #0
 tya
 sta $C016,x


 ldx #0
 lda $C016,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo134
 jmp GotoNo134
BranchNo134
 lda #220
 tay
 ldx #0
 tya
 sta $C016,x


GotoNo134

 ldx #0
 lda $C016,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo135
 jmp GotoNo135
BranchNo135
 lda #50
 tay
 ldx #0
 tya
 sta $C016,x


GotoNo135

GotoNo129

 ldx #0
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo136
 jmp GotoNo136
BranchNo136
 lda $D000
 sta $CFFE
 lda $D002
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo137
 jmp GotoNo137
BranchNo137
 jmp P1DEAD

GotoNo137

GotoNo136

GotoNo128

 lda #30
 sta $03F2
 lda #15
 sta $03F3
 lda #30
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D004
 sta $033D
 lda $D005
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D004
 sta $033C
 lda $D005
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo138
 jmp GotoNo138
BranchNo138
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo139
 jmp GotoNo139
BranchNo139
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo140
 jmp GotoNo140
BranchNo140
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo141
 jmp GotoNo141
BranchNo141
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo141

GotoNo140

 lda #0
 sta $C011

 ldx $C026
PointLoopNo141
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo141

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo143
 jmp GotoNo143
BranchNo143
 ldx #1
 lda $C014,x

 sta $D00E

 ldx #1
 lda $C016,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo143

 lda #0
 tay
 ldx #1
 tya
 sta $C014,x


 lda $D41B
 tay
 ldx #1
 tya
 sta $C016,x


 ldx #1
 lda $C016,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo144
 jmp GotoNo144
BranchNo144
 lda #220
 tay
 ldx #1
 tya
 sta $C016,x


GotoNo144

 ldx #1
 lda $C016,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo145
 jmp GotoNo145
BranchNo145
 lda #50
 tay
 ldx #1
 tya
 sta $C016,x


GotoNo145

GotoNo139

 ldx #1
 lda $C018,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo146
 jmp GotoNo146
BranchNo146
 lda $D000
 sta $CFFE
 lda $D004
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo147
 jmp GotoNo147
BranchNo147
 jmp P1DEAD

GotoNo147

GotoNo146

GotoNo138

 lda #30
 sta $03F2
 lda #15
 sta $03F3
 lda #30
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D006
 sta $033D
 lda $D007
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D006
 sta $033C
 lda $D007
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo148
 jmp GotoNo148
BranchNo148
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo149
 jmp GotoNo149
BranchNo149
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo150
 jmp GotoNo150
BranchNo150
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo151
 jmp GotoNo151
BranchNo151
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo151

GotoNo150

 lda #0
 sta $C011

 ldx $C026
PointLoopNo151
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo151

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo153
 jmp GotoNo153
BranchNo153
 ldx #0
 lda $C01D,x

 sta $D00E

 ldx #0
 lda $C01F,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo153

 lda #230
 tay
 ldx #0
 tya
 sta $C01D,x


 lda $D41B
 tay
 ldx #0
 tya
 sta $C01F,x


 ldx #0
 lda $C01F,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo154
 jmp GotoNo154
BranchNo154
 lda #220
 tay
 ldx #0
 tya
 sta $C01F,x


GotoNo154

 ldx #0
 lda $C01F,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo155
 jmp GotoNo155
BranchNo155
 lda #50
 tay
 ldx #0
 tya
 sta $C01F,x


GotoNo155

GotoNo149

 ldx #0
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo156
 jmp GotoNo156
BranchNo156
 lda $D000
 sta $CFFE
 lda $D006
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo157
 jmp GotoNo157
BranchNo157
 jmp P1DEAD

GotoNo157

GotoNo156

GotoNo148

 lda #30
 sta $03F2
 lda #15
 sta $03F3
 lda #30
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D008
 sta $033D
 lda $D009
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D008
 sta $033C
 lda $D009
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo158
 jmp GotoNo158
BranchNo158
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo159
 jmp GotoNo159
BranchNo159
 lda $D41B
 sta $CFFE
 lda #175
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo160
 jmp GotoNo160
BranchNo160
 lda $C00C
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo161
 jmp GotoNo161
BranchNo161
 lda $C00C

 sec
 sbc #1

 sta $CFFF

 sta $C00C

GotoNo161

GotoNo160

 lda #0
 sta $C011

 ldx $C026
PointLoopNo161
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo161

 lda #100
 sta $C026

 lda $C025
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo163
 jmp GotoNo163
BranchNo163
 ldx #1
 lda $C01D,x

 sta $D00E

 ldx #1
 lda $C01F,x

 sta $D00F

 lda #15
 sta $C025

 lda #%10000001
 sta $D404


GotoNo163

 lda #230
 tay
 ldx #1
 tya
 sta $C01D,x


 lda $D41B
 tay
 ldx #1
 tya
 sta $C01F,x


 ldx #1
 lda $C01F,x

 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo164
 jmp GotoNo164
BranchNo164
 lda #220
 tay
 ldx #1
 tya
 sta $C01F,x


GotoNo164

 ldx #1
 lda $C01F,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo165
 jmp GotoNo165
BranchNo165
 lda #50
 tay
 ldx #1
 tya
 sta $C01F,x


GotoNo165

GotoNo159

 ldx #1
 lda $C021,x

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo166
 jmp GotoNo166
BranchNo166
 lda $D000
 sta $CFFE
 lda $D008
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo167
 jmp GotoNo167
BranchNo167
 jmp P1DEAD

GotoNo167

GotoNo166

GotoNo158

 lda #20
 sta $03F2
 lda #20
 sta $03F3
 lda #30
 sta $03F0
 lda #5
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D00C
 sta $033D
 lda $D00D
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D00C
 sta $033C
 lda $D00D
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo168
 jmp GotoNo168
BranchNo168
 jmp P1DEAD

GotoNo168

 lda #10
 sta $03F2
 lda #20
 sta $03F3
 lda #5
 sta $03F0
 lda #25
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D00A
 sta $033D
 lda $D00B
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D00A
 sta $033C
 lda $D00B
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo169
 jmp GotoNo169
BranchNo169
 jmp P1DEAD

GotoNo169

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo100
ExitLoopNo100

P1DEAD

 lda #%10000000
 sta $D404


 lda #%01000000
 sta $D40B


 lda #203
 sta $7F8

 lda #0

 sta $C02B
; THIS IS ANIMFRAME

LoopNo170
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda $C02B
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo171
 jmp GotoNo171
BranchNo171
 lda $C02B

 clc
 adc #1

 sta $CFFF

 sta $C02B

GotoNo171

 lda $C02B
 sta $CFFE
 lda #3
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo172
 jmp GotoNo172
BranchNo172
 lda #204
 sta $7F8

GotoNo172

 lda $C02B
 sta $CFFE
 lda #6
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo173
 jmp GotoNo173
BranchNo173
 lda #205
 sta $7F8

 jmp ExitLoopNo170


GotoNo173

 jmp LoopNo170
ExitLoopNo170

 lda #50

 sta $C02C
; THIS IS RESTART

LoopNo174
 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 lda #%00010000
 bit $DC01
 beq BranchNo175
 jmp GotoNo175
BranchNo175
 lda $C02C

 sec
 sbc #1

 sta $CFFF

 sta $C02C

GotoNo175

 lda $C02C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo176
 jmp GotoNo176
BranchNo176
 jmp RESETGAME

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE
;$C00E IS NOW FREE
;$C00F IS NOW FREE
;$C010 IS NOW FREE
;$C011 IS NOW FREE
;$C012 IS NOW FREE
;$C013 IS NOW FREE
;$C014 IS NOW FREE
;$C016 IS NOW FREE
;$C018 IS NOW FREE
;$C01A IS NOW FREE
;$C01D IS NOW FREE
;$C01F IS NOW FREE
;$C021 IS NOW FREE
;$C023 IS NOW FREE
;$C01C IS NOW FREE
;$C00C IS NOW FREE
;$C025 IS NOW FREE
;$C026 IS NOW FREE
;$C027 IS NOW FREE
;$C028 IS NOW FREE
;$C029 IS NOW FREE
;$C02A IS NOW FREE
;$C02B IS NOW FREE
;$C02C IS NOW FREE

GotoNo176

 jmp LoopNo174
ExitLoopNo174


Wait1
 lda $d011
 bmi Wait1
Wait2
 lda $d012
Wait3
 cmp $d012
 beq Wait3
 lda $d011
 bpl Wait2
 rts

