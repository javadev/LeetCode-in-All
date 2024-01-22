package g0001_0100.s0010_regular_expression_matching

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming #Recursion
// #Udemy_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
// #2023_10_29_Time_459_ms_(75.00%)_Space_54.4_MB_(100.00%)

object Solution {
    private var cache: Array[Array[Option[Boolean]]] = Array.ofDim[Option[Boolean]](0, 0)

    def isMatch(s: String, p: String): Boolean = {
        cache = Array.ofDim[Option[Boolean]](s.length + 1, p.length + 1)
        isMatch(s, p, 0, 0)
    }

    private def isMatch(s: String, p: String, i: Int, j: Int): Boolean = {
        if (j == p.length) {
            return i == s.length
        }
        var result: Boolean = false
        if (cache(i).isDefinedAt(j) && cache(i)(j) != null) {
            return cache(i)(j).get
        }
        val firstMatch = i < s.length && (s.charAt(i) == p.charAt(j) || p.charAt(j) == '.')
        if (j + 1 < p.length && p.charAt(j + 1) == '*') {
            result = (firstMatch && isMatch(s, p, i + 1, j)) || isMatch(s, p, i, j + 2)
        } else {
            result = firstMatch && isMatch(s, p, i + 1, j + 1)
        }
        cache(i)(j) = Some(result)
        result
    }
}
