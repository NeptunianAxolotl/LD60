local def = {
	image = "cmd_set_1",
	humanName = "Set Register 1",
	description = "Allows the Register 1 trigger to activate. This command doubles as the Register 1 trigger.",
	chainAction = true,
	skipFunc = function (self)
		return self.GetRegister(1)
	end,
	executeFunc = function (self)
		self.SetRegister(1, true)
	end,
	acceptFunc = function (self)
		return self.GetRegister(1)
	end,
	imageFunc = function (self)
		return self.GetRegister(1)and "cmd_set_1_on" or "cmd_set_1_off"
	end
}

return def
