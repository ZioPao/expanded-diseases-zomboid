LuaEventManager.AddEvent("DiabetesEvent")


local curTicks = 0
function diabetesTick(player)
	curTicks = (curTicks+1) % ExpandedDiseases.Settings.Diabetes.TicksToProgress
	if curTicks == 0 then 
		triggerEvent("DiabetesEvent", player)
	end
end

-- Iterate all traits of the player and add event calls if they have certain traits
function addEventCallsIfHasTrait()
	local player = getPlayer()

    for x=0, player:getTraits():size()-1 do
		if player:getTraits():get(x) == "DiabetesT1" then
			-- T1 Diabetes
			Events.OnPlayerUpdate.Add(diabetesTick)
		end
	end

end

function testEvent(player)
	player:getInventory():AddItem("Base.PetrolCan")
end

Events.OnLoad.Add(addEventCallsIfHasTrait)
Events.DiabetesEvent.Add(testEvent)

