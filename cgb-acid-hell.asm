ld_long: MACRO
    IF STRLWR("\1") == "a"
        ; ld a, [$ff40]
        db $FA
        dw \2
    ELSE
        IF STRLWR("\2") == "a"
            ; ld [$ff40], a
            db $EA
            dw \1
        ENDC
    ENDC
ENDM

INCLUDE "hardware.inc"

SECTION "ROM Bank $000", ROM0[$0]

Call_000_0000:
    or $80
    ldh [rBCPS], a
    ld c, $69

jr_000_0006:
    ld a, [hl+]
    ld [c], a
    dec b
    jr nz, jr_000_0006

    ret


Call_000_000c:
    or $80
    ldh [rOCPS], a
    ld c, $6b

jr_000_0012:
    ld a, [hl+]
    ld [c], a
    dec b
    jr nz, jr_000_0012

    ret


Call_000_0018:
    ld d, a

jr_000_0019:
    ld [hl+], a
    dec bc
    ld a, b
    or c
    ld a, d
    jr nz, jr_000_0019

    ret


Call_000_0021:
    ld hl, $ff40
    bit 7, [hl]
    ret z

    call Call_000_002d
    res 7, [hl]
    ret


Call_000_002d:
jr_000_002d:
    ldh a, [rLY]
    cp $90
    jr nz, jr_000_002d

    ret


Call_000_0034:
jr_000_0034:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0034

    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jp $0150


    adc $ed
    ld h, [hl]
    ld h, [hl]
    call z, $000d
    dec bc
    inc bc
    ld [hl], e
    nop
    add e
    nop
    inc c
    nop
    dec c
    nop
    ld [$1f11], sp
    adc b
    adc c
    nop
    ld c, $dc
    call z, $e66e
    db $dd
    db $dd
    reti


    sbc c
    cp e
    cp e
    ld h, a
    ld h, e
    ld l, [hl]
    ld c, $ec
    call z, $dcdd
    sbc c
    sbc a
    cp e
    cp c
    inc sp
    ld a, $43
    ld b, a
    ld b, d
    dec l
    ld b, c
    ld b, e
    ld c, c
    ld b, h
    dec l
    ld c, b
    ld b, l
    ld c, h
    ld c, h
    nop
    nop
    ret nz

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    res 4, e
    call nc, Call_000_31f3
    cp $ff
    push af
    call Call_000_0021
    pop af
    cp $11
    jp nz, Jump_000_1ab3

    xor a
    ld [$c000], a
    ld hl, $fe00
    ld bc, $00a0
    ld a, $ff
    call Call_000_0018
    ld hl, $1b65
    ld de, $fe00
    ld bc, $00a0
    call Call_000_0034
    ld hl, $1b2c
    ld b, $18
    xor a
    call Call_000_0000
    ld hl, $1b2c
    ld b, $18
    xor a
    call Call_000_000c
    call Call_000_1ab6
    ld a, $01
    ldh [rVBK], a
    ld hl, $1f64
    ld de, $9100
    ld bc, $00e0
    call Call_000_0034
    ld hl, $9c00
    ld a, $0a
    ld c, $0e

jr_000_01a5:
    ld [hl+], a
    dec c
    jr nz, jr_000_01a5

    ld a, $01
    ld hl, $9800
    ld bc, $0400
    push hl
    call Call_000_0018
    ld de, $0020
    ld c, $10
    pop hl

jr_000_01bb:
    ld [hl], d
    add hl, de
    dec c
    jr nz, jr_000_01bb

    xor a
    ldh [rVBK], a
    ld hl, $1b64
    ld de, $9800
    ld bc, $0400
    call Call_000_0034
    ld hl, $9c00
    ld a, $10
    ld c, $0e

jr_000_01d6:
    ld [hl+], a
    inc a
    dec c
    jr nz, jr_000_01d6

    ld c, $ff
    ld de, $8010

