-----------------------------------
-- Spell: Hyoton: Ni
-----------------------------------
require("scripts/globals/spells/damage_spell")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 15 + caster:getMerit(xi.merit.HYOTON_EFFECT) -- T1 bonus debuff duration
    xi.magic.handleNinjutsuDebuff(caster, target, spell, 30, duration, xi.mod.FIRE_MEVA)

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
