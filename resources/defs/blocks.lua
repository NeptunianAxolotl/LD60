
local names = util.GetDefDirList("resources/images/blocks")
local data = {}

for i = 1, #names do
	data[#data + 1] = {
		name = names[i],
		file = "resources/images/blocks/" .. names[i] .. ".png",
		form = "image",
		xScale = Global.TILE_SIZE/128,
		yScale = Global.TILE_SIZE/128,
		xOffset = 0.5,
		yOffset = 0.5,
	}
end

return data
