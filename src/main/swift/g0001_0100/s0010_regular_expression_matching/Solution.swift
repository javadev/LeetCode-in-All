// #Hard #Top_Interview_Questions #String #Dynamic_Programming #Recursion #Udemy_Dynamic_Programming
// #Big_O_Time_O(m*n)_Space_O(m*n) #2024_06_18_Time_3_ms_(91.89%)_Space_16.2_MB_(58.11%)

class Solution {
    func isMatch(_ string: String, _ pattern: String) -> Bool {
        let stringArray = Array(string)
        let patternArray = Array(pattern)

        let stringLength = stringArray.count
        let patternLength = patternArray.count

        var table = Array(
            repeating: Array(repeating: false, count: patternLength + 1),
            count: stringLength + 1
        )

        table[stringLength][patternLength] = true

        for s in (0...stringLength).reversed() {
            for p in (0..<patternLength).reversed() {
                let firstMatch = s < stringLength 
                    && (stringArray[s] == patternArray[p] || patternArray[p] == ".")

                if p + 1 < patternLength && patternArray[p + 1] == "*" {
                    table[s][p] = firstMatch && table[s + 1][p] || table[s][p + 2]
                } else {
                    table[s][p] = firstMatch && table[s + 1][p + 1]
                }
            }
        }

        return table[0][0]
    }
}
