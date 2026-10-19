local def = {
	image = "cmd_paint_up",
	humanName = "Remove Paint",
	description = "Remove paint from ground. The next command of the trigger is then executed.",
	chainToNextTriggerAction = true,
	executeFunc = function (self)
		self.RemovePaint()
	end
}

return def
