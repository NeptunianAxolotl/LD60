local def = {
	image = "cmd_fire",
	humanName = "On Fire",
	description = "Triggers when the robot is on fire. Standing on fire that is. Old robots are fireproof.",
	acceptFunc = function (self)
		local object = self.BlockAtMyLocation()
		return object and object.GetType() == "fire"
	end
}

return def
