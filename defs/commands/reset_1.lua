local def = {
	image = "cmd_reset_1",
	chainAction = true,
	chainFromPreviousAction = true,
	skipFunc = function (self)
		return not self.GetRegister(1)
	end,
	executeFunc = function (self)
		self.SetRegister(1, false)
	end,
	acceptFunc = function (self)
		return not self.GetRegister(1)
	end,
}

return def
