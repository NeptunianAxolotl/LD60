local def = {
	image = "cmd_wall_left",
	color = {0.2, 0.2, 0.2},
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(-1)
		return object and object.GetType() == "wall"
	end
}

return def
