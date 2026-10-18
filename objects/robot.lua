
local RobotDefs = util.LoadDefDirectory("defs/robots")
local CommandDefs = util.LoadDefDirectory("defs/commands")

local function SkipAction(self, action)
	return action.skipFunc and action.skipFunc(self)
end

local function GetCommandSpeedAndMoveTime(self, action)
	local commandSpeed = (action or {}).commandSpeed or 1
	if action.commandType == "move" then
		commandSpeed = commandSpeed * (self.def.moveSpeed or 1)
	elseif action.commandType == "turn" then
		commandSpeed = commandSpeed * (self.def.turnSpeed or 1)
	else
		commandSpeed = commandSpeed * (self.def.otherCommandSpeed or 1)
	end
	if commandSpeed ~= 1 and commandSpeed ~= 2 and commandSpeed ~= 4 then
		commandSpeed = 1
	end
	
	local moveTime = Global.ROBOT_ANIMATE_TIME
	moveTime = moveTime / commandSpeed
	moveTime = moveTime / ((action.animateSpeed) or 1)
	if commandSpeed > 1 then
		local triggerTime = Global.ROBOT_MOVE_TIME / commandSpeed
		moveTime = util.AverageScalar(moveTime, triggerTime, math.min(1, (commandSpeed - 1)/3))
	end
	return commandSpeed, moveTime
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
		increment = SkipAction(self, actions[self.nextAction[index]]) and (self.nextAction[index] ~= finalIndex)
	end
end

local function ExecuteNextCommand(self, index)
	local actions = self.program[index].actions
	self.nextAction[index] = self.nextAction[index] or 1
	local actionToTake = actions[self.nextAction[index]]
	if actionToTake.exclusiveAction then
		if self.completedExclusiveAction then
			return true -- No more actions this turn
		end
		self.completedExclusiveAction = true
	end
	self.lastStepTriggers[index] = true
	self.lastStepActions[index] = self.lastStepActions[index] or {}
	local alreadyExecutedBefore = self.lastStepActions[index][self.nextAction[index]]
	self.lastStepActions[index][self.nextAction[index]] = true
	FindNextNonEmpty(self, index)
	self.previousAction = actionToTake
	
	self.commandSpeed, self.maxMoveBlock = GetCommandSpeedAndMoveTime(self, actionToTake)
	self.moveBlockDt = self.maxMoveBlock
	self.commandAcc = 0
	
	actionToTake.executeFunc(self)
	if actionToTake.chainToNextTriggerAction and not alreadyExecutedBefore then
		self.chainAction = true
		self.chainTriggerIndex = index
	end
	if actionToTake.chainAction then
		self.chainAction = true
	end
	if actions[self.nextAction[index]].chainFromPreviousAction then
		self.chainAction = true
		self.chainTriggerIndex = index
	end
end

local function FindAndExecuteCommand(self)
	-- Look down the list of triggers and execute the next action of the first one
	self.chainAction = true -- Whether to keep executing the whole program
	self.chainTriggerIndex = false -- When set, the chain is forced into the next command of the trigger
	self.lastStepTriggers = {}
	self.lastStepActions = {}
	self.completedExclusiveAction = false
	while self.chainAction do
		self.chainAction = false -- Set by actions
		if self.chainTriggerIndex then
			if ExecuteNextCommand(self, self.chainTriggerIndex) then
				return
			end
		else
			for i = 1, #self.program do
				if self.program[i].trigger.acceptFunc(self) and not AllSkip(self, self.program[i].actions) then
					if ExecuteNextCommand(self, i) then
						return
					end
					break
				end
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

local function InitSwapSlot(self)
	if self.params.swapTrigger then
		for i = 1, #self.params.program do
			if self.params.program[i].trigger == self.params.swapTrigger then
				self.swapTrigger = i
				return
			end
		end
	elseif self.params.swapAction then
		for i = 1, #self.params.program do
			if self.params.program[i].trigger == self.params.swapAction.trigger then
				self.swapAction = {i, self.params.swapAction.slot}
				return
			end
		end
	end
end

local function CheckSelfTargetHighlight(self, highlight)
	if not highlight then
		return false
	end
	local target = PlayerHandler.GetTargetForCommand()
	if target and self.map_key == target.map_key then
		return 2
	end
	return 1
end

