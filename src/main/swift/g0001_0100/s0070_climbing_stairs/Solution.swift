// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
// #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2024_06_24_Time_0_ms_(100.00%)_Space_15.5_MB_(40.57%)

public class Solution {
    public func climbStairs(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var cache = [Int](repeating: 0, count: n)
        
        // Initializing the base cases
        cache[0] = 1
        cache[1] = 2
        
        for i in 2..<n {
            cache[i] = cache[i - 1] + cache[i - 2]
        }
        
        return cache[n - 1]
    }
}
