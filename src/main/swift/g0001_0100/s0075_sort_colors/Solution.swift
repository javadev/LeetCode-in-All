// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_2_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_06_24_Time_3_ms_(71.45%)_Space_16.2_MB_(7.44%)

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var zeroes = 0
        var ones = 0
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                nums[zeroes] = 0
                zeroes += 1
            } else if nums[i] == 1 {
                ones += 1
            }
        }
        
        for j in zeroes..<(zeroes + ones) {
            nums[j] = 1
        }
        
        for k in (zeroes + ones)..<nums.count {
            nums[k] = 2
        }
    }
}
