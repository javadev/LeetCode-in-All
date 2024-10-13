// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
// #Big_O_Time_O(n)_Space_O(n) #2024_10_12_Time_380_ms_(80.65%)_Space_166.1_MB_(51.61%)

class Solution {
  int subarraySum(List<int> nums, int k) {
    int tempSum = 0;
    int ret = 0;
    Map<int, int> sumCount = {0: 1};

    for (int i in nums) {
      tempSum += i;

      if (sumCount.containsKey(tempSum - k)) {
        ret += sumCount[tempSum - k]!;
      }

      if (sumCount.containsKey(tempSum)) {
        sumCount[tempSum] = sumCount[tempSum]! + 1;
      } else {
        sumCount[tempSum] = 1;
      }
    }

    return ret;
  }
}
