local def = {
	image = "cmd_paint_up",
	humanName = "Remove Paint",
	description = "Remove paint from ground then execute the next command in the trigger.",
	chainToNextTriggerAction = true,
	executeFunc = function (self)
		self.RemovePaint()
	end
}

return def
