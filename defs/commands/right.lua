local def = {
	image = "cmd_right",
	humanName = "Turn Right",
	description = "Rotates the robot right.",
	commandType = "turn",
	exclusiveAction = true,
	executeFunc = function (self)
		self.Rotate(1)
	end
}

return def