jr_000_01e0:
    push bc
    ld hl, $1b44
    ld bc, $0010
    call Call_000_0034
    pop bc
    dec c
    jr nz, jr_000_01e0

    ld c, $7f
    ld de, $9010

jr_000_01f3:
    push bc
    ld hl, $1b44
    ld bc, $0010
    call Call_000_0034
    pop bc
    dec c
    jr nz, jr_000_01f3

    ld hl, $1b54
    ld de, $8690
    ld bc, $0010
    call Call_000_0034
    ld a, $40
    ldh [rSTAT], a
    ld a, $b4
    ldh [rSCX], a
    ld a, $21
    ldh [rWX], a
    ld a, $88
    ldh [rWY], a
    xor a
    ldh [rLYC], a
    ldh [rIF], a
    ld a, $02
    ldh [rIE], a
    ld hl, $ff40
    ld de, $80e1
    ld bc, $e3f3
    ld [hl], c

Jump_000_0230:
    call Call_000_002d
    ld a, [$c000]
    inc a
    cp $0a
    jr nz, jr_000_023d

    xor a
    ld b, b

jr_000_023d:
    ld [$c000], a
    ld a, $00
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $81
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $01
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $9e
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $02
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $bb
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $03
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $d8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $04
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $f5
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $05
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $92
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $06
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $af
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $07
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $cc
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $08
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $e9
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $09
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $86
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $0a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a3
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $0b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $c0
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $0c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $dd
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $0d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $7a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $0e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $97
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $0f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $b4
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $10
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $d1
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $11
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $ee
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $12
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $8b
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $13
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $14
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $c5
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $15
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $e2
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $16
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $7f
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $17
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $9c
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $18
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $b9
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $19
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $d6
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $1a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $73
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $1b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $90
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $1c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $ad
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $1d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $ca
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $1e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $67
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $1f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $84
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $20
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a1
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $21
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $be
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $22
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $db
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $23
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $78
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $24
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $95
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $25
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $b2
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $26
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $cf
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b

Call_000_093c:
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $27
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $6c
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $28
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $89
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $29
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a6
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $2a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $c3
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $2b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $60
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $2c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $7d
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $2d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $9a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $2e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $b7
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $2f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $54
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $30
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $71
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $31
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $8e
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $32
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $ab
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $33
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $c8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $34
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $65
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $35
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $82
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $36
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $9f
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $37
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $bc
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $38
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $59
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $39
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $76
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $3a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $93
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $3b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $b0
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $3c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $4d
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $3d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $6a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $3e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $87
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $3f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a4
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $40
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $c8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $41
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $d0
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $42
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $d8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $43
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $e0
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $44
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $e8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $45
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $f0
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $46
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $f8
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $47
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $00
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $48
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $89
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $49
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $92
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $4a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $9b
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $4b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a4
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $4c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $ad
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $4d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $36
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $4e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $3f
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $4f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $48
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $50
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $51
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $51
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $5a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $52
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $63
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $53
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $6c
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $54
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $75
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $55
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $7e
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $56
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $87
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $57
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $90
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $58
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $99
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $59
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $a2
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $5a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $2b
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $5b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $34
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $5c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $3d
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $5d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $46
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $5e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $4f
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $5f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $58
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $60
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $61
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $61
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $6a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $62
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $73
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $63
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $7c
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $64
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $85
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $65
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $8e
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $66
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $97
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $67
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $20
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $68
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $29
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $69
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $32
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $6a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $3b
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $6b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $44
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $6c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $4d
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $6d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $56
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $6e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $5f
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $6f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $68
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $70
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $71
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $71
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $7a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $72
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $83
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $73
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $8c
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $74
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $15
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $75
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $1e
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $76
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $27
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $77
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $30
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $78
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $39
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $79
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $42
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $7a
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $4b
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $7b
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $54
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $7c
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $5d
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $7d
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $66
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $7e
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $6f
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $7f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $78
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $80
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $01
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $81
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $0a
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $82
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $13
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $83
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $1c
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $84
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $25
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $85
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $2e
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $86
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $37
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld a, $87
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    halt
    ld a, $40
    ldh [rSCY], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    ld [hl], c
    ld [hl], d
    ld [hl], e
    ld [hl], d
    ld [hl], c
    ld [hl], b
    jp Jump_000_0230


