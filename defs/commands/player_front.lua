local def = {
	image = "cmd_player",
	humanName = "Player in Front",
	description = "Triggers when the player robot is on the tile in front of the robot.",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.GetType() == "player"
	end
}

return def
