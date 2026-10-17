
local RobotDefs = util.LoadDefDirectory("defs/robots")
local CommandDefs = util.LoadDefDirectory("defs/commands")

local function FindNextNonEmpty(self, index)
	local actions = self.program[index].actions
	local increment = true
	local finalIndex = index
	while increment do
		self.nextAction[index] = self.nextAction[index] + 1
		if self.nextAction[index] > #actions then
			self.nextAction[index] = 1
			self.forceFullTrigger = false
		end
		increment = actions[self.nextAction[index]].emptyCommand and (self.nextAction[index] ~= finalIndex)
	end
end

local function ExecuteNextCommand(self, index)
	local actions = self.program[index].actions
	self.nextAction[index] = self.nextAction[index] or 1
	local func = actions[self.nextAction[index]].executeFunc
	self.lastTriggerIndex = index
	self.lastActionIndex = self.nextAction[index]
	FindNextNonEmpty(self, index)
	func(self)
end

local function FindAndExecuteCommand(self)
	-- Look down the list of triggers and execute the next action of the first one
	for i = 1, #self.program do
		if self.program[i].trigger.acceptFunc(self) and ((not self.forceFullTrigger) or self.program[i].trigger.name == self.forceFullTrigger) and not self.program[i].allEmpty then
			ExecuteNextCommand(self, i)
			return
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

local function DrawUiBox(x, y)
	x, y = x - Global.COMMAND_DRAW_SIZE/2, y - Global.COMMAND_DRAW_SIZE/2
	love.graphics.setColor(Global.PANEL_COL)
	love.graphics.rectangle("fill", x, y, Global.COMMAND_DRAW_SIZE, Global.COMMAND_DRAW_SIZE, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", x, y, Global.COMMAND_DRAW_SIZE, Global.COMMAND_DRAW_SIZE, 4, 4, 16)
end

local function NewRobot(self)
	self.def = RobotDefs[self.robotType]
	self.tiggerDt = Global.TURN_RATE
	self.programRaw = self.program -- Save/load stability
	self.program = InitProgram(self.program)
	self.nextAction = {}
	
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
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		if TerrainHandler.InteractWithObjectsAt(newPos, self, "DoMoveOnto") then
			return
		end
		self.pos = newPos
	end
	
	function self.HasArrived()
		return (not self.moveBlockDt) or self.moveBlockDt < Global.ARRIVAL_LEEWAY
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
	
	function self.Update(dt)
		self.triggerDt = util.UpdateTimer(self.triggerDt, dt)
		self.moveBlockDt = util.UpdateTimer(self.moveBlockDt, dt)
		if not self.triggerDt then
			self.prevPos = self.pos
			self.prevDir = self.direction
			self.moveBlockDt = Global.ROBOT_ANIMATE_TIME
			FindAndExecuteCommand(self)
			self.triggerDt = Global.ROBOT_MOVE_TIME
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
	
	function self.OnGoal()
		local block = self.BlockAtMyLocation()
		if block and block.goalFunc(self) then
			return true
		end
	end
	
	function self.GetType()
		return self.robotType
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
			local lastTrigger = (i == self.lastTriggerIndex)
			local color = (lastTrigger and {1, 0.5, 0.5}) or self.program[i].trigger.color or {0.85, 0.85, 0.85}
			DrawUiBox(offsetX, offsetY)
			Resources.DrawImage(self.program[i].trigger.image, offsetX, offsetY, false, false, false, color)
			offsetX = offsetX + Global.COMMAND_DRAW_SIZE + 10
			for j = 1, #actions do
				local lastAction = (i == self.lastTriggerIndex and j == self.lastActionIndex)
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
				local prevProp = self.moveBlockDt/Global.ROBOT_ANIMATE_TIME
				drawPos = util.Average(drawPos, LevelHandler.GridToWorld(self.prevPos), prevProp)
				drawRot = util.AngleAverageShortest(drawRot, util.CardinalToDirection(self.prevDir), prevProp)
			end
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewRobot
