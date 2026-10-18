local def = {
	image = "cmd_wall_left",
	color = {0.2, 0.2, 0.2},
	acceptFunc = function (self)
		local object = self.BlockInRelativeDirection(-1)
		return object and object.WallTrigger and object.WallTrigger()
	end
}

return def
