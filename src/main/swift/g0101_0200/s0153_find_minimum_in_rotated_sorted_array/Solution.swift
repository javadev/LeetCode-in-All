// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
// #Binary_Search_I_Day_12 #Udemy_Binary_Search #Top_Interview_150_Binary_Search
// #Big_O_Time_O(log_N)_Space_O(log_N) #2024_06_28_Time_3_ms_(95.89%)_Space_15.5_MB_(81.96%)

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var res = nums[0]
        var l = 0
        var r = nums.count - 1

        while l <= r {
            if nums[l] < nums[r] {
                res = min(res, nums[l])
                break
            }

            var mid = (l + r) / 2
            res = min(res, nums[mid])

            if nums[mid] >= nums[l] {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return res
    }
}
