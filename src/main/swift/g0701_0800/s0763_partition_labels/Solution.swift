// #Medium #Top_100_Liked_Questions #String #Hash_Table #Greedy #Two_Pointers
// #Data_Structure_II_Day_7_String #Big_O_Time_O(n)_Space_O(1)
// #2024_07_03_Time_2_ms_(100.00%)_Space_16.4_MB_(73.85%)

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var last: [Character: Int] = [:]
        for (i, char) in s.enumerated() {
            last[char] = i
        }
        var result: [Int] = []
        var start = 0
        var end = 0
        for (i, char) in s.enumerated() {
            end = max(end, last[char, default: 0])
            if i == end {
                result.append(end - start + 1)
                start = i + 1
                end = i + 1
            }
        }
        return result
    }
}
