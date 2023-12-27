-- Do breadth first search
function Graph:bfs(startVertex)
    local visited = {}
    local queue = { startVertex }

    print("came here")
    while #queue > 0 do
        local vertex = table.remove(queue, 1)

        if not visited[vertex] then
            visited[vertex] = true
            print(vertex)

            for _, adj in ipairs(self.vertices[vertex] or {}) do
                table.insert(queue, adj)
            end
        end
    end
end

print("bfs is defined")

-- Do depth first search
function Graph:dfs(startVertex)
    local visited = {}

    local function doDFS(vertex)
        if visited[vertex] then return end

        visited[vertex] = true

        for _, adj in ipairs(self.vertices[vertex] or {}) do
            doDFS(adj)
        end
    end

    doDFS(startVertex)
end
