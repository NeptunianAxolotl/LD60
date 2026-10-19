
local BlockDefs = util.LoadDefDirectory("defs/blocks")
local CommandDefs = util.LoadDefDirectory("defs/commands")

for name, def in pairs(CommandDefs) do
	local defName = "cmd_" .. name
	BlockDefs[defName] = {
		name = defName,
		image = def.image,
		command = def.name,
		fixedDirection = 0,
		extraDraw = "tube",
		scaleOverride = 0.7,
		pickupFunc = function (self, other)
			if #PlayerHandler.GetCommandQueue() < Global.COMMAND_QUEUE_LIMIT and self.Destroy() then
				PlayerHandler.PickupCommand(self.def.command)
			end
		end,
	}
end

return BlockDefs