Jump_000_1ab3:
    jp Jump_000_1adb


Call_000_1ab6:
    ld hl, $fea0
    ld b, $55

jr_000_1abb:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_1abb

    ld [hl], b
    ld hl, $feb8
    ld b, $44

jr_000_1ac7:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_1ac7

    ld [hl], b
    ld hl, $fea0

jr_000_1ad1:
    ldh a, [rSTAT]
    and $02
    jr nz, jr_000_1ad1

    ld a, [hl]
    cp $55
    ret nz

Jump_000_1adb:
    ld a, $01
    ldh [rVBK], a
    ld hl, $2044
    ld de, $9100
    ld bc, $00e0
    call Call_000_0034
    ld hl, $9c00
    ld a, $0a
    ld c, $0e

jr_000_1af2:
    ld [hl+], a
    dec c
    jr nz, jr_000_1af2

    ld a, $01
    ld hl, $9800
    ld bc, $0400
    push hl
    call Call_000_0018
    xor a
    ldh [rVBK], a
    ld hl, $9800
    ld a, $00
    ld bc, $0400
    call Call_000_0018
    ld hl, $9c00
    ld a, $10
    ld c, $0e

jr_000_1b17:
    ld [hl+], a
    inc a
    dec c
    jr nz, jr_000_1b17

    ld a, $21

jr_000_1b1e:
    ldh [rWX], a
    ld a, $88
    ldh [rWY], a
    ld hl, $ff40
    ld b, $e1
    ld [hl], b

jr_000_1b2a:
    jr jr_000_1b2a

    rst $38
    ld a, a
    rst $38
    inc bc
    nop
    nop
    nop
    nop
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    rst $38
    ld a, a
    nop
    nop
    inc e
    inc e
    ld a, $22
    ld a, a
    ld d, l
    ld a, a
    ld b, c
    ld a, a
    ld e, l
    ld a, a
    ld b, c
    ld a, $22
    inc e
    inc e
    inc e
    inc e

jr_000_1b56:
    ld a, $22
    ld a, a
    ld d, l
    ld a, a
    ld b, c
    ld a, a
    ld d, l
    ld a, a
    ld c, c
    ld a, $22
    inc e
    inc e
    add e
    jr jr_000_1b1e

    ld l, c
    nop
    cpl
    ret nz

    ld a, c
    ld h, l
    inc h
    add l
    scf
    add c
    jp hl


    call nc, $f360
    reti


    and b
    xor b
    adc [hl]
    ld c, a
    ld bc, $01b9
    ld a, d
    pop af
    ld [hl], d
    ei
    add l
    add $b2
    inc e
    ld [hl], b
    ld sp, hl
    dec [hl]
    rst $18
    jp hl


    ld e, e
    rst $18
    rrca
    sbc l
    sub h
    ld h, [hl]
    ld e, c
    cp c
    scf
    ret nc

    and $0b
    ld c, d
    db $db
    ld e, b
    daa
    ld d, d
    di
    add c
    pop af
    ld e, c
    jr nc, jr_000_1c1e

    rst $38
    sbc h
    adc l
    ld [hl+], a
    rlca
    add hl, sp

jr_000_1ba7:
    jr z, jr_000_1baf

    inc b
    call z, $b267
    sbc c

jr_000_1bae:
    jp hl


