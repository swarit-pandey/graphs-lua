-- Import the Graph class
local Graph = require("src.graph")

-- Utility module
local util = {}

-- Function to read file and return content
function util.readFile(filename)
    local file = io.open(filename, "r")
    if not file then return nil end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to create a graph from file content
function util.createGraphFromFile(filename)
    local content = util.readFile(filename)
    if not content then
        print("Error reading file")
        return nil
    end

    local lines = {}
    for line in content:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    local graphType = lines[1]
    local graph = Graph.new()
    print(graph.bfs)
    local addEdgeFunction = graphType == "D" and graph.addEdgeDirected or graph.addEdgeUndirected

    for i = 3, #lines do
        local u, v = lines[i]:match("(%d+),%s*(%d+)")
        if u and v then
            addEdgeFunction(graph, tonumber(u), tonumber(v))
        end
    end

    return graph
end

return util
