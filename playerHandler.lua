
local NewPlayer = require("objects/player")

local self = {}
local api = {}

function api.CreatePlayer(pos, direction)
	if self.player then
		self.player.Destroy()
	end
	self.player = NewPlayer({}, pos, direction)
end

function api.KeyPressed(key, scancode, isRepeat)
	if not self.player then
		return
	end
	if key == "right" then
		self.player.Move(0)
	elseif key == "down" then
		self.player.Move(1)
	elseif key == "left" then
		self.player.Move(2)
	elseif key == "up" then
		self.player.Move(3)
	end
end

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

function api.Initialize(world)
	self = {
		player = false,
		world = world,
	}
end

return api
