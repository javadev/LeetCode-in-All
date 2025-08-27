// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
// #LeetCode_75_Backtracking #Algorithm_II_Day_11_Recursion_Backtracking
// #Udemy_Backtracking/Recursion #Top_Interview_150_Backtracking #Big_O_Time_O(4^n)_Space_O(n)
// #2024_06_18_Time_0_ms_(100.00%)_Space_16.3_MB_(72.66%)

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }

        let letters = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var ans: [String] = []
        var curr = String()

        findCombinations(0, digits, letters, &curr, &ans)
        return ans
    }

    private func findCombinations(_ start: Int, _ digits: String, _ letters: [String], _ curr: inout String, _ ans: inout [String]) {
        if curr.count == digits.count {
            ans.append(curr)
            return
        }

        let index = digits.index(digits.startIndex, offsetBy: start)
        let digit = digits[index]
        let digitIndex = digit.wholeNumberValue!

        for letter in letters[digitIndex] {
            curr.append(letter)
            findCombinations(start + 1, digits, letters, &curr, &ans)
            curr.removeLast()
        }
    }
}
