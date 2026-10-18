local def = {
	image = "cmd_button",
	humanName = "On Button",
	description = "Triggers when the robot is on a button of any colour.",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and (object.GetType() == "button_close" or object.GetType() == "button_open")
	end
}

return def
