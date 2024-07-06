// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
// #Breadth_First_Search #Matrix #Union_Find
// #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
// #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
// #Big_O_Time_O(M*N)_Space_O(M*N) #2024_07_04_Time_152_ms_(70.92%)_Space_19.2_MB_(44.62%)

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var islands = 0

        if !grid.isEmpty && !grid[0].isEmpty {
            for i in 0..<grid.count {
                for j in 0..<grid[0].count {
                    if grid[i][j] == "1" {
                        dfs(&grid, i, j)
                        islands += 1
                    }
                }
            }
        }
        return islands
    }

    private func dfs(_ grid: inout [[Character]], _ x: Int, _ y: Int) {
        if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || grid[x][y] != "1" {
            return
        }

        grid[x][y] = "x"
        dfs(&grid, x + 1, y)
        dfs(&grid, x - 1, y)
        dfs(&grid, x, y + 1)
        dfs(&grid, x, y - 1)
    }
}
