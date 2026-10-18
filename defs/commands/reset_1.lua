local def = {
	image = "cmd_reset_1",
	skipFunc = function (self)
		return not self.GetRegister(1)
	end,
	executeFunc = function (self)
		self.chainAction = true
		self.SetRegister(1, false)
	end,
	acceptFunc = function (self)
		return not self.GetRegister(1)
	end,
}

return def
