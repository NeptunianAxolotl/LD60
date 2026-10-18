local def = {
	image = "cmd_paint_see_front",
	humanName = "Visible Paint Ahead",
	description = "Triggers when the robot can see paint in front of it, at any distance. Blocked by walls, doors and boxes.",
	acceptFunc = function (self)
		local object = self.SeeBlockInRelativeDirection(0, "paint")
		return object
	end
}

return def
