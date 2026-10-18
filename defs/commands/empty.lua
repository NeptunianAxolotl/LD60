local def = {
	image = "cmd_empty",
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
