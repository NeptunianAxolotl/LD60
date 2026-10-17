
local NewPlayer = require("objects/player")

local self = {}
local api = {}

function api.Update(dt)
	if self.player then
		self.player.Update(dt)
	end
end

function api.Draw(drawQueue)
	if self.player then
		self.player.Draw(drawQueue)
	end
end
function api.CreatePlayer(pos, direction)	if self.player then		self.player.Destroy()	end	self.player = NewPlayer({}, pos, direction)end
function api.Initialize(world)
	self = {
		player = false,
		world = world,
	}
end

return api
