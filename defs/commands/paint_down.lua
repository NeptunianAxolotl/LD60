local def = {
	image = "cmd_paint_down",
	humanName = "Add Paint",
	description = "Apply paint to the ground then execute the next command in the trigger.",
	chainToNextTriggerAction = true,
	executeFunc = function (self)
		self.AddPaint()
	end
}

return def
