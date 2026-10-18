local def = {
	image = "cmd_move",
	commandType = "move",
	exclusiveAction = true,
	executeFunc = function (self)
		self.Move(self.direction)
	end
}

return def
