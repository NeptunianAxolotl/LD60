
local def = {
	image = "button",
	needDoorIndex = true,
	drawColorFunc = function (self)
		return TerrainHandler.GetDoorWantOpen(self.doorIndex) and Global.DOOR_OFF_COLOR[self.doorIndex] or Global.DOOR_ON_COLOR[self.doorIndex]
	end,
	updateFunc = function (self)
		if TerrainHandler.GetDoorWantOpen(self.doorIndex) then
			return
		end
		local other = TerrainHandler.GetMobileObjectAt(self.pos)
		if other and other.HasArrived() then
			TerrainHandler.SetDoorOpen(self.doorIndex, true)
		end
	end,
}

return def