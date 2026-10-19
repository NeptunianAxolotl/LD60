local def = {
	image = "cmd_paint_down",
	humanName = "Add Paint",
	description = "Apply paint to the ground. The next command of the trigger is then executed.",
	chainToNextTriggerAction = true,
	executeFunc = function (self)
		self.AddPaint()
	end
}

return def
