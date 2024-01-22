package g0001_0100.s0096_unique_binary_search_trees

// #Medium #Top_100_Liked_Questions #Dynamic_Programming #Math #Tree #Binary_Tree
// #Binary_Search_Tree #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
// #2023_11_03_Time_403_ms_(66.67%)_Space_51.5_MB_(100.00%)

object Solution {
    def numTrees(n: Int): Int = {
        var result: Long = 1L
        for (i <- 0 until n) {
            result *= 2L * n - i
            result /= i + 1
        }
        result /= (n + 1)
        result.toInt
    }
}
