local def = {
	image = "cmd_player_goal",
	humanName = "On Player Charging Port",
	description = "Triggers when the robot is on one of your charging ports.",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "player_goal"
	end
}

return def
