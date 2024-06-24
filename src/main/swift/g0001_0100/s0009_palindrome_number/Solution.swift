// #Easy #Math #Udemy_Integers #2024_06_18_Time_12_ms_(94.81%)_Space_15.6_MB_(58.39%)

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var rev = 0
        var localX = x
        while localX > 0 {
            rev = rev * 10 + localX % 10
            localX /= 10
        }
        return rev == x
    }
}
