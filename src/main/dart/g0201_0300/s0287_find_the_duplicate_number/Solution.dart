// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
// #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
// #2024_10_09_Time_376_ms_(92.11%)_Space_179.8_MB_(44.74%)

class Solution {
  int findDuplicate(List<int> nums) {
    List<int> arr = List.filled(nums.length + 1, 0);

    for (int num in nums) {
      arr[num] += 1;
      if (arr[num] == 2) {
        return num;
      }
    }

    return 0;
  }
}
