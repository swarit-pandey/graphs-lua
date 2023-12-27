-- Graph class
Graph = {}
Graph.__index = Graph

-- Constructor
function Graph.new()
    local self = setmetatable({}, Graph)
    self.vertices = {} -- Store the vertices
    return self
end

function Graph:edgeExists(u, v)
    for _, edge in ipairs(self.vertices[u] or {}) do
        if edge == v then
            return true
        end
    end
    return false
end

-- Remove an edge from the graph
function Graph:removeEdge(u, v)
    if self.vertices[u] then
        for i, edge in ipairs(self.vertices[u]) do
            if edge == v then
                table.remove(self.vertices[u], i)
                break
            end
        end
    end
end

-- Remove a vertex from graph
function Graph:removeVertex(vertex)
    self.vertices[vertex] = nil
    for _, _ in pairs(self.vertices) do
        self:removeEdge(_, vertex)
    end
end

-- Add a vertex
function Graph:addVertex(vertex)
    if not self.vertices[vertex] then
        self.vertices[vertex] = {}
    end
end

-- Add an edge from u to v
function Graph:addEdgeDirected(u, v)
    if not self.vertices[u] then
        self:addVertex(u)
    end
    if not self.vertices[v] then
        self:addVertex(v)
    end

    table.insert(self.vertices[u], v) -- Add an edge from u to v
end

function Graph:addEdgeUndirected(u, v)
    if not self.vertices[u] then
        self:addVertex(u)
    end
    if not self.vertices[v] then
        self:addVertex(v)
    end

    if not self:edgeExists(u, v) then
        table.insert(self.vertices[u], v) -- edge from u to v
        table.insert(self.vertices[v], u) -- edge from v to u
    end
end

-- Print graph simply
function Graph:printGraph()
    for vertex, edges in pairs(self.vertices) do
        io.write(vertex .. " -> ")
        for _, edge in ipairs(edges) do
            io.write(edge .. " ")
        end
        io.write("\n")
    end
end