jr_000_1baf:
    ld b, h
    add $89
    ld [hl-], a
    sbc h
    add c
    ld l, c
    ld a, [hl-]
    dec b
    ld de, $df55
    xor e
    ld [bc], a
    ld d, a
    nop
    ld a, [c]
    ld e, b
    cp $a9
    db $e4
    ld d, l
    sub a
    ld a, l
    ld de, $e24b
    dec a
    jr jr_000_1b56

    ld e, b
    adc [hl]
    ld [$cb39], a
    ld a, [bc]
    jr z, jr_000_1c0d

    rst $18
    dec sp
    add hl, sp
    rst $10
    ld a, [c]
    set 3, l
    ld [hl], l

jr_000_1bdd:
    add sp, -$51
    rst $18
    cp d
    and c
    sub l
    ld b, a
    ld b, c
    sub a
    ld e, b
    cp c
    ld e, a
    ld d, d
    pop de
    sbc e
    ret nz

    ld a, [$a5dc]
    xor e
    or l
    ld e, d
    ld c, [hl]
    xor c
    dec bc
    ld l, e
    ret nc

    ld c, c
    jr jr_000_1bdd

    ld b, d
    ld a, $31
    call z, Call_000_2e24
    rst $08
    cp a
    sbc $55
    rlca
    xor l
    ld e, [hl]
    sbc l
    add [hl]
    ld sp, $2fbb

jr_000_1c0d:
    ld l, $e0
    scf
    ldh [rOBP0], a
    add [hl]
    ld h, c
    db $eb
    rst $00
    ei
    jr nz, jr_000_1bae

    add [hl]
    ld b, d
    ld a, d
    sbc c
    db $fd

jr_000_1c1e:
    ld b, e
    and a
    jr jr_000_1ba7

    ld [$4959], a
    adc d
    jp hl


    rrca
    ld a, d

jr_000_1c29:
    dec hl
    or [hl]
    inc h
    ret z

    ld c, l
    adc $3f
    dec e
    add hl, bc
    ld b, b
    sbc $bd
    db $eb
    ld c, e
    cp d
    ld l, [hl]
    or a
    inc d
    xor b
    sub [hl]
    sbc [hl]
    ld h, e
    ld c, b
    and h
    rlca
    ld e, a
    ldh [rNR43], a
    ret c

    ld a, [bc]
    ld bc, $66d5
    inc bc
    rst $30
    db $eb
    push hl
    jr nz, jr_000_1c29

    adc [hl]
    ld a, h
    sbc d
    jp c, $ff94

    ld a, [de]
    ld hl, $53ea
    db $f4
    xor h
    sub l
    or e
    ld [hl], $81
    ld e, b
    ld de, $1731
    inc e
    db $e3
    ret nc

    ld [hl], e
    inc c
    cpl
    ret nc

    dec de
    ld d, a
    db $ec
    ld h, c
    jp $6a2e


    ld h, a
    or [hl]
    ld e, c
    ld b, a
    ret nc

    ld h, e
    db $eb
    inc d
    push de
    jp hl


    inc l
    ld e, l
    add $79
    dec sp
    ld h, h
    db $76
    and $1a
    ld l, e
    rst $28
    or d
    db $fc
    ld d, h
    ld l, $d4
    ld a, h
    inc sp
    sbc l
    call nz, $c015
    cpl
    inc a
    ld e, l

