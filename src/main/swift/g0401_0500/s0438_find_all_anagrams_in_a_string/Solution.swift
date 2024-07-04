// #Medium #Top_100_Liked_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_II_Day_5_Sliding_Window #Programming_Skills_II_Day_12
// #Level_1_Day_12_Sliding_Window/Two_Pointer #Big_O_Time_O(n+m)_Space_O(1)
// #2024_07_02_Time_30_ms_(97.24%)_Space_17.4_MB_(31.03%)

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var map = [Int](repeating: 0, count: 26)
        for char in p {
            map[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
        }

        var res = [Int]()
        var i = 0
        var j = 0
        let sArray = Array(s)
        let pLength = p.count

        while i < sArray.count {
            let idx = Int(sArray[i].asciiValue! - Character("a").asciiValue!)
            // Add the new character
            map[idx] -= 1

            // If the length is greater than window length, pop the left character in the window
            if i >= pLength {
                let leftIdx = Int(sArray[j].asciiValue! - Character("a").asciiValue!)
                map[leftIdx] += 1
                j += 1
            }

            var finish = true
            for count in map {
                // If it is not an anagram of string p
                if count != 0 {
                    finish = false
                    break
                }
            }

            if i >= pLength - 1 && finish {
                res.append(j)
            }

            i += 1
        }

        return res
    }
}
