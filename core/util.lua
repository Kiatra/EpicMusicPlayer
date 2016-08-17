local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")

------------------------------------------------------------------------------
-- util functions
------------------------------------------------------------------------------
function EpicMusicPlayer:ToHex(r,g,b)
	if r and type(r) == "table" then
		r,g,b = r.r, r.g, r.b
	end
	return ("%02x%02x%02x%02x"):format(1*255,r*255, g*255, b*255)
end

function EpicMusicPlayer:GetTimeSTring(seconds)
    local min = seconds / 60
		local sec = mod(seconds, 60)
		if( sec < 10) then
		    -- add zero
        return string.format("%d:0%d", min, sec)
    end
		return string.format("%d:%d", min, sec)
end

local function Debug(...)
	if(EpicMusicPlayer.dataBase.char.debug)then
	 	local s = "EMP Debug:"
		for i=1,select("#", ...) do
			local x = select(i, ...)
			s = strjoin("  ",s,tostring(x))
		end
		DEFAULT_CHAT_FRAME:AddMessage(s)
	end
end

function EpicMusicPlayer:Debug(...)
	Debug(self, ...)
end
