
local def = {
	image = "player_goal",
	imageGoalDone = "player_goal_done",
	goalFunc = function (self)
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other and other.GetType() == "player" and other.HasArrived() then
			return true
		end
	end,
}

return def