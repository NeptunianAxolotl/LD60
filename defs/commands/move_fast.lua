local def = {
	image = "cmd_move_fast",
	humanName = "On Player Charging Port",
	description = "Triggers when the robot is on one of your charging ports.",
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
