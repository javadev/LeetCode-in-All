// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
// #Udemy_Binary_Search #Top_Interview_150_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
// #2024_06_19_Time_3_ms_(96.38%)_Space_15.5_MB_(64.61%)

public class Solution {
    public func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1
        
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target {
                return mid
            }
            
            // Check if the left half is sorted
            if nums[lo] <= nums[mid] {
                // Check if the target is in the left half
                if nums[lo] <= target && target <= nums[mid] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else {
                // Check if the target is in the right half
                if nums[mid] <= target && target <= nums[hi] {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        
        return -1
    }
}
