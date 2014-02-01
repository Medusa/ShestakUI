local T, C, L, _ = unpack(ShestakUI)
if C.unitframe.enable ~= true then return end

if T.oz == true then
	C["filger_position"] = {
		player_buff_icon = {"BOTTOMLEFT", C.unitframe.portrait_enable and "oUF_Player_Portrait" or C.unitframe.class_icons_portraits and "oUF_Player_ClassIconBorder" or "oUF_Player", "BOTTOMRIGHT", C.unitframe.portrait_enable and -66 or C.unitframe.class_icons_portraits and -83 or -259, C.unitframe.portrait_enable and 279 or C.unitframe.class_icons_portraits and 294 or 280},	-- "P_BUFF_ICON"
		player_proc_icon = {"BOTTOMLEFT", "oUF_Target", "TOPLEFT", -2, 253},	-- "P_PROC_ICON"
		special_proc_icon = {"BOTTOMLEFT", C.unitframe.portrait_enable and "oUF_Player_Portrait" or C.unitframe.class_icons_portraits and "oUF_Player_ClassIconBorder" or "oUF_Player", "BOTTOMRIGHT", C.unitframe.portrait_enable and -66 or C.unitframe.class_icons_portraits and -83 or -259, C.unitframe.portrait_enable and 319 or C.unitframe.class_icons_portraits and 334 or 320},	-- "SPECIAL_P_BUFF_ICON"
		target_debuff_icon = {"BOTTOMLEFT", "oUF_Target", "TOPLEFT", -2, 293},	-- "T_DEBUFF_ICON"
		target_buff_icon = {"BOTTOMLEFT", "oUF_Target", "TOPLEFT", -2, 333},	-- "T_BUFF"
		pve_debuff = {"BOTTOMLEFT", C.unitframe.portrait_enable and "oUF_Player_Portrait" or C.unitframe.class_icons_portraits and "oUF_Player_ClassIconBorder" or "oUF_Player", "BOTTOMRIGHT", C.unitframe.portrait_enable and -89 or C.unitframe.class_icons_portraits and -106 or -282, C.unitframe.portrait_enable and 359 or C.unitframe.class_icons_portraits and 374 or 360},		-- "PVE/PVP_DEBUFF"
		pve_cc = {"BOTTOMLEFT", "oUF_Player", "TOPRIGHT", 167, -297},			-- "PVE/PVP_CC"
		cooldown = {"BOTTOMLEFT", "oUF_Player", "TOPRIGHT", 167, -269},			-- "COOLDOWN"
		target_bar = {"BOTTOMLEFT", C.unitframe.portrait_enable and "oUF_Target_Portrait" or C.unitframe.class_icons_portraits and "oUF_Target_ClassIconBorder" or "oUF_Target", "BOTTOMRIGHT", C.unitframe.portrait_enable and 6 or C.unitframe.class_icons_portraits and 3 or 5, C.unitframe.portrait_enable and -3 or C.unitframe.class_icons_portraits and 0 or -2},					-- "T_DE/BUFF_BAR"
	}
else
	C["filger_position"] = {
		player_buff_icon = {"BOTTOMRIGHT", "oUF_Player", "TOPRIGHT", 2, 173},	-- "P_BUFF_ICON"
		player_proc_icon = {"BOTTOMLEFT", "oUF_Target", "TOPLEFT", -2, 173},	-- "P_PROC_ICON"
		special_proc_icon = {"BOTTOMRIGHT", "oUF_Player", "TOPRIGHT", 2, 213},	-- "SPECIAL_P_BUFF_ICON"
		target_debuff_icon = {"BOTTOMLEFT", "oUF_Target", "TOPLEFT", -2, 213},	-- "T_DEBUFF_ICON"
		target_buff_icon = {"BOTTOMLEFT", "oUF_Target", "TOPLEFT", -2, 253},	-- "T_BUFF"
		pve_debuff = {"BOTTOMRIGHT", "oUF_Player", "TOPRIGHT", 2, 253},			-- "PVE/PVP_DEBUFF"
		pve_cc = {"TOPLEFT", "oUF_Player", "BOTTOMLEFT", -2, -83},				-- "PVE/PVP_CC"
		cooldown = {"BOTTOMRIGHT", "oUF_Player", "TOPRIGHT", 59, C.unitframe.plugins_swing and 17 or 5},		-- "COOLDOWN"
		target_bar = {"BOTTOMLEFT", C.unitframe.portrait_enable and "oUF_Target_Portrait" or C.unitframe.class_icons_portraits and "oUF_Target_ClassIconBorder" or "oUF_Target", "BOTTOMRIGHT", C.unitframe.portrait_enable and 6 or C.unitframe.class_icons_portraits and 3 or 5, C.unitframe.portrait_enable and -3 or C.unitframe.class_icons_portraits and 0 or -2},	-- "T_DE/BUFF_BAR"
	}
end

-- Edit by Oz of shestakdotorg --
