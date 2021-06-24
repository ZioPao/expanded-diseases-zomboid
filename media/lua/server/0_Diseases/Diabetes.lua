local lastCarbs
function diabetesTick(player)
    -- BLOOD SUGAR
    local curCarbs = player:getNutrition():getCarbohydrates()
    -- If the current carbs are less than last update, the player is increasing in blood sugar
    if (lastCarbs ~= nil) and curCarbs < lastCarbs then
        local BSChange = (lastCarbs - curCarbs) * (ExpandedDiseases.Settings.Diabetes.BloodSugarIncreasePer10Carbs/10)
        player:getModData().Diabetes.BloodSugar = player:getModData().Diabetes.BloodSugar + BSChange
    end
    lastCarbs = curCarbs

    -- INSULIN
    local curInsulin = player:getModData().Diabetes.Insulin
    local timeSinceUpdate = GameTime:getInstance():getGameWorldSecondsSinceLastUpdate()
    if (curInsulin > 0.0) then
        -- We assume all insulin is rapid acting for now
        local insulinToUse = curInsulin * timeSinceUpdate/ExpandedDiseases.Settings.Diabetes.InsulinSecondsForFullEffect
        local bloodSugarChange = insulinToUse * ExpandedDiseases.Settings.Diabetes.InsulinCounteractRate

        player:getModData().Diabetes.BloodSugar = player:getModData().Diabetes.BloodSugar - bloodSugarChange
        player:getModData().Diabetes.Insulin = curInsulin - insulinToUse
    end

    -- Debug
    player:Say("Blood Sugar is: " .. player:getModData().Diabetes.BloodSugar)
    player:Say("Insulin is: " .. player:getModData().Diabetes.Insulin)
end


Events.OnLoad.Add(addEventCallsIfHasTrait)
