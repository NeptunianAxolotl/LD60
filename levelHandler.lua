
local Font = require("include/font")

local EditorDefs = require("defs/editorDefs")

local self = {}
local api = {}

function api.GetLevelData()
	return self.levelData
end

function api.Width()
	return self.levelData.width
end

function api.Height()
	return self.levelData.height
end

function api.TileSize()
	return self.tileSize
end

function api.TileScale()
	return 1
end

function api.GetViewRestriction()
	local pointsToView = {{0, 0}, {self.dimensions[1]*Global.TILE_SIZE, self.dimensions[2]*Global.TILE_SIZE}}
	return pointsToView
end

function api.GetDimensions()
	return self.dimensions
end

function api.WorldToGrid(pos)
	local x, y = math.floor(pos[1]/self.tileSize), math.floor(pos[2] / self.tileSize)
	return {x, y}
end

function api.WorldToGridSpaceNoSnap(pos)
	local x, y = (pos[1] - 0.5*self.tileSize)/self.tileSize, (pos[2] - 0.5*self.tileSize)/self.tileSize
	return {x, y}
end

function api.GridToWorld(pos)
	local x, y = (pos[1] + 0.5)*self.tileSize, (pos[2] + 0.5)*self.tileSize
	return {x, y}
end

local function SetupLevel()
	self.dimensions = util.CopyTable(self.levelData.dimensions)
	for i = 1, Global.DOOR_TYPE_COUNT do
		TerrainHandler.SetDoorOpen(i, doorOpenState and doorOpenState[i] or false, true)
	end
	for spawnType, spawnData in pairs(EditorDefs.spawnTypes) do
		for i = 1, #(self.levelData[spawnType] or {}) do
			spawnData.spawnFunc(self.levelData[spawnType][i])
		end
	end
end

function api.LoadLevel(name)
	print("load level")
	local contents = love.filesystem.read("levels/" .. name .. ".lua")
	if not contents then
		EffectsHandler.SpawnEffect("error_popup", {400, 300}, {text = "Level file not found.", velocity = {0, 4}})
		return
	end
	local levelFunc = loadstring(contents)
	if not levelFunc then
		EffectsHandler.SpawnEffect("error_popup", {400, 300}, {text = "Error loading level.", velocity = {0, 4}})
		return
	end
	local success, levelData = pcall(levelFunc)
	if not success then
		EffectsHandler.SpawnEffect("error_popup", {400, 300}, {text = "Level format error.", velocity = {0, 4}})
		return
	end
	
	self.world.GetCosmos().LoadLevelByTable(levelData)
	return true
end

function api.SaveLevel(name)
	love.filesystem.createDirectory("levels")
	self.humanName = self.levelData.humanName or name
	
	local save = {
		humanName = self.humanName,
		dimensions = self.dimensions,
		doorOpenState = self.levelData.doorOpenState or {},
		description = self.levelData.description,
		textSize = self.levelData.textSize,
		hideChipInventory = self.levelData.hideChipInventory,
	}
	for spawnType, spawnData in pairs(EditorDefs.spawnTypes) do
		save[spawnType] = spawnData.exportFunc()
	end
	
	local saveTable = util.TableToString(save, Global.SAVE_ORDER, util.ListToMask(Global.SAVE_INLINE))
	local success, message = love.filesystem.write("levels/" .. name .. ".lua", "return " .. saveTable)
	if success then
		EffectsHandler.SpawnEffect("error_popup", {400, 300}, {text = "Level saved to " .. name .. ".", velocity = {0, 4}})
	else
		EffectsHandler.SpawnEffect("error_popup", {400, 300}, {text = "Save error: " .. (message or "NO MESSAGE"), velocity = {0, 4}})
	end
	return success
end

local function MoveLevel(offset)
	PlayerHandler.MoveEverything(offset)
	RobotHandler.MoveEverything(offset)
	TerrainHandler.MoveEverything(offset)
end

function api.InEditMode()
	return self.world.GetCosmos().InEditMode()
end

function api.IsMenuOpen()
	return self.loadingLevelGetName or self.saveLevelGetName
end

function api.MousePressed(mx, my, button)
	if self.loadingLevelGetName or self.saveLevelGetName then
		return true
	end
	if not api.InEditMode() then
		return
	end
	if button ~= 1 then
		return
	end
	local clickPos = api.WorldToGrid({mx, my})
	if self.editor.tile == "delete" then
		for spawnType, spawnData in pairs(EditorDefs.spawnTypes) do
			spawnData.deleteFunc(clickPos)
		end
		return
	end
	for spawnType, spawnData in pairs(EditorDefs.spawnTypes) do
		local toSpawn = spawnData.defs[self.editor.tile]
		if toSpawn then
			local data = {
				name = self.editor.tile,
				pos = clickPos,
				direction = self.editor.direction,
				doorIndex = toSpawn.needDoorIndex and self.editor.doorIndex,
			}
			spawnData.spawnFunc(data)
			self.prevClickPos = clickPos
		end
	end
end

function api.MouseMoved(mx, my, dx, dy)
	if not api.InEditMode() then
		return
	end
	if not love.mouse.isDown(1) then
		return
	end
	local clickPos = api.WorldToGrid({mx, my})
	if util.Equal(self.prevClickPos, clickPos) then
		return
	end
	api.MousePressed(mx, my, 1)
end

