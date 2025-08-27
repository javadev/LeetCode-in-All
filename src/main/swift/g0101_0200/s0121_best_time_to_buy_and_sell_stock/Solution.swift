// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
// #Top_Interview_150_Array/String #Big_O_Time_O(N)_Space_O(1)
// #2024_06_25_Time_274_ms_(88.04%)_Space_19_MB_(73.18%)

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        
        var maxProfit = 0
        var minPrice = prices[0]
        
        for i in 1..<prices.count {
            if prices[i] > minPrice {
                maxProfit = max(maxProfit, prices[i] - minPrice)
            } else {
                minPrice = prices[i]
            }
        }
        
        return maxProfit
    }
}
