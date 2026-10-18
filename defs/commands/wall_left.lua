local def = {
	image = "cmd_wall_left",
	color = {0.2, 0.2, 0.2},
	humanName = "Blocked on Left",
	description = "Triggers when a wall, box or closed door is directly to the left of the robot.",
	acceptFunc = function (self)
		local object = self.BlockInRelativeDirection(-1)
		if object and object.WallTrigger and object.WallTrigger() then
			return true
		end
		local object = self.ObjInRelativeDirection(-1)
		if object and object.WallTrigger and object.WallTrigger() then
			return true
		end
	end
}

return def
