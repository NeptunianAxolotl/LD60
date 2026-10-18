local def = {
	image = "cmd_button",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and (object.GetType() == "button_close" or object.GetType() == "button_open")
	end
}

return def
