local DISABLED = false

local soundFiles = util.LoadDefDirectory("resources/musicDefs")

local self = {}
local api = {}
local cosmos

function api.Update(dt)
	if DISABLED then
		return
	end
end

function api.Stop()
	-- Stop all the currently-playing layers and set the phase-check clock to zero so it is ready to restart
	DISABLED = true
end

function api.Start()
	-- uninhibit Update(), which will immediately restart the BGM
	DISABLED = false
end

function api.Initialize(newCosmos)
	if DISABLED then
		return
	end
	self.cosmos = newCosmos
end

return api
