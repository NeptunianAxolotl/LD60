
local CommandDefs = util.LoadDefDirectory("defs/commands")

local NewPlayer = require("objects/player")

local self = {}
local api = {}

function api.KillPlayer()
	if not GameHandler.AllowMovement() then
		return
	end
	if self.player then
		self.player.Destroy()
	end
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

function api.PickupCommand(command)
	self.commandQueue[#self.commandQueue + 1] = command
end

function api.GetTargetForCommand()
	if not self.player or self.player.IsDead() then
		return false
	end
	local command = self.commandQueue[1]
	if not command then
		command = "empty"
	end
	local directions = {0, 1, -1, 2}
	for i = 1, #directions do
		local candidate = self.player.ObjInRelativeDirection(directions[i])
		if candidate and candidate.IsRobot() then
			if CommandDefs[command].executeFunc and candidate.CanSwapAction(command) then
				return candidate, "action"
			end
			if CommandDefs[command].acceptFunc and candidate.CanSwapTrigger(command) then
				return candidate, "trigger"
			end
		end
	end
	return false
end

function api.GetCommandQueue()
	return self.commandQueue
end

local function TrySwapCommand()
	local target, targetType = api.GetTargetForCommand()
	if not target then
		return false
	end
	local command = self.commandQueue[1] or "empty"
	for i = 1, #self.commandQueue do
		self.commandQueue[i] = self.commandQueue[i + 1]
	end
	local newCommand = target.SwapCommand(command, targetType)
	if newCommand and not CommandDefs[newCommand].isEmpty then
		self.commandQueue[#self.commandQueue + 1] = newCommand
	end
	return true
end

local function TryDropCommand()
	if (not self.player) or self.player.ObjInRelativeDirection(0) or self.player.BlockInRelativeDirection(0) or self.player.IsDead() then
		return false
	end
	local command = self.commandQueue[1]
	if not command then
		return false
	end
	for i = 1, #self.commandQueue do
		self.commandQueue[i] = self.commandQueue[i + 1]
	end
	local dropPos = self.player.GetRelativeTile(0)
	TerrainHandler.AddBlock("cmd_" .. command, dropPos, 0)
	return true
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
		self.repeatedMove = (self.lastMoveKey == self.bufferKey)
		self.lastMoveKey = self.bufferKey
		self.bufferKey = false
		self.lastMoveDt = Global.BUFFER_KEY_LEEWAY
		self.lastMoveSameKeyDt = Global.SAME_MOVE_BUFFER_KEY_LEEWAY
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if not self.player or self.player.IsDead() then
		return
	end
	self.bufferKey = key
	TryMove()
	if key == "c" or key == "b" then
		self.player.DropOrCleanPaint()
		return true
	end
	if key == "x" or key == "n" then
		if TrySwapCommand() then
			return true
		end
	end
	if key == "z" or key == "m" then
		if TryDropCommand() then
			return true
		end
	end
end

function api.KeyReleased(key, scancode)
	if key == self.lastMoveKey then
		if self.repeatedMove and self.player then
			self.bufferKey = false
		end
		self.lastMoveKey = false
		self.repeatedMove = false
		self.lastMoveDt = false
	end
end

function api.MousePressed(mx, my, button)
	if not self.player or self.player.IsDead() then
		return
	end
	if button == 1 then
		self.player.DropOrCleanPaint()
	end
	if button == 2 then
		if not TrySwapCommand() then
			TryDropCommand()
		end
	end
end

function api.GetPlayer()
	return self.player and (not self.player.IsDead()) and self.player
end

function api.GetPlayerAt(pos)
	if self.player and self.player.IsAtPos(pos) and not self.player.IsDead() then
		return self.player
	end
end

function api.GoalSatisfied()
	return self.player and self.player.GoalSatisfied()
end

function api.MoveEverything(offset)
	if self.player then
		return self.player.ForceReposition(offset)
	end
end

function api.Update(dt)
	if not self.player then
		return
	end
	self.lastMoveDt = util.UpdateTimer(self.lastMoveDt, dt)
	self.lastMoveSameKeyDt = util.UpdateTimer(self.lastMoveSameKeyDt, dt)
	if not self.bufferKey and not self.lastMoveDt then
		for key,_ in pairs(self.moveKeys) do
			if love.keyboard.isDown(key) then
				if (not self.lastMoveSameKeyDt) or self.lastMoveKey ~= key then
					self.bufferKey = key
				end
			end
		end
	end
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
		commandQueue = {},
		moveKeys = {
			right = 0,
			down = 1,
			left = 2,
			up = 3,
			d = 0,
			s = 1,
			a = 2,
			w = 3,
		}
	}
end

return api
