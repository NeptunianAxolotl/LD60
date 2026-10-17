
local RobotDefs = util.LoadDefDirectory("defs/robots")
local CommandDefs = util.LoadDefDirectory("defs/commands")

local function FindAndExecuteCommand(self)
	-- Look down the list of triggers and execute the next action of the first one
	for i = 1, #self.program do
		if self.program[i].trigger.acceptFunc(self) then
			local actions = self.program[i].actions
			self.nextAction[i] = self.nextAction[i] or 1
			actions[self.nextAction[i]].executeFunc(self)
			self.nextAction[i] = self.nextAction[i]%(#actions) + 1
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
		local actions = {}
		for j = 1, #programDef[i].actions do
			actions[j] = CommandDefs[programDef[i].actions[j]]
		end
		program[i] = {
			trigger = trigger,
			actions = actions,
		}
	end
	return program
end

local function NewRobot(self)
	self.def = RobotDefs[self.robotType]
	self.tiggerDt = Global.TURN_RATE
	self.program = InitProgram(self.config.program)
	self.nextAction = {}
	
	function self.ObjInDirection(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		return TerrainHandler.GetAnythingAt(newPos)
	end
	
	function self.ObjInRelativeDirection(direction)
		direction = (self.direction + direction)%4
		return self.ObjInDirection(direction)
	end
	
	function self.Move(direction)
		local newPos = util.Add(self.pos, util.CardinalToVector(direction))
		local object = self.ObjInDirection(direction)
		if object and object.Stops(self) then
			return
		end
		self.pos = newPos
	end
	
	function self.Update(dt)
		self.triggerDt = util.UpdateTimer(self.triggerDt, dt)
		if not self.triggerDt then
			FindAndExecuteCommand(self)
			self.triggerDt = Global.TURN_RATE
		end
	end
	
	function self.Destroy(dt)
	end
	
	function self.IsAtPos(pos)
		return util.Equal(self.pos, pos)
	end
	
	function self.Stops(object)
		if self.def.isBlocking then
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
			config = self.config, -- Save/load stability
		}
	end
	function self.Draw(drawQueue)
		drawQueue:push({y=self.pos[2] + 10; f=function()
			local drawPos = LevelHandler.GridToWorld(self.pos)
			local drawRot = util.CardinalToDirection(self.direction)
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRot)
		end})
	end
	
	return self
end

return NewRobot
