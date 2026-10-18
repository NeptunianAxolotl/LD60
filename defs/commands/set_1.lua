local def = {
	image = "cmd_set_1",
	skipFunc = function (self)
		return self.GetRegister(1)
	end,
	executeFunc = function (self)
		self.chainAction = true
		self.SetRegister(1, true)
	end,
	acceptFunc = function (self)
		return self.GetRegister(1)
	end,
}

return def
