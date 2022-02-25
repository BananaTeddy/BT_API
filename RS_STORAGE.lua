local bridge = peripherals.find('rsBridge')
local monitor = peripherals.find('monitor')

local itemCount
local maxItemCount
local fluidCount
local maxFluidCount

while true do
    itemCount = 0
    maxItemCount = bridge.getMaxItemDiskStorage()

    for _, v in pairs(bridge.listItems()) do
        itemCount = itemCount + v.amount
    end

    fluidCount = 0
    maxFluidCount = bridge.getMaxFluidDiskStorage()

    for _, v in pairs(bridge.listFluids()) do
        fluidCount = fluidCount + v.amount
    end


    monitor.clear()

    monitor.setCursorPos(1, 1)
    monitor.write('Items:')
    monitor.setCursorPos(1, 2)
    monitor.write(string.format('%i/%i (%.2f%%)', itemCount, maxItemCount, (itemCount / maxItemCount) * 100))

    monitor.setCursorPos(1, 3)
    monitor.write('Fluids:')
    monitor.setCursorPos(1, 4)
    monitor.write(string.format('%i/%i (%.2f%%)', fluidCount, maxFluidCount, (fluidCount / maxFluidCount) * 100))
  

    sleep(30)    
end
