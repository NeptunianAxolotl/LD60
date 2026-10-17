local def = {
	image = "cmd_sub_1",
	executeFunc = function (self)
		self.forceFullTrigger = "sub_1"
		self.ForceExecuteCommand("sub_1", 1)
	end,
	acceptFunc = function (self)
		return (self.forceFullTrigger == "sub_1")
	end,
}

return def
