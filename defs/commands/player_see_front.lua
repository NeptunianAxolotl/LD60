local def = {
	image = "cmd_player_see_front",
	acceptFunc = function (self)
		local object = self.SeeObjectInRelativeDirection(0, "player")
		return object
	end,
}

return def
