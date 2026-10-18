local def = {
	image = "cmd_box",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.GetType() == "box"
	end
}

return def
