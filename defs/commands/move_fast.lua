local def = {
	image = "cmd_move_fast",
	humanName = "On Player Port",
	description = "Triggers when the robot is on a player robot charging port.",
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
