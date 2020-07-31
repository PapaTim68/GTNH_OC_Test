local component = require("component")
local sides = require("sides")

inv = component.transposer
player_side = sides.west
chest_side = sides.east

function transfareToChest(SLOT,COUNT)
    local chest = inv.getAllStacks(chest_side)
    for slot_n = 1, chest.count() do
        slot_c = chest[slot_n]
        if slot_c == nil then
            inv.transferItem(player_side,chest_side,COUNT,SLOT,slot_n)

player = inv.getAllStacks(player_side)

for item_n = 0, player.count()-1 do
    item = player[item_n]
    if item == nil then
        print("--EMPTY ".. item_n .. " SLOT--")
    else
        print("--ITEM " .. item_n .. " START--")
        for k,v in pairs(item) do
            print(k,v)
        end
        print("--ITEM " .. item_n .." END--")
        print("Do you want to transfare it? [Y|n]")
        ans = io.read()
        if ans=="Y" then
            transfareToChest(item_n,item["size"])

    end
end
