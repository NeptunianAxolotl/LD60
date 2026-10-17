local Font = require("include/font")
local MapDefs = util.LoadDefDirectory("defs/maps")

local self = {}
local api = {}

function api.MousePressed(x, y, button)

end

function api.Update(dt)
	IterableMap.ApplySelf(self.blockList, "Update", dt)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.blockList, "Draw", drawQueue)
	drawQueue:push({y=0; f=function()
		love.graphics.rectangle("line", 0, 0, 1, 1)
		
		local dimension = LevelHandler.GetDimensions()
		local rightPos = dimension[1]*Global.TILE_SIZE
		local bottomPos = dimension[2]*Global.TILE_SIZE
		for i = 0, dimension[1] do
			love.graphics.line(i*Global.TILE_SIZE, 0, i*Global.TILE_SIZE, bottomPos)
		end
		for i = 0, dimension[2] do
			love.graphics.line(0, i*Global.TILE_SIZE, rightPos, i*Global.TILE_SIZE)
		end
	end})
end
function api.Initialize(world, levelIndex, mapDataOverride)
	self = {
		world = world,
		blockList = IterableMap.New(),
	}
end

return api
