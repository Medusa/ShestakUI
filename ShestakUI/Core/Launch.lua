﻿local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	First Time Launch and On Login file
----------------------------------------------------------------------------------------
local function InstallUI()
	-- Don't need to set CVar multiple time
	SetCVar("screenshotQuality", 8)
	SetCVar("cameraDistanceMax", 50)
	SetCVar("cameraDistanceMaxFactor", 3.4)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("mapQuestDifficulty", 1)
	SetCVar("showTutorials", 0)
	SetCVar("gameTip", "0")
	SetCVar("UberTooltips", 1)
	SetCVar("chatMouseScroll", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar("chatStyle", "im")
	SetCVar("WholeChatWindowClickable", 0)
	SetCVar("ConversationMode", "inline")
	SetCVar("WhisperMode", "inline")
	SetCVar("BnWhisperMode", "inline")
	SetCVar("colorblindMode", 0)
	SetCVar("lootUnderMouse", 0)
	SetCVar("autoLootDefault", 1)
	SetCVar("RotateMinimap", 0)
	SetCVar("ConsolidateBuffs", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("scriptErrors", 0)
	SetCVar("taintLog", 0)
	SetCVar("buffDurations", 1)
	SetCVar("enableCombatText", 1)
	SetCVar("autoOpenLootHistory", 0)

	if T.author == true then
		SetCVar("scriptErrors", 1)
		SetCVar("interactOnLeftClick", 0)
		SetCVar("timeMgrUseLocalTime", 1)
		SetCVar("profanityFilter", 0)
		SetCVar("Sound_EnableErrorSpeech", 0)
		SetCVar("Sound_EnableEmoteSounds", 0)
		SetCVar("Sound_EnablePetSounds", 0)
		SetCVar("Sound_EnableMusic", 0)
		SetCVar("Sound_EnableSoundWhenGameIsInBG", 1)
		SetCVar("showToastWindow", 0)
		SetCVar("cameraSmoothStyle", 1)
		SetCVar("displaySpellActivationOverlays", 0)
		SetCVar("ConsolidateBuffs", 1)
		SetCVar("autoDismountFlying", 1)
		SetCVar("autoSelfCast", 1)
		SetCVar("guildMemberNotify", 1)
		SetCVar("UnitNameOwn", 0)
		SetCVar("UnitNameNPC", 0)
		SetCVar("UnitNameNonCombatCreatureName", 0)
		SetCVar("UnitNamePlayerGuild", 1)
		SetCVar("UnitNamePlayerPVPTitle", 0)
		SetCVar("UnitNameFriendlyPlayerName", 1)
		SetCVar("UnitNameFriendlyPetName", 0)
		SetCVar("UnitNameFriendlyGuardianName", 0)
		SetCVar("UnitNameFriendlyTotemName", 0)
		SetCVar("UnitNameEnemyPlayerName", 1)
		SetCVar("UnitNameEnemyPetName", 0)
		SetCVar("UnitNameEnemyGuardianName", 0)
		SetCVar("UnitNameEnemyTotemName", 1)
		SetCVar("nameplateShowFriends", 0)
		SetCVar("nameplateShowFriendlyPets", 0)
		SetCVar("nameplateShowFriendlyGuardians", 0)
		SetCVar("nameplateShowFriendlyTotems", 0)
		SetCVar("nameplateShowEnemies", 1)
		SetCVar("nameplateShowEnemyPets", 0)
		SetCVar("nameplateShowEnemyGuardians", 0)
		SetCVar("nameplateShowEnemyTotems", 0)
		SetCVar("shadowMode", 0)
		SetCVar("ffxDeath", 0)
		SetCVar("ffxNetherWorld", 0)
		SetCVar("fctLowManaHealth", 0)
		SetCVar("fctReactives", 0)
		SetAutoDeclineGuildInvites(1)
		ShowAccountAchievements(1)
		SetAllowLowLevelRaid(1)
	end

	-- Setting chat frames
	if C.chat.enable == true and not (IsAddOnLoaded("Prat-3.0") or IsAddOnLoaded("Chatter")) then
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			local chatFrameId = frame:GetID()
			local chatName = FCF_GetChatWindowInfo(chatFrameId)

			frame:SetSize(C.chat.width, C.chat.height)

			-- Default width and height of chats
			SetChatWindowSavedDimensions(chatFrameId, T.Scale(C.chat.width), T.Scale(C.chat.height))

			-- Move general chat to bottom left
			if i == 1 then
				frame:ClearAllPoints()
				frame:SetPoint(unpack(C.position.chat))
			end

			-- Save new default position and dimension
			FCF_SavePositionAndDimensions(frame)

			-- Set default font size
			FCF_SetChatWindowFontSize(nil, frame, 11)

			-- Lock them if unlocked
			if not frame.isLocked then FCF_SetLocked(frame, 1) end
		end

		if T.author == true then
			FCF_ResetChatWindows()
			FCF_OpenNewWindow(GUILD)
			FCF_SetLocked(ChatFrame3, 1)
			FCF_DockFrame(ChatFrame3)
			FCF_OpenNewWindow(LOOT)
			FCF_SetLocked(ChatFrame4, 1)
			FCF_DockFrame(ChatFrame4)

			-- Setup main tab
			ChatFrame_RemoveMessageGroup(ChatFrame1, "LOOT")
			ChatFrame_RemoveMessageGroup(ChatFrame1, "CURRENCY")
			ChatFrame_RemoveMessageGroup(ChatFrame1, "MONEY")

			-- Setup guild tab
			ChatFrame_RemoveAllMessageGroups(ChatFrame3)
			ChatFrame_AddMessageGroup(ChatFrame3, "GUILD")
			ChatFrame_AddMessageGroup(ChatFrame3, "OFFICER")
			ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
			ChatFrame_AddMessageGroup(ChatFrame3, "PARTY")
			ChatFrame_AddMessageGroup(ChatFrame3, "PARTY_LEADER")
			ChatFrame_AddMessageGroup(ChatFrame3, "RAID")
			ChatFrame_AddMessageGroup(ChatFrame3, "RAID_LEADER")
			ChatFrame_AddMessageGroup(ChatFrame3, "RAID_WARNING")
			ChatFrame_AddMessageGroup(ChatFrame3, "INSTANCE_CHAT")
			ChatFrame_AddMessageGroup(ChatFrame3, "INSTANCE_CHAT_LEADER")
			ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
			ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")

			-- Setup loot tab
			ChatFrame_RemoveAllMessageGroups(ChatFrame4)
			ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_XP_GAIN")
			ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_GUILD_XP_GAIN")
			ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_HONOR_GAIN")
			ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_FACTION_CHANGE")
			ChatFrame_AddMessageGroup(ChatFrame4, "LOOT")
			ChatFrame_AddMessageGroup(ChatFrame4, "CURRENCY")
			ChatFrame_AddMessageGroup(ChatFrame4, "MONEY")
			ChatFrame_AddMessageGroup(ChatFrame4, "SKILL")
		end

		-- Show Target Icons
		ChatFrame_AddMessageGroup(ChatFrame1, "TARGETICONS")

		-- Enable classcolor automatically on login and on each character without doing /configure each time
		ToggleChatColorNamesByClassGroup(true, "SAY")
		ToggleChatColorNamesByClassGroup(true, "EMOTE")
		ToggleChatColorNamesByClassGroup(true, "YELL")
		ToggleChatColorNamesByClassGroup(true, "GUILD")
		ToggleChatColorNamesByClassGroup(true, "OFFICER")
		ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
		ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
		ToggleChatColorNamesByClassGroup(true, "WHISPER")
		ToggleChatColorNamesByClassGroup(true, "PARTY")
		ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
		ToggleChatColorNamesByClassGroup(true, "RAID")
		ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
		ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
		ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
		ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	end

	-- Reset saved variables on char
	SavedPositions = {}
	SavedOptionsPerChar = {}

	SavedOptionsPerChar.Install = true
	SavedOptionsPerChar.FogOfWar = false
	SavedOptionsPerChar.AutoInvite = false
	SavedOptionsPerChar.Archaeology = false
	SavedOptionsPerChar.BarsLocked = false
	SavedOptionsPerChar.SplitBars = true
	SavedOptionsPerChar.RightBars = C.actionbar.rightbars
	SavedOptionsPerChar.BottomBars = C.actionbar.bottombars

	ReloadUI()
end

local function DisableUI()
	DisableAddOn("ShestakUI")
	ReloadUI()
end

----------------------------------------------------------------------------------------
--	Popups
----------------------------------------------------------------------------------------
StaticPopupDialogs.INSTALL_UI = {
	text = L_POPUP_INSTALLUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = InstallUI,
	OnCancel = function() SavedOptionsPerChar.Install = false end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 5,
}

StaticPopupDialogs.DISABLE_UI = {
	text = L_POPUP_DISABLEUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = DisableUI,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

StaticPopupDialogs.RESET_UI = {
	text = L_POPUP_RESETUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = InstallUI,
	OnCancel = function() SavedOptionsPerChar.Install = true end,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

StaticPopupDialogs.RESET_STATS = {
	text = L_POPUP_RESETSTATS,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() SavedStats = {} ReloadUI() end,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

StaticPopupDialogs.SWITCH_RAID = {
	text = L_POPUP_SWITCH_RAID,
	button1 = DAMAGER,
	button2 = HEALER,
	button3 = "Blizzard",
	OnAccept = function() SavedOptions.RaidLayout = "DPS" ReloadUI() end,
	OnCancel = function() SavedOptions.RaidLayout = "HEAL" ReloadUI() end,
	OnAlt = function() SavedOptions.RaidLayout = "NONE" ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 5,
}

SLASH_CONFIGURE1 = "/resetui"
SlashCmdList.CONFIGURE = function() StaticPopup_Show("RESET_UI") end

SLASH_RESETSTATS1 = "/resetstats"
SlashCmdList.RESETSTATS = function() StaticPopup_Show("RESET_STATS") end

----------------------------------------------------------------------------------------
--	On logon function
----------------------------------------------------------------------------------------
local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	-- Create empty CVar if they doesn't exist
	if SavedOptions == nil then SavedOptions = {} end
	if SavedPositions == nil then SavedPositions = {} end
	if SavedAddonProfiles == nil then SavedAddonProfiles = {} end
	if SavedOptionsPerChar == nil then SavedOptionsPerChar = {} end
	if SavedOptions.RaidLayout == nil then SavedOptions.RaidLayout = "UNKNOWN" end
	if SavedOptionsPerChar.FogOfWar == nil then SavedOptionsPerChar.FogOfWar = false end
	if SavedOptionsPerChar.AutoInvite == nil then SavedOptionsPerChar.AutoInvite = false end
	if SavedOptionsPerChar.Archaeology == nil then SavedOptionsPerChar.Archaeology = false end
	if SavedOptionsPerChar.BarsLocked == nil then SavedOptionsPerChar.BarsLocked = false end
	if SavedOptionsPerChar.SplitBars == nil then SavedOptionsPerChar.SplitBars = true end
	if SavedOptionsPerChar.RightBars == nil then SavedOptionsPerChar.RightBars = C.actionbar.rightbars end
	if SavedOptionsPerChar.BottomBars == nil then SavedOptionsPerChar.BottomBars = C.actionbar.bottombars end

	if T.getscreenwidth < 1024 and GetCVar("gxMonitor") == "0" then
		SetCVar("useUiScale", 0)
		StaticPopup_Show("DISABLE_UI")
	else
		SetCVar("useUiScale", 1)
		if C.general.multisampleprotect == true and GetCVar("gxMultisample") ~= "1" then
			SetMultisampleFormat(1)
		end
		if C.general.uiscale > 1.28 then C.general.uiscale = 1.28 end
		if C.general.uiscale < 0.64 then C.general.uiscale = 0.64 end

		-- Set our uiscale
		SetCVar("uiScale", C.general.uiscale)

		-- Install default if we never ran ShestakUI on this character
		if not SavedOptionsPerChar.Install then
			StaticPopup_Show("INSTALL_UI")
		end
	end

	if SavedOptions.RaidLayout == "UNKNOWN" then
		StaticPopup_Show("SWITCH_RAID")
	end

	-- Welcome message
	if C.general.welcome_message == true then
		print("|cffffff00"..L_WELCOME_LINE_1..T.version.." "..T.client..", "..T.name..".|r")
		print("|cffffff00"..L_WELCOME_LINE_2_1.." |cffffff00"..L_WELCOME_LINE_2_2)
		print("|cffffff00"..L_WELCOME_LINE_3)
	end
end)

-- Edit by Oz of shestakdotorg --
