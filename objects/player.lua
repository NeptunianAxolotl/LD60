
local function NewPlayer(self, position, direction)
	-- pos
	self.direction = direction
	self.pos = position
	
	function self.ObjInDirection(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		return TerrainHandler.GetMobileObjectAt(newPos)
	end
	
	function self.ObjInRelativeDirection(direction)
		direction = (self.direction + direction)%4
		return self.ObjInDirection(direction)
	end
	
	function self.BlockInDirection(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		return TerrainHandler.GetBlockAt(newPos)
	end
	
	function self.BlockInRelativeDirection(direction)
		direction = (self.direction + direction)%4
		return self.BlockInDirection(direction)
	end
	
	function self.BlockAtMyLocation()
		return TerrainHandler.GetBlockAt(self.pos)
	end
	
	function self.Move(direction)
		if not GameHandler.AllowMovement() then
			return
		end
		if self.moveBlockDt then
			return false
		end
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		self.direction = direction
		if TerrainHandler.InteractWithObjectsAt(newPos, self, "DoMoveOnto") then
			return true
		end
		self.prevPos = self.pos
		self.pos = newPos
		self.moveBlockDt = Global.PLAYER_MOVE_TIME
		return true
	end
	
	function self.HasArrived()
		return (not self.moveBlockDt) or self.moveBlockDt < Global.ARRIVAL_LEEWAY
	end
	
	function self.DropOrCleanPaint()
		local dropPos = LevelHandler.WorldToGrid(self.GetDrawPos())
		local block = TerrainHandler.GetBlockAt(dropPos)
		if not block then
			TerrainHandler.AddBlock("paint", dropPos, self.direction)
		elseif block.GetType() == "paint" then
			TerrainHandler.RemoveBlock(dropPos)
		end
	end
	
	function self.CheckPickup()
		if not self.HasArrived() then
			return
		end
		local block = TerrainHandler.GetBlockAt(self.pos)
		if block then
			block.TryPickup(self)
		end
	end
	
	function self.Update(dt)
		self.moveBlockDt = util.UpdateTimer(self.moveBlockDt, dt)
		self.CheckPickup()
	end
	
	function self.Destroy(dt)
		if not GameHandler.AllowMovement() then
			return
		end
	end
	
	function self.DoMoveOnto(object)
		PlayerHandler.KillPlayer()
		return false
	end
	
	function self.IsRobot()
		return false
	end
	
	function self.GoalSatisfied()
		local block = TerrainHandler.GetBlockAt(self.pos)
		return block and block.GoalSatisfied()
	end
	
	function self.GetType()
		return "player"
	end
	
	function self.GetDrawPos()
		local drawPos = LevelHandler.GridToWorld(self.pos)
		if self.moveBlockDt then
			local prevProp = self.moveBlockDt/Global.PLAYER_MOVE_TIME
			drawPos = util.Average(drawPos, LevelHandler.GridToWorld(self.prevPos), prevProp)
		end
		return drawPos
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.Export(objList)
		objList[#objList + 1] = {
			name = "player",
			pos = self.pos,
			direction = self.direction,
			paintCount = self.paintCount,
		}
	end
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2] + 10; f=function()
			local drawPos = self.GetDrawPos()
			local drawRot = util.CardinalToDirection(self.direction)
			Resources.DrawImage("player", drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewPlayer
