// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Greedy #Two_Pointers
// #Algorithm_II_Day_4_Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2024_06_18_Time_204_ms_(98.62%)_Space_19.4_MB_(60.00%)

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var mx = Int.min
        // Base condition
        guard height.count != 2 else {
            return min(height[0], height[1])
        }

        // Hypothesis
    
        // Induction
        while (j > i) {
            let dis = j - i
            var area = height[i] * dis
            if height[i] < height[j] {
                i += 1
            } else {
                area = height[j] * dis
                j -= 1
            }
            mx = max(mx, area)
        }
         return mx
    }
}
