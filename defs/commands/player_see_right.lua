local def = {
	image = "cmd_player_see_right",
	humanName = "Visible Player on Right",
	description = "Triggers when you are to the right of the robot, at any distance. Blocked by walls, doors and boxes.",
	acceptFunc = function (self)
		local object = self.SeeObjectInRelativeDirection(1, "player")
		return object
	end,
}

return def
