// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Level_2_Day_14_Sliding_Window/Two_Pointer #Big_O_Time_O(s.length())_Space_O(1)
// #2024_06_24_Time_41_ms_(94.94%)_Space_18.6_MB_(9.70%)

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sChars = Array(s)
        let tChars = Array(t)
        var tCount = [Character: Int]()
        
        // Store the count of each character in t
        for char in tChars {
            tCount[char, default: 0] += 1
        }
        
        var windowStart = 0
        var windowEnd = 0
        var minWindowSize = Int.max
        var minWindowStart = 0
        var count = tChars.count
        
        while windowEnd < sChars.count {
            let charEnd = sChars[windowEnd]
            
            // If the character at windowEnd is in t, decrease the count
            if let charCount = tCount[charEnd] {
                if charCount > 0 {
                    count -= 1
                }
                tCount[charEnd] = charCount - 1
            }
            
            // Move windowStart to the right until all characters in t are included
            while count == 0 {
                let currentWindowSize = windowEnd - windowStart + 1
                
                // Update the minimum window size and start position if necessary
                if currentWindowSize < minWindowSize {
                    minWindowSize = currentWindowSize
                    minWindowStart = windowStart
                }
                
                let charStart = sChars[windowStart]
                
                // If the character at windowStart is in t, increase the count
                if let charCount = tCount[charStart] {
                    if charCount == 0 {
                        count += 1
                    }
                    tCount[charStart] = charCount + 1
                }
                
                windowStart += 1
            }
            
            windowEnd += 1
        }
    
        // Return the minimum window substring or an empty string if not found
        if minWindowSize == Int.max {
            return ""
        } else {
            let minWindowEnd = minWindowStart + minWindowSize
            return String(sChars[minWindowStart..<minWindowEnd])
        }
    }
}
