local def = {
	image = "cmd_reset_1",
	humanName = "Clear Register 1",
	description = "Disables the Register 1 trigger. The robot then executes another action.",
	chainAction = true,
	chainFromPreviousAction = true,
	executeFunc = function (self)
		self.SetRegister(1, false)
	end,
}

return def
