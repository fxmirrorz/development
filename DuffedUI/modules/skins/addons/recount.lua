local D, C, L, G = unpack(select(2, ...))
if C["skins"].recount ~= true or not IsAddOnLoaded("Recount") then return end

local Recount = _G["Recount"]

local function SkinFrame(frame)
	frame.bgMain = CreateFrame("Frame", nil, frame)
	if frame ~= Recount.MainWindow then
		frame.bgMain:SetTemplate("Transparent")
		frame.CloseButton:SkinCloseButton()
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -11)
	end
	if frame == Recount.MainWindow then
		frame.Title:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, -15)
		frame.Title:SetFont(C["media"].font, C["datatext"].fontsize, "THINOUTLINE")
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 3, -9)
	end
	frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
	frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
	frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -7)
	frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
	frame:SetBackdrop(nil)
end

local function SkinButton(frame, text)
	if frame.SetNormalTexture then frame:SetNormalTexture("") end
	if frame.SetHighlightTexture then frame:SetHighlightTexture("") end
	if frame.SetPushedTexture then frame:SetPushedTexture("") end

	if not frame.text then
		frame:FontString("text", C["media"].font, C["datatext"].fontsize, "THINOUTLINE")
		frame.text:SetPoint("CENTER")
		frame.text:SetText(text)
	end

	frame:HookScript("OnEnter", function(self) self.text:SetTextColor(T.panelcolor) end)
	frame:HookScript("OnLeave", function(self) self.text:SetTextColor(1, 1, 1) end)
end

-- Override bar textures
Recount.UpdateBarTextures = function(self)
	for k, v in pairs(Recount.MainWindow.Rows) do
		v.StatusBar:SetStatusBarTexture(C.media.texture)
		v.StatusBar:GetStatusBarTexture():SetHorizTile(false)
		v.StatusBar:GetStatusBarTexture():SetVertTile(false)

		v.background = v.StatusBar:CreateTexture("$parentBackground", "BACKGROUND")
		v.background:SetAllPoints(v.StatusBar)
		v.background:SetTexture(C.media.texture)
		v.background:SetVertexColor(0.15, 0.15, 0.15, 0.75)

		v.overlay = CreateFrame("Frame", nil, v.StatusBar)
		v.overlay:SetTemplate("Default")
		v.overlay:SetFrameStrata("BACKGROUND")
		v.overlay:SetPoint("TOPLEFT", -2, 2)
		v.overlay:SetPoint("BOTTOMRIGHT", 2, -2)

		v.LeftText:ClearAllPoints()
		v.LeftText:SetPoint("LEFT", v.StatusBar, "LEFT", 2, 0)
		v.LeftText:SetFont(C["media"].font, C["datatext"].fontsize, "THINOUTLINE")

		v.RightText:SetFont(C["media"].font, C["datatext"].fontsize, "THINOUTLINE")
	end
end
Recount.SetBarTextures = Recount.UpdateBarTextures

-- Fix bar textures as they're created
Recount.SetupBar_ = Recount.SetupBar
Recount.SetupBar = function(self, bar)
	self:SetupBar_(bar)
	bar.StatusBar:SetStatusBarTexture(C["media"].texture)
end

-- Skin frames when they're created
Recount.CreateFrame_ = Recount.CreateFrame
Recount.CreateFrame = function(self, Name, Title, Height, Width, ShowFunc, HideFunc)
	local frame = self:CreateFrame_(Name, Title, Height, Width, ShowFunc, HideFunc)
	SkinFrame(frame)
	return frame
end

-- Skin some others frame, not available outside Recount
Recount.AddWindow_ = Recount.AddWindow
Recount.AddWindow = function(self, frame)
	Recount:AddWindow_(frame)

	if frame.YesButton then
		frame:SetTemplate("Transparent")
		frame.YesButton:SkinButton()
		frame.NoButton:SkinButton()
	end

	if frame.ReportButton then
		frame.ReportButton:SkinButton()
	end
end

-- Skin existing frames
if Recount.MainWindow then SkinFrame(Recount.MainWindow) end
if Recount.ConfigWindow then SkinFrame(Recount.ConfigWindow) end
if Recount.GraphWindow then SkinFrame(Recount.GraphWindow) end
if Recount.DetailWindow then SkinFrame(Recount.DetailWindow) end
if Recount.ResetFrame then SkinFrame(Recount.ResetFrame) end
if _G["Recount_Realtime_!RAID_DAMAGE"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGE"].Window) end
if _G["Recount_Realtime_!RAID_HEALING"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALING"].Window) end
if _G["Recount_Realtime_!RAID_HEALINGTAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALINGTAKEN"].Window) end
if _G["Recount_Realtime_!RAID_DAMAGETAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGETAKEN"].Window) end
if _G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"] then SkinFrame(_G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"].Window) end
if _G["Recount_Realtime_FPS_FPS"] then SkinFrame(_G["Recount_Realtime_FPS_FPS"].Window) end
if _G["Recount_Realtime_Latency_LAG"] then SkinFrame(_G["Recount_Realtime_Latency_LAG"].Window) end
if _G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"].Window) end
if _G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"].Window) end

-- Update Textures
Recount:UpdateBarTextures()
Recount.MainWindow.ConfigButton:HookScript("OnClick", function(self) Recount:UpdateBarTextures() end)

-- Reskin Dropdown
Recount.MainWindow.FileButton:HookScript("OnClick", function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate("Transparent") end end)

-- Reskin Buttons
SkinButton(Recount.MainWindow.CloseButton, "X")
SkinButton(Recount.MainWindow.RightButton, ">")
SkinButton(Recount.MainWindow.LeftButton, "<")
SkinButton(Recount.MainWindow.ResetButton, "R")
SkinButton(Recount.MainWindow.FileButton, "F")
SkinButton(Recount.MainWindow.ConfigButton, "C")
SkinButton(Recount.MainWindow.ReportButton, "S")

-- Force some default profile options
local uploadRecount = function ()
	if not RecountDB then RecountDB = {} end
	if not RecountDB["profiles"] then RecountDB["profiles"] = {} end
	if not RecountDB["profiles"][D.myname.." - "..GetRealmName()] then RecountDB["profiles"][D.myname.." - "..D.myrealm] = {} end
	if not RecountDB["profiles"][D.myname.." - "..GetRealmName()]["MainWindow"] then RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"] = {} end

	RecountDB["profiles"][D.myname.." - "..D.myrealm]["Locked"] = true
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["Scaling"] = 1
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["RowHeight"] = 12
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["RowSpacing"] = 7
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["ShowScrollbar"] = false
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["HideTotalBar"] = true
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["Position"]["x"] = 284
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["Position"]["y"] = -281
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["Position"]["w"] = 221
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindow"]["BarText"]["NumFormat"] = 3
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["MainWindowWidth"] = 221
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["ClampToScreen"] = true
	RecountDB["profiles"][D.myname.." - "..D.myrealm]["Font"] = "Calibri"
end

SLASH_DUFFEDUIRECOUNT1 = "/drecount"
SlashCmdList["DUFFEDUIRECOUNT"] = function(msg)
	if msg == "apply" then
		D.ShowPopup("DUFFEDUI_ENABLE_RECOUNT_SKIN")
	end
end

D.CreatePopup["DUFFEDUI_ENABLE_RECOUNT_SKIN"] = {
	question = "Enable the RECOUNT-Skin",
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		uploadRecount()

		if InCombatLockdown() then
			print(ERR_NOT_IN_COMBAT)
			print("Please reload your interface to apply Recount skin.")
		else
			ReloadUI()
		end
	end,
}

local x = "Recountskin loaded"
print(x)