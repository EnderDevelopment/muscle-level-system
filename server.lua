local ESX = exports['es_extended']:getSharedObject()

-- Function to get muscle level from database
local function getMuscleLevel(identifier, cb)
    MySQL.Async.fetchScalar('SELECT muscle_level FROM muscle_legends WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result then
            cb(result)
        else
            cb(Config.MuscleLegends.DefaultMuscleLevel)
        end
    end)
end

-- Function to update muscle level in database
local function updateMuscleLevel(identifier, level)
    MySQL.Async.execute('INSERT INTO muscle_legends (identifier, muscle_level, last_workout) VALUES (@identifier, @level, CURRENT_TIMESTAMP) ON DUPLICATE KEY UPDATE muscle_level = @level, last_workout = CURRENT_TIMESTAMP', {
        ['@identifier'] = identifier,
        ['@level'] = level
    })
end

-- Event to update muscle level
RegisterNetEvent('muscleLegends:updateMuscleLevel')
AddEventHandler('muscleLegends:updateMuscleLevel', function(level)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        updateMuscleLevel(xPlayer.identifier, level)
    end
end)

-- Event to request muscle level
RegisterNetEvent('muscleLegends:requestMuscleLevel')
AddEventHandler('muscleLegends:requestMuscleLevel', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        getMuscleLevel(xPlayer.identifier, function(level)
            TriggerClientEvent('muscleLegends:receiveMuscleLevel', source, level, GetGameTimer())
        end)
    end
end)

-- Event to check muscle level for certain actions
RegisterNetEvent('muscleLegends:checkMuscleLevel')
AddEventHandler('muscleLegends:checkMuscleLevel', function(action)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        getMuscleLevel(xPlayer.identifier, function(level)
            if level < Config.MuscleLegends.MuscleLevelRequirements[action] then
                TriggerClientEvent('muscleLegends:checkMuscleLevel', source, action)
            end
        end)
    end
end)