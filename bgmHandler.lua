local DISABLED = false

local soundFiles = util.LoadDefDirectory("resources/musicDefs")

local bgmTracks = {}
local bgmTrackTargetVolumes = {}

for k,v in pairs(soundFiles) do
    bgmTracks[v.track] = love.audio.newSource("resources/sounds/"..v.file,"static")
    bgmTracks[v.track]:setLooping(true)
    bgmTracks[v.track]:setVolume(0)
    bgmTrackTargetVolumes[v.track] = {vol = 1.0, time = 2}
end


local self = {}
local api = {}
local cosmos

function api.Update(dt)
	if DISABLED then
    for k,v in pairs(soundFiles) do
      bgmTracks[v.track]:pause()
    end
	else
    -- set the target volumes
    -- snare is running as long as the game is not paused
    if(self.cosmos.GetWorld().GetPaused()) then
      bgmTrackTargetVolumes["snare"]["vol"] = 0
    else 
      bgmTrackTargetVolumes["snare"]["vol"] = 1
    end
    
    --victory siren is only when you've won; for that matter drums should stop if you die
    local _, gameWon, gameLost = self.cosmos.GetWorld().GetGameOver()
    if(gameWon) then
      bgmTrackTargetVolumes["siren"]["vol"] = 1
    else 
      bgmTrackTargetVolumes["siren"]["vol"] = 0
    end
    
    if(gameLost) then
      bgmTrackTargetVolumes["drums"]["vol"] = 0
    else 
      bgmTrackTargetVolumes["drums"]["vol"] = 1
    end
    
    --pad is active after level 1, bass is active after level 2, lead is active after level 3
    local currentLevel = self.cosmos.GetLevelNumber()
    
    if currentLevel ~= nil then
      if currentLevel >= 1 and currentLevel < 3 then
        bgmTrackTargetVolumes["pad"]["vol"] = 0
        bgmTrackTargetVolumes["bass"]["vol"] = 0
        bgmTrackTargetVolumes["lead"]["vol"] = 0
      elseif currentLevel >= 3 and currentLevel < 5 then
        bgmTrackTargetVolumes["pad"]["vol"] = 1
        bgmTrackTargetVolumes["bass"]["vol"] = 0
        bgmTrackTargetVolumes["lead"]["vol"] = 0
      elseif currentLevel >= 5 and currentLevel < 7 then
        bgmTrackTargetVolumes["pad"]["vol"] = 1
        bgmTrackTargetVolumes["bass"]["vol"] = 1
        bgmTrackTargetVolumes["lead"]["vol"] = 0
      else
        bgmTrackTargetVolumes["pad"]["vol"] = 1
        bgmTrackTargetVolumes["bass"]["vol"] = 1
        bgmTrackTargetVolumes["lead"]["vol"] = 1
      end
    end
    
    
    for k,v in pairs(soundFiles) do
      local currentVolumeRel = 0
      if self.cosmos.GetMusicVolume() > 0 then
        currentVolumeRel = bgmTracks[v.track]:getVolume() / self.cosmos.GetMusicVolume()
      end
      
      local deltaV = 0
      local targetVol = currentVolumeRel
      if bgmTrackTargetVolumes[v.track]["time"] == 0 then
        targetVol = bgmTrackTargetVolumes[v.track]["vol"] * self.cosmos.GetMusicVolume()
      else
      --print(bgmTrackTargetVolumes[v.track]["vol"])
      deltaV = (bgmTrackTargetVolumes[v.track]["vol"] - currentVolumeRel) * (dt / bgmTrackTargetVolumes[v.track]["time"])
      
      targetVol = currentVolumeRel + deltaV
      
        if (targetVol > bgmTrackTargetVolumes[v.track]["vol"] and deltaV > 0) or (targetVol < bgmTrackTargetVolumes[v.track]["vol"] and deltaV < 0) then
          targetVol = bgmTrackTargetVolumes[v.track]["vol"]
          bgmTrackTargetVolumes[v.track]["time"] = 0
        else
          targetVol = currentVolumeRel + deltaV
        end
      end
       
      bgmTracks[v.track]:setVolume(targetVol  * self.cosmos.GetMusicVolume())
      bgmTracks[v.track]:play()
      
    end
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
