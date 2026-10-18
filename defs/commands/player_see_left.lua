local def = {
	image = "cmd_player_see_left",
	humanName = "Visible Player on Left",
	description = "Triggers when the player is to the left of the robot, at any distance. Blocked by walls, doors and boxes.",
	acceptFunc = function (self)
		local object = self.SeeObjectInRelativeDirection(-1, "player")
		return object
	end,
}

return def
