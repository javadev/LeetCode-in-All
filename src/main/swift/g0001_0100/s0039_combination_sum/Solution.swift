// #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
// #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n+2^n) #2024_06_19_Time_8_ms_(90.77%)_Space_16_MB_(55.65%)

public class Solution {
    public func combinationSum(_ coins: [Int], _ amount: Int) -> [[Int]] {
        var ans = [[Int]]()
        var subList = [Int]()
        combinationSumRec(coins.count, coins, amount, &subList, &ans)
        return ans
    }

    private func combinationSumRec(_ n: Int, _ coins: [Int], _ amount: Int, _ subList: inout [Int], _ ans: inout [[Int]]) {
        if amount == 0 || n == 0 {
            if amount == 0 {
                ans.append(subList)
            }
            return
        }
        if amount - coins[n - 1] >= 0 {
            subList.append(coins[n - 1])
            combinationSumRec(n, coins, amount - coins[n - 1], &subList, &ans)
            subList.removeLast()
        }
        combinationSumRec(n - 1, coins, amount, &subList, &ans)
    }
}
