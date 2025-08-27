// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Breadth_First_Search
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
// #Level_2_Day_12_Dynamic_Programming #Top_Interview_150_1D_DP #Big_O_Time_O(m*n)_Space_O(amount)
// #2024_07_02_Time_9_ms_(94.72%)_Space_15.5_MB_(61.62%)

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 1 { return 0 }
        let dummyValue: Int = .max
        var minCoinsHolder = Array(repeating: dummyValue, count: amount + 1)
        minCoinsHolder[0] = 0

        for intermediateAmount in 1 ... amount {
            var minCoins = dummyValue

            for coin in coins {
                if intermediateAmount >= coin {
                    let reminder = intermediateAmount - coin
                    let minCoinsForReminder = minCoinsHolder[reminder]
                    if minCoinsForReminder == dummyValue { continue }
                    minCoins = min(minCoins, 1 + minCoinsForReminder)
                }
            }

            minCoinsHolder[intermediateAmount] = minCoins
        }

        return minCoinsHolder[amount] == dummyValue ? -1 : minCoinsHolder[amount]
    }
}
