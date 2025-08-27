// #Medium #String #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(n)
// #2024_06_19_Time_26_ms_(72.18%)_Space_16.6_MB_(44.74%)

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let arr = Array(s)
        var result = ""
        let shift = numRows > 1 ? (numRows - 1) * 2 : 1
        var index = 0
    
        for row in 0..<numRows { // Step 1
            index = row // Step 2
            
            while index < arr.count {
                result.append(arr[index]) // Step 3
                if row != 0 && row != numRows - 1 { // Step 4
                    let diagonalIndex = index + (numRows - 1 - row) * 2
                    if diagonalIndex < arr.count {
                        result.append(arr[diagonalIndex])
                    }
                }
                index += shift // Step 5
            }
        }
        return result
    }
}
