// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Divide_and_Conquer
// #Big_O_Time_O(log(min(N,M)))_Space_O(1) #AI_can_be_used_to_solve_the_task
// #2024_11_29_Time_3_ms_(91.90%)_Space_54.1_MB_(88.03%)

/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findMedianSortedArrays = function (nums1, nums2) {
    if (nums2.length < nums1.length) {
        return findMedianSortedArrays(nums2, nums1)
    }

    let n1 = nums1.length,
        n2 = nums2.length
    let low = 0,
        high = n1

    while (low <= high) {
        let cut1 = Math.floor((low + high) / 2)
        let cut2 = Math.floor((n1 + n2 + 1) / 2) - cut1

        let l1 = cut1 === 0 ? -Infinity : nums1[cut1 - 1]
        let l2 = cut2 === 0 ? -Infinity : nums2[cut2 - 1]
        let r1 = cut1 === n1 ? Infinity : nums1[cut1]
        let r2 = cut2 === n2 ? Infinity : nums2[cut2]

        if (l1 <= r2 && l2 <= r1) {
            if ((n1 + n2) % 2 === 0) {
                return (Math.max(l1, l2) + Math.min(r1, r2)) / 2.0
            }
            return Math.max(l1, l2)
        } else if (l1 > r2) {
            high = cut1 - 1
        } else {
            low = cut1 + 1
        }
    }

    return 0.0
}

export { findMedianSortedArrays }
