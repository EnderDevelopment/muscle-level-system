Config = {}

-- Muscle Legends System Configuration
Config.MuscleLegends = {
    -- Default muscle level for new players
    DefaultMuscleLevel = 0,
    -- Muscle level increase per workout
    MuscleIncreasePerWorkout = 1,
    -- Muscle level decrease per day
    MuscleDecreasePerDay = 0.5,
    -- Maximum muscle level
    MaxMuscleLevel = 100,
    -- Minimum muscle level
    MinMuscleLevel = 0,
    -- Workout cooldown in minutes
    WorkoutCooldown = 60,
    -- Muscle level required for certain actions
    MuscleLevelRequirements = {
        ['run'] = 20,
        ['swim'] = 30,
        ['jump'] = 10
    }
}