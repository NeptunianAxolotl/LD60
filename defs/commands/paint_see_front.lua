local def = {
	image = "cmd_paint_see_front",
	acceptFunc = function (self)
		local object = self.SeeBlockInRelativeDirection(0, "paint")
		return object
	end
}

return def
