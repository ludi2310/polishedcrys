ShamoutiTunnel_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 33,  9, SHAMOUTI_ISLAND, 3
	warp_event  5, 17, WARM_BEACH, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 21,  5, SIGNPOST_ITEM + NUGGET, EVENT_SHAMOUTI_TUNNEL_HIDDEN_NUGGET
	bg_event 32,  4, SIGNPOST_ITEM + LEAF_STONE, EVENT_SHAMOUTI_TUNNEL_HIDDEN_LEAF_STONE

	db 7 ; object events
	object_event 15, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, OreManiacScript, -1
	object_event 24, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerTamerOswald, -1
	object_event 24,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerFirebreatherTala, -1
	object_event  6,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSightseerfNoelle, -1
	object_event  3, 16, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightseermChester, -1
	itemball_event  3,  4, X_SPEED, 1, EVENT_SHAMOUTI_TUNNEL_X_SPEED
	itemball_event 12, 17, SMOOTH_ROCK, 1, EVENT_SHAMOUTI_TUNNEL_SMOOTH_ROCK

OreManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	buttonsound
	special Special_ChooseItem
	iffalse .NoItem
	special GetOreManiacPrice
	iffalse .WrongItem
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse .NoItem
	copybytetovar CurItem
	takeitem ITEM_FROM_MEM
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpopenedtext .ThankYouText

.NoItem:
	jumpopenedtext .NoItemText

.WrongItem:
	jumpopenedtext .WrongItemText

.GreetingText:
	text "Ore, ore, ore…"
	line "Ores that I adore!"

	para "I'll pay you well"
	line "for rare ores."

	para "Don't you have an"
	line "adorable ore that"
	cont "shakes my core?"
	done

.OfferText:
	text "That ore, it's"
	line "shaking me!"

	para "Will you sell it"
	line "for ¥@"
	deciram hMoneyTemp, 3, 7
	text "?"
	done

.ThankYouText:
	text "The deal is done!"
	line "I've scored an ore"
	cont "I can adore!"
	done

.WrongItemText:
	text "Huh? What on earth"
	line "is this?"

	para "You can't shake my"
	line "core with an ore"
	cont "so poor!"
	done

.NoItemText:
	text "Hmmm. My core won't"
	line "change."

	para "I hope you sell"
	line "one to me someday."
	done

TrainerTamerOswald:
	trainer TAMER, OSWALD, EVENT_BEAT_TAMER_OSWALD, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I was born a"
	line "circus man."

	para "Now I'm also a"
	line "fierce battler."
	done

.BeatenText:
	text "I couldn't tame"
	line "your #mon…"
	done

.AfterText:
	text "I'm a Tamer now,"
	line "but when I first"

	para "started out in"
	line "the circus I was"

	para "in the #mon"
	line "trapeze act."
	done

TrainerFirebreatherTala:
	trainer FIREBREATHER, TALA, EVENT_BEAT_FIREBREATHER_TALA, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "Roll up, roll up,"
	line "for my spectacular"
	cont "fire-breathing"
	cont "extravaganza!"
	done

.BeatenText:
	text "Burned out"
	line "already!"
	done

.AfterText:
	text "My fire-breathing"
	line "act is really"

	para "popular with the"
	line "tourists."

	para "Some even leave"
	line "donations!"
	done

TrainerSightseerfNoelle:
	trainer SIGHTSEERF, NOELLE, EVENT_BEAT_SIGHTSEERF_NOELLE, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "Oh my gosh!"
	line "You have #mon"

	para "that I haven't"
	line "seen before!"

	para "Can I take a"
	line "photo?"
	done

.BeatenText:
	text "Aww… I lost?"
	line "No problem!"

	para "Selfie! ♥"
	line "Click!"
	done

.AfterText:
	text "I'm making a photo"
	line "album to show my"
	cont "parents."

	para "Hey, don't look!"
	line "It's private!"
	done

TrainerSightseermChester:
	trainer SIGHTSEERM, CHESTER, EVENT_BEAT_SIGHTSEERM_CHESTER, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	jumptextfaceplayer .AfterText

.SeenText:
	text "I'm traveling"
	line "around the world."

	para "Which region"
	line "should I visit"
	cont "next?"
	done

.BeatenText:
	text "What a great"
	line "experience!"
	done

.AfterText:
	text "So you're from"
	line "Johto? I haven't"
	cont "been there!"

	para "Maybe I'll see"
	line "you in the Battle"
	cont "Tower."
	done
