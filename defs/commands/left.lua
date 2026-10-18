local def = {
	image = "cmd_left",
	humanName = "Turn Left",
	description = "Rotates the robot left.",
	commandType = "turn",
	exclusiveAction = true,
	executeFunc = function (self)
		self.Rotate(-1)
	end
}

return def
