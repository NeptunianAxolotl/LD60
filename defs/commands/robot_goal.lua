local def = {
	image = "cmd_robot_goal",
	humanName = "On Robot Port",
	description = "Triggers when the robot is on a non-player robot charging port.",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "robot_goal"
	end
}

return def
