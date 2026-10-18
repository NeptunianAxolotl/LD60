
local Font = require("include/font")

local EffectsHandler = require("effectsHandler")
local Resources = require("resourceHandler")

local CommandDefs = util.LoadDefDirectory("defs/commands")

local self = {}
local api = {}

--------------------------------------------------
-- Updating
--------------------------------------------------

--------------------------------------------------
-- API
--------------------------------------------------

function api.MousePressed(x, y)
	if self.hovered == "You Win! Click to continue." then
		self.world.GetCosmos().SwitchLevel(true)
	elseif self.hovered == "You Died! Click to restart." then
		self.world.Restart()
	end
end

function api.AllowMovement()
	local _, won = self.world.GetGameOver()
	return not won
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.Update(dt)
	if not self.world.GetGameOver() then
		if not PlayerHandler.GetPlayer() and not LevelHandler.InEditMode() then
			self.world.SetGameOver(false, "player_died")
		elseif PlayerHandler.GoalSatisfied() and RobotHandler.GoalSatisfied() then
			self.world.SetGameOver(true, "all_charging")
		end
	end
end

function api.DrawCommandBox(x, y)
	x, y = x - Global.COMMAND_DRAW_SIZE/2, y - Global.COMMAND_DRAW_SIZE/2
	love.graphics.setColor(Global.PANEL_COL)
	love.graphics.rectangle("fill", x, y, Global.COMMAND_DRAW_SIZE, Global.COMMAND_DRAW_SIZE, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", x, y, Global.COMMAND_DRAW_SIZE, Global.COMMAND_DRAW_SIZE, 4, 4, 16)
end

function api.DrawInterface()
	love.graphics.setLineWidth(5)
	love.graphics.setColor(Global.PANEL_COL)
	love.graphics.rectangle("fill", Global.WINDOW_X - Global.UI_WIDTH, -1000, 1200, 3000, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", Global.WINDOW_X - Global.UI_WIDTH, -1000, 1200, 3000, 4, 4, 16)
	
	local levelData = LevelHandler.GetLevelData()
	local offsetY = 120
	Font.SetSize(0)
	love.graphics.setColor(Global.TEXT_COL)
	love.graphics.printf(levelData.humanName, Global.WINDOW_X - Global.UI_WIDTH, 30, Global.UI_WIDTH, "center")
	
	if levelData.description then
		Font.SetSize(4)
		love.graphics.printf(levelData.description, Global.WINDOW_X - Global.UI_WIDTH + 20, offsetY, Global.UI_WIDTH - 28, "left")
		offsetY = offsetY + 270
	else
		offsetY = offsetY + 20
	end
	
	local commandQueue = PlayerHandler.GetCommandQueue()
	Font.SetSize(3)
	love.graphics.printf("Chips:", Global.WINDOW_X - Global.UI_WIDTH + 20, offsetY, Global.UI_WIDTH - 40, "left")
	local offsetX = Global.WINDOW_X - Global.UI_WIDTH + 130
	for i = 1, #commandQueue do
		api.DrawCommandBox(offsetX, offsetY + Global.COMMAND_DRAW_SIZE*0.4)
		Resources.DrawImage(CommandDefs[commandQueue[i]].image, offsetX, offsetY + Global.COMMAND_DRAW_SIZE*0.4)
		offsetX = offsetX + Global.COMMAND_DRAW_SIZE + 5
	end
	offsetY = offsetY + 60
	
	local _, won, lost = self.world.GetGameOver()
	local mousePos = self.world.GetMousePositionInterface()
	self.hovered = false
	if won then
		self.hovered = InterfaceUtil.DrawButton(600, 500, 700, 100, mousePos, "You Win! Click to continue.", false, false, false, false, 1, 15, false, 0.85)
	elseif lost then
		self.hovered = InterfaceUtil.DrawButton(600, 500, 700, 100, mousePos, "You Died! Click to restart.", false, false, false, false, 1, 15, false, 0.85)
	end
end

function api.Initialize(parentWorld)
	self = {
		world = parentWorld
	}
end

return api
