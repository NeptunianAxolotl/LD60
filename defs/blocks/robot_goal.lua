
local def = {
	image = "robot_goal",
	imageFunc = function (self)
		return self.goalDone and "robot_goal_done" or "robot_goal"
	end,
	updateFunc = function (self)
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other and other.IsRobot() and other.HasArrived() then
			self.goalDone = true
			return
		end
		self.goalDone = false
	end,
}

return def