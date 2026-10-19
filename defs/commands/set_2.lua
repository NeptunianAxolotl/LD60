local def = {
	image = "cmd_set_2",
	humanName = "Set Register 2",
	description = "Allows the Register 2 trigger to activate. The robot then executes another action.",
	chainAction = true,
	executeFunc = function (self)
		self.SetRegister(2, true)
	end,
}

return def
