// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
// #Big_O_Time_O(N)_Space_O(1) #2024_07_03_Time_10_ms_(70.10%)_Space_15.4_MB_(95.88%)

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var left: Double = 1
        var right: Double = 1
        var j = nums.count - 1
        var res: Double = Double(Int.min)
        
        for i in 0..<nums.count {
            if left == 0 { left = 1 }
            if right == 0 { right = 1 }
            
            left *= Double(nums[i])
            right *= Double(nums[j])
            
            j -= 1
            
            res = max(res, max(left, right))
        }
        
        return Int(res)
    }
}
