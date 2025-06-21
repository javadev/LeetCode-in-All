// #Easy #Dynamic_Programming #Bit_Manipulation #LeetCode_75_Bit_Manipulation
// #Udemy_Bit_Manipulation #Big_O_Time_O(num)_Space_O(num)
// #2024_10_11_Time_303_ms_(100.00%)_Space_151.6_MB_(25.81%)

class Solution {
  List<int> countBits(int num) {
    List<int> result = List.filled(num + 1, 0);
    int borderPos = 1;
    int incrPos = 1;

    for (int i = 1; i < result.length; i++) {
      // When we reach a power of 2, reset borderPos and incrPos
      if (incrPos == borderPos) {
        result[i] = 1;
        incrPos = 1;
        borderPos = i;
      } else {
        result[i] = 1 + result[incrPos++];
      }
    }

    return result;
  }
}
