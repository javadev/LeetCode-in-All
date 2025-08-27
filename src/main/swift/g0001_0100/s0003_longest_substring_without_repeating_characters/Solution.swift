// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
// #Top_Interview_150_Sliding_Window #Big_O_Time_O(n)_Space_O(1) #AI_can_be_used_to_solve_the_task
// #2024_06_17_Time_8_ms_(93.40%)_Space_16.6_MB_(54.36%)

public class Solution {
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastIndices = Array(repeating: -1, count: 256)
        var maxLen = 0
        var curLen = 0
        var start = 0

        for (i, char) in s.enumerated() {
            let asciiValue = Int(char.asciiValue!)
            if lastIndices[asciiValue] < start {
                lastIndices[asciiValue] = i
                curLen += 1
            } else {
                let lastIndex = lastIndices[asciiValue]
                start = lastIndex + 1
                curLen = i - start + 1
                lastIndices[asciiValue] = i
            }
            if curLen > maxLen {
                maxLen = curLen
            }
        }
        return maxLen
    }
}
