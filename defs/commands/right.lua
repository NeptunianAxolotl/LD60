local def = {
	image = "cmd_right",
	executeFunc = function (self)
		self.direction = (self.direction + 1)%4
	end
}

return def
