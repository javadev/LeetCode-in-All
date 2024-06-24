// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_5 #Big_O_Time_O(log_n)_Space_O(1)
// #2024_06_19_Time_11_ms_(92.41%)_Space_16.9_MB_(58.09%)

public class Solution {
    public func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var ans = [helper(nums, target, false), helper(nums, target, true)]
        return ans
    }

    private func helper(_ nums: [Int], _ target: Int, _ equals: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var result = -1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target {
                result = mid
            }
            if nums[mid] < target || (nums[mid] == target && equals) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return result
    }
}
