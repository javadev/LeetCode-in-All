// #Medium #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
// #2024_07_03_Time_0_ms_(100.00%)_Space_16_MB_(83.02%)

class Solution {
    private func expand(_ a: [Character], _ l: Int, _ r: Int, _ res: inout Int) {
        var l = l
        var r = r
        while l >= 0 && r < a.count {
            if a[l] != a[r] {
                return
            } else {
                res += 1
                l -= 1
                r += 1
            }
        }
    }

    func countSubstrings(_ s: String) -> Int {
        let a = Array(s)
        var res = 0
        for i in 0..<a.count {
            expand(a, i, i, &res)
            expand(a, i, i + 1, &res)
        }
        return res
    }
}
