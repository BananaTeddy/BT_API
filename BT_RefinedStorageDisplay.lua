-- program to show Refined Storage capacity
-- needs 3x1 Monitor blocks

function main()
    Initialize()

    local bridge = peripheral.find('rsBridge')
    local monitor = peripheral.find('monitor')
    local oldTerm = term.redirect(monitor)

    term.setTextColor(colors.green)
    term.setBackgroundColor(colors.black)
    monitor.setTextScale(0.5)
    
    local itemCount
    local maxItemCount

    while true do
        itemCount = 0
        maxItemCount = bridge.getMaxItemDiskStorage()

        for _, v in pairs(bridge.listItems()) do
            itemCount = itemCount + v.amount
        end

        monitor.clear()

        monitor.setCursorPos(1, 1)
        monitor.write('Items:')
        monitor.setCursorPos(1, 2)
        monitor.write(
            string.format(
                '%s/%s (%.2f%%)',
                BT_API.ShortNumberString(itemCount),
                BT_API.ShortNumberString(maxItemCount),
                (itemCount / maxItemCount) * 100
            )
        )
        BT_API.ProgressBar(3, 6, itemCount, maxItemCount, colors.green)

        sleep(30)
    end
end




function Initialize()
    local btCoreLoaded = require('BT_API')

    if BT_API.GetVersion() < 6  then
        print('BananaTeddy API is outdated.');
        print('Please update from https://raw.githubusercontent.com/BananaTeddy/BT_API/main/Install.lua');
    end
    
end

main()