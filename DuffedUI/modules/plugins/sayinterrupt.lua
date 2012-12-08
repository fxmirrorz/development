local D, C, L, G = unpack(select(2, ...))
if C["duffed"].sayinterrupt ~= true then return end

local f = CreateFrame("Frame")
local function Update(self, event, ...)
	if not C["duffed"].sayinterrupt then return end
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
			channel = "INSTANCE_CHAT"
		elseif IsInRaid("player") then
			channel = C["duffed"].announcechannel
		elseif IsInGroup("player") then
			channel = C["duffed"].announcechannel
		else
			channel = "SAY"
		end
		
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, _, extraskillID, extraSkillName = ...
		if eventType == "SPELL_INTERRUPT" and sourceName == UnitName("player") then
			SendChatMessage("Interrupted => "..GetSpellLink(extraskillID).."!", channel)
		end
	end
end
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", Update)