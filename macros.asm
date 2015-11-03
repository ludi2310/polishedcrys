INCLUDE "macros/enum.asm"
INCLUDE "macros/basestats.asm"

INCLUDE "macros/event.asm"
INCLUDE "macros/sound.asm"
INCLUDE "macros/text.asm"
INCLUDE "macros/charmap.asm"
INCLUDE "macros/move_effect.asm"
INCLUDE "macros/move_anim.asm"
INCLUDE "macros/movement.asm"
INCLUDE "macros/map.asm"
INCLUDE "macros/pic.asm"
INCLUDE "macros/predef.asm"
INCLUDE "macros/rst.asm"
INCLUDE "macros/mobile.asm"
INCLUDE "macros/trainer.asm"



RGB: MACRO
	dw ((\3) << 10) + ((\2) << 5) + (\1)
	ENDM


percent EQUS "* $ff / 100"


dwb: MACRO
	dw \1
	db \2
	ENDM

dbw: MACRO
	db \1
	dw \2
	ENDM

dbbw: MACRO
	db \1, \2
	dw \3
	ENDM

dbww: MACRO
	db \1
	dw \2, \3
	ENDM

dbwww: MACRO
	db \1
	dw \2, \3, \4
	ENDM

dn: MACRO
	rept _NARG / 2
	db (\1) << 4 + (\2)
	shift
	shift
	endr
	ENDM

dx: MACRO
x = 8 * ((\1) - 1)
	rept \1
	db ((\2) >> x) & $ff
x = x + -8
	endr
	ENDM

dt: MACRO ; three-byte (big-endian)
	dx 3, \1
	ENDM

dd: MACRO ; four-byte (big-endian)
	dx 4, \1
	ENDM

bigdw: MACRO ; big-endian word
	dx 2, \1
	ENDM

dba: MACRO ; dbw bank, address
	rept _NARG
	dbw BANK(\1), \1
	shift
	endr
	ENDM

dab: MACRO ; dwb address, bank
	rept _NARG
	dwb \1, BANK(\1)
	shift
	endr
	ENDM

lb: MACRO ; r, hi, lo
	ld \1, (\2) << 8 + (\3)
	ENDM

ln: MACRO ; r, hi, lo
	ld \1, (\2) << 4 + (\3)
	ENDM

bccoord equs "coord bc,"
decoord equs "coord de,"
hlcoord equs "coord hl,"

coord: MACRO
; register, x, y[, origin]
	if _NARG < 4
	ld \1, TileMap + SCREEN_WIDTH * (\3) + (\2)
	else
	ld \1, \4 + SCREEN_WIDTH * (\3) + (\2)
	endc
	ENDM

dwcoord: MACRO
	rept _NARG / 2
	dw TileMap + SCREEN_WIDTH * (\2) + (\1)
	shift
	shift
	endr
	ENDM

ldcoord_a: MACRO
	if _NARG < 3
	ld [TileMap + SCREEN_WIDTH * (\2) + (\1)], a
	else
	ld [\3 + SCREEN_WIDTH * (\2) + (\1)], a
	endc
	ENDM

lda_coord: MACRO
	if _NARG < 3
	ld a, [TileMap + SCREEN_WIDTH * (\2) + (\1)]
	else
	ld a, [\3 + SCREEN_WIDTH * (\2) + (\1)]
	endc
	ENDM

; pic animations
frame: MACRO
	db \1
	db \2
	ENDM
setrepeat: MACRO
	db $fe
	db \1
	ENDM
dorepeat: MACRO
	db $fd
	db \1
	ENDM
endanim: MACRO
	db $ff
	ENDM



sine_wave: MACRO
; \1: amplitude

x = 0
	rept $20
	; Round up.
	dw (sin(x) + (sin(x) & $ff)) >> 8
x = x + (\1) * $40000
	endr
ENDM


bcd: MACRO
	rept _NARG
	dn ((\1) % 100) / 10, (\1) % 10
	shift
	endr
ENDM

tiles EQUS "* $10"
tile EQUS "+ $10 *"

partymon: MACRO
	db \1
	db \2
	db \3, \4, \5, \6
	dw \7
	dt \8
rept 8
	shift
endr
rept 5
	bigdw \1
	shift
endr
	db \1, \2
	db \3, \4, \5, \6
rept 6
	shift
endr
	db \1
	db \2, \3, \4
	db \5
	db \6, \7
rept 7
	shift
endr
rept 7
	bigdw \1
	shift
endr
	db \1
ENDM
