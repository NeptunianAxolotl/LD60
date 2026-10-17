local def = {
	image = "cmd_paint",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "paint"
	end
}

return def
