// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
// #Top_Interview_150_Two_Pointers #Big_O_Time_O(n*log(n))_Space_O(n^2)
// #2024_06_18_Time_129_ms_(99.77%)_Space_20.6_MB_(57.21%)

class Solution {    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return [] }
        
        var nums = nums.sorted()
        guard var firstPositiveIndex = nums.firstIndex(where: { $0 >= 0 }) else { return [] }
        
        var result: [[Int]] = []
        var left = 0
        var right = nums.count - 1
        var amount = 0

        for i in (0...firstPositiveIndex) {
            if i > 0 && nums[i] == nums[i-1] { continue }
            
            left = i + 1
            right = nums.count - 1
            
            while left < right {
                
                var amount = nums[i] + nums[left] + nums[right]
                if amount == 0 {
                    if result.last != [nums[i], nums[left], nums[right]] {
                        result.append([nums[i], nums[left], nums[right]])
                    }
                    left += 1
                    right -= 1
                } else if amount > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return result
    }
}
