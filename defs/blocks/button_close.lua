
local def = {
	image = "button",
	needDoorIndex = true,
	partialTopDrawFunc = function (self)
		return TerrainHandler.GetDoorWantOpen(self.doorIndex) and 0.3 or 0.15
	end,
	drawColorFunc = function (self)
		return TerrainHandler.GetDoorWantOpen(self.doorIndex) and Global.DOOR_ON_COLOR[self.doorIndex] or Global.DOOR_OFF_COLOR[self.doorIndex]
	end,
	updateFunc = function (self)
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other then
			TerrainHandler.SetDoorOpen(self.doorIndex, false)
		end
	end,
}

return def