// #Medium #Top_100_Liked_Questions #Array #Prefix_Sum #LeetCode_75_Array/String
// #Data_Structure_II_Day_5_Array #Udemy_Arrays #Top_Interview_150_Array/String
// #Big_O_Time_O(n^2)_Space_O(n) #2024_10_09_Time_346_ms_(99.16%)_Space_167_MB_(42.02%)

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    int product = 1;
    List<int> ans = List.filled(nums.length, 0);

    // Calculate total product of all elements
    for (int num in nums) {
      product *= num;
    }

    // Fill in the result array
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != 0) {
        ans[i] = product ~/ nums[i]; // Integer division
      } else {
        int p = 1;
        for (int j = 0; j < nums.length; j++) {
          if (j != i) {
            p *= nums[j];
          }
        }
        ans[i] = p;
      }
    }

    return ans;
  }
}
