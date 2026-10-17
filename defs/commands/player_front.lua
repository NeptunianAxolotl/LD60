local def = {
	image = "cmd_player",
	acceptFunc = function (self)
		local object = self.ObjInRelativeDirection(0)
		return object and object.GetType() == "player"
	end
}

return def
