
local RobotDefs = util.LoadDefDirectory("defs/robots")
local NewRobot = require("objects/robot")

local self = {}
local api = {}

function api.MousePressed(x, y, button)

end

function api.RemoveRobot(pos)
	IterableMap.ApplySelf(self.robots, "IsAtPos", pos)
end

function api.AddRobot(robotType, pos, direction, program)
	api.RemoveRobot(pos)
	local def = RobotDefs[robotType]
	local robotData = {}
	robotData.robotType = robotType
	robotData.pos = pos
	robotData.direction = direction
	robotData.program = program
	IterableMap.Add(self.robots, NewRobot(robotData))
end

function api.ExportObjects()
	local objList = {}
	IterableMap.ApplySelf(self.robots, "Export", objList)
	return objList
end

function api.GetRobotAt(pos)
	return IterableMap.GetFirstSatisfies(self.robots, "IsAtPos", pos)
end

function api.Update(dt)
	self.commandDt = util.UpdateTimer(self.commandDt, dt)
	IterableMap.ApplySelf(self.robots, "Update", dt, not self.commandDt)
	if not self.commandDt then
		self.commandDt = Global.ROBOT_MOVE_TIME/4
	end
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.robots, "Draw", drawQueue)
end
function api.DrawInterface()
	love.graphics.setLineWidth(3)
	IterableMap.ApplySelf(self.robots, "DrawProgram", {Global.WINDOW_X - Global.UI_WIDTH + Global.COMMAND_DRAW_SIZE, 500})
end

function api.Initialize(world, levelIndex, mapDataOverride)
	self = {
		world = world,
		robots = IterableMap.New({stable = true}),
		commandDt = Global.ROBOT_MOVE_TIME/4,
	}
end

return api
