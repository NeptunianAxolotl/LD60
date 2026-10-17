
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
	TerrainHandler.SetDimensions(self.levelData.dimensions)
	for spawnType, _ in pairs(EditorDefs.spawnTypes) do
		for i = 1, #self.levelData[spawnType] do
			EditorDefs.spawnTypes[spawnType].spawnFunc(self.levelData[spawnType][i])
		end
	end
end

function api.LoadLevel(name)
	print("load level")
	local contents = love.filesystem.read("levels/" .. name)
	if not contents then
		EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Level file not found.", velocity = {0, 4}})
		return
	end
	local levelFunc = loadstring("return "..contents)
	if not levelFunc then
		EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Error loading level.", velocity = {0, 4}})
		return
	end
	local success, levelData = pcall(levelFunc)
	if not success then
		EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Level format error.", velocity = {0, 4}})
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
		dimensions = TerrainHandler.GetDimensions(),
	}
	for spawnType, _ in pairs(EditorDefs.spawnTypes) do
		for i = 1, #self.levelData[spawnType] do
			save[spawnType] = EditorDefs.spawnTypes[spawnType].exportFunc()
		end
	end
	
	local saveTable = util.TableToString(save)
	local success, message = love.filesystem.write("levels/" .. name .. ".lua", saveTable)
	if success then
		EffectsHandler.SpawnEffect("error_popup", {0, 0}, {text = "Level saved to " .. name .. ".", velocity = {0, 4}})
	else
		EffectsHandler.SpawnEffect("error_popup", {0, 0}, {text = "Save error: " .. (message or "NO MESSAGE"), velocity = {0, 4}})
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
	local clickPos = api.WorldToGrid({mx, my})
	if self.editor.tile == "delete" then
		for spawnType, _ in pairs(EditorDefs.spawnTypes) do
			EditorDefs.spawnTypes[spawnType].deleteFunc(clickPos)
		end
		return
	end
	for spawnType, _ in pairs(EditorDefs.spawnTypes) do
		if EditorDefs.spawnTypes[spawnType].defs[self.editor.tile] then
			EditorDefs.spawnTypes[spawnType].spawnFunc(clickPos, self.editor.tile, self.editor.rotation)
		end
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if self.loadingLevelGetName or self.saveLevelGetName then
		if key and string.len(key) == 1 then
			if (love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) then
				key = string.upper(key)
			end
			self.enteredText = (self.enteredText or "") .. key
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
		self.editor.rotation = (self.editor.rotation + 1)%4
	elseif key == "e" then
		self.editor.rotation = (self.editor.rotation - 1)%4
	elseif key == "z" then
		self.editor.tile = "delete"
	elseif EditorDefs.spawnKey[key] then
		self.editor.tile = EditorDefs.spawnKey[key]
	end
	print(key)
end

function api.GetSelectedTile()
	return self.editor and self.editor.tile, self.editor and self.editor.rotation
end

function api.DrawInterface()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()
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
		Font.SetSize(2)
		offset = 20
		love.graphics.printf("Editing Level", 20, offset, 500, "left")
		offset = offset + 40
		love.graphics.printf("Piece: " .. self.editor.tile, 20, offset, 500, "left")
		offset = offset + 40
		love.graphics.printf("Rotation: " .. self.editor.rotation, 20, offset, 500, "left")
		offset = offset + 40
		
		offset = offset + 40
		love.graphics.printf([[
R - Rotate
E - Rotate backwards
Z - Delete
]] .. EditorDefs.spawnString, 20, offset, 500, "left")
		offset = offset + 40
	end
	return drawWindow
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
		local drawRot = util.CardinalToDirection(self.editor.rotation)
		Resources.DrawImage(toDraw, drawPos[1], drawPos[2], drawRot)
	end})
end

function api.Initialize(world, levelData)
	self = {
		world = world,
		levelData = levelData,
		editMode = true,
		tileSize = Global.TILE_SIZE,
		editor = {
			rotation = 0,
			tile = "wall",
		},
	}
end

return api
