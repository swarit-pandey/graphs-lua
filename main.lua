local util = require("src.util")

local filePath = "graph_data.txt"

local gotGraph = util.createGraphFromFile(filePath)

if gotGraph then
    print("Graph created:")
    gotGraph:printGraph()

    local startVertex = 1
    print("\nBFS Traversal starting from vertex " .. startVertex .. ":")
    gotGraph:bfs(startVertex)

    print("\nDFS Traversal starting from vertex " .. startVertex .. ":")
    gotGraph:dfs(startVertex)
else
    print("Failed to create graph.")
end

