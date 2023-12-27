local util = require("src.util")

local filePath = "graph_data.txt" -- hardcoded

local gotGraph = util.createGraphFromFile(filePath)

if gotGraph then
    print("Graph created: ")
    gotGraph:printGraph()
else
    print("Failed to create graph: ")
end
