Route32PokeCenter1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  5,  7, ROUTE_32, 1
	warp_event  6,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  1, SIGNPOST_READ, PokemonJournalKurtScript

	db 4 ; object events
	pc_nurse_event  5, 1
	object_event  3,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x69b55, -1
	object_event  8,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x69cac, -1
	object_event  0,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route32PokeCenter1FPokefanMScript, -1

PokemonJournalKurtScript:
	setflag ENGINE_READ_KURT_JOURNAL
	thistext

	text "#mon Journal"

	para "Special Feature:"
	line "Craftsman Kurt!"

	para "Kurt does not let"
	line "anyone near while"

	para "he is making #"
	line "Balls except his"

	para "granddaughter"
	line "Maizie."
	done

FishingGuruScript_0x69b55:
	checkevent EVENT_GOT_OLD_ROD
	iftrue_jumptextfaceplayer .DoneText
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	buttonsound
	verbosegiveitem OLD_ROD
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.IntroText:
	text "This is a great"
	line "fishing spot."

	para "You saw people"
	line "fishing? How"
	cont "about you?"

	para "Would you like one"
	line "of my Rods?"
	done

.YesText:
	text "Heh, that's good"
	line "to hear."

	para "Now you're an"
	line "angler too!"
	done

.AfterText:
	text "Fishing is great!"

	para "If there's water,"
	line "be it the sea or a"

	para "stream, try out"
	line "your Rod."
	done

.NoText:
	text "Oh. That's rather"
	line "disappointing…"
	done

.DoneText:
	text "Yo, kid. How are"
	line "they biting?"
	done

Route32PokeCenter1FPokefanMScript:
	checkevent EVENT_GOT_LURE_BALL_FROM_FRENCHMAN
	iftrue_jumptextfaceplayer .Text5
	faceplayer
	opentext
	writetext .Text1
	yesorno
	iftrue .Yes
	writetext .Text2
	jump .Continue
.Yes:
	writetext .Text3
.Continue
	buttonsound
	verbosegiveitem LURE_BALL
	iffalse .NoRoom
	setevent EVENT_GOT_LURE_BALL_FROM_FRENCHMAN
	thisopenedtext

	text "This Ball easily"
	line "catches #mon"
	cont "hooked on a Rod!"

	para "Kurt of Azalea"
	line "Town made it from"
	cont "an Apricorn."

	para "Apricorns,"
	line "hourrah!"
	done

.NoRoom
	endtext

.Text1:
	text "Bonjour. How are"
	line "you? Do you know"
	cont "about Apricorns?"
	done

.Text2:
	text "Non? What a waste!"
	line "I will show you"

	para "how great Apri-"
	line "corns are!"
	done

.Text3:
	text "Youpi! Way to go!"
	line "I feel so great,"

	para "I want to give you"
	line "this!"
	done

.Text5:
	text "Kurt is the hero"
	line "of every Apricorn"
	cont "collector."

	para "Apricorns,"
	line "hourrah!"
	done

UnknownText_0x69cac:
	text "What should I make"
	line "my #mon hold?"

	para "Maybe an item that"
	line "increases Attack"
	cont "power…"
	done
