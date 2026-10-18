local def = {
	image = "cmd_reflect",
	commandType = "move",
	exclusiveAction = true,
	executeFunc = function (self)
		self.Move(self.direction + 2)
	end,
}

return def
