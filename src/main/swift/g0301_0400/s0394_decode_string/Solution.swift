// #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(n) #2024_07_02_Time_0_ms_(100.00%)_Space_16.5_MB_(23.23%)

class Solution {
    private var i = 0
    
    func decodeString(_ s: String) -> String {
        var count = 0
        var sb = ""
        let chars = Array(s)
        
        while i < chars.count {
            let c = chars[i]
            i += 1
            
            if c.isLetter {
                sb.append(c)
            } else if c.isNumber {
                count = count * 10 + c.wholeNumberValue!
            } else if c == "]" {
                break
            } else if c == "[" {
                // sub problem
                let repeatString = decodeString(s)
                while count > 0 {
                    sb.append(repeatString)
                    count -= 1
                }
            }
        }
        return sb
    }
}
