local def = {
	image = "cmd_paint_up",
	chainToNextTriggerAction = true,
	executeFunc = function (self)
		self.RemovePaint()
	end
}

return def
