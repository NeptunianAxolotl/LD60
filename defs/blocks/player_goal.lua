
local def = {
	image = "player_goal",
	goalFunc = function (other)
		if other.GetType() == "player" then
			return true
		end
	end,
}

return def