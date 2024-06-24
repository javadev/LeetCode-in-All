// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
// #Big_O_Time_O(n)_Space_O(1) #2024_06_23_Time_25_ms_(98.10%)_Space_15.7_MB_(75.63%)

public class Solution {
    public func jump(_ nums: [Int]) -> Int {
        var length = 0
        var maxLength = 0
        var minJump = 0

        for i in 0..<nums.count - 1 {
            length -= 1
            maxLength -= 1
            maxLength = max(maxLength, nums[i])
            if length <= 0 {
                length = maxLength
                minJump += 1
            }
            if length >= nums.count - i - 1 {
                return minJump
            }
        }
        return minJump
    }
}
