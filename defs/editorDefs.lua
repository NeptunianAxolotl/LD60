
local BlockDefs = require("defs/blockDefs")
local RobotDefs = util.LoadDefDirectory("defs/robots")
local CommandDefs = util.LoadDefDirectory("defs/commands")

local def = {
	spawnTypes = {
		blocks = {
			defs = BlockDefs,
			spawnFunc = function (data)
				TerrainHandler.AddBlock(data.name, data.pos, data.direction)
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
	f = "fast_robot",
	a = "player_goal",
	s = "robot_goal",
	u = "paint",
}

def.spawnString = [[
W - Wall
Q - Player
D - Basic Robot
F - Fast Robot
A - Player Goal
S - Robot Goal
U - Paint

]]

def.commandBlocks = {}
for name, _ in pairs(CommandDefs) do
	local defName = "cmd_" .. name
	def.commandBlocks[#def.commandBlocks + 1] = defName
end
table.sort(def.commandBlocks)

return def
