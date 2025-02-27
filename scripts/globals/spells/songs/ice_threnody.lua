-----------------------------------
-- Spell: Threnody - xi.mod.ICE_MEVA
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.magic.handleThrenody(caster, target, spell, 50, 60, xi.mod.ICE_MEVA)
end

return spellObject
