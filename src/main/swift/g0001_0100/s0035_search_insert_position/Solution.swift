// #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
// #Binary_Search_I_Day_2 #Big_O_Time_O(log_n)_Space_O(1)
// #2024_06_19_Time_6_ms_(97.35%)_Space_15.5_MB_(88.56%)

public class Solution {
    public func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1
        
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target {
                return mid
            } else if target < nums[mid] {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        
        return lo
    }
}
