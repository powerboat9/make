data = {save = {}}

for v in gfind("\n?%s*([^\n]*)") do
    local _, _, command, p1, p2, p3 = v:find("[\n%s]*\"([^\"]*)\"%s\"([^\"]*)\"%s\"([^\"]*)\"%s\"([^\"]*)\"")
    if command == "save" then
        data[#data + 1] = {
            type = "save",
            path = p1,
            url = p2
        }
    elseif command == "run" then
        data[#data +1] = {
            type = "run",
            path = p1,
            args = 
            
