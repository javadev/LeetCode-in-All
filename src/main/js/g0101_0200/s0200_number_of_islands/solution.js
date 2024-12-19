// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
// #Breadth_First_Search #Matrix #Union_Find
// #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
// #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
// #Big_O_Time_O(M*N)_Space_O(M*N) #2024_12_17_Time_62_ms_(90.80%)_Space_52.5_MB_(66.24%)

/**
 * @param {character[][]} grid
 * @return {number}
 */
var numIslands = function(grid) {
    let islands = 0

    if (grid && grid.length > 0 && grid[0].length > 0) {
        for (let i = 0; i < grid.length; i++) {
            for (let j = 0; j < grid[0].length; j++) {
                if (grid[i][j] === '1') {
                    dfs(grid, i, j)
                    islands++
                }
            }
        }
    }

    return islands
};

const dfs = function(grid, x, y) {
    if (
        x < 0 ||
        x >= grid.length ||
        y < 0 ||
        y >= grid[0].length ||
        grid[x][y] !== '1'
    ) {
        return
    }

    grid[x][y] = 'x' // Mark as visited

    dfs(grid, x + 1, y) // Down
    dfs(grid, x - 1, y) // Up
    dfs(grid, x, y + 1) // Right
    dfs(grid, x, y - 1) // Left
};

export { numIslands }
