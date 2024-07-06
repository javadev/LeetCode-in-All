// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
// #Big_O_Time_O(n)_Space_O(n) #2024_07_03_Time_78_ms_(92.15%)_Space_16.6_MB_(75.62%)

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var dict = [Int: Int]()
        dict[0] = 1
    
        var sum = 0
        for num in nums {
            sum += num
            if let val = dict[sum - k] {
                result += val
            }
            dict[sum, default: 0] += 1
        }
        return result 
    }
}
