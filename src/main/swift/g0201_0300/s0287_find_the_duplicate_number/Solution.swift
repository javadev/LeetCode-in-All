// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
// #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
// #2024_07_02_Time_277_ms_(88.76%)_Space_19.5_MB_(84.27%)

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count
        var array = [Bool](repeating: false, count: n)
        for num in nums {
            if array[num] {
                return num
            }
            array[num] = true
        }
        return n
    }
}
