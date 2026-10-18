local def = {
	image = "cmd_move_fast",
	commandType = "move",
	commandSpeed = 2,
	exclusiveAction = true,
	executeFunc = function (self)
		self.Move(self.direction)
	end,
}

return def
