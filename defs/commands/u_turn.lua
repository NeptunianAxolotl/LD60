local def = {
	image = "cmd_u_turn",
	executeFunc = function (self)
		self.direction = (self.direction - 2)%4
	end
}

return def
