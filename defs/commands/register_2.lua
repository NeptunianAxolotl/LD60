local def = {
	image = "cmd_set_2_on",
	humanName = "Register 2",
	description = "Activates as long as Register 2 is set. Register stay set until cleared.",
	acceptFunc = function (self)
		return self.GetRegister(2)
	end,
	imageFunc = function (self)
		return self.GetRegister(2) and "cmd_set_2_on" or "cmd_set_2_off"
	end
}

return def
