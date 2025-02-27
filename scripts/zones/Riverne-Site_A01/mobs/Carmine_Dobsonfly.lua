-----------------------------------
-- Area: Riverne - Site A01
--  Mob: Carmine Dobsonfly
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.SUPERLINK, ID.mob.CARMINE_DOBSONFLY_OFFSET)
    mob:setMagicCastingEnabled(false) -- does not cast spells while idle
end

entity.onMobEngaged = function(mob, target)
    mob:setMagicCastingEnabled(true)
end

entity.onMobDisengage = function(mob)
    mob:setMagicCastingEnabled(false)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    -- each dead dobsonfly should stay despawned until all 10 are killed. then they respawn as a group.

    local allFliesDead = true
    for i = ID.mob.CARMINE_DOBSONFLY_OFFSET, ID.mob.CARMINE_DOBSONFLY_OFFSET + 9 do
        if GetMobByID(i):isAlive() then
            allFliesDead = false
        end
    end

    if allFliesDead then
        local respawnTime = math.random(75600, 86400)
        for i = ID.mob.CARMINE_DOBSONFLY_OFFSET, ID.mob.CARMINE_DOBSONFLY_OFFSET + 9 do
            DisallowRespawn(i, false)
            xi.mob.nmTODPersist(GetMobByID(i), respawnTime) -- 21 to 24 hours
        end
    else
        DisallowRespawn(mob:getID(), true)
    end
end

return entity
