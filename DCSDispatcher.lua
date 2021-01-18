DCSD = {}

function DCSD.notify(message, displayFor)
    trigger.action.outText(message, displayFor)
end

function DCSD.debug()
    DCSD.notify("test", 5)
end

do



    DCSD.debug()
    local groupData = 
        {
            [1] = 
            {
                ["unitId"] = 30,
                ["name"] = "UnitName01",
                ["type"] = "A-10C",
                ["payload"] = {
                    ["fuel"] = 1,
                },
                ["y"] = 0,
                ["x"] = 0,
            },
        }
      
    local vars = {
        name = "UnitName1",
        groupId = 10,
        units = groupData, 
        country = 'USA', 
        category = "Plane",
    }
    mist.dynAdd(vars)

    DCSD.notify(mist.utils.tableShow(mist.getGroupPayload('UnitName1')), 10)

end