local def = {
	image = "cmd_reflect_fast",
	skipRotationAnimate = true,
	commandType = "move",
	commandSpeed = 2,
	executeFunc = function (self)
		self.Rotate(2)
		self.Move(self.direction)
	end,
}

return def
