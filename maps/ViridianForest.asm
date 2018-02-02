ViridianForest_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  3,  5, VIRIDIAN_FOREST_PEWTER_GATE, 1
	warp_event 18, 47, VIRIDIAN_FOREST_VIRIDIAN_GATE, 1
	warp_event 19, 47, VIRIDIAN_FOREST_VIRIDIAN_GATE, 2

	db 0 ; coord events

	db 11 ; bg events
	bg_event  4,  7, SIGNPOST_JUMPTEXT, ViridianForestSignText1
	bg_event  6, 26, SIGNPOST_JUMPTEXT, ViridianForestSignText2
	bg_event 28, 19, SIGNPOST_JUMPTEXT, ViridianForestSignText3
	bg_event 18, 34, SIGNPOST_JUMPTEXT, ViridianForestSignText4
	bg_event 26, 42, SIGNPOST_JUMPTEXT, ViridianForestSignText5
	bg_event 20, 44, SIGNPOST_JUMPTEXT, ViridianForestSignText6
	bg_event 32, 44, SIGNPOST_ITEM + MAX_ETHER, EVENT_VIRIDIAN_FOREST_HIDDEN_MAX_ETHER
	bg_event 18, 43, SIGNPOST_ITEM + FULL_HEAL, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_HEAL
	bg_event  4, 43, SIGNPOST_ITEM + MULCH, EVENT_VIRIDIAN_FOREST_HIDDEN_MULCH
	bg_event 30,  9, SIGNPOST_ITEM + REVIVE, EVENT_VIRIDIAN_FOREST_HIDDEN_REVIVE
	bg_event  3, 14, SIGNPOST_ITEM + LEAF_STONE, EVENT_VIRIDIAN_FOREST_HIDDEN_LEAF_STONE

	db 7 ; object events
	object_event 29, 42, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerBug_maniacDane, -1
	object_event 33, 35, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 5, TrainerBug_maniacDion, -1
	object_event 32, 21, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, TrainerBug_maniacStacey, -1
	object_event 31,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerBug_maniacEllis, -1
	object_event  5, 24, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, TrainerBug_maniacAbner, -1
	itemball_event 14, 31, DIRE_HIT, 1, EVENT_ROUTE_2_DIRE_HIT
	itemball_event  3, 33, MAX_POTION, 1, EVENT_ROUTE_2_MAX_POTION

TrainerBug_maniacDane:
	trainer BUG_MANIAC, DANE, EVENT_BEAT_BUG_MANIAC_DANE, BugManiacDaneSeenText, BugManiacDaneBeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer BugManiacDaneAfterText

TrainerBug_maniacDion:
	trainer BUG_MANIAC, DION, EVENT_BEAT_BUG_MANIAC_DION, BugManiacDionSeenText, BugManiacDionBeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer BugManiacDionAfterText

TrainerBug_maniacStacey:
	trainer BUG_MANIAC, STACEY, EVENT_BEAT_BUG_MANIAC_STACEY, BugManiacStaceySeenText, BugManiacStaceyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer BugManiacStaceyAfterText

TrainerBug_maniacEllis:
	trainer BUG_MANIAC, ELLIS, EVENT_BEAT_BUG_MANIAC_ELLIS, BugManiacEllisSeenText, BugManiacEllisBeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer BugManiacEllisAfterText

TrainerBug_maniacAbner:
	trainer BUG_MANIAC, ABNER, EVENT_BEAT_BUG_MANIAC_ABNER, BugManiacAbnerSeenText, BugManiacAbnerBeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer BugManiacAbnerAfterText

BugManiacDaneSeenText:
	text "Welcome to"
	line "Viridian Forest."
	cont "Enjoy my Bug-type"
	cont "#mon."
	done

BugManiacDaneBeatenText:
	text "That's wonderful…"
	done

BugManiacDaneAfterText:
	text "Pretty impressive!"

	para "I'm sure you can"
	line "go anywhere with"
	cont "that skill!"
	done

BugManiacDionSeenText:
	text "Shh! Be quiet! The"
	line "bug #mon will"
	cont "run away!"
	done

BugManiacDionBeatenText:
	text "Phew…"
	done

BugManiacDionAfterText:
	text "Bug-type #mon"
	line "make all kinds of"
	cont "sounds."

	para "For bug #mon"
	line "fans, knowing how"
	cont "to distinguish"
	cont "them is key!"
	done

BugManiacStaceySeenText:
	text "Wow, that's a HUGE"
	line "#mon!"

	para "…"
	line "…What kind of"
	cont "trainer?!"
	done

BugManiacStaceyBeatenText:
	text "I couldn't catch"
	line "it!"
	done

BugManiacStaceyAfterText:
	text "Has anyone ever"
	line "told you that from"
	cont "behind you look"
	cont "like a Venonat?"
	done

BugManiacEllisSeenText:
	text "There's nothing"
	line "more efficient and"
	cont "beautiful than a"
	cont "Bug-type #mon."
	done

BugManiacEllisBeatenText:
	text "I lost"
	line "beautifully!"
	done

BugManiacEllisAfterText:
	text "If this is it,"
	line "then I don't mind"
	cont "losing!"
	done

BugManiacAbnerSeenText:
	text "Many people prefer"
	line "solid bug #mon"
	cont "over squishy bug"
	cont "#mon."
	done

BugManiacAbnerBeatenText:
	text "Thanks for your"
	line "hard work, my"
	cont "lovely #mon…"
	done

BugManiacAbnerAfterText:
	text "Doesn't matter what"
	line "kind of #mon--"

	para "as long as you"
	line "like them, they"
	cont "all look cute."
	done

ViridianForestSignText1:
	text "Leaving"
	line "Viridian Forest"
	cont "Pewter City Ahead"
	done

ViridianForestSignText2:
	text "Trainer Tips"

	para "No stealing of"
	line "#mon from"
	cont "other trainers!"
	cont "Catch only wild"
	cont "#mon!"
	done

ViridianForestSignText3:
	text "Trainer Tips"

	para "Contact Prof.Oak"
	line "via PC to get"
	cont "your #dex"
	cont "evaluated!"
	done

ViridianForestSignText4:
	text "For poison, use"
	line "Antidote! Get it"
	cont "at #mon Marts!"
	done

ViridianForestSignText5:
	text "Trainer Tips"

	para "If you want to"
	line "avoid battles,"
	cont "stay away from"
	cont "grassy areas!"
	done

ViridianForestSignText6:
	text "Trainer Tips"

	para "Weaken #mon"
	line "before attempting"
	cont "capture!"

	para "When healthy,"
	line "they may escape!"
	done
