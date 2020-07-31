local component = require("component")
local sides = require("sides")

trans = component.transposer
player_side = sides.west
chest_side = sides.east

function findEmptySlot(SIDE)
    local inv = trans.getAllStacks(SIDE)
    for slot_n = 1, inv.count() do
        slot_c = inv[slot_n]
        if slot_c == nil then
            return slot_n
        end
    end
end

function findItems(INV,ITEM)
    local items_n = {}
    for slot_n = 0, INV.count() do
        item = INV[slot_n]
        if item ~= nil then
            if item["name"] == ITEM then
                items_n[#items_n+1] = slot_n
            end
        end
    end
    return items_n
end

function transfareToChest(SLOT,COUNT)
    trans.transferItem(player_side,chest_side,COUNT,SLOT,findEmptySlot(chest_side))
end

function removeItemsFromInvtory(ITEM)
    local player_inv = trans.getAllStacks(player_side)
    local chest_inv = trans.getAllStacks(chest_side)
    local items = findItems(player_inv,ITEM)
    if items ~= nil then
        for j,v in pairs(items) do
            if items[v] ~= nil then
                count = player_inv[items[v]]["size"]
                transfareToChest(items[v],count)
            end
        end
    end
end

removeItemsFromInvtory("minecraft:dirt")