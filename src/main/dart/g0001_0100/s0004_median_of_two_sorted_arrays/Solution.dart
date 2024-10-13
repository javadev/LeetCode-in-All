// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Divide_and_Conquer
// #Big_O_Time_O(log(min(N,M)))_Space_O(1)
// #2024_09_28_Time_393_ms_(100.00%)_Space_151.2_MB_(78.38%)

import 'dart:math';

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    if (nums2.length < nums1.length) {
      return findMedianSortedArrays(nums2, nums1);
    }

    int n1 = nums1.length;
    int n2 = nums2.length;
    int low = 0;
    int high = n1;

    int minValue = -pow(2, 31).toInt(); // substitute for Integer.MIN_VALUE
    int maxValue = pow(2, 31).toInt() - 1; // substitute for Integer.MAX_VALUE

    while (low <= high) {
      int cut1 = (low + high) ~/ 2;
      int cut2 = ((n1 + n2 + 1) ~/ 2) - cut1;

      int l1 = cut1 == 0 ? minValue : nums1[cut1 - 1];
      int l2 = cut2 == 0 ? minValue : nums2[cut2 - 1];
      int r1 = cut1 == n1 ? maxValue : nums1[cut1];
      int r2 = cut2 == n2 ? maxValue : nums2[cut2];

      if (l1 <= r2 && l2 <= r1) {
        if ((n1 + n2) % 2 == 0) {
          return (max(l1, l2) + min(r1, r2)) / 2.0;
        }
        return max(l1, l2).toDouble();
      } else if (l1 > r2) {
        high = cut1 - 1;
      } else {
        low = cut1 + 1;
      }
    }
    return 0.0;
  }
}
