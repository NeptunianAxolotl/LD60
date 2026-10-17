local def = {
	image = "cmd_reflect",
	skipRotationAnimate = true,
	commandType = "move",
	executeFunc = function (self)
		self.Rotate(2)
		self.Move(self.direction)
	end,
}

return def
