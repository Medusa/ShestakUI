local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	ShestakUI personal configuration file
--	BACKUP THIS FILE BEFORE UPDATING!
--	ATTENTION: When saving changes to a file encoded file should be in UTF8
----------------------------------------------------------------------------------------
--	Configuration example:
----------------------------------------------------------------------------------------
-- if T.name == "MegaChar" then
--		C["chat"].width = 100500
--		C["tooltip"].cursor = false
--		C["unitframe_class_bar"].totem = false
--		C["position"].tooltip = {"BOTTOMRIGHT", Minimap, "TOPRIGHT", 2, 5}
--		C["position"].bottom_bars = {"BOTTOM", UIParent, "BOTTOM", 2, 8}
--		C["position"].unitframes.tank = {"BOTTOMLEFT", UIParent, "BOTTOM", 176, 68}
-- end
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	Per Class Config (overwrite general)
--	Class need to be UPPERCASE
----------------------------------------------------------------------------------------
if T.class == "DRUID" then

end

----------------------------------------------------------------------------------------
--	Per Character Name Config (overwrite general and class)
--	Name need to be case sensitive
----------------------------------------------------------------------------------------
if T.name == "CharacterName" then

end

----------------------------------------------------------------------------------------
--	Per Max Character Level Config (overwrite general, class and name)
----------------------------------------------------------------------------------------
if T.level ~= MAX_PLAYER_LEVEL then

end

----------------------------------------------------------------------------------------
--	Oz@Pozzo dell'Eternità Config
--------------------------------------------------------------------------------------
if T.oz == true then
	C["font"].chat_font = [[Interface\AddOns\ShestakUI\Media\Fonts\homespun.ttf]]
	C["font"].chat_font_style = "OUTLINEMONOCHROME"
	C["font"].chat_font_shadow = false
	C["media"].border_color = {0.2, 0.2, 0.2, 1}
	C["position"].minimap = {"BOTTOM", UIParent, "BOTTOM", 205, 52}
	C["position"].chat = {"BOTTOM", Minimap, "BOTTOM", -338, -26}
	C["position"].bn_popup = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 21, 21}
	C["position"].vehicle = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 21, 48}
	C["position"].ghost = {"TOPLEFT", "oUF_Player", "TOPLEFT", -2, 65}
	C["position"].quest = {"TOPRIGHT", UIParent, "TOPRIGHT", -276, -88}
	C["position"].loot = {"CENTER", UIParent, "CENTER", -422, -212}
	C["position"].group_loot = {"TOP", UIParent, "TOP", 0, -100}
	C["position"].threat_meter = {"BOTTOM", "oUF_Target", "BOTTOM", -193, -14}
	C["position"].raid_cooldown = {"RIGHT", UIParent, "RIGHT", -243, -236}
	C["position"].enemy_cooldown = {"BOTTOMLEFT", "oUF_Target", "BOTTOMRIGHT", 5, -67}
	C["position"].bg_score = {"LEFT", UIParent, "BOTTOMLEFT", 21, 11}
	C["position"].player_buffs = {"TOPRIGHT", UIParent, "TOPRIGHT", -21, -21}
	C["position"].raid_buffs = {"BOTTOMLEFT", Minimap, "BOTTOMLEFT", -2, -25}
	C["position"].top_panel = {"BOTTOM", Minimap, "BOTTOM", -365, 141}
	C["position"].raid_utility = {"TOPLEFT", UIParent, "TOPLEFT", 405, -23}
	C["position"].extra_button = {"RIGHT", "oUF_Player", "BOTTOM", -53, -126}
	C["position"].bottom_bars = {"BOTTOMRIGHT", Minimap, "TOPLEFT", 132, 5}
	C["position"].right_bars = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -21, 296}
	C["position"].stance_bar = {"BOTTOM", UIParent, "BOTTOM", -322, 2}
	C["position"].vehicle_bar = {"BOTTOMRIGHT", ActionButton1, "BOTTOMLEFT", 353, 0}
	C["position"].unitframes.player = {"BOTTOMLEFT", Minimap, "LEFT", -249, 279}
	C["position"].unitframes.target = {"BOTTOMLEFT", "oUF_Player", "TOPRIGHT", 169, -27}
	C["position"].unitframes.party_heal = {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 7, -19}
	C["position"].unitframes.raid_heal = {"TOPLEFT", UIParent, "TOPLEFT", 23, -23}
	C["position"].unitframes.party_dps = {"BOTTOMLEFT", UIParent, "LEFT", 23, -23}
	C["position"].unitframes.raid_dps = {"TOPLEFT", UIParent, "TOPLEFT", 23, -23}
	C["position"].unitframes.arena = {"BOTTOMRIGHT", UIParent, "RIGHT", -60, 122}
	C["position"].unitframes.boss = {"BOTTOMRIGHT", UIParent, "RIGHT", -23, 122}
	C["position"].unitframes.tank = {"BOTTOMRIGHT", ChatFrame1, "BOTTOMLEFT", -142, 8}
	C["position"].unitframes.player_castbar = {"BOTTOMLEFT", "oUF_Player", "LEFT", -11, -144}
	C["general"].welcome_message = false
	C["misc"].hide_button = false
	C["misc"].new_skada_bg = true
	C["automation"].auction_house_undercut = true
	C["automation"].logging_combat = true
	C["skins"].skada = false
	C["combattext"].scrollable = true
	C["combattext"].dk_runes = false
	C["reminder"].raid_buffs_size = 19.8
	C["raidcooldown"].width = 186
	C["threat"].height = 16
	C["threat"].width = 155
	C["threat"].bar_rows = 2
	C["chat"].top_edit_box = false
	C["chat"].background = true
	C["chat"].width = 254
	C["chat"].height = 130
	C["chat"].chat_bar = false
	C["chat"].tabs_mouseover = false
	C["minimap"].size = 134
	C["minimap"].toggle_menu = false
	C["minimap"].farm_mode = false
	C["nameplate"].health_value = true
	C["actionbar"].hotkey = false
	C["actionbar"].button_size = 24.4
	C["actionbar"].stancebar_hide = true
	C["aura"].player_buff_size = 24.4
	C["aura"].fot_debuffs = true
	C["aura"].pet_debuffs = true
	C["aura"].tot_debuffs = true
	C["unitframe"].own_color = true
	C["unitframe"].color_value = true
	C["unitframe"].bar_color_value = true
	C["unitframe"].alternative_portraits = true
	C["unitframe"].class_icons_portraits = false
	C["unitframe"].plugins_fader = true
	C["raidframe"].deficit_health = true
	C["raidframe"].raid_tanks_tt = true
	C["raidframe"].raid_groups = 8
	C["raidframe"].raid_portraits = true
	C["toppanel"].enable = true
	C["toppanel"].mouseover = false
	C["toppanel"].height = 24
	C["toppanel"].width = 206
	C["stats"].friend = false
	C["stats"].bags = false
	C["stats"].experience = false	
