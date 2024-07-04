// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Binary_Search
// #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3 #Dynamic_Programming_I_Day_18
// #Udemy_Dynamic_Programming #Big_O_Time_O(n*log_n)_Space_O(n)
// #2024_07_02_Time_8_ms_(100.00%)_Space_15.5_MB_(61.14%)

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        var dp = [Int](repeating: Int.max, count: nums.count + 1)
        dp[0] = Int.min
        var length = 0

        for num in nums {
            var left = 0
            var right = length
            while left <= right {
                let mid = left + (right - left) / 2
                if dp[mid] < num {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            dp[left] = num
            if left > length {
                length = left
            }
        }

        return length
    }
}
