local def = {
	image = "cmd_reset_1",
	humanName = "Clear Register 1",
	description = "Blocks Register 1 trigger activation.",
	chainAction = true,
	chainFromPreviousAction = true,
	skipFunc = function (self)
		return not self.GetRegister(1)
	end,
	executeFunc = function (self)
		self.SetRegister(1, false)
	end,
}

return def
