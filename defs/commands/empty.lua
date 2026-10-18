local def = {
	image = "cmd_empty",
	humanName = "Empty",
	description = "An empty slot.",
	isEmpty = true,
	skipFunc = function (self)
		return true
	end,
	executeFunc = function (self)
		self.chainAction = true
	end,
	acceptFunc = function (self)
		return false
	end,
}

return def
