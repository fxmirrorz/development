local D, C, L, G = unpack(select(2, ...)) 

if not C["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarBottomLeft as bar #2
---------------------------------------------------------------------------

local bar = DuffedUIBar2
MultiBarBottomLeft:SetParent(bar)

-- setup the bar
for i=1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(D.buttonsize, D.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("BOTTOMLEFT", bar, D.buttonspacing, D.buttonspacing)
	elseif i == 7 then
		b:SetPoint("TOPLEFT", bar, D.buttonspacing, -D.buttonspacing)
	else
		b:SetPoint("LEFT", b2, "RIGHT", D.buttonspacing, 0)
	end
	
	G.ActionBars.Bar2["Button"..i] = b
end

for i=7, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton1"]
	b:SetFrameLevel(b2:GetFrameLevel() - 2)
end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")