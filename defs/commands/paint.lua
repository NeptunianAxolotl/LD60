local def = {
	image = "cmd_paint",
	humanName = "On Paint",
	description = "Triggers when the robot is on a painted tile.",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "paint"
	end
}

return def
