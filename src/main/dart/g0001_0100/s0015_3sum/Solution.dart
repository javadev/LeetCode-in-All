// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
// #Top_Interview_150_Two_Pointers #Big_O_Time_O(n*log(n))_Space_O(n^2)
// #2024_09_30_Time_370_ms_(100.00%)_Space_158.2_MB_(82.14%)

class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> result = [];

    if (nums.length < 3) {
      return result; // There can't be triplets if there are less than 3 elements.
    }

    nums.sort(); // Sort the array to make the two-pointer approach easier.

    for (int i = 0; i < nums.length - 2; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) {
        continue; // Skip duplicates for the first element of the triplet.
      }

      int target = -nums[i];
      int left = i + 1;
      int right = nums.length - 1;

      while (left < right) {
        int sum = nums[left] + nums[right];

        if (sum == target) {
          result.add([nums[i], nums[left], nums[right]]);

          while (left < right && nums[left] == nums[left + 1]) {
            left++; // Skip duplicates for the second element of the triplet.
          }

          while (left < right && nums[right] == nums[right - 1]) {
            right--; // Skip duplicates for the third element of the triplet.
          }

          left++;
          right--;
        } else if (sum < target) {
          left++;
        } else {
          right--;
        }
      }
    }

    return result;
  }
}
