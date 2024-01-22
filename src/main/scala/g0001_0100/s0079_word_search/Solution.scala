package g0001_0100.s0079_word_search

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Matrix #Backtracking
// #Algorithm_II_Day_11_Recursion_Backtracking #Big_O_Time_O(4^(m*n))_Space_O(m*n)
// #2023_11_02_Time_783_ms_(94.87%)_Space_54.9_MB_(100.00%)

object Solution {
    private val directions = Array(Array(-1, 0), Array(1, 0), Array(0, -1), Array(0, 1))
    private var numRows, numCols = 0

    def exist(board: Array[Array[Char]], word: String): Boolean = {
        if (board.length == 0) return false
        if (word.isEmpty) return true
        numRows = board.length
        numCols = board(0).length
        var result = false
        for (row <- 0 until numRows) {
            for (col <- 0 until numCols) {
                if (board(row)(col) == word(0)) {
                    result = backTracking(board, row, col, word, 0)
                    if (result) return true
                }
            }
        }
        result
    }

    private def backTracking(board: Array[Array[Char]], row: Int, col: Int, word: String, index: Int): Boolean = {
        if (index >= word.length) return true
        if (row < 0 || row >= numRows || col < 0 || col >= numCols || board(row)(col) != word(index) || board(row)(col) == '0') {
            return false
        }
        val originalValue = board(row)(col)
        board(row)(col) = '0'
        var output = false
        for (dir <- directions) {
            val newRow = row + dir(0)
            val newCol = col + dir(1)
            output = backTracking(board, newRow, newCol, word, index + 1)
            if (output) return true
        }
        board(row)(col) = originalValue
        output
    }
}
