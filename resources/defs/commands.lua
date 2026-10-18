
local names = util.GetDefDirList("resources/images/commands")
local data = {}

for i = 1, #names do
	data[#data + 1] = {
		name = "cmd_" .. names[i],
		file = "resources/images/commands/" .. names[i] .. ".png",
		form = "image",
		xScale = Global.COMMAND_DRAW_SIZE/128*0.96,
		yScale = Global.COMMAND_DRAW_SIZE/128*0.96,
		xOffset = 0.5,
		yOffset = 0.5,
	}
end

return data
