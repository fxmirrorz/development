local D, C, L, G = unpack(select(2, ...)) 

local DuffedUIBar1 = CreateFrame("Frame", "DuffedUIBar1", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar1:SetTemplate()
DuffedUIBar1:SetWidth((D.buttonsize * 12) + (D.buttonspacing * 13))
DuffedUIBar1:SetHeight((D.buttonsize * 1) + (D.buttonspacing * 2))
DuffedUIBar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 14)
DuffedUIBar1:SetFrameStrata("BACKGROUND")
DuffedUIBar1:SetFrameLevel(1)
G.ActionBars.Bar1 = DuffedUIBar1

local DuffedUIBar2 = CreateFrame("Frame", "DuffedUIBar2", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar2:SetTemplate()
DuffedUIBar2:Point("BOTTOMRIGHT", DuffedUIBar1, "BOTTOMLEFT", -6, 0)
DuffedUIBar2:SetWidth((D.buttonsize * 6) + (D.buttonspacing * 7))
DuffedUIBar2:SetHeight((D.buttonsize * 2) + (D.buttonspacing * 3))
DuffedUIBar2:SetFrameStrata("BACKGROUND")
DuffedUIBar2:SetFrameLevel(3)
DuffedUIBar2:SetAlpha(0)
if D.lowversion then
	DuffedUIBar2:SetAlpha(0)
else
	DuffedUIBar2:SetAlpha(1)
end
G.ActionBars.Bar2 = DuffedUIBar2

local DuffedUIBar3 = CreateFrame("Frame", "DuffedUIBar3", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar3:SetTemplate()
DuffedUIBar3:Point("BOTTOMLEFT", DuffedUIBar1, "BOTTOMRIGHT", 6, 0)
DuffedUIBar3:SetWidth((D.buttonsize * 6) + (D.buttonspacing * 7))
DuffedUIBar3:SetHeight((D.buttonsize * 2) + (D.buttonspacing * 3))
DuffedUIBar3:SetFrameStrata("BACKGROUND")
DuffedUIBar3:SetFrameLevel(3)
if D.lowversion then
	DuffedUIBar3:SetAlpha(0)
else
	DuffedUIBar3:SetAlpha(1)
end
G.ActionBars.Bar3 = DuffedUIBar3

local DuffedUIBar4 = CreateFrame("Frame", "DuffedUIBar4", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar4:SetTemplate()
DuffedUIBar4:Point("BOTTOM", UIParent, "BOTTOM", 0, 14)
DuffedUIBar4:SetWidth((D.buttonsize * 12) + (D.buttonspacing * 13))
DuffedUIBar4:SetHeight((D.buttonsize * 2) + (D.buttonspacing * 3))
DuffedUIBar4:SetFrameStrata("BACKGROUND")
DuffedUIBar4:SetFrameLevel(3)
G.ActionBars.Bar4 = DuffedUIBar4

local DuffedUIBar5 = CreateFrame("Frame", "DuffedUIBar5", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar5:SetTemplate()
DuffedUIBar5:SetPoint("RIGHT", UIParent, "RIGHT", -23, -14)
DuffedUIBar5:SetHeight((D.buttonsize * 12) + (D.buttonspacing * 13))
DuffedUIBar5:SetWidth((D.buttonsize * 1) + (D.buttonspacing * 2))
DuffedUIBar5:SetFrameStrata("BACKGROUND")
DuffedUIBar5:SetFrameLevel(2)
DuffedUIBar5:SetAlpha(0)
G.ActionBars.Bar5 = DuffedUIBar5

local DuffedUIBar6 = CreateFrame("Frame", "DuffedUIBar6", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar6:SetWidth((D.buttonsize * 1) + (D.buttonspacing * 2))
DuffedUIBar6:SetHeight((D.buttonsize * 12) + (D.buttonspacing * 13))
DuffedUIBar6:SetPoint("LEFT", DuffedUIBar5, "LEFT", 0, 0)
DuffedUIBar6:SetFrameStrata("BACKGROUND")
DuffedUIBar6:SetFrameLevel(2)
DuffedUIBar6:SetAlpha(0)
G.ActionBars.Bar6 = DuffedUIBar6

local DuffedUIBar7 = CreateFrame("Frame", "DuffedUIBar7", UIParent, "SecureHandlerStateTemplate")
DuffedUIBar7:SetWidth((D.buttonsize * 1) + (D.buttonspacing * 2))
DuffedUIBar7:SetHeight((D.buttonsize * 12) + (D.buttonspacing * 13))
DuffedUIBar7:SetPoint("TOP", DuffedUIBar5, "TOP", 0 , 0)
DuffedUIBar7:SetFrameStrata("BACKGROUND")
DuffedUIBar7:SetFrameLevel(2)
DuffedUIBar7:SetAlpha(0)
G.ActionBars.Bar7 = DuffedUIBar7

local petbg = CreateFrame("Frame", "DuffedUIPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:SetTemplate()
petbg:SetSize(D.petbuttonsize + (D.petbuttonspacing * 2), (D.petbuttonsize * 10) + (D.petbuttonspacing * 11))
petbg:SetPoint("RIGHT", DuffedUIBar5, "LEFT", -6, 0)
G.ActionBars.Pet = petbg

local ltpetbg1 = CreateFrame("Frame", "DuffedUILineToPetActionBarBackground", petbg)
ltpetbg1:SetTemplate()
ltpetbg1:Size(24, 265)
ltpetbg1:Point("LEFT", petbg, "RIGHT", 0, 0)
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(0)
G.ActionBars.Pet.BackgroundLink = ltpetbg1

-- INVISIBLE FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvDuffedUIActionBarBackground", UIParent)
if D.lowversion then
	invbarbg:SetPoint("TOPLEFT", DuffedUIBar4)
	invbarbg:SetPoint("BOTTOMRIGHT", DuffedUIBar1)
	DuffedUIBar2:Hide()
	DuffedUIBar3:Hide()
else
	invbarbg:SetPoint("TOPLEFT", DuffedUIBar2)
	invbarbg:SetPoint("BOTTOMRIGHT", DuffedUIBar3)
end
G.Panels.BottomPanelOverActionBars = invbarbg

-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "DuffedUIInfoLeftLineVertical", UIParent)
ileftlv:SetTemplate()
ileftlv:Size(2, 130)
ileftlv:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 30)
ileftlv:SetFrameLevel(1)
ileftlv:SetFrameStrata("BACKGROUND")
G.Panels.BottomLeftVerticalLine = ileftlv

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "DuffedUIInfoRightLineVertical", UIParent)
irightlv:SetTemplate()
irightlv:Size(2, 130)
irightlv:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 30)
irightlv:SetFrameLevel(1)
irightlv:SetFrameStrata("BACKGROUND")
G.Panels.BottomRightVerticalLine = irightlv

if not C.chat.background then
	-- CUBE AT LEFT, ACT AS A BUTTON (CHAT MENU)
	local cubeleft = CreateFrame("Frame", "DuffedUICubeLeft", UIParent)
	cubeleft:SetTemplate()
	cubeleft:Size(10)
	cubeleft:Point("BOTTOM", ileftlv, "TOP", 0, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetFrameLevel(1)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if DuffedUIInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if DuffedUIInfoLeftBattleGround:IsShown() then
					DuffedUIInfoLeftBattleGround:Hide()
				else
					DuffedUIInfoLeftBattleGround:Show()
				end
			end
		end
		
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)
	G.Panels.BottomLeftCube = cubeleft
	

	-- CUBE AT RIGHT, ACT AS A BUTTON (CONFIGUI or BG'S)
	local cuberight = CreateFrame("Frame", "DuffedUICubeRight", UIParent)
	cuberight:SetTemplate()
	cuberight:Size(10)
	cuberight:SetFrameLevel(1)
	cuberight:Point("BOTTOM", irightlv, "TOP", 0, 0)
	if C["bags"].enable then
		cuberight:EnableMouse(true)
		cuberight:SetScript("OnMouseDown", function(self)
			ToggleAllBags()
		end)
	end
	G.Panels.BottomRightCube = cuberight
end

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "DuffedUILineToABLeft", UIParent)
ltoabl:SetTemplate()
ltoabl:Size(5, 2)
ltoabl:ClearAllPoints()
ltoabl:Point("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:Point("RIGHT", DuffedUIBar1, "BOTTOMLEFT", -1, 17)
ltoabl:SetFrameStrata("BACKGROUND")
ltoabl:SetFrameLevel(1)
G.Panels.BottomLeftLine = ltoabl

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "DuffedUILineToABRight", UIParent)
ltoabr:SetTemplate()
ltoabr:Size(5, 2)
ltoabr:Point("LEFT", DuffedUIBar1, "BOTTOMRIGHT", 1, 17)
ltoabr:Point("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)
ltoabr:SetFrameStrata("BACKGROUND")
ltoabr:SetFrameLevel(1)
G.Panels.BottomRightLine = ltoabr

-- MOVE/HIDE SOME ELEMENTS IF CHAT BACKGROUND IS ENABLED
local movechat = 0
if C.chat.background then movechat = 10 ileftlv:SetAlpha(0) irightlv:SetAlpha(0) end

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "DuffedUIInfoLeft", UIParent)
ileft:SetTemplate()
ileft:Size(D.InfoLeftRightWidth, 23)
ileft:SetPoint("LEFT", ltoabl, "LEFT", 14 - movechat, 0)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")
G.Panels.DataTextLeft = ileft

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "DuffedUIInfoRight", UIParent)
iright:SetTemplate()
iright:Size(D.InfoLeftRightWidth, 23)
iright:SetPoint("RIGHT", ltoabr, "RIGHT", -14 + movechat, 0)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")
G.Panels.DataTextRight = iright

if C.chat.background then
	-- Alpha horizontal lines because all panels is dependent on this frame.
	ltoabl:SetAlpha(0)
	ltoabr:SetAlpha(0)
	
	-- CHAT BG LEFT
	local chatleftbg = CreateFrame("Frame", "DuffedUIChatBackgroundLeft", DuffedUIInfoLeft)
	chatleftbg:SetTemplate("Transparent")
	chatleftbg:Size(D.InfoLeftRightWidth + 12, 177)
	chatleftbg:Point("BOTTOM", DuffedUIInfoLeft, "BOTTOM", 0, -6)
	chatleftbg:SetFrameLevel(1)
	G.Panels.LeftChatBackground = chatleftbg

	-- CHAT BG RIGHT
	local chatrightbg = CreateFrame("Frame", "DuffedUIChatBackgroundRight", DuffedUIInfoRight)
	chatrightbg:SetTemplate("Transparent")
	chatrightbg:Size(D.InfoLeftRightWidth + 12, 177)
	chatrightbg:Point("BOTTOM", DuffedUIInfoRight, "BOTTOM", 0, -6)
	chatrightbg:SetFrameLevel(1)
	G.Panels.RightChatBackground = chatrightbg
	
	-- LEFT TAB PANEL
	local tabsbgleft = CreateFrame("Frame", "DuffedUITabsLeftBackground", UIParent)
	tabsbgleft:SetTemplate()
	tabsbgleft:Size(D.InfoLeftRightWidth, 23)
	tabsbgleft:Point("TOP", chatleftbg, "TOP", 0, -6)
	tabsbgleft:SetFrameLevel(2)
	tabsbgleft:SetFrameStrata("BACKGROUND")
	G.Panels.LeftChatTabsBackground = tabsbgleft
		
	-- RIGHT TAB PANEL
	local tabsbgright = CreateFrame("Frame", "DuffedUITabsRightBackground", UIParent)
	tabsbgright:SetTemplate()
	tabsbgright:Size(D.InfoLeftRightWidth, 23)
	tabsbgright:Point("TOP", chatrightbg, "TOP", 0, -6)
	tabsbgright:SetFrameLevel(2)
	tabsbgright:SetFrameStrata("BACKGROUND")
	G.Panels.RightChatTabsBackground = tabsbgright

	-- [[ Create new horizontal line for chat background ]] --
	-- HORIZONTAL LINE LEFT
	local ltoabl2 = CreateFrame("Frame", "DuffedUILineToABLeftAlt", UIParent)
	ltoabl2:SetTemplate()
	ltoabl2:Size(5, 2)
	ltoabl2:Point("RIGHT", DuffedUIBar1, "LEFT", 0, 16)
	ltoabl2:Point("BOTTOMLEFT", chatleftbg, "BOTTOMRIGHT", 0, 16)
	ltoabl2:SetFrameStrata("BACKGROUND")
	ltoabl2:SetFrameLevel(1)
	G.Panels.LeftDataTextToActionBarLine = ltoabl2

	-- HORIZONTAL LINE RIGHT
	local ltoabr2 = CreateFrame("Frame", "DuffedUILineToABRightAlt", UIParent)
	ltoabr2:SetTemplate()
	ltoabr2:Size(5, 2)
	ltoabr2:Point("LEFT", DuffedUIBar1, "RIGHT", 0, 16)
	ltoabr2:Point("BOTTOMRIGHT", chatrightbg, "BOTTOMLEFT", 0, 16)
	ltoabr2:SetFrameStrata("BACKGROUND")
	ltoabr2:SetFrameLevel(1)
	G.Panels.RightDataTextToActionBarLine = ltoabr2
end

if DuffedUIMinimap then
	local minimapstatsleft = CreateFrame("Frame", "DuffedUIMinimapStatsLeft", DuffedUIMinimap)
	minimapstatsleft:SetTemplate()
	minimapstatsleft:Size(((DuffedUIMinimap:GetWidth() + 4) / 2) -3, 19)
	minimapstatsleft:Point("TOPLEFT", DuffedUIMinimap, "BOTTOMLEFT", 0, -2)
	G.Panels.DataTextMinimapLeft = minimapstatsleft

	local minimapstatsright = CreateFrame("Frame", "DuffedUIMinimapStatsRight", DuffedUIMinimap)
	minimapstatsright:SetTemplate()
	minimapstatsright:Size(((DuffedUIMinimap:GetWidth() + 4) / 2) -3, 19)
	minimapstatsright:Point("TOPRIGHT", DuffedUIMinimap, "BOTTOMRIGHT", 0, -2)
	G.Panels.DataTextMinimapRight = minimapstatsright
end

--BATTLEGROUND STATS FRAME
if C["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "DuffedUIInfoLeftBattleGround", UIParent)
	bgframe:SetTemplate()
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
	G.Panels.BattlegroundDataText = bgframe
end
