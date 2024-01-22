package g0001_0100.s0039_combination_sum

// #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
// #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n+2^n) #2023_10_30_Time_488_ms_(97.50%)_Space_55.2_MB_(97.50%)

import scala.collection.mutable.ListBuffer

object Solution {
    def combinationSum(coins: Array[Int], amount: Int): List[List[Int]] = {
        val ans = ListBuffer[List[Int]]()
        val subList = ListBuffer[Int]()
        combinationSumRec(coins.length - 1, coins, amount, subList, ans)
        ans.toList
    }

    private def combinationSumRec(
                                     n: Int,
                                     coins: Array[Int],
                                     amount: Int,
                                     subList: ListBuffer[Int],
                                     ans: ListBuffer[List[Int]]
                                 ): Unit = {
        if (amount == 0 || n < 0) {
            if (amount == 0) {
                val base = subList.toList
                ans += base
            }
            return
        }
        if (amount - coins(n) >= 0) {
            subList += coins(n)
            combinationSumRec(n, coins, amount - coins(n), subList, ans)
            subList.remove(subList.length - 1)
        }
        combinationSumRec(n - 1, coins, amount, subList, ans)
    }
}
