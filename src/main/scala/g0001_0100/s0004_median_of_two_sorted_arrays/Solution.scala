package g0001_0100.s0004_median_of_two_sorted_arrays

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Divide_and_Conquer
// #Big_O_Time_O(log(min(N,M)))_Space_O(1) #2023_10_29_Time_644_ms_(80.82%)_Space_57.9_MB_(91.78%)

object Solution {
    @SuppressWarnings(Array("scala:S3776"))
    def findMedianSortedArrays(nums1: Array[Int], nums2: Array[Int]): Double = {
        if (nums2.length < nums1.length) {
            findMedianSortedArrays(nums2, nums1)
        } else {
            val n1 = nums1.length
            val n2 = nums2.length
            var cut1: Int = 0
            var cut2: Int = 0
            var low: Int = 0
            var high: Int = n1

            while (low <= high) {
                cut1 = (low + high) / 2
                cut2 = (n1 + n2 + 1) / 2 - cut1
                val l1 = if (cut1 == 0) Int.MinValue else nums1(cut1 - 1)
                val l2 = if (cut2 == 0) Int.MinValue else nums2(cut2 - 1)
                val r1 = if (cut1 == n1) Int.MaxValue else nums1(cut1)
                val r2 = if (cut2 == n2) Int.MaxValue else nums2(cut2)

                if (l1 <= r2 && l2 <= r1) {
                    if ((n1 + n2) % 2 == 0) {
                        return (math.max(l1, l2) + math.min(r1, r2)) / 2.0
                    }
                    return math.max(l1, l2)
                } else if (l1 > r2) {
                    high = cut1 - 1
                } else {
                    low = cut1 + 1
                }
            }
            0.0
        }
    }
}
