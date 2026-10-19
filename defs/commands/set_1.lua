local def = {
	image = "cmd_set_1",
	humanName = "Set Register 1",
	description = "Allows the Register 1 trigger to activate. The robot then executes another action.",
	chainAction = true,
	executeFunc = function (self)
		self.SetRegister(1, true)
	end,
}

return def
