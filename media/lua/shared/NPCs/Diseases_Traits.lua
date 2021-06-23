TraitFactory.addTrait("DiabetesT1", "Type 1 Diabetes", -8, "This character has type 1 diabetes and requires insulin.", false);
LuaEventManager.AddEvent("DiabetesEvent")


function diabetesTick(player)
	triggerEvent("DiabetesEvent", player)
end

-- Iterate all traits of the player and add event calls if they have certain traits
function addEventCallsIfHasTrait(player, square) 

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

Events.OnNewGame.Add(addEventCallsIfHasTrait)
Events.DiabetesEvent.Add(testEvent)