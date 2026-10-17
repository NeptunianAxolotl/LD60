
local function NewPlayer(self, position, direction)
	-- pos
	self.direction = direction
	self.pos = position
	self.isPlayer = true
	
	function self.Move(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		self.direction = direction
		local block = TerrainHandler.GetBlockAt(newPos)
		if block and block.Stops(self) then
			return
		end
		local robot = RobotHandler.GetRobotAt(newPos)
		if robot and robot.Stops(self) then
			return
		end
		self.pos = newPos
	end
	
	function self.Update(dt)
	end
	
	function self.Destroy(dt)
	end
	
	function self.Stops(object)
		return true
	end
	
	function self.Export(objList)
		objList[#objList + 1] = {
			name = "player",
			pos = self.pos,
			direction = self.direction,
		}
	end
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2] + 10; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			Resources.DrawImage("player", drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewPlayer
