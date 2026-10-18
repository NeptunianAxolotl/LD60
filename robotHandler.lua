
local RobotDefs = util.LoadDefDirectory("defs/robots")
local NewRobot = require("objects/robot")

local self = {}
local api = {}

function api.MousePressed(x, y, button)

end

function api.RemoveRobot(pos)
	IterableMap.ApplySelf(self.robots, "IsAtPos", pos)
end

function api.AddRobot(robotType, pos, direction, params)
	api.RemoveRobot(pos)
	local def = RobotDefs[robotType]
	local robotData = {}
	robotData.robotType = robotType
	robotData.pos = pos
	robotData.direction = direction
	robotData.params = params or {}
	IterableMap.Add(self.robots, NewRobot(robotData, params))
end

function api.ExportObjects()
	local objList = {}
	IterableMap.ApplySelf(self.robots, "Export", objList)
	return objList
end

function api.GetRobotAt(pos)
	return IterableMap.GetFirstSatisfies(self.robots, "IsAtPos", pos)
end

function api.GoalSatisfied()
	return IterableMap.IfAllSatisfy(self.robots, "GoalSatisfied")
end

function api.Update(dt)
	self.commandDt = util.UpdateTimer(self.commandDt, dt)
	IterableMap.ApplySelf(self.robots, "Update", dt, not self.commandDt)
	if not self.commandDt then
		self.commandDt = Global.ROBOT_MOVE_TIME/4
	end
end

function api.MoveEverything(offset)
	IterableMap.ApplySelf(self.robots, "ForceReposition", offset)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.robots, "Draw", drawQueue)
end
function api.DrawInterface()
	IterableMap.ApplySelf(self.robots, "DrawProgram", {Global.WINDOW_X - Global.UI_WIDTH + Global.COMMAND_DRAW_SIZE - 5, GameHandler.GetRobotCommandsOffset()})
end

function api.Initialize(world, levelIndex, mapDataOverride)
	self = {
		world = world,
		robots = IterableMap.New({stable = true}),
		commandDt = Global.ROBOT_MOVE_TIME/4,
	}
end

return api
