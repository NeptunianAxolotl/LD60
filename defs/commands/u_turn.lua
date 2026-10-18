local def = {
	image = "cmd_u_turn",
	commandType = "turn",
	animateSpeed = 0.5,
	exclusiveAction = true,
	executeFunc = function (self)
		self.Rotate(2)
	end,
}

return def
