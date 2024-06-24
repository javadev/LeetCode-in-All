// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
// #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Big_O_Time_O(n)_Space_O(n)
// #2024_06_17_Time_22_ms_(65.41%)_Space_16_MB_(83.22%)

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seen = [Int: Int]()
        for (i, num) in nums.enumerated() {
            let diff = target - nums[i]
            if let index = seen[diff] {
                return [index, i]
            } else {
                seen[nums[i]] = i
            }
        }
        return [-1, -1]
    }
}
