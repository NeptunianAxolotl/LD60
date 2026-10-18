local def = {
	image = "cmd_reflect",
	skipRotationAnimate = true,
	commandType = "move",
	executeFunc = function (self)
		self.Move(self.direction + 2)
	end,
}

return def
