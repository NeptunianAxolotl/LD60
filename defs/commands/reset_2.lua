local def = {
	image = "cmd_reset_2",
	humanName = "Clear Register 2",
	description = "Disables the Register 2 trigger. The robot then executes another action.",
	chainAction = true,
	chainFromPreviousAction = true,
	executeFunc = function (self)
		self.SetRegister(2, false)
	end,
}

return def
