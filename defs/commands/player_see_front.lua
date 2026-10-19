local def = {
	image = "cmd_player_see_front",
	humanName = "Visible Player Ahead",
	description = "Triggers when you are in front of the robot, at any distance. Blocked by walls, doors and boxes.",
	acceptFunc = function (self)
		local object = self.SeeObjectInRelativeDirection(0, "player")
		return object
	end,
}

return def
