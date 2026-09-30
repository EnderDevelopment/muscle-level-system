# Muscle Level System

Track and enhance player muscle levels in FiveM with this comprehensive system.

## Features

- Track player muscle levels
- Perform workouts to increase muscle level
- Check muscle level requirements for certain actions

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server resources folder
3. Add `start muscleLegends` to your server.cfg file
4. Import the database.sql file into your MySQL database

## Usage

### Commands

- `/workout` - Perform a workout to increase your muscle level

### Events

- `muscleLegends:updateMuscleLevel` - Update a player's muscle level
- `muscleLegends:requestMuscleLevel` - Request a player's muscle level
- `muscleLegends:checkMuscleLevel` - Check if a player meets the muscle level requirement for an action

## Configuration

The script can be configured in the `config.lua` file. The following options are available:

- `DefaultMuscleLevel` - The default muscle level for new players
- `MuscleIncreasePerWorkout` - The amount of muscle level increased per workout
- `MuscleDecreasePerDay` - The amount of muscle level decreased per day
- `MaxMuscleLevel` - The maximum muscle level
- `MinMuscleLevel` - The minimum muscle level
- `WorkoutCooldown` - The cooldown time between workouts in minutes
- `MuscleLevelRequirements` - The muscle level requirements for certain actions

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=muscle-level-system&utm_content=bottom) — describe it in one sentence and get the full source code.