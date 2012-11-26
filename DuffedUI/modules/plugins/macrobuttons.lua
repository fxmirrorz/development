local D, C, L, G = unpack(select(2, ...))

D.CreateBtn("MB_reload", DuffedUIMinimap, 19, 19, "Reloads the entire UI", "R")
MB_reload:Point("TOPLEFT", DuffedUIMinimap, "BOTTOMLEFT", 0, -22)
MB_reload:CreateShadow("Default")
MB_reload:SetAttribute("macrotext1", "/rl")

D.CreateBtn("MB_heal", MB_reload, 19, 19, "Switch to heal-layout", "H")
MB_heal:Point("LEFT", MB_reload, "RIGHT", 2, 0)
MB_heal:CreateShadow("Default")
MB_heal:SetAttribute("macrotext1", "/heal")

D.CreateBtn("MB_dps", MB_reload, 19, 19, "Switch to dps-layout", "D")
MB_dps:Point("LEFT", MB_heal, "RIGHT", 2, 0)
MB_dps:CreateShadow("Default")
MB_dps:SetAttribute("macrotext1", "/dps")

D.CreateBtn("MB_am", MB_reload, 19, 19, "Open Addonmanager", "A")
MB_am:Point("LEFT", MB_dps, "RIGHT", 2, 0)
MB_am:CreateShadow("Default")
if IsAddOnLoaded("AuctionMaster") then MB_am:SetAttribute("macrotext1", "/ap") else MB_am:SetAttribute("macrotext1", "/am") end

D.CreateBtn("MB_mui", MB_reload, 19, 19, "Move the frames", "M")
MB_mui:Point("LEFT", MB_am, "RIGHT", 2, 0)
MB_mui:CreateShadow("Default")
MB_mui:SetAttribute("macrotext1", "/moveui")

D.CreateBtn("MB_config", MB_reload, 19, 19, "DuffedUI Config", "C")
MB_config:Point("LEFT", MB_mui, "RIGHT", 2, 0)
MB_config:CreateShadow("Default")
MB_config:SetAttribute("macrotext1", "/dc")

D.CreateBtn("MB_binds", MB_reload, 19, 19, "Set your keybindings", "K")
MB_binds:Point("LEFT", MB_config, "RIGHT", 2, 0)
MB_binds:CreateShadow("Default")
MB_binds:SetAttribute("macrotext1", "/kb")

D.CreateBtn("MB_help", MB_reload, 28, 19, "Open the Helpframe for DuffedUI", "Help")
MB_help:Point("LEFT", MB_binds, "RIGHT", 2, 0)
MB_help:CreateShadow("Default")
MB_help:SetAttribute("macrotext1", "/dhelp")

--[[MB_reload:SetScript("OnClick", function()
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
end)]]--