end

----------------------------------------------------------------------------------------
--	Nagiko@Pozzo dell'Eternità Config
----------------------------------------------------------------------------------------
if T.name == "Nagiko" and T.realm == "Pozzo dell'Eternità" then
	C["font"].stats_font = C.media.normal_font
	C["font"].stats_font_style = "OUTLINE"
	C["font"].stats_font_size = 14
	C["font"].chat_tabs_font = C.media.normal_font
	C["font"].chat_tabs_font_style = "OUTLINE"
	C["font"].chat_tabs_font_size = 12
	C["font"].action_bars_font = C.media.normal_font
	C["font"].action_bars_font_style = "OUTLINE"
	C["font"].action_bars_font_size = 12
	C["font"].raid_cooldowns_font = C.media.normal_font
	C["font"].raid_cooldowns_font_style = "OUTLINE"
	C["font"].raid_cooldowns_font_shadow = true
	C["font"].raid_cooldowns_font_size = 12
	C["font"].threat_meter_font = C.media.normal_font
	C["font"].threat_meter_font_style = "OUTLINE"
	C["font"].threat_meter_font_shadow = true
	C["font"].threat_meter_font_size = 12
	C["font"].cooldown_timers_font = C.media.normal_font
	C["font"].cooldown_timers_font_style = "OUTLINE"
	C["font"].cooldown_timers_font_size = 16
	C["font"].loot_font = C.media.normal_font
	C["font"].loot_font_style = "OUTLINE"
	C["font"].loot_font_size = 12
	C["font"].stylization_font = C.media.normal_font
	C["font"].stylization_font_style = "OUTLINE"
	C["font"].stylization_font_size = 12
	C["font"].bags_font = C.media.normal_font
	C["font"].bags_font_style = "OUTLINE"
	C["font"].bags_font_size = 12
	C["position"].threat_meter = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -245, 24}
	C["position"].player_buffs = {"TOPLEFT", Minimap, "TOPLEFT", -572, 2}
	C["position"].stance_bar = {"TOPLEFT", UIParent, "TOPLEFT", 323, -21}
	C["position"].micro_menu = {"TOPLEFT", UIParent, "TOPLEFT", 21, -21}
	C["position"].unitframes.arena = {"RIGHT", oUF_Target, "RIGHT", -242, 7}
	C["position"].unitframes.boss = {"RIGHT", oUF_Target, "RIGHT", -242, 7}
	C["media"].border_color = {0.6, 0.196078, 0.8, 1}
	C["misc"].profession_database = true
	C["automation"].auction_house_undercut = true
	C["combattext"].enable = false
	C["pulsecooldown"].enable = true
	C["pulsecooldown"].sound = true
	C["pulsecooldown"].anim_scale = 2
	C["pulsecooldown"].threshold = 5
	C["chat"].background = true
	C["chat"].tabs_mouseover = false
	C["bag"].button_size = 35
	C["minimap"].tracking_icon = true
	C["actionbar"].button_size = 35
	C["actionbar"].split_bars = true
	C["actionbar"].toggle_mode = false
	C["actionbar"].rightbars_mouseover = false
	C["actionbar"].micromenu = true
	C["aura"].player_buff_size = 35	
	C["aura"].pet_debuffs = true
	C["aura"].player_aura_only = true
	C["unitframe"].alternative_portraits = true
	C["raidframe"].raid_portraits = true
end

-- Edit by Oz of shestakdotorg --
