// #Easy #Dynamic_Programming #Bit_Manipulation #Udemy_Bit_Manipulation
// #Big_O_Time_O(num)_Space_O(num) #2024_07_02_Time_31_ms_(90.56%)_Space_20.7_MB_(98.89%)

class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int]()

        for num in 0 ... n {
            var count = 0
            var curr = num
            
            while curr > 0 {
                count += curr & 1
                curr = curr >> 1
            }
            result.append(count)
        }
        return result
    }
}