jr_000_1c95:
    cp l
    and h
    xor e
    ld hl, $0a6c
    xor h
    inc d
    adc e
    ld d, h
    ld h, e
    ld b, e
    ld a, [hl+]
    jp nc, $432e

    dec a
    add [hl]
    rla
    ld d, c
    and c
    and h
    ld b, c
    db $ec
    ret nz

    ld b, a
    cp l
    ldh a, [$34]
    ld l, h
    ld h, a
    dec d
    jp nc, $78ab

    dec c
    sub l
    ld sp, $bed3
    call z, $4f58
    dec l
    dec a
    add l
    ld [bc], a
    ld d, h
    db $ec
    dec d
    ld e, a
    and [hl]
    or b
    ld e, [hl]
    ld sp, $2fb3
    cp b
    sub d
    add b
    ld a, $ad
    res 4, [hl]
    sub c
    ld e, e
    ld [c], a
    db $db
    and c
    cp [hl]
    jr nc, jr_000_1c95

    ld c, a
    cp [hl]
    ld a, d
    sub d
    db $fc
    and b
    push bc
    xor b
    ld h, e
    adc c
    sub d
    or l
    inc b
    db $db
    or h
    dec a
    sub h
    xor $bd
    ld d, l
    ld a, [hl]
    ld h, d
    ld b, $f0
    push bc
    xor b
    inc h
    ld h, $68
    cp $0f
    ld hl, $34b3
    ld l, l
    jr @-$0c

    ld e, e
    add hl, de
    ld hl, sp+$73
    ld [hl+], a
    or h
    ld e, l
    add b
    ld a, $ae
    dec b
    ret nc

    jp $cfa5


    adc c
    cp d
    db $ed
    ld a, [$0472]
    cp a
    ld a, d
    ld b, $f7
    db $ed
    add c
    or e
    inc hl
    rla

Call_000_1d20:
    ldh [$57], a
    adc l
    add hl, sp
    ld h, d
    push bc
    ld bc, $39db
    or l
    sub e
    dec b
    and b
    dec b
    sub c
    xor c
    dec hl
    ld a, [bc]
    or e
    daa
    ld a, h
    ld e, e
    and d
    jp nz, $d1f8

    ld [hl], h
    pop bc
    ld [hl], $f4
    adc [hl]
    ld b, c
    ld h, b
    adc $70
    db $f4
    adc $58
    add d
    ld [c], a
    jp z, $c398

    xor e
    pop af
    dec h
    sbc e
    ld b, $a4
    add e
    adc e
    dec h
    jr z, jr_000_1db0

    ret nc

    ld b, c
    ld [hl+], a
    ret c

    jp c, $ffb7

    ld c, l
    ld c, e
    ld sp, hl
    xor c
    push bc
    dec e
    ld h, c
    adc h
    ld [hl], l
    call nz, $d5ef
    cp $3b
    or a
    inc l
    inc d
    dec [hl]
    call c, $9bf4
    ld [bc], a
    ld d, a
    adc e
    ld h, $86
    xor c
    sub e
    ld l, h
    or b
    xor l
    rst $00
    ccf
    ld d, l
    ld d, c
    rst $00
    ld hl, sp+$5f
    and e
    inc hl
    adc d
    add hl, sp
    ld sp, hl
    ld [hl], c
    add hl, sp
    ld [hl], h
    ld c, l
    rra
    ld hl, sp+$6a
    jp nz, $b050

    add h
    scf
    or b
    ld d, [hl]
    add hl, de
    cp c
    call c, $c2a1
    db $d3
    ld [hl-], a
    ld e, l
    ldh a, [$7a]
    ld c, b
    dec sp
    db $db
    ld e, $bf
    scf
    inc de
    ld l, e
    adc h
    ld c, a
    sbc b
    or h
    sub b
    or h
    pop bc
    ld [hl], a

jr_000_1db0:
    ld c, a
    cpl
    nop
    dec a
    ld bc, $5f00
    ld e, d
    sbc [hl]
    ld l, a
    db $d3
    ld c, c
    sbc $f3
    adc a
    ret nc

    dec bc
    adc c
    sbc e
    inc hl
    pop hl
    and e
    sub [hl]
    cp l
    ld h, b
    jr nc, jr_000_1e16

    ld l, h
    ld h, a
    sub b
    sub a
    add b
    xor d
    ld c, a
    nop
    and c
    jp nz, $f42d

    ld l, d
    inc bc
    db $76
    ld d, e
    ld l, [hl]
    db $fc
    ld [hl], b
    add hl, de
    or [hl]
    rlca
    nop
    ld_long a, $ff79
    and d
    xor [hl]
    rst $18
    rst $00
    adc l
    push af
    ld sp, hl
    ld d, [hl]
    ld d, b
    cp e
    ld h, $57
    ld a, [hl]
    ldh [$65], a
    ld a, l
    sub e
    ld d, $b4
    ld b, d
    add l
    sub $ef
    db $eb
    ld e, a
    xor d
    adc a
    dec h
    call nz, $aaeb
    ld [hl], a
    ld [hl], $8d
    and c
    rst $00
    ld l, [hl]
    push hl
    ld b, $21
    ld sp, $350f
    ld c, b
    call nc, Call_000_093c
    or a
    add e

