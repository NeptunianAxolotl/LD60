local def = {
	image = "cmd_wall_left",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(-1)
		return object and object.GetType() == "wall"
	end
}

return def
