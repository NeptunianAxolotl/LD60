
local BlockDefs = util.LoadDefDirectory("defs/blocks")

local def = {
	spawnTypes = {
		blocks = {
			defs = BlockDefs,
			spawnFunc = function (defName, pos, direction)
			
			end,
			deleteFunc = function ()
			
			end,
			exportFunc = function ()
				
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