jr_000_1e16:
    ld l, e
    ld l, c
    rlca
    ld l, b
    call Call_000_1d20
    xor l
    ld l, $02
    ld a, h
    ld e, [hl]
    dec c
    bit 2, [hl]
    dec [hl]
    ld b, l
    cp c
    ld a, a
    rst $10
    db $e3
    sub $51
    ld l, d
    ld a, [c]
    rst $00
    sbc l
    ei
    ld a, [c]
    rst $28
    jr z, @+$71

    db $10
    ld d, [hl]
    adc c
    sub $41
    and e
    sbc e
    add $25
    add h
    ld l, h

jr_000_1e41:
    add hl, sp
    xor d
    adc [hl]
    dec [hl]
    ld b, [hl]
    ld b, d
    ld [hl], e
    sbc a
    ld e, $d4
    rst $28
    or h
    ld h, [hl]
    ld [hl], a
    dec c
    pop de
    dec c
    ld a, e
    rst $18
    ld b, [hl]
    add l
    ld hl, sp+$0a
    db $e4
    db $eb
    reti


    ld a, [c]
    ld l, e
    call $90a1
    sub c
    adc l
    jr nc, @-$24

    ret z

    db $fd
    ld a, e
    ld d, e
    rst $28
    ld l, [hl]
    ld h, $d5
    add c
    and [hl]
    cp e
    and e
    rst $38
    ld l, e
    ld a, h
    ld b, e
    and $77
    adc e
    jr nz, jr_000_1e41

    ld e, [hl]
    and c
    sbc $3c
    ld [de], a
    sbc h
    call $7c3e
    ld l, [hl]
    sub a
    dec d
    sub l
    rra
    reti


    ld b, l
    rl l
    ld [hl], b
    pop af
    ret z

    ld l, l
    ld [hl], h
    ld a, c
    jp Jump_000_2d4b


    jr nc, jr_000_1f14

    ld d, c
    sbc b
    xor e
    inc sp
    ld l, l
    ld a, [hl+]
    adc d
    rst $20
    dec [hl]
    ld b, a
    push bc
    ei
    ld l, h
    ld a, e
    jp nc, $a1d2

    ld a, [hl+]
    and $ac
    add hl, hl
    db $d3
    ld a, c
    ld [$d04c], a
    or h
    db $e3
    ld d, [hl]
    ld [hl], d
    ld l, b
    xor $45
    jp nz, $8ef4

    add hl, sp
    ld [hl], h
    rlca
    cp $39
    ld h, e
    sbc [hl]
    ld l, $61
    ld e, b
    jp z, $d9e5

    and b
    db $db
    add $f3
    xor c
    db $ec
    sub b
    ldh a, [$f5]
    rst $08
    dec [hl]
    sub h
    xor [hl]
    ld h, c
    ld d, l
    jp hl


    ld l, e
    ld [$bab2], a
    ld b, b
    pop de
    sbc $46
    ret z

    push hl
    dec h
    or d
    ld h, c
    rlca
    adc h
    ld l, $99
    inc a
    cpl
    rlca
    ld e, c
    nop
    ld b, d
    rrca
    db $fc
    db $10
    add [hl]
    db $f4
    ld c, [hl]
    sbc $22
    ld d, c
    xor b
    db $ed
    ld b, $ff
    adc e
    db $fd
    ld [hl], h
    or c
    ld d, e
    ld c, e
    ei
    sub e
    sub $49
    add hl, bc
    db $dd
    inc c
    call nc, Call_000_36eb
    ld [hl], b
    sub h
    ld h, [hl]
    rst $38
    add h
    ld c, a
    sub h
    inc c
    ld e, h

