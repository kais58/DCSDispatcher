DCSD = {}

local f15 = {
    ["unitId"] = 30,
    ["name"] = "UnitName01",
    ["type"] = "F-15C",
    ["hardpoint_racks"] = true,
    ["payload"] = {
        ["fuel"] = "6103",
        ["flare"] = 60,
        ["chaff"] = 120,
        ["gun"] = 100,
        ["pylons"] = {
            [1] = {
                ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"
            },
            [2] = {
                ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}"
            },
            [3] = {
                ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}"
            },
            [4] = {
                ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"
            },
            [5] = {
                ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"
            },
            [6] = {
                ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}"
            },
            [7] = {
                ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"
            },
            [8] = {
                ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"
            },
            [9] = {
                ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}"
            },
            [10] = {
                ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}"
            },
            [11] = {
                ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"
            }
        }
    },
    ["y"] = 0,
    ["x"] = 0
}

function DCSD.notify(message, displayFor)
    trigger.action.outText(tostring(message), displayFor)
end

function DCSD.debug()
    DCSD.notify("test", 5)
end


local base = world.getAirbases()
local myBaseTblBlue = {}
local myBaseTblRed = {}
local myBaseTblNeut = {}
for i = 1, #base do
    local info = {}
    info.desc = Airbase.getDesc(base[i])
    info.callsign = Airbase.getCallsign(base[i])
    info.id = Airbase.getID(base[i])
    info.cat = Airbase.getCategory(base[i])
    info.point = Airbase.getPoint(base[i])
    info.coalition = Airbase.getCoalition(base[i])
    if Airbase.getUnit(base[i]) then
        info.unitId = Airbase.getUnit(base[i]):getID()
    end

    if info.coalition == 1 then
        myBaseTblRed[info.callsign] = info
    elseif info.coalition == 2 then
        myBaseTblBlue[info.callsign] = info
    else
        myBaseTblNeut[info.callsign] = info
    end
end


function DCSD.getParkingSpot(airbase, spot)
    local base = Airbase.getByName(airbase)
    local spots = Airbase.getParking(base)
    return spots
end


do
    DCSD.debug()

    local vars = {
        name = "UnitName1",
        groupId = 10,
        units = {
            [1] = f15
        },
        country = "USA",
        category = "Plane"
    }
    mist.dynAdd(vars)
    --DCSD.notify(myBaseTblRed[5], 10)
end
