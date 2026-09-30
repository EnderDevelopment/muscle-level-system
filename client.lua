local ESX = exports['es_extended']:getSharedObject()

local muscleLevel = Config.MuscleLegends.DefaultMuscleLevel
local lastWorkout = 0

-- Function to update muscle level
local function updateMuscleLevel(newLevel)
    muscleLevel = newLevel
    TriggerServerEvent('muscleLegends:updateMuscleLevel', newLevel)
end

-- Function to perform workout
local function performWorkout()
    local currentTime = GetGameTimer()
    if currentTime - lastWorkout < Config.MuscleLegends.WorkoutCooldown * 60000 then
        ESX.ShowNotification('You need to wait before working out again.')
        return
    end
    
    if muscleLevel >= Config.MuscleLegends.MaxMuscleLevel then
        ESX.ShowNotification('You have reached the maximum muscle level.')
        return
    end
    
    lastWorkout = currentTime
    updateMuscleLevel(math.min(muscleLevel + Config.MuscleLegends.MuscleIncreasePerWorkout, Config.MuscleLegends.MaxMuscleLevel))
    ESX.ShowNotification('You have increased your muscle level to ' .. muscleLevel .. '.')
end

-- Register command for workout
RegisterCommand('workout', function()
    performWorkout()
end, false)

-- Event to receive muscle level from server
RegisterNetEvent('muscleLegends:receiveMuscleLevel')
AddEventHandler('muscleLegends:receiveMuscleLevel', function(level, lastWorkoutTime)
    muscleLevel = level
    lastWorkout = lastWorkoutTime
end)

-- Event to check muscle level for certain actions
RegisterNetEvent('muscleLegends:checkMuscleLevel')
AddEventHandler('muscleLegends:checkMuscleLevel', function(action)
    if muscleLevel < Config.MuscleLegends.MuscleLevelRequirements[action] then
        ESX.ShowNotification('You need a higher muscle level to perform this action.')
        CancelEvent()
    end
end)

-- Request muscle level from server on player load
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent('muscleLegends:requestMuscleLevel')
end)