jr_000_1f14:
    add hl, hl
    dec [hl]
    rla
    adc [hl]
    jr jr_000_1f61

    add hl, hl
    pop de
    xor h
    inc bc
    ld a, [de]
    and l
    cp l
    add hl, sp
    ld a, a
    inc a
    add hl, bc
    inc a
    dec h
    sub c
    ld [hl-], a
    ld b, $3d
    ld hl, sp-$6c
    jp $939f


    sbc h
    ld a, [c]
    ld a, c
    rst $20
    sub h
    ld c, e
    ld d, b
    sub c
    ld e, h
    sub [hl]
    sub c
    db $10
    add h
    and $50
    ld sp, $c96d
    inc hl
    rst $18
    rrca
    rst $38
    rst $28
    ld b, $7b
    cp h
    ld [hl], c
    rst $30
    ld e, $3b
    xor $68
    inc [hl]
    ld hl, $4f04
    ld e, h
    ld a, a
    ld a, $1b
    dec sp
    res 7, [hl]
    db $10
    ld de, $ec0c
    rra
    cpl

jr_000_1f61:
    add c
    xor d
    ld a, [c]
    db $ec
    db $ec
    adc d
    adc d
    xor $ee
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ret nz

    ret nz

    xor $ee
    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, [hl]
    ld c, [hl]
    add sp, -$18
    xor [hl]
    xor [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    or b
    or b
    xor e
    xor e
    or b
    or b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec hl
    dec hl
    cp e
    cp e
    dec hl
    dec hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and d
    and d
    ld [hl+], a
    ld [hl+], a
    cp e
    cp e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    inc bc
    inc bc
    inc bc
    inc bc
    add e
    add e
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr z, jr_000_1ffe

    cp b
    cp b
    sub b
    sub b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add hl, sp
    add hl, sp
    dec sp
    dec sp
    ld a, [hl+]
    ld a, [hl+]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec sp
    dec sp
    sub c
    sub c
    sub c
    sub c
    nop
    nop
    nop
    nop

jr_000_1ffe:
    nop
    nop
    nop
    nop
    nop
    nop
    add e
    add e
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor e
    xor e
    dec hl
    dec hl
    cp d
    cp d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl-], a
    ld [hl-], a
    cp d
    cp d
    xor d
    xor d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ldh [$e0], a
    ret nz

    ret nz

    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld l, [hl]
    ld l, [hl]
    ld c, d
    ld c, d
    adc $ce
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    call z, $eecc
    xor $aa
    xor d
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and b
    and b
    ldh [$e0], a
    ld b, b
    ld b, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    xor [hl]
    xor [hl]
    ld [$4eea], a
    ld c, [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    and b
    and b
    and b
    and b
    ldh [$e0], a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    adc $ce
    xor d
    xor d
    adc $ce
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    db $eb
    db $eb
    and c
    and c
    and c
    and c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add e
    add e
    ld [bc], a
    ld [bc], a
    inc bc
    inc bc
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec sp
    dec sp
    or c
    or c
    cp c
    cp c
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add e
    add e
    ld bc, $0101
    ld bc, $0000
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    cp b
    cp b
    jr z, jr_000_2110

    jr c, jr_000_2122

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld a, [hl-]
    ld a, [hl-]
    ld a, [hl-]
    ld a, [hl-]
    inc hl
    inc hl
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [de], a
    ld [de], a
    dec sp
    dec sp
    xor c
    xor c
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_2110:
    nop
    nop
    nop
    nop
    add b
    add b
    add b
    add b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_2122:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Jump_000_2d4b:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_2e24:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_31f3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Call_000_36eb:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
