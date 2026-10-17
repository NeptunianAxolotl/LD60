
local BlockDefs = util.LoadDefDirectory("defs/blocks")

local function NewBlock(self)
	self.def = BlockDefs[self.blockType]
	function self.Update(dt)
	end
	
	function self.Destroy(dt)
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.Stops(object)
		if self.def.blocksPlayer and object.isPlayer then
			return true
		end
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
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewBlock
