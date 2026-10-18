
local def = {
	image = "button",
	needDoorIndex = true,
	partialTopDrawFunc = function (self)
		return TerrainHandler.GetDoorWantOpen(self.doorIndex) and 0.15 or 0.3
	end,
	drawColorFunc = function (self)
		return TerrainHandler.GetDoorWantOpen(self.doorIndex) and Global.DOOR_OFF_COLOR[self.doorIndex] or Global.DOOR_ON_COLOR[self.doorIndex]
	end,
	updateFunc = function (self)
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other then
			TerrainHandler.SetDoorOpen(self.doorIndex, true)
		end
	end,
}

return def