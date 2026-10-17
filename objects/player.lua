
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
	
	function self.BlockAtMyLocation()
		return TerrainHandler.GetBlockAt(self.pos)
	end
	
	function self.Move(direction)
		if self.moveBlockDt then
			return false
		end
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		self.direction = direction
		if TerrainHandler.InteractWithObjectsAt(newPos, self, "DoMoveOnto") then
			return
		end
		self.prevPos = self.pos
		self.pos = newPos
		self.moveBlockDt = Global.PLAYER_MOVE_TIME
		return true
	end
	
	function self.DropPaint()
		if self.moveBlockDt and self.moveBlockDt > Global.PAINT_MOVE_REQ then
			return
		end
		if not self.BlockAtMyLocation() then
			TerrainHandler.AddBlock("paint", self.pos, self.direction)
		end
	end
	
	function self.Update(dt)
		self.moveBlockDt = util.UpdateTimer(self.moveBlockDt, dt)
		if love.mouse.isDown(2) then
			self.DropPaint()
			return
		end
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
	
	function self.OnGoal()
		local block = self.BlockAtMyLocation()
		if block and block.goalFunc(self) then
			return true
		end
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
			if self.moveBlockDt then
				local prevProp = self.moveBlockDt/Global.PLAYER_MOVE_TIME
				drawPos = util.Average(drawPos, LevelHandler.GridToWorld(self.prevPos), prevProp)
			end
			Resources.DrawImage("player", drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewPlayer
