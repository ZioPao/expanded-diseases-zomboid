function Recipe.OnCreate.InjectInsulin(items, result, player)
    local insulin_mL
    for i=0, items:size()-1 do
       if items:get(i):getType() == "InsulinPen" then
           insulin_mL = items:get(i):getUsedDelta() * 3;
       end
    end

    result:setUsedDelta(0)

    player:getModData().Diabetes.Insulin = player:getModData().Diabetes.Insulin + insulin_mL*10
    player:Say("oh yis that's the good stuff")

end

function Recipe.OnTest.InsulinPenNotEmpty(item)
    return item:getType() == "InsulinPen" and item:getUsedDelta() > 0
end

function Recipe.OnTest.RefillInsulinPen(item)
    if item:getType() == "InsulinPen" then
        if item:getUsedDelta() == 1 then return false; end
    elseif item:getType() == "InsulinVial" then
        if item:getUsedDelta() == 0 then return false; end
    end
    return true;
end

function Recipe.OnCreate.Refill1ml(items, result, player)
        local previousPen = nil;
        local insulinVial = nil;
        for i=0, items:size()-1 do
           if items:get(i):getType() == "InsulinPen" then
               previousPen = items:get(i);
           elseif items:get(i):getType() == "InsulinVial" then
               insulinVial = items:get(i);
           end
        end
        -- Get the amount that was in the pen before, add it into the return pen
        result:setUsedDelta(previousPen:getUsedDelta());

        -- Use the vial (which ticks down by its useDelta) and add the pen's useDelta amount to itself
        --  Essentially, we reduce vial by 0.1 and add 0.33 to the pen - converted to mL, it's 1 each.
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta());
        insulinVial:Use();

        -- We cannot overfill the pen. We might lose a little bit here, but, oh well.
        if result:getUsedDelta() > 1 then
            result:setUsedDelta(1);
        end
end

function Recipe.OnCreate.Refill2ml(items, result, player)
        local previousPen = nil;
        local insulinVial = nil;
        for i=0, items:size()-1 do
           if items:get(i):getType() == "InsulinPen" then
               previousPen = items:get(i);
           elseif items:get(i):getType() == "InsulinVial" then
               insulinVial = items:get(i);
           end
        end
        -- Get the amount that was in the pen before, add it into the return pen
        result:setUsedDelta(previousPen:getUsedDelta() + result:getUseDelta());

        -- Use the vial (which ticks down by its useDelta) and add the pen's useDelta amount to itself
        --  Essentially, we reduce vial by 0.1 and add 0.33 to the pen - converted to mL, it's 1 each.
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta());
        insulinVial:Use();

        -- We cannot overfill the pen. We might lose a little bit here, but, oh well.
        if result:getUsedDelta() > 1 then
            result:setUsedDelta(1);
        end
end

function Recipe.OnCreate.Refill3ml(items, result, player)
        local previousPen = nil;
        local insulinVial = nil;
        for i=0, items:size()-1 do
           if items:get(i):getType() == "InsulinPen" then
               previousPen = items:get(i);
           elseif items:get(i):getType() == "InsulinVial" then
               insulinVial = items:get(i);
           end
        end
        -- Get the amount that was in the pen before, add it into the return pen
        result:setUsedDelta(previousPen:getUsedDelta() + result:getUseDelta());

        -- Use the vial (which ticks down by its useDelta) and add the pen's useDelta amount to itself
        --  Essentially, we reduce vial by 0.1 and add 0.33 to the pen - converted to mL, it's 1 each.
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta());
        insulinVial:Use();

        -- We cannot overfill the pen. We might lose a little bit here, but, oh well.
        if result:getUsedDelta() > 1 then
            result:setUsedDelta(1);
        end
end