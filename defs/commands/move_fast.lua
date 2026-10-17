local def = {
	image = "cmd_move_fast",
	commandType = "move",
	commandSpeed = 2,
	executeFunc = function (self)
		self.Move(self.direction)
	end,
}

return def
