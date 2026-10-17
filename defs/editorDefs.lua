
local BlockDefs = util.LoadDefDirectory("defs/blocks")
local RobotDefs = util.LoadDefDirectory("defs/robots")

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
				RobotHandler.AddRobot(data.name, data.pos, data.direction)
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
}

def.spawnString = [[
W - Wall
Q - Player
D - Basic Robot

]]

return def
