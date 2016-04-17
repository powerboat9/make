local tArgs = {...} --Usage: make install/uninstall/update/add-dependencies file

local struct = {}

local values = {version = "1.1", command = tArgs[1]}

--[[function isTrue(s)
    --TODO: Implement and Finish
    do
        local isQuoted = false
        local lastSpace = true
        local tempS = ""
        for i = 1, #s do
            if (s:sub(i, i) == "\"") and (not (s:sub(i - 1, i - 1) == "\\")) then
                isQuoted = not isQuoted
            elseif (not isQuoted) and (s:sub(i, i) == " ") then
                end
        end
        s = tempS
    end
    while true do]]--

function seperate(s)
    s = s:gsub("^%s*", "")
    s = s:gsub("%s*$", "")
    local inQuotes = false
    local data = {""}
    local argPos = 1
    local wasLastSpace = true
    for v in s:gfind(".") do
        if v == "\"" then
            inQuotes = not inQuotes
        elseif (v == " ") and (not wasLastSpace) and (not inOuotes) then
            argPos = argPos + 1
            data[argPos] = ""
        else
            data[argPos] = data[argPos] .. v
        end
    end
    for k, v in ipairs(data) do if v == "__BLANK__" then data[k] = nil end end --Removes Blank Arguments, They're POINTLESS (LOL, My Jokes are Terrible)
    return data
end

for v in gfind("\n?%s*([^\n]*)") do
    local data = seperate(v)
    if data[1] == "save" then
        struct[#struct + 1] = {
            type = "save",
            path = data[2],
            url = data[3]
        }
    elseif data[1] == "run" then
        struct[#struct + 1] = {
            type = "run",
            path = data[2],
            args = data[3]
        }
    elseif data[1] == "git" then
        struct[#struct + 1] = {
            type = "git",
            user = data[2],
            repository = data[3],
            saveDir = data[4],
            branch = data[5],
            repDir = data[6]
        }
    elseif data[1] == "paste" then
        struct[#struct + 1] = {
            type = "paste",
            id = data[2]
        }
    else
        error("Invalid Command")
    end
end

for k, v in struct
            
