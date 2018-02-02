YellowForestGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  4,  0, YELLOW_FOREST, 1
	warp_event  5,  0, YELLOW_FOREST, 2
	warp_event  4,  7, ROUTE_48, 1
	warp_event  5,  7, ROUTE_48, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, YellowForestGateOfficerText, -1
	object_event  9,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YellowForestGateNurseScript, -1
	object_event  9,  4, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_POKEMON, CHANSEY, YellowForestGateChanseyText, -1
	object_event  6,  4, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_COMMAND, pokemart, MARTTYPE_INFORMAL, MART_YELLOW_FOREST, -1

YellowForestGateNurseScript:
	showtextfaceplayer YellowForestGateNurseText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumptext YellowForestGateNurseHealedText

YellowForestGateOfficerText:
	text "There are rare"
	line "#mon in"
	cont "Yellow Forest!"

	para "Don't forget to"
	line "bring # Balls!"

	para "That guy is sell-"
	line "ing some spares."
	done

YellowForestGateNurseText:
	text "Your #mon look"
	line "worn out."

	para "Let me heal them"
	line "for you."
	done

YellowForestGateNurseHealedText:
	text "All done!"

	para "Your #mon"
	line "are fully healed."
	done

YellowForestGateChanseyText:
	text "Chansey: Sii!"
	done
