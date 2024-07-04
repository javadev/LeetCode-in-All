// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Two_Pointers
// #Algorithm_I_Day_2_Two_Pointers #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_06_28_Time_118_ms_(91.36%)_Space_22.9_MB_(98.87%)

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 1, k > 0, k != nums.count else {
            return
        }

        let requiredRotationsCount = k % nums.count
        let pivotIndex = nums.count - requiredRotationsCount

        reverse(&nums, startIndex: nums.startIndex, endIndex: nums.endIndex - 1)
        reverse(&nums, startIndex: nums.startIndex, endIndex: requiredRotationsCount - 1)
        reverse(&nums, startIndex: requiredRotationsCount, endIndex: nums.endIndex - 1)

    }

    func reverse(_ nums: inout [Int], startIndex: Int, endIndex: Int) {
        var startIndex = startIndex
        var endIndex = endIndex

        while endIndex > startIndex {
            let temp = nums[startIndex]
            nums[startIndex] = nums[endIndex]
            nums[endIndex] = temp
            startIndex += 1
            endIndex -= 1
        }
    }
}
