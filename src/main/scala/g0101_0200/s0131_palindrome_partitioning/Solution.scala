package g0101_0200.s0131_palindrome_partitioning

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Big_O_Time_O(N*2^N)_Space_O(2^N*N)
// #2023_11_04_Time_797_ms_(100.00%)_Space_84.5_MB_(72.73%)

object Solution {
    def partition(s: String): List[List[String]] = {
        val res = scala.collection.mutable.ListBuffer[List[String]]()
        backtracking(res, List.empty[String], s, 0)
        res.toList
    }

    private def backtracking(res: scala.collection.mutable.ListBuffer[List[String]], currArr: List[String], s: String, start: Int): Unit = {
        if (start == s.length) {
            res += currArr.reverse
        }
        for (end <- start until s.length) {
            if (isPalindrome(s, start, end)) {
                backtracking(res, s.substring(start, end + 1) :: currArr, s, end + 1)
            }
        }
    }

    private def isPalindrome(s: String, start: Int, end: Int): Boolean = {
        var left = start
        var right = end
        while (left < right && s(left) == s(right)) {
            left += 1
            right -= 1
        }
        left >= right
    }
}
