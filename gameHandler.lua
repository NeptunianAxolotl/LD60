
local CommandDefs = util.LoadDefDirectory("defs/commands")

local self = {}
local api = {}

--------------------------------------------------
-- Updating
--------------------------------------------------


function api.NofityRobotBrick(robotName)
	self.brickedRobotName = robotName
	self.brickTimer = Global.BRICK_ROBOT_TIMER
end

function api.GetBrickedRobotName()
	return self.brickedRobotName
end

function api.AllowMovement()
	local _, won = self.world.GetGameOver()
	if LevelHandler.InEditMode() then
		return false
	end
	return (not won)
end

--------------------------------------------------
-- API
--------------------------------------------------

function api.MousePressed(x, y)
	if self.hovered == "Level Complete!\nPress Space to continue" then
		self.world.GetCosmos().SwitchLevel(true)
		return true
	elseif self.hovered == "You Died!\nPress Space to restart" then
		self.world.Restart()
		return true
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if key == "return" or key == "space" or key == "kpenter" then
		local _, won, lost = self.world.GetGameOver()
		if won then
			self.world.GetCosmos().SwitchLevel(true)
			return true
		elseif lost then
			self.world.Restart()
			return true
		end
	end
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.Update(dt)
	self.brickTimer = util.UpdateTimer(self.brickTimer, dt)
	if RobotHandler.AllRobotsStationary() then
		BGMHandler.SetArp(0)
	else
		BGMHandler.SetArp(1)
	end
	if not self.world.GetGameOver() then
		if not PlayerHandler.GetPlayer() and not LevelHandler.InEditMode() then
			self.world.SetGameOver(false, "player_died")
		elseif PlayerHandler.GoalSatisfied() and RobotHandler.GoalSatisfied() then
			self.world.SetGameOver(true, "all_charging")
		end
	end
	if self.hoveredCommand then
		self.tooltipDisplay = self.hoveredCommand
		self.tooltipAlpha = math.min(2.6, (self.tooltipAlpha or 0) + 16*dt)
		self.hoveredCommand = false
	else
		self.tooltipAlpha = (self.tooltipAlpha or 0) - 9*dt
		if self.tooltipAlpha < 0 then
			self.tooltipAlpha = false
			self.tooltipDisplay = false
		end
	end
end

function api.DrawCommandBox(command, x, y, highlight, scale, hoverScale, lastAction, nextAction, backColorProp, alpha, robot)
	love.graphics.setLineWidth(3*(scale or 1))
	highlight = highlight or 0
	alpha = alpha or 1
	if hoverScale and self.mousePos and not self.hoveredCommand then
		local hoverSize = (hoverScale or 1)*Global.COMMAND_DRAW_SIZE
		local hx, hy = x - hoverSize/2, y - hoverSize/2
		self.hoveredCommand = util.PosInRectangle(self.mousePos, hx, hy, hoverSize, hoverSize) and command
	end
	local size = (scale or 1)*Global.COMMAND_DRAW_SIZE
	local rx, ry = x - size/2, y - size/2
	local backColor = (highlight >= 2) and Global.BUTTON_HIGHLIGHT or nextAction and Global.BUTTON_BACK_NEXT or Global.BUTTON_BACK
	local borderColor = (highlight >= 1) and Global.HOVER_HIGHLIGHT or Global.PUSH_BUTTON_BORDER
	if backColorProp and highlight < 2 and not nextAction then
		backColor = util.AverageTriple(Global.BUTTON_BACK, Global.BUTTON_BACK_NEXT, backColorProp)
	end
	if alpha ~= 1 then
		backColor = util.CopyTable(backColor)
		backColor[4] = alpha
		borderColor = util.CopyTable(borderColor)
		borderColor[4] = alpha
	end
	love.graphics.setColor(backColor)
	love.graphics.rectangle("fill", rx, ry, size, size, 4, 4, 16)
	love.graphics.setColor(borderColor)
	love.graphics.rectangle("line", rx, ry, size, size, 4, 4, 16)
	local image = CommandDefs[command].image
	if robot and CommandDefs[command].imageFunc then
		image = CommandDefs[command].imageFunc(robot)
	end
	Resources.DrawImage(image, x, y, false, alpha, scale)
end

function api.GetRobotCommandsOffset()
	return LevelHandler.GetLevelData().textSize or LevelHandler.GetLevelData().description and 425 or 160
end

