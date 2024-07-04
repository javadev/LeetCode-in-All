// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
// #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
// #Big_O_Time_O(n)_Space_O(1) #2024_06_28_Time_38_ms_(96.59%)_Space_16.9_MB_(85.84%)

class Solution {
    func majorityElement(_ arr: [Int]) -> Int {
        var count = 1
        var majority = arr[0]

        // For Potential Majority Element
        for i in 1..<arr.count {
            if arr[i] == majority {
                count += 1
            } else {
                if count > 1 {
                    count -= 1
                } else {
                    majority = arr[i]
                }
            }
        }

        // For Confirmation
        count = 0
        for num in arr {
            if num == majority {
                count += 1
            }
        }
        return count >= (arr.count / 2) + 1 ? majority : -1
    }
}
