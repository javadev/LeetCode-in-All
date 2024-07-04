// #Easy #Top_100_Liked_Questions #Array #Two_Pointers #Algorithm_I_Day_3_Two_Pointers
// #Programming_Skills_I_Day_6_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_07_01_Time_82_ms_(95.43%)_Space_17.1_MB_(33.52%)

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        let zero: Int = nums.filter { $0 == 0 }.count
        guard zero != nums.count else { return }
        
        nums = nums.filter { $0 != 0 }
        guard zero != 0 else { return }
        for _ in 0..<zero {
            nums.append(0)
        }
    }
}
