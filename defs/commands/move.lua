local def = {
	image = "cmd_move",
	humanName = "Move Forward",
	description = "Moves the robot forward one tile.",
	commandType = "move",
	exclusiveAction = true,
	executeFunc = function (self)
		self.Move(self.direction)
	end
}

return def
