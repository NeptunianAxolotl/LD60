local def = {
	image = "cmd_box",
	humanName = "Box in Front",
	description = "Triggers when a box is on the tile in front of the robot.",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.GetType() == "box"
	end
}

return def
