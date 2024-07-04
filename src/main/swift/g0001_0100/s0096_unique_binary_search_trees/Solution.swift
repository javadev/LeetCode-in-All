// #Medium #Dynamic_Programming #Math #Tree #Binary_Tree #Binary_Search_Tree
// #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
// #2024_06_25_Time_0_ms_(100.00%)_Space_15.3_MB_(56.25%)

class Solution {
    func numTrees(_ n: Int) -> Int {
        var result: Int64 = 1
        for i in 0..<n {
            result *= Int64(2 * n - i)
            result /= Int64(i + 1)
        }
        result /= Int64(n + 1)
        return Int(result)
    }
}
