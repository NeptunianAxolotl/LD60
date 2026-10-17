local def = {
	image = "cmd_move",
	commandType = "move",
	executeFunc = function (self)
		self.Move(self.direction)
	end
}

return def
