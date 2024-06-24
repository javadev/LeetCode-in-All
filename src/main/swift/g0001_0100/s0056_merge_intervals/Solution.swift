// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
// #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
// #Big_O_Time_O(n_log_n)_Space_O(n) #2024_06_23_Time_52_ms_(99.13%)_Space_17.8_MB_(32.24%)

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        var intervals = intervals
        intervals.sort{ a, b in 
            a[0] < b[0]
        }
        var j = 0
        var merged = [intervals[0]]
        while j < intervals.count {
            let first = merged.removeLast()
            let second = intervals[j] 
            if first[0] <= second[0] && first[1] >= second[1] {
                merged.append([first[0], first[1]])
            } else if second[0] <= first[0] && second[1] >= first[1] {
                merged.append([second[0], second[1]]) 
            } else if first[1] >= second[0] && first[0] <= second[0] {
                merged.append([first[0], second[1]])
            }  else {
                merged.append(first)
                merged.append(second)
            }
            j += 1
        }
        return merged
    }
}
