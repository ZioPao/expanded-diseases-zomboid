local lastCarbs
function diabetesTick(player)
    local timeSinceUpdate = GameTime:getInstance():getGameWorldSecondsSinceLastUpdate()

    -- BLOOD SUGAR
    local curCarbs = player:getNutrition():getCarbohydrates()
    if (lastCarbs ~= nil) and curCarbs > lastCarbs then
        local vanillaCarbsProcessed = timeSinceUpdate * player:getModData().Diabetes.CarbRate
        local carbChange = curCarbs - (lastCarbs - vanillaCarbsProcessed)
        player:getModData().Diabetes.UnprocessedCarbs = player:getModData().Diabetes.UnprocessedCarbs + carbChange
    end
    lastCarbs = curCarbs

    -- PROCESS CARBS
    local curCarbs = player:getModData().Diabetes.UnprocessedCarbs
    local carbsToProcess = curCarbs / ExpandedDiseases.Settings.Diabetes.CarbSecondsToProcess
    player:getModData().Diabetes.UnprocessedCarbs = player:getModData().Diabetes.UnprocessedCarbs - carbsToProcess
    player:getModData().Diabetes.BloodSugar = player:getModData().Diabetes.BloodSugar + carbsToProcess*ExpandedDiseases.Settings.Diabetes.CarbToGlucoseRatio

    -- INSULIN
    local curInsulin = player:getModData().Diabetes.Insulin
    if (curInsulin > 0.0) then
        -- We assume all insulin is rapid acting for now
        local rateOfInsulin = curInsulin / ExpandedDiseases.Settings.Diabetes.InsulinSecondsForFullEffect
        local insulinToUse = curInsulin * (timeSinceUpdate/ExpandedDiseases.Settings.Diabetes.InsulinSecondsForFullEffect)
        local bloodSugarChange = insulinToUse * ExpandedDiseases.Settings.Diabetes.InsulinCounteractRate

        player:getModData().Diabetes.BloodSugar = player:getModData().Diabetes.BloodSugar - bloodSugarChange
        player:getModData().Diabetes.Insulin = curInsulin - insulinToUse
    end

    -- Debug
    player:Say("Blood Sugar is: " .. player:getModData().Diabetes.BloodSugar)
    player:Say("Insulin is: " .. player:getModData().Diabetes.Insulin)
    player:Say("Carbs: " .. player:getModData().Diabetes.UnprocessedCarbs)
end

