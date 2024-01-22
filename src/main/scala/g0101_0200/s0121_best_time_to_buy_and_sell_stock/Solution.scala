package g0101_0200.s0121_best_time_to_buy_and_sell_stock

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
// #Big_O_Time_O(N)_Space_O(1) #2023_11_03_Time_762_ms_(98.45%)_Space_68.4_MB_(71.65%)

object Solution {
    def maxProfit(prices: Array[Int]): Int = {
        var maxProfit = 0
        var min = prices(0)

        for (i <- 1 until prices.length) {
            if (prices(i) > min) {
                maxProfit = math.max(maxProfit, prices(i) - min)
            } else {
                min = prices(i)
            }
        }

        maxProfit
    }
}
