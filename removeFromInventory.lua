local component = require("component")
local sides = require("sides")

trans = component.transposer
player_side = sides.west
chest_side = sides.east

function findEmptySlot(INV)
    for slot_n = 1, INV.count()-1 do
        slot_c = INV[slot_n]
        if slot_c == nil then
            return slot_n
        end
    end
end

function findItems(INV,ITEM)
    local items_n = {}
    for slot_n = 0, INV.count()-1 do
        item = INV[slot_n]
        if item == ITEM then
            items_n[#items_n+1] = slot_n
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
    for i in items
        count = player_inv[i]["size"]
        transfareToChest(i,count)
    end
end

removeItemsFromInv("dirt")