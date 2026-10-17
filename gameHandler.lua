
local Font = require("include/font")

local EffectsHandler = require("effectsHandler")
local Resources = require("resourceHandler")

local self = {}
local api = {}
local world

--------------------------------------------------
-- Updating
--------------------------------------------------

--------------------------------------------------
-- API
--------------------------------------------------

function api.ToggleMenu()
	self.menuOpen = not self.menuOpen
	world.SetMenuState(self.menuOpen)
end

function api.MousePressed(x, y)
	local windowX, windowY = love.window.getMode()
	local drawPos = world.ScreenToInterface({windowX, 0})
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.Update(dt)
end

function api.DrawInterface()
	love.graphics.setLineWidth(5)
	love.graphics.setColor(Global.PANEL_COL)
	love.graphics.rectangle("fill", Global.WINDOW_X - Global.UI_WIDTH, -1000, 1200, 3000, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", Global.WINDOW_X - Global.UI_WIDTH, -1000, 1200, 3000, 4, 4, 16)
	
	local levelData = LevelHandler.GetLevelData()
	Font.SetSize(0)
	love.graphics.setColor(Global.TEXT_COL)
	love.graphics.printf(levelData.humanName, Global.WINDOW_X - Global.UI_WIDTH, 30, Global.UI_WIDTH, "center")
	
	if levelData.description then
		Font.SetSize(4)
		love.graphics.printf(levelData.description, Global.WINDOW_X - Global.UI_WIDTH + 30, 120, Global.UI_WIDTH - 40, "left")
	end
end

function api.Initialize(parentWorld)
	self = {}
	world = parentWorld
end

return api
