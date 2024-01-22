package g0601_0700.s0647_palindromic_substrings

// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
// #2023_11_09_Time_423_ms_(100.00%)_Space_54.7_MB_(81.82%)

object Solution {
    private def expand(a: Array[Char], l: Int, r: Int, res: Array[Int]): Unit = {
        var left = l
        var right = r
        while (left >= 0 && right < a.length) {
            if (a(left) != a(right)) {
                return
            } else {
                res(0) += 1
                left -= 1
                right += 1
            }
        }
    }

    def countSubstrings(s: String): Int = {
        val a = s.toCharArray
        val res = Array(0)
        for (i <- 0 until a.length) {
            expand(a, i, i, res)
            expand(a, i, i + 1, res)
        }
        res(0)
    }
}
