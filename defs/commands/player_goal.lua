local def = {
	image = "cmd_player_goal",
	humanName = "On Player Port",
	description = "Triggers when the robot is on a player robot charging port.",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "player_goal"
	end
}

return def
