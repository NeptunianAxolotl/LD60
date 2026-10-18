
local BlockDefs = require("defs/blockDefs")
local NewBlock = require("objects/block")

local self = {}
local api = {}

function api.MousePressed(x, y, button)

end

function api.RemoveBlock(pos)
	IterableMap.ApplySelf(self.blocks, "IsAtPos", pos)
end

function api.AddBlock(blockType, pos, direction, params)
	api.RemoveBlock(pos)
	local def = BlockDefs[blockType]
	local blockData = {}
	blockData.blockType = blockType
	blockData.pos = pos
	blockData.direction = direction
	blockData.params = params or {}
	IterableMap.Add(self.blocks, NewBlock(blockData))
end

function api.ExportObjects()
	local objList = {}
	IterableMap.ApplySelf(self.blocks, "Export", objList)
	return objList
end

function api.GetBlockAt(pos)
	return IterableMap.GetAt(self.blocks, pos)
end

function api.GetAnythingAt(pos)
	local block = api.GetBlockAt(pos)
	if block then
		return block
	end
	local robot = RobotHandler.GetRobotAt(pos)
	if robot then
		return robot
	end
	local player = PlayerHandler.GetPlayerAt(pos)
	if player then
		return player
	end
	return false
end

function api.GetMobileObjectAt(pos)
	local robot = RobotHandler.GetRobotAt(pos)
	if robot then
		return robot
	end
	local player = PlayerHandler.GetPlayerAt(pos)
	if player then
		return player
	end
	return false
end

function api.InteractWithObjectsAt(pos, object, funcName)
	local block = api.GetBlockAt(pos)
	if block and block[funcName](object) then
		return block
	end
	local robot = RobotHandler.GetRobotAt(pos)
	if robot and robot[funcName](object) then
		return robot
	end
	local player = PlayerHandler.GetPlayerAt(pos)
	if player and player[funcName](object) then
		return player
	end
	return false
end

function api.SetDoorOpen(doorIndex, newState, force)
	if newState == self.doorOpen[doorIndex] then
		return
	end
	self.doorOpen[doorIndex] = newState
	if newState then
		self.doorOpenTimer[doorIndex] = Global.DOOR_OPEN_DELAY
	end
	if force then
		self.doorOpenTimer[doorIndex] = nil
	end
end

function api.GetDoorOpen(doorIndex)
	return self.doorOpen[doorIndex] and not self.doorOpenTimer[doorIndex]
end

function api.Update(dt)
	for doorIndex, value in pairs(self.doorOpenTimer) do
		self.doorOpenTimer[doorIndex] = util.UpdateTimer(value, dt)
		if not self.doorOpenTimer[doorIndex] then
			self.doorOpenTimer[doorIndex] = nil
		end
	end
	IterableMap.ApplySelf(self.blocks, "Update", dt)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.blocks, "Draw", drawQueue)
	drawQueue:push({y=-100; f=function()
		love.graphics.setColor(0, 0, 0, 0.5)
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
function api.Initialize(world)
	self = {
		world = world,
		blocks = IterableMap.New({gridPos = true}),
		doorOpen = {},
		doorOpenTimer = {}
	}
end

return api
