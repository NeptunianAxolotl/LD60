
local RobotDefs = util.LoadDefDirectory("defs/robots")
local CommandDefs = util.LoadDefDirectory("defs/commands")

local function SkipAction(self, action)
	return action.skipFunc and action.skipFunc(self)
end

local function AllSkip(self, actions)
	for i = 1, #actions do
		if not SkipAction(self, actions[i]) then
			return false
		end
	end
	return true
end

local function FindNextNonEmpty(self, index)
	local actions = self.program[index].actions
	local increment = true
	local finalIndex = index
	while increment do
		self.nextAction[index] = (self.nextAction[index])%(#actions) + 1
		increment =  SkipAction(self, actions[self.nextAction[index]]) and (self.nextAction[index] ~= finalIndex)
	end
end

local function ExecuteNextCommand(self, index)
	local actions = self.program[index].actions
	self.nextAction[index] = self.nextAction[index] or 1
	local actionToTake = actions[self.nextAction[index]]
	self.lastStepTriggers[index] = true
	self.lastStepActions[index] = self.lastStepActions[index] or {}
	self.lastStepActions[index][self.nextAction[index]] = true
	FindNextNonEmpty(self, index)
	self.previousAction = actionToTake
	actionToTake.executeFunc(self)
end

local function FindAndExecuteCommand(self)
	-- Look down the list of triggers and execute the next action of the first one
	self.chainAction = true
	self.lastStepTriggers = {}
	self.lastStepActions = {}
	while self.chainAction do
		self.chainAction = false -- Set by actions
		for i = 1, #self.program do
			if self.program[i].trigger.acceptFunc(self) and not AllSkip(self, self.program[i].actions) then
				ExecuteNextCommand(self, i)
				break
			end
		end
	end
end

local function InitProgram(programDef)
	if not programDef then
		return {}
	end
	local program = {}
	for i = 1, #programDef do
		local trigger = CommandDefs[programDef[i].trigger]
		if not trigger then
			error("Cannot find trigger with name " .. programDef[i].trigger)
		end
		local actions = {}
		for j = 1, #programDef[i].actions do
			actions[j] = CommandDefs[programDef[i].actions[j]]
			if not actions[j] then
				error("Cannot find action with name " .. programDef[i].actions[j])
			end
		end
		program[i] = {
			trigger = trigger,
			actions = actions,
		}
	end
	return program
end

local function GetLastCommandSpeed(self)
	local speed = (self.previousAction or {}).commandSpeed or 1
	
	if self.lastCommandType == "move" then
		speed = speed * self.def.moveSpeed
	elseif self.lastCommandType == "turn" then
		speed = speed * self.def.turnSpeed
	else
		speed = speed * self.def.otherCommandSpeed
	end
	if speed ~= 1 and speed ~= 2 and speed ~= 4 then
		speed = 1
	end
	return speed
end

local function DrawUiBox(x, y)
	x, y = x - Global.COMMAND_DRAW_SIZE/2, y - Global.COMMAND_DRAW_SIZE/2
	love.graphics.setColor(Global.PANEL_COL)
	love.graphics.rectangle("fill", x, y, Global.COMMAND_DRAW_SIZE, Global.COMMAND_DRAW_SIZE, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", x, y, Global.COMMAND_DRAW_SIZE, Global.COMMAND_DRAW_SIZE, 4, 4, 16)
end

local function NewRobot(self)
	self.def = RobotDefs[self.robotType]
	self.commandSpeed = 1
	self.commandAcc = 3
	self.programRaw = self.program -- Save/load stability
	self.program = InitProgram(self.program)
	self.nextAction = {}
	self.registerValues = {}
	
	function self.ObjInDirection(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		return TerrainHandler.GetMobileObjectAt(newPos)
	end
	
	function self.ObjInRelativeDirection(direction)
		direction = (self.direction + direction)%4
		return self.ObjInDirection(direction)
	end
	
	function self.BlockInDirection(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		return TerrainHandler.GetBlockAt(newPos)
	end
	
	function self.BlockInRelativeDirection(direction)
		direction = (self.direction + direction)%4
		return self.BlockInDirection(direction)
	end
	
	function self.BlockAtMyLocation()
		return TerrainHandler.GetBlockAt(self.pos)
	end
	
	function self.Move(direction)
		if not GameHandler.AllowMovement() then
			return
		end
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		if TerrainHandler.InteractWithObjectsAt(newPos, self, "DoMoveOnto") then
			return
		end
		self.pos = newPos
		self.moveBlockDt = Global.ROBOT_ANIMATE_TIME
	end
	
	function self.Rotate(direction)
		if not GameHandler.AllowMovement() then
			return
		end
		self.direction = (self.direction + direction)%4
		self.moveBlockDt = Global.ROBOT_ANIMATE_TIME
	end
	
	function self.GetRegister(index)
		return self.registerValues[index]
	end
	
	function self.SetRegister(index, value)
		self.registerValues[index] = value
	end
	
	function self.HasArrived()
		return (not self.moveBlockDt) or self.moveBlockDt < Global.ARRIVAL_LEEWAY or util.Equal(self.pos, self.prevPos)
	end
	
	function self.ForceExecuteCommand(triggerName, actionIndex)
		for i = 1, #self.program do
			if self.program[i].trigger.name == triggerName then
				if actionIndex then
					self.nextAction[i] = actionIndex
					FindNextNonEmpty(self, i)
				end
				ExecuteNextCommand(self, i)
				return
			end
		end
	end
	
	function self.Update(dt, commandUpdate)
		self.moveBlockDt = util.UpdateTimer(self.moveBlockDt, dt)
		if commandUpdate then
			self.commandAcc = self.commandAcc + self.commandSpeed
		end
		if self.commandAcc >= 4 then
			self.prevPos = self.pos
			self.prevDir = self.direction
			self.lastCommandType = false
			FindAndExecuteCommand(self)
			self.commandSpeed = GetLastCommandSpeed(self)
			self.commandAcc = 0
			if self.moveBlockDt then
				self.moveBlockDt = self.moveBlockDt / self.commandSpeed
				self.moveBlockDt = self.moveBlockDt / ((self.previousAction and self.previousAction.animateSpeed) or 1)
				if self.commandSpeed > 1 then
					local triggerTime = Global.ROBOT_MOVE_TIME / self.commandSpeed
					self.moveBlockDt = util.AverageScalar(self.moveBlockDt, triggerTime, math.min(1, (self.commandSpeed - 1)/3))
				end
				self.maxMoveBlock = self.moveBlockDt
			end
		end
	end
	
	function self.Destroy(dt)
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.DoMoveOnto(object)
		if self.def.isBlocking then
			return true
		end
	end
	
	function self.GetType()
		return self.robotType
	end
	
	function self.IsRobot()
		return true
	end
	
	function self.Export(objList)
		objList[#objList + 1] = {
			name = self.robotType,
			pos = self.pos,
			direction = self.direction,
			program = self.programRaw,
		}
	end
	
	function self.DrawProgram(drawPos)
		if #self.program == 0 then
			return
		end
		offsetY = drawPos[2]
		for i = 1, #self.program do
			local offsetX = drawPos[1]
			local actions = self.program[i].actions
			local lastTrigger = (self.lastStepTriggers and self.lastStepTriggers[i])
			local color = (lastTrigger and {1, 0.5, 0.5}) or self.program[i].trigger.color or {0.85, 0.85, 0.85}
			love.graphics.setColor(Global.PANEL_BORDER_COL)
			love.graphics.rectangle("line", offsetX, offsetY - 3, Global.COMMAND_DRAW_SIZE, 6, 4, 4, 16)
			
			DrawUiBox(offsetX, offsetY)
			Resources.DrawImage(self.program[i].trigger.image, offsetX, offsetY, false, false, false, color)
			offsetX = offsetX + Global.COMMAND_DRAW_SIZE + 20
			for j = 1, #actions do
				local lastAction = (self.lastStepActions and self.lastStepActions[i] and self.lastStepActions[i][j])
				local nextAction = (j == (self.nextAction[i] or 1))
				local color = (lastAction and {1, 0, 0}) or (nextAction and {0, 0, 0}) or {0.35, 0.35, 0.35}
				DrawUiBox(offsetX, offsetY)
				Resources.DrawImage(actions[j].image, offsetX, offsetY, false, false, false, color)
				offsetX = offsetX + Global.COMMAND_DRAW_SIZE + 5
			end
			offsetY = offsetY + Global.COMMAND_DRAW_SIZE + 10
		end
		drawPos[2] = offsetY + Global.COMMAND_DRAW_SIZE
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2] + 10; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			if self.moveBlockDt then
				local prevProp = self.moveBlockDt / self.maxMoveBlock
				drawPos = util.Average(drawPos, LevelHandler.GridToWorld(self.prevPos), prevProp)
				if not (self.previousAction and self.previousAction.skipRotationAnimate) then
					drawRot = util.AngleAverageShortest(drawRot, util.CardinalToDirection(self.prevDir), prevProp)
				end
			end
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewRobot
