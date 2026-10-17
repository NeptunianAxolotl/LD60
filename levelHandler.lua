
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
	self.humanName = name
	
	local save = {
		humanName = self.humanName,
		dimensions = self.dimensions,
		description = self.levelData.description,
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

function api.InEditMode()
	return self.editMode
end

function api.IsMenuOpen()
	return self.loadingLevelGetName or self.saveLevelGetName
end

function api.MousePressed(mx, my, button)
	if self.loadingLevelGetName or self.saveLevelGetName then
		return true
	end
	if not self.editMode then
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
		if spawnData.defs[self.editor.tile] then
			local data = {
				name = self.editor.tile,
				pos = clickPos,
				direction = self.editor.direction,
			}
			spawnData.spawnFunc(data)
			self.prevClickPos = clickPos
		end
	end
end

function api.MouseMoved(mx, my, dx, dy)
	if not self.editMode then
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
	end
	if key == "k" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.saveLevelGetName = true
	end
	if key == "j" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.editMode = not self.editMode
		print("editMode", self.editMode)
	end
	
	if not self.editMode then
		return
	end
	
	local varyRate = ((love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) and 5) or 1
	if key == "r" then
		self.editor.direction = (self.editor.direction + 1)%4
		return true
	elseif key == "e" then
		self.editor.direction = (self.editor.direction - 1)%4
		return true
	elseif key == "z" then
		self.editor.tile = "delete"
		return true
	elseif EditorDefs.spawnKey[key] then
		self.editor.tile = EditorDefs.spawnKey[key]
		return true
	end
	print(key)
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
	
	if self.editMode then
		Font.SetSize(4)
		offset = 10
		love.graphics.printf([[
Editing Level
Piece: ]] .. self.editor.tile .. [[ 
Direction: ]] .. self.editor.direction .. [[ 

Ctrl+J - Edit mode
Ctrl+K - Save level
Ctrl+L = Load level

R - Rotate
E - Rotate backwards
Z - Delete
]] .. EditorDefs.spawnString, 0, offset, 500, "left")
	end
end

local function DrawLevelInfo()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()

end

function api.DrawInterface()
	DrawEditor()
end

function api.Draw(drawQueue)
	if not self.editMode then
		return
	end
	local mousePos = api.WorldToGrid(self.world.GetMousePosition())
	if not mousePos then
		return
	end
	local toDraw = false
	
	for spawnType, spawnData in pairs(EditorDefs.spawnTypes) do
		if spawnData.defs[self.editor.tile] then
			toDraw = spawnData.defs[self.editor.tile].image
		end
	end
	if not toDraw then
		return
	end
	drawQueue:push({y=0; f=function()
		local drawPos = api.GridToWorld(mousePos)
		local drawRot = util.CardinalToDirection(self.editor.direction)
		Resources.DrawImage(toDraw, drawPos[1], drawPos[2], drawRot, 0.5)
	end})
end

function api.Initialize(world, levelData)
	self = {
		world = world,
		levelData = levelData,
		editMode = false,
		tileSize = Global.TILE_SIZE,
		editor = {
			direction = 0,
			tile = "wall",
		},
	}
	SetupLevel()
end

return api
