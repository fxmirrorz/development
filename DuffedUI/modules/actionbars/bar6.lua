local D, C, L, G = unpack(select(2, ...)) 
if not C["actionbar"].enable == true or not D.lowversion then return end

DuffedUIBar5:SetWidth((D.buttonsize * 3) + (D.buttonspacing * 4))

local bar = DuffedUIBar6
bar:SetAlpha(1)
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
		b:SetPoint("TOPLEFT", bar, D.buttonspacing, -D.buttonspacing)
	else
		b:SetPoint("TOP", b2, "BOTTOM", 0, -D.buttonspacing)
	end
	
	G.ActionBars.Bar6["Button"..i] = b
end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")