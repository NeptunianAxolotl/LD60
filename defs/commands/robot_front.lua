local def = {
	image = "cmd_robot",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.GetType() == "basic_robot"
	end
}

return def
