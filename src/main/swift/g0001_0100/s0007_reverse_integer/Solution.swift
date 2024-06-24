// #Medium #Top_Interview_Questions #Math #Udemy_Integers
// #2024_06_18_Time_0_ms_(100.00%)_Space_15.3_MB_(69.27%)

class Solution {
    func reverse(_ x: Int) -> Int {
        var rev: Int = 0
        var number = x

        while number != 0 {
            let pop = number % 10
            number /= 10

            if rev > Int32.max / 10 || (rev == Int32.max / 10 && pop > 7) {
                return 0
            }
            if rev < Int32.min / 10 || (rev == Int32.min / 10 && pop < -8) {
                return 0
            }
            rev = rev * 10 + pop
        }

        return rev
    }
}
