// #Medium #Top_Interview_Questions #String #2024_06_18_Time_0_ms_(100.00%)_Space_16.5_MB_(45.57%)

class Solution {
    func myAtoi(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        }
        
        var i = str.startIndex
        var negativeSign = false
        var num = 0
        
        // Skip leading whitespace
        while i < str.endIndex && str[i] == " " {
            i = str.index(after: i)
        }
        
        if i == str.endIndex {
            return 0
        }
        
        // Check for sign
        if str[i] == "+" {
            i = str.index(after: i)
        } else if str[i] == "-" {
            i = str.index(after: i)
            negativeSign = true
        }
        
        while i < str.endIndex, let digit = str[i].wholeNumberValue {
            let tem = negativeSign ? -digit : digit
            
            // Check for overflow
            if num > Int32.max / 10 || (num == Int32.max / 10 && tem > 7) {
                return Int(Int32.max)
            }
            if num < Int32.min / 10 || (num == Int32.min / 10 && tem < -8) {
                return Int(Int32.min)
            }
            
            num = num * 10 + tem
            i = str.index(after: i)
        }
        
        return num
    }
}
