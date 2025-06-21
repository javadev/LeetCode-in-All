// #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #LeetCode_75_Monotonic_Stack
// #Programming_Skills_II_Day_6 #Big_O_Time_O(n)_Space_O(n)
// #2024_10_12_Time_429_ms_(80.43%)_Space_189.2_MB_(54.35%)

class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    List<int> sol = List.filled(temperatures.length, 0);
    sol[temperatures.length - 1] = 0;

    for (int i = sol.length - 2; i >= 0; i--) {
      int j = i + 1;
      while (j < sol.length) { // Use '<' instead of '<='
        if (temperatures[i] < temperatures[j]) {
          sol[i] = j - i;
          break;
        } else {
          if (sol[j] == 0) {
            break;
          }
          j = j + sol[j];
        }
      }
    }
    return sol;
  }
}
