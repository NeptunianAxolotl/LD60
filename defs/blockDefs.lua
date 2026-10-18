
local BlockDefs = util.LoadDefDirectory("defs/blocks")
local CommandDefs = util.LoadDefDirectory("defs/commands")

for name, def in pairs(CommandDefs) do
	local defName = "cmd_" .. name
	BlockDefs[defName] = {
		name = defName,
		image = def.image,
		command = def.name,
		isBlocking = false,
		pickupFunc = function (self, other)
			if #PlayerHandler.GetCommandQueue() < Global.COMMAND_QUEUE_LIMIT and self.Destroy() then
				PlayerHandler.PickupCommand(self.def.command)
			end
		end,
	}
end

return BlockDefs