function api.KeyPressed(key, scancode, isRepeat)
	if self.loadingLevelGetName or self.saveLevelGetName then
		if key and string.len(key) == 1 then
			if (love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) then
				key = string.upper(key)
			end
			self.enteredText = (self.enteredText or "") .. key
			return true
		end
		if key == "meta" or key == "space" then
			self.enteredText = (self.enteredText or "") .. " "
		end
		if (key == "delete" or key == "backspace") and self.enteredText and string.len(self.enteredText) > 0 then
			self.enteredText = string.sub(self.enteredText, 0, string.len(self.enteredText) - 1)
		end
		if key == "escape" then
			self.loadingLevelGetName = false
			self.saveLevelGetName = false
			return true
		end
		if key == "return" and self.enteredText then
			if self.loadingLevelGetName then
				api.LoadLevel(self.enteredText)
				-- Loading causes immediate reinitialisation from world.
			elseif self.saveLevelGetName then
				if api.SaveLevel(self.enteredText) then
					self.saveLevelGetName = false
				end
			end
		end
		return true
	end
	
	if key == "l" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.loadingLevelGetName = true
	elseif key == "k" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.saveLevelGetName = true
	end
	
	if not api.InEditMode() then
		return
	end
	
	if key == "left" then
		if (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
			self.dimensions[1] = math.max(3, self.dimensions[1] - 1)
		else
			MoveLevel({-1, 0})
		end
	elseif key == "right" then
		if (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
			self.dimensions[1] = self.dimensions[1] + 1
		else
			MoveLevel({1, 0})
		end
	elseif key == "up" then
		if (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
			self.dimensions[2] = math.max(3, self.dimensions[2] - 1)
		else
			MoveLevel({0, -1})
		end
	elseif key == "down" then
		if (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
			self.dimensions[2] = self.dimensions[2] + 1
		else
			MoveLevel({0, 1})
		end
	end
	
	local varyRate = ((love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) and 5) or 1
	if key == "r" then
		self.editor.direction = (self.editor.direction + 1)%4
		return true
	elseif key == "e" then
		self.editor.direction = (self.editor.direction - 1)%4
		return true
	elseif key == "y" then
		self.editor.commandIndex = (self.editor.commandIndex or 0)%(#EditorDefs.commandBlocks) + 1
		self.editor.tile = EditorDefs.commandBlocks[self.editor.commandIndex]
		return true
	elseif key == "t" then
		self.editor.commandIndex = ((self.editor.commandIndex or 0) - 2)%(#EditorDefs.commandBlocks) + 1
		self.editor.tile = EditorDefs.commandBlocks[self.editor.commandIndex]
		return true
	elseif key == "g" then
		self.editor.doorIndex = self.editor.doorIndex%Global.DOOR_TYPE_COUNT + 1
		return true
	elseif key == "z" then
		self.editor.tile = "delete"
		return true
	elseif EditorDefs.spawnKey[key] then
		self.editor.tile = EditorDefs.spawnKey[key]
		return true
	end
end

local function DrawEditor()
	local windowX, windowY = love.window.getMode()
	local overX = windowX*0.32
	local overWidth = windowX*0.36
	local overY = windowY*0.3
	local overHeight = windowY*0.4
	love.graphics.setColor(0, 0, 0, 1)
	Font.SetSize(2)
	
	local drawWindow = self.loadingLevelGetName or self.saveLevelGetName
	if drawWindow then
		love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.97)
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", overX, overY, overWidth, overHeight, 8, 8, 16)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("line", overX, overY, overWidth, overHeight, 8, 8, 16)
	end
	if self.loadingLevelGetName then
		Font.SetSize(0)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.printf("Loading Level", overX, overY + overHeight * 0.04, overWidth, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Type level name (Enter accept, ESC cancel)\n" .. (self.enteredText or ""), overX + overWidth*0.05, overY + overHeight * 0.32 , overWidth*0.9, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Loading from " .. (love.filesystem.getSaveDirectory() or "DIR_ERROR") .. "/levels", overX + overWidth*0.05, overY + overHeight * 0.65, overWidth*0.9, "center")
	elseif self.saveLevelGetName then
		Font.SetSize(0)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.printf("Saving Level", overX, overY + overHeight * 0.04, overWidth, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Type level name (Enter accept, ESC cancel)\n" .. (self.enteredText or ""), overX + overWidth*0.05, overY + overHeight * 0.32 , overWidth*0.9, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Saving to " .. (love.filesystem.getSaveDirectory() or "DIR_ERROR") .. "/levels", overX + overWidth*0.05, overY + overHeight * 0.65, overWidth*0.9, "center")
	end
	
	if api.InEditMode() then
		Font.SetSize(4)
		love.graphics.setColor(0.9, 0.9, 0.9, 1)
		offset = 10
		love.graphics.printf([[
Editing Level
Piece: ]] .. self.editor.tile .. [[ 
Direction: ]] .. self.editor.direction .. [[ 
Door: ]] .. self.editor.doorIndex .. [[ 

Ctrl+J - Edit mode
Ctrl+K - Save level
Ctrl+L - Load level

Arrows - Reposition
Ctrl+Arrows - Resize
E,R - Rotate
T,Y - Place command
Z - Delete

]] .. EditorDefs.spawnString .. [[
Edit robot programs in the
level file (save and open
inbuilt levels for examples).]], 30, offset, 500, "left")
	end
end

local function DrawLevelInfo()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()

end

function api.DrawInterface()
	DrawEditor()
end

function api.Draw(drawQueue)
	if not api.InEditMode() then
		return
	end
	local mousePos = api.WorldToGrid(self.world.GetMousePosition())
	if not mousePos then
		return
	end
	local toDraw = false
	for spawnType, spawnData in pairs(EditorDefs.spawnTypes) do
		if spawnData.defs[self.editor.tile] then
			toDraw = spawnData.defs[self.editor.tile]
		end
	end
	if not toDraw then
		return
	end
	drawQueue:push({y=0; f=function()
		local drawPos = api.GridToWorld(mousePos)
		local drawRot = util.CardinalToDirection(self.editor.direction)
		local color = toDraw.drawColorFunc and toDraw.drawColorFunc({doorIndex = self.editor.doorIndex})
		Resources.DrawImage(toDraw.image, drawPos[1], drawPos[2], drawRot, 0.5, false, color)
	end})
end

function api.Initialize(world, levelData)
	self = {
		world = world,
		levelData = levelData,
		tileSize = Global.TILE_SIZE,
		editor = {
			direction = 0,
			doorIndex = 1,
			tile = "wall",
		},
	}
	SetupLevel()
end

return api
