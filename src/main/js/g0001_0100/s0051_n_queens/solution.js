// #Hard #Top_100_Liked_Questions #Array #Backtracking #Big_O_Time_O(N!)_Space_O(N)
// #2024_12_09_Time_6_ms_(96.66%)_Space_52.2_MB_(83.66%)

/**
 * @param {number} n
 * @return {string[][]}
 */
var solveNQueens = function(n) {
    const board = Array.from({ length: n }, () => Array(n).fill('.'))
    const res = []
    const leftRow = new Array(n).fill(0)
    const upperDiagonal = new Array(2 * n - 1).fill(0)
    const lowerDiagonal = new Array(2 * n - 1).fill(0)

    const solve = (col) => {
        if (col === n) {
            res.push(construct(board))
            return
        }
        for (let row = 0; row < n; row++) {
            if (
                leftRow[row] === 0 &&
                lowerDiagonal[row + col] === 0 &&
                upperDiagonal[n - 1 + col - row] === 0
            ) {
                board[row][col] = 'Q'
                leftRow[row] = 1
                lowerDiagonal[row + col] = 1
                upperDiagonal[n - 1 + col - row] = 1
                solve(col + 1)
                board[row][col] = '.'
                leftRow[row] = 0
                lowerDiagonal[row + col] = 0
                upperDiagonal[n - 1 + col - row] = 0
            }
        }
    }

    const construct = (board) => {
        return board.map(row => row.join(''))
    }

    solve(0)
    return res
}

export { solveNQueens }
