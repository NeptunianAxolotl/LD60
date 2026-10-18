
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
		local open = (self.open or self.closeDelayDt)
		return open and "door_open" or "door"
	end,
	updateFunc = function (self, dt)
		self.closeDelayDt = util.UpdateTimer(self.closeDelayDt, dt)
		local wantOpen = TerrainHandler.GetDoorWantOpen(self.doorIndex)
		if wantOpen == self.open then
			return
		end
		if wantOpen then
			self.open = wantOpen -- Open delay happens in TerrainHandler
		else
			local blockage = TerrainHandler.GetMobileObjectAt(self.pos)
			if blockage then
				if blockage.GetType() == "player" then
					PlayerHandler.KillPlayer()
					self.open = wantOpen -- Close instantly?
				end
				return
			end
			self.open = wantOpen
			self.closeDelayDt = Global.DOOR_CLOSE_DELAY
		end
	end,
	initFunc = function (self)
		self.open = TerrainHandler.GetDoorWantOpen(self.doorIndex)
	end,
}

return def