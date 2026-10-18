
local BlockDefs = require("defs/blockDefs")

local function NewBlock(self)
	self.def = BlockDefs[self.blockType]
	
	function self.Update(dt)
		if self.def.goalFunc then
			self.goalDone = self.def.goalFunc(self)
		end
		return self.toDestroy
	end
	
	function self.Destroy(dt)
		if self.toDestroy then
			return false
		end
		self.toDestroy = true
		return true
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.DoMoveOnto(object)
		if self.def.isBlocking then
			return true
		end
	end
	
	function self.TryPickup(other)
		if self.def.pickupFunc then
			self.def.pickupFunc(self, other)
		end
		
	end
	
	function self.GoalSatisfied()
		return self.goalDone
	end
	
	function self.GetType()
		return self.blockType
	end
	
	function self.Export(objList)
		objList[#objList + 1] = {
			name = self.blockType,
			pos = self.pos,
			direction = self.direction,
		}
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2]; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			local image = self.def.image
			if self.goalDone then
				image = self.def.imageGoalDone
			end
			Resources.DrawImage(image, drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewBlock
