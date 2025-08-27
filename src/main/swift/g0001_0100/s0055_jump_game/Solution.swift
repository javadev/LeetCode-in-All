// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_4 #Udemy_Arrays
// #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
// #2024_06_23_Time_132_ms_(89.47%)_Space_15.5_MB_(85.96%)

public class Solution {
    public func canJump(_ nums: [Int]) -> Bool {
        let sz = nums.count
        var tmp = 1
        for i in 0..<sz {
            tmp -= 1
            if tmp < 0 {
                return false
            }
            tmp = max(tmp, nums[i])
            if i + tmp >= sz - 1 {
                return true
            }
        }
        return true
    }
}
