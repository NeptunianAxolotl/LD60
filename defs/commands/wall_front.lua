local def = {
	image = "cmd_wall_front",
	color = {0.2, 0.2, 0.2},
	acceptFunc = function (self)
		local object = self.BlockInRelativeDirection(0)
		return object and object.GetType() == "wall"
	end
}

return def
