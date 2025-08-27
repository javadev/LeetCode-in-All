// #Medium #Top_100_Liked_Questions #Array #Prefix_Sum #LeetCode_75_Array/String
// #Data_Structure_II_Day_5_Array #Udemy_Arrays #Top_Interview_150_Array/String
// #Big_O_Time_O(n^2)_Space_O(n) #2024_07_01_Time_150_ms_(91.75%)_Space_24.8_MB_(93.84%)

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
      var res = Array(repeating: 1, count: nums.count)
      var pre = 1
      for i in 0..<nums.count {
        res[i] *= pre
        pre *= nums[i]
      }
      var post = 1
      for i in (0..<nums.count).reversed() {
        res[i] *= post
        post *= nums[i]
      }
      return res
    }
}
