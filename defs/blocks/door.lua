
local def = {
	image = "door",
	needDoorIndex = true,
	triggerAsWall = true,
	blockingFunc = function (self)
		return not self.open
	end,
	drawColorFunc = function (self)
		return Global.DOOR_ON_COLOR[self.doorIndex]
	end,
	imageFunc = function (self)
		local open = self.open
		if self.closeDelayDt then
			open = self.oldOpen
		end
		return open and "door_open" or "door"
	end,
	updateFunc = function (self, dt)
		self.doorDelayDt = util.UpdateTimer(self.doorDelayDt, dt)
		local wantOpen = TerrainHandler.GetDoorWantOpen(self.doorIndex)
		if wantOpen == self.open then
			return
		end
		if not wantOpen then
			local blockage = TerrainHandler.GetMobileObjectAt(self.pos)
			if blockage then
				if blockage.GetType() == "player" then
					PlayerHandler.KillPlayer()
				else
					return
				end
			end
		end
		if not self.doorDelayDt then
			self.oldOpen = self.open
		end
		self.open = wantOpen
		self.doorDelayDt = Global.DOOR_DELAY
	end,
	initFunc = function (self)
		self.open = TerrainHandler.GetDoorWantOpen(self.doorIndex)
	end,
}

return def