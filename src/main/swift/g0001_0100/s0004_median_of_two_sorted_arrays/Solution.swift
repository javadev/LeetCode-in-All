// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Divide_and_Conquer
// #Top_Interview_150_Binary_Search #Big_O_Time_O(log(min(N,M)))_Space_O(1)
// #AI_can_be_used_to_solve_the_task #2024_06_17_Time_26_ms_(94.07%)_Space_16_MB_(90.06%)

public class Solution {
    public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n1 = nums1.count
        let n2 = nums2.count
        
        if n1 > n2 {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        var low = 0
        var high = n1
        
        while low <= high {
            let cut1 = (low + high) / 2
            let cut2 = (n1 + n2 + 1) / 2 - cut1
            
            let l1 = cut1 == 0 ? Int.min : nums1[cut1 - 1]
            let l2 = cut2 == 0 ? Int.min : nums2[cut2 - 1]
            let r1 = cut1 == n1 ? Int.max : nums1[cut1]
            let r2 = cut2 == n2 ? Int.max : nums2[cut2]
            
            if l1 <= r2 && l2 <= r1 {
                if (n1 + n2) % 2 == 0 {
                    return (Double(max(l1, l2)) + Double(min(r1, r2))) / 2.0
                } else {
                    return Double(max(l1, l2))
                }
            } else if l1 > r2 {
                high = cut1 - 1
            } else {
                low = cut1 + 1
            }
        }
        
        return 0.0
    }
}
