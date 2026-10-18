local def = {
	image = "cmd_paint_see_right",
	humanName = "Visible Paint on Right",
	description = "Triggers when the robot can see paint to its right, at any distance. Blocked by walls, doors and boxes.",
	acceptFunc = function (self)
		local object = self.SeeBlockInRelativeDirection(1, "paint")
		return object
	end
}

return def
