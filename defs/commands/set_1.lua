local def = {
	image = "cmd_set_1",
	humanName = "Set Register 1",
	description = "Allows the Register 1 trigger to activate.",
	chainAction = true,
	skipFunc = function (self)
		return self.GetRegister(1)
	end,
	executeFunc = function (self)
		self.SetRegister(1, true)
	end,
}

return def
