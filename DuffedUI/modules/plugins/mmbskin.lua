local D, C, L, G = unpack(select(2, ...))
if IsAddOnLoaded("GatherMate2") then return end

local buttons = {
	"QueueStatusMinimapButton",
	"MiniMapTrackingButton",
	"MiniMapMailFrame",
	"HelpOpenTicketButton"
}

local function SkinButton(frame)
	if frame:GetObjectType() ~= "Button" then return end

	for i, buttons in pairs(buttons) do
		if frame:GetName() ~= nil then
			if frame:GetName():match(buttons) then return end
		end
	end

	frame:SetPushedTexture(nil)
	frame:SetHighlightTexture(nil)
	frame:SetDisabledTexture(nil)
	frame:Size(24)

	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			local tex = region:GetTexture()

			if tex and (tex:find("Border") or tex:find("Background") or tex:find("AlphaMask")) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:Point("TOPLEFT", frame, "TOPLEFT", 2, -2)
				region:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				region:SetDrawLayer("ARTWORK")
				if frame:GetName() == "PS_MinimapButton" then
					region.SetPoint = T.dummy
				end
			end
		end
	end

	frame:SetTemplate("Default")
end

local SkinMinimapButtons = CreateFrame("Frame")
SkinMinimapButtons:RegisterEvent("PLAYER_LOGIN")
SkinMinimapButtons:SetScript("OnEvent", function(self, event)
	for i = 1, Minimap:GetNumChildren() do
		SkinButton(select(i, Minimap:GetChildren()))
	end

	self = nil
end)