
local NewPlayer = require("objects/player")

local self = {}
local api = {}

function api.KillPlayer()
	if self.player then
		self.player.Destroy()
	end
	self.player = false
end

function api.CreatePlayer(pos, direction)
	if self.player then
		self.player.Destroy()
	end
	self.player = NewPlayer({}, pos, direction)
end

function api.ExportObjects()
	local objList = {}
	if self.player then
		self.player.Export(objList)
	end
	return objList
end

local function TryMove()
	if not self.bufferKey then
		return
	end
	if not self.moveKeys[self.bufferKey] then
		self.bufferKey = false
		return
	end
	if self.player.Move(self.moveKeys[self.bufferKey]) then
		self.bufferKey = false
		self.lastMoveKey = self.bufferKey
		self.lastMoveDt = Global.BUFFER_KEY_LEEWAY
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if not self.player then
		return
	end
	self.bufferKey = key
	TryMove()
end

function api.GetPlayerAt(pos)
	if self.player and self.player.IsAtPos(pos) then
		return self.player
	end
end

function api.Update(dt)
	if not self.player then
		return
	end
	if not self.bufferKey and not self.lastMoveDt then
		for key,_ in pairs(self.moveKeys) do
			if key ~= self.lastMoveKey and love.keyboard.isDown(key) then
				self.bufferKey = key
			end
		end
	end
	self.lastMoveDt = util.UpdateTimer(self.lastMoveDt, dt)
	TryMove()
	self.player.Update(dt)
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
		moveKeys = {
			right = 0,
			down = 1,
			left = 2,
			up = 3,
		}
	}
end

return api
