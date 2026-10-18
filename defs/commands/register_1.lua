local def = {
	image = "cmd_set_1_on",
	humanName = "Register 1",
	description = "Triggers provided register 1 is set. Register stay set until cleared.",
	chainAction = true,
	skipFunc = function (self)
		return self.GetRegister(1)
	end,
	acceptFunc = function (self)
		return self.GetRegister(1)
	end,
	imageFunc = function (self)
		return self.GetRegister(1)and "cmd_set_1_on" or "cmd_set_1_off"
	end
}

return def
