
local BlockDefs = util.LoadDefDirectory("defs/blocks")

local def = {
	spawnTypes = {
		blocks = {
			defs = BlockDefs,
			spawnFunc = function ()
			
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

}

def.spawnString = [[
W - Wall

]]

return def
