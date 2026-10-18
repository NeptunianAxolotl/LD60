local def = {
	image = "cmd_empty",
	skipFunc = function (self)
		return true
	end,
	executeFunc = function (self)
		self.chainAction = true
	end
}

return def
