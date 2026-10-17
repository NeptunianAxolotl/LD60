
local function NewPlayer(self, position, direction)
	-- pos
	self.direction = direction
	self.pos = position
	
	function self.ObjInDirection(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		return TerrainHandler.GetAnythingAt(newPos)
	end
	
	function self.ObjInRelativeDirection(direction)
		direction = (self.direction + direction)%4
		return self.ObjInDirection(direction)
	end
	
	function self.Move(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		self.direction = direction
		local object = self.ObjInRelativeDirection(0)
		if object and object.DoMoveOnto(self) then
			return
		end
		self.pos = newPos
	end
	
	function self.Update(dt)
	end
	
	function self.Destroy(dt)
	end
	
	function self.DoMoveOnto(object)
		PlayerHandler.KillPlayer()
		return false
	end
	
	function self.GetType()
		return "player"
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
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
