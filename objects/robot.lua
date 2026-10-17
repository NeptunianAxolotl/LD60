
local RobotDefs = util.LoadDefDirectory("defs/robots")

local function NewRobot(self)
	self.def = RobotDefs[self.robotType]
	
	function self.Move(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		local block = TerrainHandler.GetBlockAt(newPos)
		self.direction = direction
		if block and block.Stops(self) then
			return
		end
		self.pos = newPos
	end
	
	function self.Update(dt)
	end
	
	function self.Destroy(dt)
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.Stops(object)
		if self.def.isBlocking then
			return true
		end
	end
	
	function self.Export(objList)
		objList[#objList + 1] = {
			name = self.robotType,
			pos = self.pos,
			direction = self.direction,
		}
	end
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2] + 10; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewRobot
