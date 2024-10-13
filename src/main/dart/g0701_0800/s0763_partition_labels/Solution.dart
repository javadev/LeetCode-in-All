// #Medium #String #Hash_Table #Greedy #Two_Pointers #Data_Structure_II_Day_7_String
// #Big_O_Time_O(n)_Space_O(1) #2024_10_12_Time_311_ms_(100.00%)_Space_145.8_MB_(100.00%)

class Solution {
  List<int> partitionLabels(String s) {
    List<int> result = [];
    List<int> position = List.filled(26, 0);

    // Store the last position of each letter in the string
    for (int i = 0; i < s.length; i++) {
      position[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] = i;
    }

    int i = 0;
    int prev = -1;
    int max = 0;

    while (i < s.length) {
      max = max > position[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] ? max : position[s.codeUnitAt(i) - 'a'.codeUnitAt(0)];

      if (i == max) {
        result.add(i - prev);
        prev = i;
      }

      i++;
    }

    return result;
  }
}
