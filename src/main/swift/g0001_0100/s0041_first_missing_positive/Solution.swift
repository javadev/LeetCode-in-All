// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(n) #2024_06_23_Time_199_ms_(94.85%)_Space_19.6_MB_(89.69%)

public class Solution {
    public func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] > 0 && nums[i] <= nums.count && nums[i] != i + 1 {
                let val = nums[i]
                if nums[val - 1] == val {
                    break
                }
                nums.swapAt(i, val - 1)
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}
