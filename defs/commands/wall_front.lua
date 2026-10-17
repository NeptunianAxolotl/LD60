local def = {
	image = "cmd_wall_front",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.GetType() == "wall"
	end
}

return def
