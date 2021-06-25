-- Iterate all traits of the player and add event calls if they have certain traits
function addEventCallsIfHasTrait()
	local player = getPlayer()

    for x=0, player:getTraits():size()-1 do
	
		-- T1 Diabetes
		if player:getTraits():get(x) == "DiabetesT1" then
			Events.OnPlayerUpdate.Add(diabetesTick)

			if not player:getModData().Diabetes then
			    local carbRate = player:isFemale() and 0.0032 or 0.0035
			    -- Default values
			    player:getModData().Diabetes = {
			        CarbRate = carbRate,
			        Insulin = ExpandedDiseases.Settings.Diabetes.StartingInsulin,
			        BloodSugar = ExpandedDiseases.Settings.Diabetes.StartingBloodSugar,
			    }

			    -- TESTING
			    -- Add 3 pens and 3 vials to inventory
                for i=0, 3 do
                    player:getInventory():AddItem("ExpandedDiseases.InsulinPen")
                    player:getInventory():AddItem("ExpandedDiseases.InsulinVial")
			    end
			end

		end
		
		
	end

end

Events.OnGameStart.Add(addEventCallsIfHasTrait)
