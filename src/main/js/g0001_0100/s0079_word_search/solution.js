// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Matrix #Backtracking
// #Algorithm_II_Day_11_Recursion_Backtracking #Big_O_Time_O(4^(m*n))_Space_O(m*n)
// #2024_12_12_Time_292_ms_(83.26%)_Space_49.6_MB_(62.55%)

/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */
var exist = function (board, word) {
    let visited = Array.from({ length: board.length }, () => Array(board[0].length).fill(0)),
        m = board.length, n = board[0].length, isMatch = false
    const dfs = (i, j, match) => {
        visited[i][j] = 1
        if (match == word.length) {
            isMatch = true
            return
        }
        let x = [1, -1, 0, 0], y = [0, 0, 1, -1]
        for (let k = 0; k < 4; k++) {
            let xx = x[k] + i, yy = y[k] + j
            if (xx >= 0 && yy >= 0 && xx < m && yy < n && visited[xx][yy] != 1 && board[xx][yy] == word[match]) {
                dfs(xx, yy, match + 1)
                visited[xx][yy] = 0
            }
        }
    }
    for (let i = 0; i < board.length; i++) {
        for (let j = 0; j < board[0].length; j++) {
            if (board[i][j] == word[0]) {
                dfs(i, j, 1)
                if (isMatch) {
                    return true
                }
                visited = Array.from({ length: board.length }, () => Array(board[0].length).fill(0))

            }
        }
    }
    return isMatch
};

export { exist }
