
local def = {
	image = "player_goal",
	goalFunc = function (other)
		if other.GetType() == "player" and other.HasArrived() then
			return true
		end
	end,
}

return def