local function NewRobot(self)
	self.def = RobotDefs[self.robotType]
	self.commandSpeed = 1
	self.commandAcc = 3
	self.humanName = self.params.humanName or "Unnamed"
	self.program = InitProgram(self.params.program)
	self.nextAction = {}
	self.registerValues = {}
	InitSwapSlot(self)
	
	function self.SeeBlockInRelativeDirection(direction, blockType)
		direction = (self.direction + direction)%4
		local checkVec = util.CardinalToVector(direction)
		local checkPos = self.pos
		for _ = 1, 30 do
			checkPos = util.Add(checkPos, checkVec)
			local obj = TerrainHandler.GetMobileObjectAt(checkPos)
			if obj and obj.WallTrigger and obj.WallTrigger() then
				return false -- Blocked by boxes as well
			end
			local block = TerrainHandler.GetBlockAt(checkPos)
			if block then 
				if block.WallTrigger and block.WallTrigger() then
					return false -- Blocked by walls and doors
				end
				if block.GetType() == blockType then
					return block
				end
			end
		end
	end
	
	function self.SeeObjectInRelativeDirection(direction, objType)
		direction = (self.direction + direction)%4
		local checkVec = util.CardinalToVector(direction)
		local checkPos = self.pos
		for _ = 1, 30 do
			checkPos = util.Add(checkPos, checkVec)
			local block = TerrainHandler.GetBlockAt(checkPos)
			if block and block.WallTrigger and block.WallTrigger() then
				return false -- Blocked by walls and doors
			end
			local obj = TerrainHandler.GetMobileObjectAt(checkPos)
			if obj and obj.WallTrigger and obj.WallTrigger() then
				return false -- Blocked by boxes as well
			end
			if obj and obj.GetType() == objType then
				return obj
			end
		end
	end
	
	function self.PushBoxes(direction)
		local checkVec = util.CardinalToVector(direction)
		local checkPos = self.pos
		local boxes = {}
		for _ = 1, 30 do
			checkPos = util.Add(checkPos, checkVec)
			local block = TerrainHandler.GetBlockAt(checkPos)
			if block and block.WallTrigger and block.WallTrigger() then
				return false -- Blocked by walls and doors
			end
			local obj = TerrainHandler.GetMobileObjectAt(checkPos)
			if obj and obj.IsPushable() then
				if not obj.FullyStationary() then
					return false -- Do not move boxes in motion
				end
				boxes[#boxes + 1] = obj -- A box to push
			elseif obj and obj.IsRobot() then
				return false -- cannot push through Robots
			else
				break -- Free space, start pushing
			end
		end
		for i = 1, #boxes do
			boxes[i].ForceMove(direction, self.maxMoveBlock)
		end
		return true
	end
	
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
	
	function self.ForceMove(direction, moveAnimTime)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		self.prevPos = self.pos
		self.pos = newPos
		self.moveBlockDt = moveAnimTime
		self.maxMoveBlock = moveAnimTime
		return true
	end
	
	function self.Move(direction)
		if not GameHandler.AllowMovement() then
			return false
		end
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		if TerrainHandler.InteractWithObjectsAt(newPos, self, "BlockMoveIntoByObject", direction) then
			return false
		end
		self.pos = newPos
		return true
	end
	
	function self.Rotate(direction)
		if not GameHandler.AllowMovement() then
			return
		end
		self.direction = (self.direction + direction)%4
	end
	
	function self.GetRegister(index)
		return self.registerValues[index]
	end
	
	function self.SetRegister(index, value)
		self.registerValues[index] = value
	end
	
	function self.AddPaint()
		local block = TerrainHandler.GetBlockAt(self.pos)
		if not block then
			TerrainHandler.AddBlock("paint", self.pos, self.direction)
		end
	end
	
	function self.RemovePaint()
		local block = TerrainHandler.GetBlockAt(self.pos)
		if block and block.GetType() == "paint" then
			TerrainHandler.RemoveBlock(self.pos)
		end
	end
	
	function self.HasArrived()
		return (not self.moveBlockDt) or self.moveBlockDt < Global.ARRIVAL_LEEWAY or util.Equal(self.pos, self.prevPos)
	end
	
	function self.FullyStationary()
		return (not self.moveBlockDt) or util.Equal(self.pos, self.prevPos)
	end
	
	function self.Update(dt, commandUpdate)
		self.moveBlockDt = util.UpdateTimer(self.moveBlockDt, dt)
		if commandUpdate and self.def.isRobot then
			self.commandAcc = self.commandAcc + self.commandSpeed
		end
		if self.commandAcc >= 4 then
			self.prevPos = self.pos
			self.prevDir = self.direction
			FindAndExecuteCommand(self)
		end
	end
	
	function self.Destroy(dt)
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.BlockMoveIntoByObject(object, direction)
		if self.def.robotCanPush and object.IsRobot() then
			return not object.PushBoxes(direction)
		end
		return self.def.isBlocking
	end
	
	function self.GetType()
		return self.robotType
	end
	
	function self.IsRobot()
		return self.def.isRobot
	end
	
	function self.IsPushable()
		return self.def.robotCanPush
	end
	
	function self.WallTrigger()
		return self.def.triggerAsWall
	end
	
	function self.GoalSatisfied()
		local block = TerrainHandler.GetBlockAt(self.pos)
		return block and block.GoalSatisfied()
	end
	
	function self.CanSwapTrigger()
		return self.swapTrigger
	end
	
	function self.CanSwapAction()
		return self.swapAction
	end
	
	function self.SwapCommand(command)
		if self.swapTrigger then
			local oldCommand = self.program[self.swapTrigger].trigger.name
			self.program[self.swapTrigger].trigger = CommandDefs[command]
			return oldCommand
		end
		if self.swapAction then
			local oldCommand = self.program[self.swapAction[1]].actions[self.swapAction[2]].name
			self.program[self.swapAction[1]].actions[self.swapAction[2]] = CommandDefs[command]
			return oldCommand
		end
	end
	
	function self.Export(objList)
		local data = {
			name = self.robotType,
			pos = self.pos,
			direction = self.direction,
		}
		for k, v in pairs(self.params) do
			data[k] = v
		end
		objList[#objList + 1] = data
	end
	
	function self.DrawProgram(drawPos)
		if #self.program == 0 or not self.def.isRobot then
			return
		end
		offsetY = drawPos[2]
		Font.SetSize(3)
		love.graphics.setColor(0, 0, 0)
		love.graphics.printf(self.humanName, drawPos[1] - 25, offsetY, Global.UI_WIDTH, "left")
		offsetY = offsetY + Global.COMMAND_DRAW_SIZE + 15
		
		for i = 1, #self.program do
			local offsetX = drawPos[1]
			local actions = self.program[i].actions
			local lastTrigger = (self.lastStepTriggers and self.lastStepTriggers[i])
			local color = (lastTrigger and {1, 0.5, 0.5}) or self.program[i].trigger.color or {0.85, 0.85, 0.85}
			local highlight = CheckSelfTargetHighlight(self, (self.swapTrigger == i))
			love.graphics.setColor(Global.PANEL_BORDER_COL)
			love.graphics.rectangle("line", offsetX, offsetY - 3, Global.COMMAND_DRAW_SIZE, 6, 4, 4, 16)
			
			GameHandler.DrawCommandBox(offsetX, offsetY, highlight)
			Resources.DrawImage(self.program[i].trigger.image, offsetX, offsetY, false, false, false, color)
			offsetX = offsetX + Global.COMMAND_DRAW_SIZE + 20
			for j = 1, #actions do
				local lastAction = (self.lastStepActions and self.lastStepActions[i] and self.lastStepActions[i][j])
				local nextAction = (j == (self.nextAction[i] or 1))
				local color = (lastAction and {1, 0, 0}) or (nextAction and {0, 0, 0}) or {0.35, 0.35, 0.35}
				local highlight = CheckSelfTargetHighlight(self, self.swapAction and self.swapAction[1] == i and self.swapAction[2] == j)
				GameHandler.DrawCommandBox(offsetX, offsetY, highlight)
				Resources.DrawImage(actions[j].image, offsetX, offsetY, false, false, false, color)
				offsetX = offsetX + Global.COMMAND_DRAW_SIZE + 5
			end
			offsetY = offsetY + Global.COMMAND_DRAW_SIZE + 10
		end
		drawPos[2] = offsetY - 22
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2] + 10; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			if self.moveBlockDt then
				local prevProp = self.moveBlockDt / self.maxMoveBlock
				drawPos = util.Average(drawPos, LevelHandler.GridToWorld(self.prevPos), prevProp)
				if not (self.previousAction and self.previousAction.skipRotationAnimate) and self.prevDir then
					drawRot = util.AngleAverageShortest(drawRot, util.CardinalToDirection(self.prevDir), prevProp)
				end
			end
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRot)
			if self.def.isRobot then
				Font.SetSize(3)
				love.graphics.setColor(0, 0, 0)
				love.graphics.printf(string.sub(self.humanName, 0, 1), drawPos[1] - 25, drawPos[2] - 15, 50, "center")
			end
		end})
	end
	
	return self
end

return NewRobot
