
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
	return not won and not LevelHandler.InEditMode()
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

function api.DrawCommandBox(x, y, highlight, scale)
	love.graphics.setLineWidth(3*(scale or 1))
	highlight = highlight or 0
	local size = (scale or 1)*Global.COMMAND_DRAW_SIZE
	x, y = x - size/2, y - size/2
	love.graphics.setColor((highlight >= 2) and Global.BUTTON_HIGHLIGHT or Global.BUTTON_BACK)
	love.graphics.rectangle("fill", x, y, size, size, 4, 4, 16)
	love.graphics.setColor((highlight >= 1) and Global.HOVER_HIGHLIGHT or Global.PUSH_BUTTON_BORDER)
	love.graphics.rectangle("line", x, y, size, size, 4, 4, 16)
end

function api.GetRobotCommandsOffset()
	return LevelHandler.GetLevelData().textSize or LevelHandler.GetLevelData().description and 425 or 160
end

function api.DrawInterface()
	love.graphics.setLineWidth(5)
	love.graphics.setColor(Global.PANEL_COL)
	love.graphics.rectangle("fill", Global.WINDOW_X - Global.UI_WIDTH, -1000, 1200, 3000, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", Global.WINDOW_X - Global.UI_WIDTH, -1000, 1200, 3000, 4, 4, 16)
	
	local levelData = LevelHandler.GetLevelData()
	local offsetY = 100
	Font.SetSize(1)
	love.graphics.setColor(Global.TEXT_COL)
	love.graphics.printf(levelData.humanName, Global.WINDOW_X - Global.UI_WIDTH, 30, Global.UI_WIDTH, "center")
	
	if levelData.description then
		Font.SetSize(4)
		love.graphics.printf(levelData.description, Global.WINDOW_X - Global.UI_WIDTH + 20, offsetY, Global.UI_WIDTH - 28, "left")
	end
	offsetY = offsetY + api.GetRobotCommandsOffset() - 150
	
	local commandQueue = PlayerHandler.GetCommandQueue()
	Font.SetSize(3)
	if not LevelHandler.GetLevelData().hideChipInventory then
		love.graphics.printf("Held Chip:", Global.WINDOW_X - Global.UI_WIDTH + 20, offsetY, Global.UI_WIDTH - 40, "left")
		local offsetX = Global.WINDOW_X - Global.UI_WIDTH + 190
		local CMD_SCALE = 1.2
		for i = 1, #commandQueue do
			local highlight = (i == 1) and 1
			if highlight and PlayerHandler.GetTargetForCommand() then
				highlight = 2
			end
			api.DrawCommandBox(offsetX, offsetY + Global.COMMAND_DRAW_SIZE*0.38, highlight, CMD_SCALE)
			Resources.DrawImage(CommandDefs[commandQueue[i]].image, offsetX, offsetY + Global.COMMAND_DRAW_SIZE*0.38, false, false, CMD_SCALE)
			offsetX = offsetX + Global.COMMAND_DRAW_SIZE*CMD_SCALE + 5
		end
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
