local def = {
	image = "cmd_wildcard",
	humanName = "Wildcard",
	description = "Always triggers if reached. Robots check their triggers from top to bottom.",
	color = {0.2, 0.2, 0.2},
	acceptFunc = function (self)
		return true
	end
}

return def
