local def = {
	image = "cmd_paint_down",
	chainToNextTriggerAction = true,
	executeFunc = function (self)
		self.AddPaint()
	end
}

return def
