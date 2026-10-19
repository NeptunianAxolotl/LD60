
local BlockDefs = require("defs/blockDefs")

local function NewBlock(self)
	self.def = BlockDefs[self.blockType]
	self.doorIndex = self.params.doorIndex
	if self.def.fixedDirection then
		self.direction = self.def.fixedDirection
	end
	if self.def.fireAnimate then
		self.fireScale = {1, 1}
	end
	
	if self.def.randomRotation then
		self.randomRotation = math.random()*self.def.randomRotation*2 - self.def.randomRotation
	end
	if self.def.randomScale then
		self.randomScale = {
			1 + math.random()*self.def.randomScale*2 - self.def.randomScale,
			1 + math.random()*self.def.randomScale*2 - self.def.randomScale,
		}
	end
	if self.def.randomColor then
		local blue = math.pow(math.random()*0.9, 2)
		local colPos = util.Mult(1 - blue, util.RandomPointInAnnulus(0.7, 0.9, 0, math.pi/2))
		colPos[3] = blue
		self.randomColor = colPos
	end
	
	if self.def.initFunc then
		self.def.initFunc(self)
	end
	
	function self.Update(dt)
		if self.def.updateFunc then
			self.def.updateFunc(self, dt)
		end
		if self.fireScale then
			local variation = util.RandomPointInAnnulus(dt*0.1, dt*0.6)
			variation[2] = variation[2]*4
			self.fireScale = util.ClampVector(util.Add(self.fireScale, variation), 0.9, 0.9, 1.2, 1.2)
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
	
	function self.BlockMoveIntoByObject(object, direction)
		if self.def.isBlocking or (self.def.blockingFunc and self.def.blockingFunc(self)) then
			return true
		end
		if object.GetType() == "player" and self.def.playerBlocking then
			return true
		end
	end
	
	function self.TryPickup(other)
		if self.def.pickupFunc then
			return self.def.pickupFunc(self, other)
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
	
	function self.ForceReposition(offset)
		self.pos = util.Add(self.pos, offset)
	end
	
	function self.Export(objList)
		local data = {
			name = self.blockType,
			pos = self.pos,
			direction = self.direction,
		}
		for k, v in pairs(self.params) do
			data[k] = v
		end
		objList[#objList + 1] = data
	end
	
	function self.Draw(drawQueue)
		local drawPos = LevelHandler.GridToWorld(self.pos)
		local drawRot = util.CardinalToDirection(self.direction) + (self.randomRotation or 0)
		local image = self.def.imageFunc and self.def.imageFunc(self) or self.def.image
		local color = self.def.drawColorFunc and self.def.drawColorFunc(self) or self.randomColor
		local mainDrawPos = drawPos
		if self.def.mainDrawOffset then
			mainDrawPos = util.Add(drawPos, self.def.mainDrawOffset)
		end
		drawQueue:push({y=self.pos[2] + (self.def.depth or 0); f=function()
			Resources.DrawImage(image, mainDrawPos[1], mainDrawPos[2], drawRot, false, self.def.scaleOverride or self.randomScale, color)
			if self.def.extraDraw then
				Resources.DrawImage(self.def.extraDraw, drawPos[1], drawPos[2], drawRot, false, 0.98)
			end
			if self.fireScale then
				Resources.DrawImage("fire", drawPos[1], drawPos[2] + 0.28*Global.TILE_SIZE, drawRot, false, self.fireScale, color)
			end
		end})
		if self.def.partialTopDrawFunc then
			local alpha = self.def.partialTopDrawFunc(self)
			drawQueue:push({y=self.pos[2] + 100; f=function()
				Resources.DrawImage(image, mainDrawPos[1], mainDrawPos[2], drawRot, alpha, self.randomScale, color)
			end})
		end
	end
	
	return self
end

return NewBlock
