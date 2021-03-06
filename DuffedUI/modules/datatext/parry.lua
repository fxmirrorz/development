local D, C, L, G = unpack(select(2, ...))

if not C["datatext"].parry or C["datatext"].parry == 0 then return end

local Stat = CreateFrame("Frame", "DuffedUIStatParry")
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text  = Stat:CreateFontString("DuffedUIStatParryText", "OVERLAY")
Text:SetFont(C["media"].font, C["datatext"].fontsize)
D.DataTextPosition(C["datatext"].parry, Text)

local format = string.format
local displayFloat = string.join("", "%s", D.panelcolor, "%.2f%%|r")
local displayChance = string.join("", D.panelcolor, "%.2f|r (%.2f + |cff00ff00%.2f|r)")
local displayRating = string.join("", "%d (|cff00ff00+%.2f|r)")

local int = 5
local function Update(self, t)
	int = int - t
	if int > 0 then return end

	Text:SetFormattedText(displayFloat, STAT_PARRY..": ", GetParryChance())

	self:SetAllPoints(Text)

	int = 2
end

local function ShowTooltip(self)
	local anchor, panel, xoff, yoff = D.DataTextTooltipAnchor(Text)
	GameTooltip:SetOwner(panel, anchor, xoff, yoff)
	GameTooltip:ClearLines()

	local rating = GetCombatRating(CR_PARRY)
	local ratingChance = GetCombatRatingBonus(CR_PARRY)
	local baseChance = GetParryChance() - ratingChance

	GameTooltip:AddDoubleLine(STAT_PARRY, format(displayChance, GetParryChance(), baseChance, ratingChance), 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine(ITEM_MOD_PARRY_RATING_SHORT, format(displayRating, rating, ratingChance), 1, 1, 1, 1, 1, 1)
	GameTooltip:Show()
end

Stat:SetScript("OnEnter", function() ShowTooltip(Stat) end)
Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
Stat:SetScript("OnUpdate", Update)