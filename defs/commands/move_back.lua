local def = {
	image = "cmd_reflect",
	humanName = "Move Backward",
	description = "Moves the robot backwards one tile.",
	commandType = "move",
	exclusiveAction = true,
	executeFunc = function (self)
		self.Move(self.direction + 2)
	end,
}

return def
