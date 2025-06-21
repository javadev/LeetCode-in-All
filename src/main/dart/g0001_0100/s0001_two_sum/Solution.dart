// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
// #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Top_Interview_150_Hashmap
// #Big_O_Time_O(n)_Space_O(n) #AI_can_be_used_to_solve_the_task
// #2024_09_28_Time_305_ms_(99.57%)_Space_146.2_MB_(99.70%)

class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    Map<int, int> indexMap = {};
    for (int i = 0; i < numbers.length; i++) {
      int requiredNum = target - numbers[i];
      if (indexMap.containsKey(requiredNum)) {
        return [indexMap[requiredNum]!, i];
      }
      indexMap[numbers[i]] = i;
    }
    return [-1, -1];
  }
}
