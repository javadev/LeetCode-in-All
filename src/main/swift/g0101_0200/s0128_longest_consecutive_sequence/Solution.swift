// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
// #Big_O_Time_O(N_log_N)_Space_O(1) #2024_06_27_Time_225_ms_(94.82%)_Space_21_MB_(31.47%)

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }

        let sortedNums = nums.sorted()
        var maxLen = 1
        var currentLen = 1

        for i in 1..<sortedNums.count {
            if sortedNums[i] == sortedNums[i - 1] + 1 {
                currentLen += 1
            } else if sortedNums[i] != sortedNums[i - 1] {
                maxLen = max(maxLen, currentLen)
                currentLen = 1
            }
        }
        return max(maxLen, currentLen)
    }
}
