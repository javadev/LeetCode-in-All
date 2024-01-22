package g0101_0200.s0200_number_of_islands

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
// #Breadth_First_Search #Matrix #Union_Find
// #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
// #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
// #Big_O_Time_O(M*N)_Space_O(M*N) #2023_11_05_Time_537_ms_(93.18%)_Space_63.1_MB_(52.27%)

object Solution {
    def numIslands(grid: Array[Array[Char]]): Int = {
        var islands = 0

        def dfs(x: Int, y: Int): Unit = {
            if (x < 0 || x >= grid.length || y < 0 || y >= grid(0).length || grid(x)(y) != '1') {
                return
            }
            grid(x)(y) = 'x'
            dfs(x + 1, y)
            dfs(x - 1, y)
            dfs(x, y + 1)
            dfs(x, y - 1)
        }

        if (grid != null && grid.length > 0 && grid(0).length > 0) {
            for (i <- grid.indices) {
                for (j <- grid(0).indices) {
                    if (grid(i)(j) == '1') {
                        dfs(i, j)
                        islands += 1
                    }
                }
            }
        }
        islands
    }
}
