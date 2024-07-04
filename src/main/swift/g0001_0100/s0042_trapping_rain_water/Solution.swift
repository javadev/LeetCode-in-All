// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
// #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
// #Big_O_Time_O(n)_Space_O(1) #2024_06_23_Time_24_ms_(94.11%)_Space_16.2_MB_(12.42%)

class Solution {
    func trap(_ height: [Int]) -> Int {
        var ans = 0
        var left = 0, right = height.count - 1
        var leftMax = 0, rightMax = 0
        while left < right {
            let leftHeight = height[left], rightHeight = height[right]
            if leftHeight < rightHeight {
                if leftHeight >= leftMax {
                    leftMax = leftHeight
                } else {
                    ans += leftMax - leftHeight
                }
                left += 1
            } else {
                if rightHeight >= rightMax {
                    rightMax = rightHeight
                } else {
                    ans += rightMax - rightHeight
                }
                right -= 1
            }
        }
        return ans
    }    
}
