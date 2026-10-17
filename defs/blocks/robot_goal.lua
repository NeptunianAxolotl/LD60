
local def = {
	image = "robot_goal",
	imageGoalDone = "robot_goal_done",
	goalFunc = function (self)
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other and other.GetType() == "basic_robot" and other.HasArrived() then
			return true
		end
	end,
}

return def