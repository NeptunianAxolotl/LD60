
local RobotDefs = util.LoadDefDirectory("defs/robots")
local NewRobot = require("objects/robot")

local self = {}
local api = {}

function api.MousePressed(x, y, button)

end

function api.RemoveRobot(pos)
	IterableMap.ApplySelf(self.robots, "IsAtPos", pos)
end

function api.AddRobot(robotType, pos, direction, config)
	api.RemoveRobot(pos)
	local def = RobotDefs[robotType]
	local robotData = {}
	robotData.robotType = robotType
	robotData.pos = pos
	robotData.direction = direction
	robotData.config = config
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
	IterableMap.ApplySelf(self.robots, "Update", dt)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.robots, "Draw", drawQueue)
end
function api.Initialize(world, levelIndex, mapDataOverride)
	self = {
		world = world,
		robots = IterableMap.New(),
	}
end

return api
