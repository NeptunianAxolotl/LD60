local def = {
	image = "cmd_move_fast",
	humanName = "Charge Forward",
	description = "Rapidly moves the robot forward one tile.",
	humanName = "Move Quickly",
	description = "Moves the robot fowards at double speed.",
	commandType = "move",
	commandSpeed = 2,
	exclusiveAction = true,
	executeFunc = function (self)
		self.Move(self.direction)
	end,
}

return def
