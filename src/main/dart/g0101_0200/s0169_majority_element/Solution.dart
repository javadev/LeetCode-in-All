// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
// #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
// #Big_O_Time_O(n)_Space_O(1) #2024_10_08_Time_317_ms_(98.55%)_Space_156.5_MB_(11.11%)

class Solution {
  int majorityElement(List<int> arr) {
    int count = 1;
    int majority = arr[0];

    // Step 1: Find Potential Majority Element
    for (int i = 1; i < arr.length; i++) {
      if (arr[i] == majority) {
        count++;
      } else {
        if (count > 1) {
          count--;
        } else {
          majority = arr[i];
        }
      }
    }

    // Step 2: Confirmation of Majority Element
    count = 0;
    for (int num in arr) {
      if (num == majority) {
        count++;
      }
    }

    return count >= (arr.length / 2).ceil() ? majority : -1;
  }
}