function api.DrawInterface()
	love.graphics.setLineWidth(5)
	love.graphics.setColor(Global.PANEL_COL)
	local UI_PAD = 12
	love.graphics.rectangle("fill", Global.WINDOW_X - Global.UI_WIDTH - UI_PAD, -1000, 1200, 3000, 4, 4, 16)
	love.graphics.setColor(Global.PANEL_BORDER_COL)
	love.graphics.rectangle("line", Global.WINDOW_X - Global.UI_WIDTH - UI_PAD, -1000, 1200, 3000, 4, 4, 16)
	
	local levelData = LevelHandler.GetLevelData()
	local offsetY = 100
	Font.SetSize(1)
	love.graphics.setColor(Global.TEXT_COL)
	love.graphics.printf(levelData.humanName, Global.WINDOW_X - Global.UI_WIDTH, 30, Global.UI_WIDTH, "center")
	
	if levelData.description then
		Font.SetSize(4)
		love.graphics.printf(levelData.description, Global.WINDOW_X - Global.UI_WIDTH + 20, offsetY, Global.UI_WIDTH - 45, "left")
	end
	offsetY = offsetY + api.GetRobotCommandsOffset() - 150
	
	local commandQueue = PlayerHandler.GetCommandQueue()
	Font.SetSize(3)
	if not LevelHandler.GetLevelData().hideChipInventory then
		love.graphics.printf("Held Tube:", Global.WINDOW_X - Global.UI_WIDTH + 20, offsetY, Global.UI_WIDTH - 40, "left")
		local offsetX = Global.WINDOW_X - Global.UI_WIDTH + 190
		local CMD_SCALE = 1.2
		for i = 1, #commandQueue do
			local highlight = (i == 1) and 1
			if highlight and PlayerHandler.GetTargetForCommand() then
				highlight = 2
			end
			api.DrawCommandBox(commandQueue[i], offsetX, offsetY + Global.COMMAND_DRAW_SIZE*0.38, highlight, CMD_SCALE, CMD_SCALE)
			offsetX = offsetX + Global.COMMAND_DRAW_SIZE*CMD_SCALE + 5
		end
	end
	offsetY = offsetY + 60
	
	if LevelHandler.InEditMode() then
		return
	end
	
	local _, won, lost = self.world.GetGameOver()
	local mousePos = self.world.GetMousePositionInterface()
	self.mousePos = mousePos
	if won and LevelHandler.GetLevelData().specialEndText then
		local width = 600
		local panelX, panelY = (Global.WINDOW_X - Global.UI_WIDTH - width)/2 + 80, 400
		local height = 320
		local alpha = 1 - (self.brickTimer or 0)*5
		local CMD_SCALE = 2
		InterfaceUtil.DrawPanel(panelX, panelY, width, height, 5, false, 0.95)
		Font.SetSize(2)
		local textColor = Global.TEXT_COL
		if alpha ~= 1 then
			textColor = util.CopyTable(textColor)
			textColor[4] = alpha
		end
		love.graphics.setColor(textColor)
		love.graphics.printf(LevelHandler.GetLevelData().specialEndText or "???", panelX, panelY + 24, width, "center")
	end
	if self.brickedRobotName and (self.brickTimer or 0) < 0.2 then
		local width = 670
		local panelX, panelY = (Global.WINDOW_X - Global.UI_WIDTH - width)/2 + 80, 920
		local height = Global.WINDOW_Y - panelY - 20
		local alpha = 1 - (self.brickTimer or 0)*5
		local CMD_SCALE = 2
		InterfaceUtil.DrawPanel(panelX, panelY, width, height, 5, true, alpha)
		Font.SetSize(2)
		local textColor = Global.TEXT_COL
		if alpha ~= 1 then
			textColor = util.CopyTable(textColor)
			textColor[4] = alpha
		end
		love.graphics.setColor(textColor)
		love.graphics.printf((self.brickedRobotName or "A robot") .. [[
 is permanently stuck
Press Ctrl+R to restart the level
]], panelX, panelY + 24, width, "center")
	elseif self.tooltipDisplay then
		local panelX, panelY = 800 - UI_PAD, 920
		local width = (Global.WINDOW_X - Global.UI_WIDTH - 30 - UI_PAD) - panelX
		local height = Global.WINDOW_Y - panelY - 20
		local alpha = math.min(1, self.tooltipAlpha)
		local CMD_SCALE = 2
		InterfaceUtil.DrawPanel(panelX, panelY, width, height, 5, false, alpha)
		api.DrawCommandBox(self.tooltipDisplay, panelX + height/2, panelY + height/2, false, CMD_SCALE, false, false, false, false, alpha)
		
		local def = CommandDefs[self.tooltipDisplay]
		Font.SetSize(3)
		local textColor = Global.TEXT_COL
		if alpha ~= 1 then
			textColor = util.CopyTable(textColor)
			textColor[4] = alpha
		end
		love.graphics.setColor(textColor)
		love.graphics.printf(def.humanName or "MISSING", panelX + height, panelY + 13, width - height, "left")
		love.graphics.printf(def.description or "No description", panelX + height, panelY + 50, width - height - 20, "left")
		
	end
	
	self.hovered = false
	if won then
		if not LevelHandler.GetLevelData().specialEndText then
			self.hovered = InterfaceUtil.DrawButton(620, 500, 640, 180, mousePos, "Level Complete!\nPress Space to continue", false, false, false, false, 1, 17, false, 0.95)
		end
	elseif lost then
		self.hovered = InterfaceUtil.DrawButton(620, 500, 640, 180, mousePos, "You Died!\nPress Space to restart", false, false, false, false, 1, 17, false, 0.95)
	end
end

function api.Initialize(parentWorld)
	self = {
		world = parentWorld,
		tooltipAlpha = 0,
		tooltipDisplay = false,
	}
end

return api
