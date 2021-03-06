local D, C, L, G = unpack(select(2, ...))

if not C["datatext"].block or C["datatext"].block == 0 then return end

local Stat = CreateFrame("Frame", "DuffedUIStatBlock")
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text  = Stat:CreateFontString("DuffedUIStatBlockText", "OVERLAY")
Text:SetFont(C["media"].font, C["datatext"].fontsize)
D.DataTextPosition(C["datatext"].block, Text)

local format = string.format
local displayFloat = string.join("", "%s", D.panelcolor, "%.2f%%|r")
local displayChance = string.join("", D.panelcolor, "%.2f|r (%.2f + |cff00ff00%.2f|r)")
local displayRating = string.join("", "%d (|cff00ff00+%.2f|r)")

local int = 5
local function Update(self, t)
	int = int - t
	if int > 0 then return end

	Text:SetFormattedText(displayFloat, STAT_BLOCK..": ", GetBlockChance())

	self:SetAllPoints(Text)

	int = 2
end

local function ShowTooltip(self)
	local anchor, panel, xoff, yoff = D.DataTextTooltipAnchor(Text)
	GameTooltip:SetOwner(panel, anchor, xoff, yoff)
	GameTooltip:ClearLines()

	local rating = GetCombatRating(CR_BLOCK)
	local ratingChance = GetCombatRatingBonus(CR_BLOCK)
	local baseChance = GetBlockChance() - ratingChance

	GameTooltip:AddDoubleLine(STAT_BLOCK, format(displayChance, GetBlockChance(), baseChance, ratingChance), 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine(ITEM_MOD_BLOCK_RATING_SHORT, format(displayRating, rating, ratingChance), 1, 1, 1, 1, 1, 1)
	GameTooltip:Show()
end

Stat:SetScript("OnEnter", function() ShowTooltip(Stat) end)
Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
Stat:SetScript("OnUpdate", Update)