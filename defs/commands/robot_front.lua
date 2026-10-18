local def = {
	image = "cmd_robot",
	humanName = "Robot in Front",
	description = "Triggers when a non-player robot is on the tile in front.",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.IsRobot()
	end
}

return def
