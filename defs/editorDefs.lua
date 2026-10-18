
local BlockDefs = require("defs/blockDefs")
local RobotDefs = util.LoadDefDirectory("defs/robots")
local CommandDefs = util.LoadDefDirectory("defs/commands")

local def = {
	spawnTypes = {
		blocks = {
			defs = BlockDefs,
			spawnFunc = function (data)
				local params = {
					doorIndex = data.doorIndex
				}
				TerrainHandler.AddBlock(data.name, data.pos, data.direction, params)
			end,
			deleteFunc = function (pos)
				TerrainHandler.RemoveBlock(pos)
			end,
			exportFunc = function ()
				return TerrainHandler.ExportObjects()
			end,
		},
		robots = {
			defs = RobotDefs,
			spawnFunc = function (data)
				local params = {
					program = data.program,
					humanName = data.humanName,
					swapAction = data.swapAction,
					swapTrigger = data.swapTrigger,
				}
				RobotHandler.AddRobot(data.name, data.pos, data.direction, params)
			end,
			deleteFunc = function (pos)
				RobotHandler.RemoveRobot(pos)
			end,
			exportFunc = function ()
				return RobotHandler.ExportObjects()
			end,
		},
		player = {
			defs = {player = {image = "player"}},
			spawnFunc = function (data)
				PlayerHandler.CreatePlayer(data.pos, data.direction)
			end,
			deleteFunc = function ()
				
			end,
			exportFunc = function ()
				return PlayerHandler.ExportObjects()
			end,
		}
	},
	
}

def.spawnKey = {
	w = "wall",
	q = "player",
	d = "basic_robot",
	a = "player_goal",
	s = "robot_goal",
	u = "paint",
	i = "fire",
	h = "box",
	f = "door",
	n = "door_reverse",
	v = "button_open",
	b = "button_close",
}

def.spawnString = [[
W - Wall
Q - Player
D - Basic Robot
NO KEY - Fast Robot
A - Player Goal
S - Robot Goal
U - Paint
I - Fire
H - Box

G - Door type select
F - Door
N - Reverse Door
V - Open Button
B - Close Button

]]

def.commandBlocks = {}
for name, _ in pairs(CommandDefs) do
	local defName = "cmd_" .. name
	def.commandBlocks[#def.commandBlocks + 1] = defName
end
table.sort(def.commandBlocks)

return def
