// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
// #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
// #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
// #Big_O_Time_O(M+max*N)_Space_O(M+N+max) #2024_06_27_Time_3_ms_(95.73%)_Space_16.4_MB_(60.50%)

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var words = [[Character]]()
        for word in wordDict {
            words.append(Array(word))
        }
        let sSlice = Array(s)[...]
        var visited = Array(repeating: false, count: sSlice.count)
        return canBeBroken(sSlice, words, &visited)
    }

    func canBeBroken(
        _ chars: ArraySlice<Character>, 
        _ words: [[Character]],
        _ visited: inout [Bool]
    ) -> Bool {
        let startIndex = chars.startIndex
        guard startIndex != chars.endIndex else { return true }
        guard !visited[startIndex] else { return false }
        for word in words {
            guard 
                chars.starts(with: word),
                canBeBroken(chars[startIndex.advanced(by: word.count)...], words, &visited)
            else { 
                continue 
            }
            return true
        }
        visited[startIndex] = true
        return false
    }
}
