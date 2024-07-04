// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_3
// #Level_2_Day_12_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2024_06_28_Time_0_ms_(100.00%)_Space_15.6_MB_(25.32%)

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        var profit = [Int](repeating: 0, count: nums.count)
        profit[0] = nums[0]
        profit[1] = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            profit[i] = max(profit[i - 1], nums[i] + profit[i - 2])
        }
        return profit[nums.count - 1]
    }
}
