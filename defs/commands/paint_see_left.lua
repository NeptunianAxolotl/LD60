local def = {
	image = "cmd_paint_see_left",
	acceptFunc = function (self)
		local object = self.SeeBlockInRelativeDirection(-1, "paint")
		return object
	end
}

return def
