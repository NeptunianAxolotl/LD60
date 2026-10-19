
local function NewPlayer(self, position, direction)
	-- pos
	self.direction = direction
	self.pos = position
	
	function self.GetRelativeTile(direction)
		return util.Add(self.pos, util.CardinalToVector((self.direction + direction)%4))
	end
	
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
	
	function self.GetPos()
		return self.pos
	end
	
	function self.Move(direction)
		if self.dead or not GameHandler.AllowMovement() then
			return false
		end
		if self.moveBlockDt then
			return false
		end
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		self.direction = direction
		if TerrainHandler.InteractWithObjectsAt(newPos, self, "BlockMoveIntoByObject", direction) then
			return true
		end
		self.prevPos = self.pos
		self.pos = newPos
		self.moveBlockDt = Global.PLAYER_MOVE_TIME
		self.moveBlockMax = Global.PLAYER_MOVE_TIME
		self.undoingMove = false
		self.cannotPickupAutomatically = false
		return true
	end
	
	function self.UndoMove(window)
		if self.dead or self.undoingMove or not (self.prevPos and self.moveBlockDt and self.moveBlockMax - self.moveBlockDt < window) then
			return false
		end
		if TerrainHandler.InteractWithObjectsAt(self.prevPos, self, "BlockMoveIntoByObject", direction) then
			return false
		end
		self.pos, self.prevPos = self.prevPos, self.pos
		self.moveBlockDt = (self.moveBlockMax - self.moveBlockDt)
		self.undoingMove = true
		return true
	end
	
	function self.HasArrived()
		return (not self.moveBlockDt) or self.moveBlockDt < Global.ARRIVAL_LEEWAY
	end
	
	function self.FullyStationary()
		return (not self.moveBlockDt) or util.Equal(self.pos, self.prevPos)
	end
	
	function self.DropOrCleanPaint()
		if self.dead or not GameHandler.AllowMovement() then
			return
		end
		local dropPos = LevelHandler.WorldToGrid(self.GetDrawPos())
		local block = TerrainHandler.GetBlockAt(dropPos)
		if not block then
			TerrainHandler.AddBlock("paint", dropPos, 0)
			SoundHandler.PlaySound("gsharp_2")
		elseif block.GetType() == "paint" then
			TerrainHandler.RemoveBlock(dropPos)
			SoundHandler.PlaySound("gsharp_3")
		end
	end
	
	function self.CheckPickup()
		if not self.HasArrived() then
			return
		end
		local block = TerrainHandler.GetBlockAt(self.pos)
		if block and block.TryPickup(self) then
			SoundHandler.PlaySound("csharp_3")
			return true
		end
	end
	
	function self.SetCannotPickup()
		self.cannotPickupAutomatically = true
	end
	
	function self.Update(dt)
		if self.dead then
			self.deadDt = util.UpdateTimer(self.deadDt, dt)
			return
		end
		self.moveBlockDt = util.UpdateTimer(self.moveBlockDt, dt)
		if not self.cannotPickupAutomatically then
			self.CheckPickup()
		end
	end
	
	function self.Destroy(dt)
		if self.dead or not GameHandler.AllowMovement() then
			return false
		end
		self.deadDt = Global.DEAD_TIME
		self.dead = true
		SoundHandler.PlaySound("csharp_2")
		return true
	end
	
	function self.IsDead()
		return self.dead
	end
	
	function self.BlockMoveIntoByObject(object)
		if not self.UndoMove(Global.PLAYER_CRUSH_UNDO_WINDOW) then
			PlayerHandler.KillPlayer()
		end
		return false
	end
	
	function self.IsRobot()
		return false
	end
	
	function self.IsPushable()
		return false
	end
	
	function self.GoalSatisfied()
		if self.dead then
			return false
		end
		local block = TerrainHandler.GetBlockAt(self.pos)
		return block and block.GoalSatisfied()
	end
	
	function self.GetType()
		return "player"
	end
	
	function self.GetDrawPos()
		local drawPos = LevelHandler.GridToWorld(self.pos)
		if self.moveBlockDt then
			local prevProp = self.moveBlockDt / self.moveBlockMax
			drawPos = util.Average(drawPos, LevelHandler.GridToWorld(self.prevPos), prevProp)
		end
		return drawPos
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.ForceReposition(offset)
		self.pos = util.Add(self.pos, offset)
	end
	
	function self.Export(objList)
		objList[#objList + 1] = {
			name = "player",
			pos = self.pos,
			direction = self.direction,
			paintCount = self.paintCount,
		}
	end
	
	function self.GetDeadColors()
		if not self.dead then
			return 1, 1, false
		end
		if not self.deadDt then
			return 0, 1, false
		end
		local alpha = self.deadDt / Global.DEAD_TIME
		local scale = 1 + (Global.DEAD_TIME - self.deadDt)*0.35
		local color = math.max(0.35, 1 + (1 - scale)*2)
		return alpha, scale, {color, color, color}
		
	end
	
	function self.Draw(drawQueue)
		local depth = self.dead and 400 or 200
		drawQueue:push({y=self.pos[2] + depth; f=function()
			local drawPos = self.GetDrawPos()
			local drawRot = util.CardinalToDirection(self.direction)
			local alpha, scale, color = self.GetDeadColors()
			Resources.DrawImage("player", drawPos[1], drawPos[2], drawRot, alpha, scale, color)
			local target = PlayerHandler.GetTargetForCommand()
			if target then
				local targetPos = LevelHandler.GridToWorld(target.GetPos())
				love.graphics.setLineWidth(5)
				love.graphics.setColor(Global.HOVER_HIGHLIGHT)
				love.graphics.rectangle("line", targetPos[1] - Global.TILE_SIZE/2, targetPos[2] - Global.TILE_SIZE/2, Global.TILE_SIZE, Global.TILE_SIZE, 4, 4, 32)
			end
		end})
	end
	
	return self
end

return NewPlayer
