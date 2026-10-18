
local def = {
	image = "player_goal",
	imageFunc = function (self)
		return self.goalDone and "player_goal_done" or "player_goal"
	end,
	updateFunc = function (self)
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other and other.GetType() == "player" and other.HasArrived() then
			self.goalDone = true
			return
		end
		self.goalDone = false
	end,
}

return def