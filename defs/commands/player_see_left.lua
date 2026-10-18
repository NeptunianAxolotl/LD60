local def = {
	image = "cmd_player_see_left",
	acceptFunc = function (self)
		local object = self.SeeObjectInRelativeDirection(-1, "player")
		return object
	end,
}

return def
