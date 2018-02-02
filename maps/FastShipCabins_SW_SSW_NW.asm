FastShipCabins_SW_SSW_NW_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  1, SIGNPOST_READ, FastShipBed
	bg_event  7,  2, SIGNPOST_READ, FastShipBed

	db 5 ; object events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5, 27, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerRichBoyWinston, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerGuitaristmClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, FirebreatherLyleScript

FirebreatherLyleScript:
	end_if_just_battled
	jumptextfaceplayer UnknownText_0x75b52

TrainerBug_catcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, Bug_catcherKenSeenText, Bug_catcherKenBeatenText, 0, Bug_catcherKenScript

Bug_catcherKenScript:
	end_if_just_battled
	jumptextfaceplayer UnknownText_0x75bd5

TrainerRichBoyWinston:
	trainer RICH_BOY, WINSTON, EVENT_BEAT_RICH_BOY_WINSTON, RichBoyWinstonSeenText, RichBoyWinstonBeatenText, 0, RichBoyWinstonScript

RichBoyWinstonScript:
	end_if_just_battled
	jumptextfaceplayer RichBoyWinstonAfterText

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, BeautyCassieScript

BeautyCassieScript:
	end_if_just_battled
	jumptextfaceplayer UnknownText_0x75c43

TrainerGuitaristmClyde:
	trainer GUITARISTM, CLYDE, EVENT_BEAT_GUITARISTM_CLYDE, GuitaristmClydeSeenText, GuitaristmClydeBeatenText, 0, GuitaristmClydeScript

GuitaristmClydeScript:
	end_if_just_battled
	opentext
	checkcode VAR_BATTLEPOINTS
	if_greater_than 0, .BattleTower
	jumpopenedtext UnknownText_0x75d65

.BattleTower:
	jumpopenedtext UnknownText_0x75cfe

FastShipBed:
	showtext FastShipBedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext FastShipBedText2
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue UnknownScript_0x75ae1
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue UnknownScript_0x75ae2
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue UnknownScript_0x75ae2
UnknownScript_0x75ae1:
	end

UnknownScript_0x75ae2:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue UnknownScript_0x75af7
	showtext FastShipArrivedVermilionText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

UnknownScript_0x75af7:
	showtext FastShipArrivedOlivineText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FirebreatherLyleSeenText:
	text "I'm going to Kanto"
	line "to put on fire-"
	cont "breathing shows!"
	done

FirebreatherLyleBeatenText:
	text "Fizzle… The"
	line "flame's tiny…"
	done

UnknownText_0x75b52:
	text "I guess fire is"
	line "weak on the sea."

	para "It doesn't matter?"
	line "Really?"
	done

Bug_catcherKenSeenText:
	text "I'm visiting my"
	line "grandma to catch"
	cont "me some bugs!"
	done

Bug_catcherKenBeatenText:
	text "Ooh, wow."
	line "You're tough!"
	done

UnknownText_0x75bd5:
	text "You can find lots"
	line "of #mon in the"
	cont "trees of Johto!"
	done

RichBoyWinstonSeenText:
	text "There's no way you"
	line "could afford a"
	cont "ticket."

	para "It looks like we've"
	line "got a stowaway!"
	done

RichBoyWinstonBeatenText:
	text "Wow! Who'd you buy"
	line "your #mon from?"
	done

RichBoyWinstonAfterText:
	text "This boat is so"
	line "drab."
	done

BeautyCassieSeenText:
	text "I'm trying to"
	line "forget my woes."
	cont "Let's battle!"
	done

BeautyCassieBeatenText:
	text "My heart weeps…"
	done

UnknownText_0x75c43:
	text "A voyage is best"
	line "for getting over"
	cont "a broken heart."

	para "But a Fast Ship"
	line "trip is too short"
	cont "for grieving."
	done

GuitaristmClydeSeenText:
	text "I'm going to audi-"
	line "tion my songs at"

	para "Goldenrod's Radio"
	line "Station."
	done

GuitaristmClydeBeatenText:
	text "Yowza!"
	line "Total distortion!"
	done

UnknownText_0x75d65:
	text "Speaking of the"
	line "Radio Station,"

	para "what's this week's"
	line "lucky number?"
	done

UnknownText_0x75cfe:
	text "I was going to"
	line "make my debut at"
	cont "the Battle Tower…"

	para "I should go back"
	line "to Vermilion and"
	cont "redo my training…"
	done

FastShipBedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	done

FastShipBedText2:
	text "Ah, refreshed and"
	line "restored!"
	done

FastShipArrivedOlivineText:
	text "Fast Ship S.S.Aqua"
	line "has arrived in"
	cont "Olivine City."
	done

FastShipArrivedVermilionText:
	text "Fast Ship S.S.Aqua"
	line "has arrived in"
	cont "Vermilion City."
	done
