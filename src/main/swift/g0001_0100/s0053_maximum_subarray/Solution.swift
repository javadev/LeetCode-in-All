// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
// #Udemy_Famous_Algorithm #Top_Interview_150_Kadane's_Algorithm #Big_O_Time_O(n)_Space_O(1)
// #2024_06_23_Time_281_ms_(98.21%)_Space_20.2_MB_(6.94%)

public class Solution {
    public func maxSubArray(_ nums: [Int]) -> Int {
        var maxi = Int.min
        var sum = 0
        for num in nums {
            sum += num
            maxi = max(sum, maxi)
            if sum < 0 {
                sum = 0
            }
        }
        return maxi
    }
}
