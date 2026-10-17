local def = {
	image = "cmd_robot",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.IsRobot()
	end
}

return def
