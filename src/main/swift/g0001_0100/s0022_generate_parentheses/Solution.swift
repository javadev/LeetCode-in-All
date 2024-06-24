// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n) #2024_06_19_Time_4_ms_(93.36%)_Space_16.3_MB_(33.02%)

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var sb = ""
        var ans = [String]()
        generate(&sb, &ans, n, n)
        return ans
    }

    private func generate(_ sb: inout String, _ str: inout [String], _ open: Int, _ close: Int) {
        if open == 0 && close == 0 {
            str.append(sb)
            return
        }
        if open > 0 {
            sb.append("(")
            generate(&sb, &str, open - 1, close)
            sb.removeLast()
        }
        if close > 0 && open < close {
            sb.append(")")
            generate(&sb, &str, open, close - 1)
            sb.removeLast()
        }
    }
}
