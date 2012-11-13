local D, C, L, G = unpack(select(2, ...))

-- omg this file sux, it really need a rewrite someday, I was probably drunk when I made this. :X

local function ShowOrHideBar(bar, button)
	local db = DuffedUIDataPerChar
	
	if bar:IsShown() then
		if bar == DuffedUIBar5 and D.lowversion then
			if button == DuffedUIBar5ButtonTop then
				if DuffedUIBar7:IsShown() then
					UnregisterStateDriver(DuffedUIBar7, "visibility")
					DuffedUIBar7:Hide()
					bar:SetWidth((D.buttonsize * 2) + (D.buttonspacing * 3))
					db.hidebar7 = true
				elseif DuffedUIBar6:IsShown() then
					UnregisterStateDriver(DuffedUIBar6, "visibility")
					DuffedUIBar6:Hide()
					bar:SetWidth((D.buttonsize * 1) + (D.buttonspacing * 2))
					db.hidebar6 = true
				else
					UnregisterStateDriver(bar, "visibility")
					bar:Hide()
				end
			else
				if button == DuffedUIBar5ButtonBottom then
					if not bar:IsShown() then
						RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
						bar:Show()
						bar:SetWidth((D.buttonsize * 1) + (D.buttonspacing * 2))
					elseif not DuffedUIBar6:IsShown() then
						RegisterStateDriver(DuffedUIBar6, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
						DuffedUIBar6:Show()
						bar:SetWidth((D.buttonsize * 2) + (D.buttonspacing * 3))
						db.hidebar6 = false
					else
						RegisterStateDriver(DuffedUIBar7, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
						DuffedUIBar7:Show()
						bar:SetWidth((D.buttonsize * 3) + (D.buttonspacing * 4))
						db.hidebar7 = false
					end
				end
			end
		else
			UnregisterStateDriver(bar, "visibility")
			bar:Hide()
		end
		
		-- for bar 2�+3�+4, high reso only
		if bar == DuffedUIBar4 then
			--DuffedUIBar1:SetHeight((D.buttonsize * 1) + (D.buttonspacing * 2))
			DuffedUIBar2:SetHeight(DuffedUIBar1:GetHeight())
			DuffedUIBar3:SetHeight(DuffedUIBar1:GetHeight())
			DuffedUIBar2Button:SetHeight(DuffedUIBar1:GetHeight())
			DuffedUIBar3Button:SetHeight(DuffedUIBar1:GetHeight())
			if not D.lowversion then
				for i = 7, 12 do
					local left = _G["MultiBarBottomLeftButton"..i]
					local right = _G["MultiBarBottomRightButton"..i]
					left:SetAlpha(0)
					right:SetAlpha(0)
				end
			end
		end
	else
		if bar == DuffedUIBar5 and D.lowversion then
			if DuffedUIBar7:IsShown() then
				RegisterStateDriver(DuffedUIBar7, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
				DuffedUIBar7:Show()
				DuffedUIBar5:SetWidth((D.buttonsize * 3) + (D.buttonspacing * 4))
			elseif DuffedUIBar6:IsShown() then
				RegisterStateDriver(DuffedUIBar6, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
				DuffedUIBar6:Show()
				DuffedUIBar5:SetWidth((D.buttonsize * 2) + (D.buttonspacing * 3))
			else
				RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
				bar:Show()
			end
		else
			RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
			bar:Show()
		end
		
		-- for bar 2�+3�+4, high reso only
		if bar == DuffedUIBar4 then
			--DuffedUIBar1:SetHeight((D.buttonsize * 2) + (D.buttonspacing * 3))
			DuffedUIBar2:SetHeight(DuffedUIBar4:GetHeight())
			DuffedUIBar3:SetHeight(DuffedUIBar4:GetHeight())
			DuffedUIBar2Button:SetHeight(DuffedUIBar2:GetHeight())
			DuffedUIBar3Button:SetHeight(DuffedUIBar3:GetHeight())
			if not D.lowversion then
				for i = 7, 12 do
					local left = _G["MultiBarBottomLeftButton"..i]
					local right = _G["MultiBarBottomRightButton"..i]
					left:SetAlpha(1)
					right:SetAlpha(1)
				end
			end
		end
	end
end

local function MoveButtonBar(button, bar)
	local db = DuffedUIDataPerChar
	
	if button == DuffedUIBar2Button then
		if bar:IsShown() then
			db.hidebar2 = false
			button:ClearAllPoints()
			button:Point("BOTTOMRIGHT", DuffedUIBar2, "BOTTOMLEFT", -2, 0)
			button.text:SetText("|cff4BAF4C>|r")
		else
			db.hidebar2 = true
			button:ClearAllPoints()
			button:Point("BOTTOMRIGHT", DuffedUIBar1, "BOTTOMLEFT", -2, 0)
			button.text:SetText("|cff4BAF4C<|r")
		end
	end
	
	if button == DuffedUIBar3Button then
		if bar:IsShown() then
			db.hidebar3 = false
			button:ClearAllPoints()
			button:Point("BOTTOMLEFT", DuffedUIBar3, "BOTTOMRIGHT", 2, 0)
			button.text:SetText("|cff4BAF4C<|r")
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			button:Point("BOTTOMLEFT", DuffedUIBar1, "BOTTOMRIGHT", 2, 0)
			button.text:SetText("|cff4BAF4C>|r")
		end
	end

	if button == DuffedUIBar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button.text:SetText("|cff4BAF4C- - - - - -|r")
		else
			db.hidebar4 = true
			button.text:SetText("|cff4BAF4C+ + + + + +|r")
		end
	end
	
	if button == DuffedUIBar5ButtonTop or button == DuffedUIBar5ButtonBottom then		
		local buttontop = DuffedUIBar5ButtonTop
		local buttonbot = DuffedUIBar5ButtonBottom
		if bar:IsShown() then
			db.hidebar5 = false
			buttontop:ClearAllPoints()
			buttontop:Size(bar:GetWidth(), 17)
			buttontop:Point("BOTTOM", bar, "TOP", 0, 2)
			if not D.lowversion then buttontop.text:SetText("|cff4BAF4C>|r") end
			buttonbot:ClearAllPoints()
			buttonbot:Size(bar:GetWidth(), 17)
			buttonbot:Point("TOP", bar, "BOTTOM", 0, -2)
			if not D.lowversion then buttonbot.text:SetText("|cff4BAF4C>|r") end
				
			-- move the pet
			DuffedUIPetBar:ClearAllPoints()
			DuffedUIPetBar:Point("RIGHT", bar, "LEFT", -6, 0)		
		else
			db.hidebar5 = true
			buttonbot:ClearAllPoints()
			buttonbot:SetSize(DuffedUILineToPetActionBarBackground:GetWidth(), DuffedUILineToPetActionBarBackground:GetHeight())
			buttonbot:Point("LEFT", DuffedUIPetBar, "RIGHT", 2, 0)
			if not D.lowversion then buttonbot.text:SetText("|cff4BAF4C<|r") end
			buttontop:ClearAllPoints()
			buttontop:SetSize(DuffedUILineToPetActionBarBackground:GetWidth(), DuffedUILineToPetActionBarBackground:GetHeight())
			buttontop:Point("LEFT", DuffedUIPetBar, "RIGHT", 2, 0)
			if not D.lowversion then buttontop.text:SetText("|cff4BAF4C<|r") end
			
			-- move the pet
			DuffedUIPetBar:ClearAllPoints()
			DuffedUIPetBar:Point("RIGHT", UIParent, "RIGHT", -23, -14)
		end	
	end
end

local function UpdateBar(self, bar) -- guess what! :P
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

local DuffedUIBar2Button = CreateFrame("Button", "DuffedUIBar2Button", DuffedUIPetBattleHider)
DuffedUIBar2Button:Width(17)
DuffedUIBar2Button:SetHeight(DuffedUIBar2:GetHeight())
if D.lowversion then
	DuffedUIBar2Button:Point("BOTTOMRIGHT", DuffedUIBar1, "BOTTOMLEFT", -2, 0)
else
	DuffedUIBar2Button:Point("BOTTOMRIGHT", DuffedUIBar2, "BOTTOMLEFT", -2, 0)
end
DuffedUIBar2Button:SetTemplate("Default")
DuffedUIBar2Button:RegisterForClicks("AnyUp")
DuffedUIBar2Button:SetAlpha(0)
DuffedUIBar2Button:SetScript("OnClick", function(self) UpdateBar(self, DuffedUIBar2) end)
DuffedUIBar2Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
DuffedUIBar2Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
DuffedUIBar2Button.text = D.SetFontString(DuffedUIBar2Button, C["media"].uffont, 20)
DuffedUIBar2Button.text:Point("CENTER", 1, 1)
DuffedUIBar2Button.text:SetText("|cff4BAF4C>|r")
G.ActionBars.Bar2.ShowHideButton = DuffedUIBar2Button

local DuffedUIBar3Button = CreateFrame("Button", "DuffedUIBar3Button", DuffedUIPetBattleHider)
DuffedUIBar3Button:Width(17)
DuffedUIBar3Button:SetHeight(DuffedUIBar3:GetHeight())
if D.lowversion then
	DuffedUIBar3Button:Point("BOTTOMLEFT", DuffedUIBar1, "BOTTOMRIGHT", 2, 0)
else
	DuffedUIBar3Button:Point("BOTTOMLEFT", DuffedUIBar3, "BOTTOMRIGHT", 2, 0)
end
DuffedUIBar3Button:SetTemplate("Default")
DuffedUIBar3Button:RegisterForClicks("AnyUp")
DuffedUIBar3Button:SetAlpha(0)
DuffedUIBar3Button:SetScript("OnClick", function(self) UpdateBar(self, DuffedUIBar3) end)
DuffedUIBar3Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
DuffedUIBar3Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
DuffedUIBar3Button.text = D.SetFontString(DuffedUIBar3Button, C["media"].uffont, 20)
DuffedUIBar3Button.text:Point("CENTER", 1, 1)
DuffedUIBar3Button.text:SetText("|cff4BAF4C<|r")
G.ActionBars.Bar3.ShowHideButton = DuffedUIBar3Button

local DuffedUIBar4Button = CreateFrame("Button", "DuffedUIBar4Button", DuffedUIPetBattleHider)
DuffedUIBar4Button:SetWidth(DuffedUIBar1:GetWidth())
DuffedUIBar4Button:Height(10)
DuffedUIBar4Button:Point("TOP", DuffedUIBar1, "BOTTOM", 0, -2)
DuffedUIBar4Button:SetTemplate("Default")
DuffedUIBar4Button:RegisterForClicks("AnyUp")
DuffedUIBar4Button:SetAlpha(0)
DuffedUIBar4Button:SetScript("OnClick", function(self) UpdateBar(self, DuffedUIBar4) end)
DuffedUIBar4Button:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
DuffedUIBar4Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
DuffedUIBar4Button.text = D.SetFontString(DuffedUIBar4Button, C["media"].uffont, 30)
DuffedUIBar4Button.text:SetPoint("CENTER", 0, 0)
DuffedUIBar4Button.text:SetText("|cff4BAF4C- - - - - -|r")
G.ActionBars.Bar4.ShowHideButton = DuffedUIBar4Button

local DuffedUIBar5ButtonTop = CreateFrame("Button", "DuffedUIBar5ButtonTop", DuffedUIPetBattleHider)
DuffedUIBar5ButtonTop:SetWidth(DuffedUIBar5:GetWidth())
DuffedUIBar5ButtonTop:Height(17)
DuffedUIBar5ButtonTop:Point("BOTTOM", DuffedUIBar5, "TOP", 0, 2)
DuffedUIBar5ButtonTop:SetTemplate("Default")
DuffedUIBar5ButtonTop:RegisterForClicks("AnyUp")
DuffedUIBar5ButtonTop:SetAlpha(0)
DuffedUIBar5ButtonTop:SetScript("OnClick", function(self) UpdateBar(self, DuffedUIBar5) end)
DuffedUIBar5ButtonTop:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
DuffedUIBar5ButtonTop:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
DuffedUIBar5ButtonTop.text = D.SetFontString(DuffedUIBar5ButtonTop, C["media"].uffont, 20)
DuffedUIBar5ButtonTop.text:Point("CENTER", 1, 1)
DuffedUIBar5ButtonTop.text:SetText("|cff4BAF4C>|r")
G.ActionBars.Bar5.ShowHideButtonTop = DuffedUIBar5ButtonTop

local DuffedUIBar5ButtonBottom = CreateFrame("Button", "DuffedUIBar5ButtonBottom", DuffedUIPetBattleHider)
DuffedUIBar5ButtonBottom:SetFrameLevel(DuffedUIBar5ButtonTop:GetFrameLevel() + 1)
DuffedUIBar5ButtonBottom:SetWidth(DuffedUIBar5:GetWidth())
DuffedUIBar5ButtonBottom:Height(17)
DuffedUIBar5ButtonBottom:Point("TOP", DuffedUIBar5, "BOTTOM", 0, -2)
DuffedUIBar5ButtonBottom:SetTemplate("Default")
DuffedUIBar5ButtonBottom:RegisterForClicks("AnyUp")
DuffedUIBar5ButtonBottom:SetAlpha(0)
DuffedUIBar5ButtonBottom:SetScript("OnClick", function(self) UpdateBar(self, DuffedUIBar5) end)
DuffedUIBar5ButtonBottom:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
DuffedUIBar5ButtonBottom:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
DuffedUIBar5ButtonBottom.text = D.SetFontString(DuffedUIBar5ButtonBottom, C["media"].uffont, 20)
DuffedUIBar5ButtonBottom.text:Point("CENTER", 1, 1)
G.ActionBars.Bar5.ShowHideButtonBottom = DuffedUIBar5ButtonBottom

if D.lowversion then DuffedUIBar5ButtonBottom.text:SetText("|cff4BAF4C<|r") else DuffedUIBar5ButtonBottom.text:SetText("|cff4BAF4C>|r") end

-- exit vehicle button on left side of bottom action bar
local vehicleleft = CreateFrame("Button", "DuffedUIExitVehicleButtonLeft", UIParent, "SecureHandlerClickTemplate")
vehicleleft:SetAllPoints(DuffedUIInfoLeft)
vehicleleft:SetFrameStrata("LOW")
vehicleleft:SetFrameLevel(10)
vehicleleft:SetTemplate("Default")
vehicleleft:SetBackdropBorderColor(75/255,  175/255, 76/255)
vehicleleft:RegisterForClicks("AnyUp")
vehicleleft:SetScript("OnClick", function() VehicleExit() end)
vehicleleft:FontString("text", C["media"].font, 12)
vehicleleft.text:Point("CENTER", 0, 0)
vehicleleft.text:SetText("|cff4BAF4C"..string.upper(LEAVE_VEHICLE).."|r")
RegisterStateDriver(vehicleleft, "visibility", "[target=vehicle,exists] show;hide")
G.ActionBars.ExitVehicleLeft = vehicleleft

-- exit vehicle button on right side of bottom action bar
local vehicleright = CreateFrame("Button", "DuffedUIExitVehicleButtonRight", UIParent, "SecureHandlerClickTemplate")
vehicleright:SetAllPoints(DuffedUIInfoRight)
vehicleright:SetTemplate("Default")
vehicleright:SetFrameStrata("LOW")
vehicleright:SetFrameLevel(10)
vehicleright:SetBackdropBorderColor(75/255,  175/255, 76/255)
vehicleright:RegisterForClicks("AnyUp")
vehicleright:SetScript("OnClick", function() VehicleExit() end)
vehicleright:FontString("text", C["media"].font, 12)
vehicleright.text:Point("CENTER", 0, 0)
vehicleright.text:SetText("|cff4BAF4C"..string.upper(LEAVE_VEHICLE).."|r")
RegisterStateDriver(vehicleright, "visibility", "[target=vehicle,exists] show;hide")
G.ActionBars.ExitVehicleRight = vehicleright

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not DuffedUIDataPerChar then DuffedUIDataPerChar = {} end
	local db = DuffedUIDataPerChar
	
	if not D.lowversion and db.hidebar2 then 
		UpdateBar(DuffedUIBar2Button, DuffedUIBar2)
	end
	
	if not D.lowversion and db.hidebar3 then
		UpdateBar(DuffedUIBar3Button, DuffedUIBar3)
	end
	
	if db.hidebar4 then
		UpdateBar(DuffedUIBar4Button, DuffedUIBar4)
	end
		
	if D.lowversion then
		-- because we use bar6.lua and bar7.lua with DuffedUIBar5Button for lower reso.
		DuffedUIBar2Button:Hide()
		DuffedUIBar3Button:Hide()
		if db.hidebar7 then
			UnregisterStateDriver(DuffedUIBar7, "visibility")
			DuffedUIBar7:Hide()
			DuffedUIBar5:SetWidth((D.buttonsize * 2) + (D.buttonspacing * 3))
		end
		
		if db.hidebar6 then
			UnregisterStateDriver(DuffedUIBar6, "visibility")
			DuffedUIBar6:Hide()
			DuffedUIBar5:SetWidth((D.buttonsize * 1) + (D.buttonspacing * 2))
		end
		
		DuffedUIBar5ButtonTop:SetWidth(DuffedUIBar5:GetWidth())
		DuffedUIBar5ButtonBottom:SetWidth(DuffedUIBar5:GetWidth())
	end
	
	if db.hidebar5 then
		UpdateBar(DuffedUIBar5ButtonTop, DuffedUIBar5)
	end
end)