local def = {
	image = "cmd_robot_goal",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "robot_goal"
	end
}

return def
