local def = {
	image = "cmd_left",
	commandType = "turn",
	executeFunc = function (self)
		self.Rotate(-1)
	end
}

return def
