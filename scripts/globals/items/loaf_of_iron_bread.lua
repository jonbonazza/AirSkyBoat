-----------------------------------
-- ID: 4499
-- Item: loaf_of_iron_bread
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 4
-- Vitality 1
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if
        target:hasStatusEffect(xi.effect.FOOD) or
        target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD)
    then
        result = xi.msg.basic.IS_FULL
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4499)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 4)
    target:addMod(xi.mod.VIT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 4)
    target:delMod(xi.mod.VIT, 1)
end

return itemObject
