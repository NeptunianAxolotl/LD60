
local function NewPlayer(self, position, direction)
	-- pos
	self.direction = direction
	self.pos = position
	
	function self.Update(dt)
	end
	
	function self.Destroy(dt)
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2]; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			Resources.DrawImage("player", drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewPlayer
