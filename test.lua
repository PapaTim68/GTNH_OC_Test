local component = require("component")
local sides = require("sides")

inv = component.inventory_controller

items = inv.getAllStacks(sides.east)

for item_n = 1, items.count() do
    item = items[item_n]
    if item != nil do
        print("--ITEM " .. item_n .. " START--")
        for k,v in pairs(item) do
            print(k,v)
        end
        print("--ITEM " .. item_n .." END--") 
    end
end

