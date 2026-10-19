
local World = require("world")
SoundHandler = require("soundHandler")
BGMHandler = require("bgmHandler")
MainMenuHandler = require("mainMenuHandler")

local LevelDefs = require("defs/levelDefs")

local self = {}
local api = {}

-- Cosmos handles the world level, restarting the world,
-- and things that persist between worlds.

--------------------------------------------------
-- Get
--------------------------------------------------

function api.GetWorld()
	return World
end

--------------------------------------------------
-- Music
--------------------------------------------------

function api.ToggleMusic()
	self.musicEnabled = not self.musicEnabled
	if self.musicEnabled then
		BGMHandler.Start()
	else
		BGMHandler.Stop()
	end
end

function api.MusicEnabled()
	return self.musicEnabled
end

function api.GetMusicVolume()
	return self.musicVolume
end

function api.SetMusicVolume(volume)
	self.musicVolume = volume
	if volume <= 0 then
		self.musicEnabled = false
		return
	end
	self.musicEnabled = true
end

function api.GetSoundVolume()
	return self.soundVolume
end

function api.SetSoundVolume(volume)
	self.soundVolume = volume
	if volume <= 0 then
		self.soundEnabled = false
		return
	end
	self.soundEnabled = true
end

--------------------------------------------------
-- Resets etc
--------------------------------------------------

function api.RestartWorld()
	World.Initialize(api, self.currentLevel)
end

function api.LoadLevelByTable(levelTable)
	self.currentLevel = levelTable
	World.Initialize(api, self.currentLevel)
end

function api.SwitchLevel(goNext)
	for i = 1, #LevelDefs.levelOrder do
		if LevelDefs.levelOrder[i] == self.currentLevel.name then
			local offset = (goNext and 1) or -1
			if LevelDefs.levelOrder[i + offset] then
				self.currentLevel = LevelDefs.levels[LevelDefs.levelOrder[i + offset]]
				World.Initialize(api, self.currentLevel)
			end
			return
		end
	end
	api.SwitchLevelByNumber(1)
end

function api.SwitchLevelByNumber(levelNumber)
	if LevelDefs.levelOrder[levelNumber] then
		self.currentLevel = LevelDefs.levels[LevelDefs.levelOrder[levelNumber]]
		World.Initialize(api, self.currentLevel)
		return
	end
end

function api.GetLevelNumber()
	for i = 1, #LevelDefs.levelOrder do
		if LevelDefs.levelOrder[i] == self.currentLevel.name then
			return i
		end
	end
	return nil
end

function api.GetScrollSpeeds()
	return (self.grabInput and self.mouseScrollSpeed) or 0, self.keyScrollSpeed
end

function api.GetPersistentData()
	return self.persistentDataTable
end

function api.ToggleGrabInput()
	self.grabInput = not self.grabInput
	love.mouse.setGrabbed(self.grabInput)
end

function api.ScrollSpeedChange(change)
	self.mouseScrollSpeed = self.mouseScrollSpeed * change
	self.keyScrollSpeed = self.keyScrollSpeed * change
end

function api.DrawPhysicsEnabled()
	return self.drawDebug
end

function api.QuitGame()
	love.event.quit()
end

function api.DrawDebug()
	return self.drawDebug
end

function api.ToggleDebug()
	self.drawDebug = not self.drawDebug
end

function api.InEditMode()
	return self.editMode
end

function api.ToggleLocalisation()
	self.localisation = not self.localisation
end

function api.GetLocalisation()
	return self.localisation
end

--------------------------------------------------
-- Won Levels
--------------------------------------------------

function api.GetCurrentLevelPreviouslyWon()
	return self.wonLevels[(self.currentLevel.name or "unknown")]
end

