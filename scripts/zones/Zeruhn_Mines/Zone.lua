-----------------------------------
-- Zone: Zeruhn_Mines (172)
-----------------------------------
local ID = require('scripts/zones/Zeruhn_Mines/IDs')
require('scripts/globals/conquest')
require('scripts/globals/quests')
require('scripts/globals/helm')
require('scripts/globals/zone')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.helm.initZone(zone, xi.helm.type.MINING)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if prevZone == xi.zone.PALBOROUGH_MINES then
        cs = 150
    elseif
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-270.707, 14.159, -20.268, 0)
    end

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
