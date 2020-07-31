local component = require("component")
local sides = require("sides")

trans = component.transposer
player_side = sides.west
chest_side = sides.east

function findEmptySlot(INV)
    for slot_n = 1, INV.count() do
        slot_c = INV[slot_n]
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

function removeItemsFromInv(ITEM)
    local player_inv = trans.getAllStacks(player_side)
    local items = findItems(player_inv,ITEM)
    if items ~= nil then
        for j,v in pairs(items) do
            count = player_inv[items[v]]["size"]
            transfareToChest(items[v],count)
        end
    end
end

removeItemsFromInv("dirt")