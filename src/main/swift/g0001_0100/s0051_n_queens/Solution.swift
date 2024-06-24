// #Hard #Top_100_Liked_Questions #Array #Backtracking #Big_O_Time_O(N!)_Space_O(N)
// #2024_06_23_Time_8_ms_(98.15%)_Space_16_MB_(94.44%)

public class Solution {
    public func solveNQueens(_ n: Int) -> [[String]] {
        var pos = [Bool](repeating: false, count: n + 2 * n - 1 + 2 * n - 1)
        var pos2 = [Int](repeating: 0, count: n)
        var ans = [[String]]()
        helper(n, 0, &pos, &pos2, &ans)
        return ans
    }

    private func helper(_ n: Int, _ row: Int, _ pos: inout [Bool], _ pos2: inout [Int], _ ans: inout [[String]]) {
        if row == n {
            construct(n, pos2, &ans)
            return
        }
        for i in 0..<n {
            let index = n + 2 * n - 1 + n - 1 + i - row
            if pos[i] || pos[n + i + row] || pos[index] {
                continue
            }
            pos[i] = true
            pos[n + i + row] = true
            pos[index] = true
            pos2[row] = i
            helper(n, row + 1, &pos, &pos2, &ans)
            pos[i] = false
            pos[n + i + row] = false
            pos[index] = false
        }
    }

    private func construct(_ n: Int, _ pos: [Int], _ ans: inout [[String]]) {
        var sol = [String]()
        for r in 0..<n {
            var queenRow = [Character](repeating: ".", count: n)
            queenRow[pos[r]] = "Q"
            sol.append(String(queenRow))
        }
        ans.append(sol)
    }
}
