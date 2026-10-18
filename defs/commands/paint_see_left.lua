local def = {
	image = "cmd_paint_see_left",
	humanName = "Visible Paint on Left",
	description = "Triggers when the robot can see paint to its left, at any distance. Blocked by walls, doors and boxes.",
	acceptFunc = function (self)
		local object = self.SeeBlockInRelativeDirection(-1, "paint")
		return object
	end
}

return def
