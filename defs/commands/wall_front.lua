local def = {
	image = "cmd_wall_front",
	color = {0.2, 0.2, 0.2},
	acceptFunc = function (self)
		local object = self.BlockInRelativeDirection(0)
		if object and object.WallTrigger and object.WallTrigger() then
			return true
		end
		local object = self.ObjInRelativeDirection(0)
		if object and object.WallTrigger and object.WallTrigger() then
			return true
		end
	end
}

return def
