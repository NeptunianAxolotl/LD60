local def = {
	image = "cmd_player_goal",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "player_goal"
	end
}

return def
