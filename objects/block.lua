
local BlockDefs = require("defs/blockDefs")

local function NewBlock(self)
	self.def = BlockDefs[self.blockType]
	self.doorIndex = self.params.doorIndex
	
	if self.def.initFunc then
		self.def.initFunc(self)
	end
	
	function self.Update(dt)
		if self.def.updateFunc then
			self.def.updateFunc(self, dt)
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
		if self.def.isBlocking or (self.def.blockingFunc and self.def.blockingFunc(self)) then
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
	
	function self.WallTrigger()
		if not self.def.triggerAsWall then
			return false
		end
		if self.def.blockingFunc and not self.def.blockingFunc(self) then
			return false
		end
		return true
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
			local image = self.def.imageFunc and self.def.imageFunc(self) or self.def.image
			local color = self.def.drawColorFunc and self.def.drawColorFunc(self)
			Resources.DrawImage(image, drawPos[1], drawPos[2], drawRot, false, false, color)
		end})
	end
	
	return self
end

return NewBlock
