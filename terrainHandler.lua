
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

function api.InteractWithObjectsAt(pos, object, funcName, direction)
	local block = api.GetBlockAt(pos)
	if block and block[funcName](object, direction) then
		return block
	end
	local robot = RobotHandler.GetRobotAt(pos)
	if robot and robot[funcName](object, direction) then
		return robot
	end
	local player = PlayerHandler.GetPlayerAt(pos)
	if player and player[funcName](object, direction) then
		return player
	end
	return false
end

function api.SetDoorOpen(doorIndex, newState, force)
	if force then
		self.doorOpen[doorIndex] = newState
	end
	if newState then
		self.doorWantOpen[doorIndex] = true
	else
		self.doorWantClosed[doorIndex] = true
	end
end

function api.GetDoorWantOpen(doorIndex)
	return self.doorOpen[doorIndex]
end

local function UpdateDoors()
	local playSound = false
	for doorIndex = 1, Global.DOOR_TYPE_COUNT do
		local prevDoorState = self.doorOpen[doorIndex]
		if self.doorWantOpen[doorIndex] ~= self.doorWantClosed[doorIndex] then
			if self.doorWantOpen[doorIndex] then
				self.doorOpen[doorIndex] = true
			elseif self.doorWantClosed[doorIndex] then
				self.doorOpen[doorIndex] = false
			end
		end
		if prevDoorState ~= self.doorOpen[doorIndex] then
			playSound = true
		end
		self.doorWantOpen[doorIndex] = false
		self.doorWantClosed[doorIndex] = false
	end
	if not self.skipFirstDoorSound and playSound then
		--SoundHandler.PlaySound("csharp_7")
	end
	self.skipFirstDoorSound = false
end

function api.MoveEverything(offset)
	IterableMap.ApplySelf(self.blocks, "ForceReposition", offset)
	IterableMap.RemakeGridMap(self.blocks)
end

function api.Update(dt)
	IterableMap.ApplySelf(self.blocks, "Update", dt)
	UpdateDoors()
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.blocks, "Draw", drawQueue)
	local depth = LevelHandler.InEditMode() and 2000 or -100
	local RECT_SIZE = 2000
	drawQueue:push({y=depth; f=function()
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
		love.graphics.setColor(Global.WALL_COLOR)
		love.graphics.rectangle("fill", -RECT_SIZE, -RECT_SIZE, RECT_SIZE, bottomPos + RECT_SIZE*2)
		love.graphics.rectangle("fill", rightPos, -RECT_SIZE, RECT_SIZE, bottomPos + RECT_SIZE*2)
		love.graphics.rectangle("fill", -RECT_SIZE, -RECT_SIZE, rightPos + RECT_SIZE*2, RECT_SIZE)
		love.graphics.rectangle("fill", -RECT_SIZE, bottomPos, rightPos + RECT_SIZE*2, RECT_SIZE)
	end})
end
function api.Initialize(world)
	self = {
		world = world,
		blocks = IterableMap.New({gridPos = true}),
		doorOpen = {},
		doorWantClosed = {},
		doorWantOpen = {},
		skipFirstDoorSound = true,
	}
end

return api