function api.SetLevelWon(cyclesToWin)
	cyclesToWin = cyclesToWin or -1
	local oldTime = self.wonLevels[(self.currentLevel.name or "unknown")] or -1
	if oldTime > 0 and oldTime < cyclesToWin then
		cyclesToWin = oldTime
	end
	if Global.SAVE_WON_LEVELS then
		love.filesystem.createDirectory("completed")
		local success, message = love.filesystem.write("completed/" .. (self.currentLevel.name or "unknown"), cyclesToWin or "won")
	end
	self.wonLevels[(self.currentLevel.name or "unknown")] = cyclesToWin
end

function api.LoadLevelsWon()
	local files = love.filesystem.getDirectoryItems("completed")
	for i = 1, #(files or {}) do
		if files[i] then
			local contents = love.filesystem.read("completed/" .. files[i])
			local cyclesToWin = contents and tonumber(contents) or -1
			self.wonLevels[files[i]] = cyclesToWin
		end
	end
end

function api.GetLevelTimes()
	return self.wonLevels
end

function api.ShowHighScore()
	return self.showHighScore
end

function api.SetShowHighScore(newValue)
	self.showHighScore = newValue
end

--------------------------------------------------
-- Draw
--------------------------------------------------

function api.Draw()
	World.Draw()
end

function api.ViewResize(width, height)
	World.ViewResize(width, height)
end

function api.TakeScreenshot()
	love.filesystem.createDirectory("screenshots")
	print("working", love.filesystem.getWorkingDirectory())
	print("save", love.filesystem.getSaveDirectory())
	love.graphics.captureScreenshot("screenshots/screenshot_" .. math.floor(math.random()*100000) .. "_.png")
end

function api.GetRealTime()
	return self.realTime
end

--------------------------------------------------
-- Input
--------------------------------------------------

function api.KeyPressed(key, scancode, isRepeat)
	if key == "r" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.RestartWorld()
		return true
	end
	if key == "d" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.ToggleDebug()
		return true
	end
	if key == "m" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.ToggleMusic()
		return true
	end
	if key == "s" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.TakeScreenshot()
		return true
	end
	if key == "h" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.showHighScore = not self.showHighScore
		return true
	end
	if Global.DEV_TOOLS_ENABLED and key == "b" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.SwitchLevelByNumber(Global.DEBUG_SKIP_TO_LEVEL)
	end
	if key == "n" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.SwitchLevel(true)
		return true
	end
	if key == "p" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.SwitchLevel(false)
		return true
	end
	if key == "j" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.editMode = not self.editMode
	end
	if World.KeyPressed(key, scancode, isRepeat) then
		return true
	end
	if key == "escape" then
		MainMenuHandler.ToggleMenu()
		return true
	end
end

function api.KeyReleased(key, scancode)
	return World.KeyReleased(key, scancode)
end

function api.MousePressed(x, y, button)
	return World.MousePressed(x, y, button)
end

function api.MouseReleased(x, y, button)
	return World.MouseReleased(x, y, button)
end

function api.MouseMoved(x, y, dx, dy)
	World.MouseMoved(x, y, dx, dy)
end

--------------------------------------------------
-- Update and Initialize
--------------------------------------------------

function api.Update(dt, realDt)
	self.realTime = self.realTime + realDt
	BGMHandler.Update(realDt)
	SoundHandler.Update(realDt)
	World.Update(dt)
	if not self.levelsLoaded then
		self.levelsLoaded = true
		api.LoadLevelsWon()
	end
end

function api.Initialize()
	self = {
		realTime = 0,
		musicVolume = Global.MUSIC_VOLUME,
		soundVolume = Global.SFX_VOLUME,
		currentLevel = LevelDefs.levels[LevelDefs.levelOrder[1]],
		musicEnabled = true,
		soundEnabled = true,
		editMode = false,
		levelsLoaded = false,
		showHighScore = false,
		wonLevels = {},
		drawDebug = Global.DRAW_DEBUG,
	}
	BGMHandler.Initialize(api)
	SoundHandler.Initialize(api)
	MainMenuHandler.Initialize(api)
	World.Initialize(api, self.currentLevel)
end

return api
