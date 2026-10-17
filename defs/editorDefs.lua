
local BlockDefs = util.LoadDefDirectory("defs/blocks")

local def = {
	spawnTypes = {
		blocks = {
			defs = BlockDefs,
			spawnFunc = function (defName, pos, direction)
				TerrainHandler.AddBlock(defName, pos, direction)
			end,
			deleteFunc = function (pos)
				TerrainHandler.RemoveBlock(pos)
			end,
			exportFunc = function ()
				return TerrainHandler.ExportObjects()
			end,
		},
		player = {
			defs = {player = {image = "player"}},
			spawnFunc = function (defName, pos, direction)
				PlayerHandler.CreatePlayer(pos, direction)
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
}

def.spawnString = [[
W - Wall
Q - Player

]]

return def
