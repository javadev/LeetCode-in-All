package g0001_0100.s0051_n_queens

// #Hard #Top_100_Liked_Questions #Array #Backtracking #Big_O_Time_O(N!)_Space_O(N)
// #2023_10_31_Time_483_ms_(93.33%)_Space_57.9_MB_(26.67%)

object Solution {
    def solveNQueens(n: Int): List[List[String]] = {
        val rst = scala.collection.mutable.ListBuffer[List[String]]()
        dfs(n, List[Int](), rst)
        rst.toList
    }

    @SuppressWarnings(Array("scala:S3776"))
    private def dfs(n: Int, oneSol: List[Int], rst: scala.collection.mutable.ListBuffer[List[String]]): Unit = {
        if (oneSol.length == n) {
            val line = for (idx <- oneSol) yield ("." * idx + "Q" + "." * (n - idx - 1))
            rst += line
            return
        }
        for (col <- 0 until n) {
            if (!oneSol.contains(col)) {
                var i = oneSol.length - 1
                var j = col - 1
                var k = col + 1
                var continue = true
                while (continue && i >= 0 && (j >= 0 || k < n)) {
                    if (oneSol(i) == j || oneSol(i) == k) {
                        continue = false
                    }
                    i -= 1
                    j -= 1
                    k += 1
                }
                if (continue) {
                    dfs(n, oneSol :+ col, rst)
                }
            }
        }
    }
}
