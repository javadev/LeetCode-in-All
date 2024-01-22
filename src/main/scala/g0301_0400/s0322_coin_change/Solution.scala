package g0301_0400.s0322_coin_change

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Breadth_First_Search #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
// #Level_2_Day_12_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(amount)
// #2023_11_08_Time_533_ms_(84.21%)_Space_55.7_MB_(84.21%)

object Solution {
    def coinChange(coins: Array[Int], amount: Int): Int = {
        val dp = Array.fill(amount + 1)(0)
        dp(0) = 0

        for (i <- 1 to amount) {
            var minCoins = Int.MaxValue
            for (coin <- coins) {
                if (i - coin >= 0 && dp(i - coin) != -1) {
                    minCoins = math.min(minCoins, dp(i - coin) + 1)
                }
            }
            dp(i) = if (minCoins == Int.MaxValue) -1 else minCoins
        }

        dp(amount)
    }
}
