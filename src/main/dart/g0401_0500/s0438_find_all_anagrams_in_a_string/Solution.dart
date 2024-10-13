// #Medium #Top_100_Liked_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_II_Day_5_Sliding_Window #Programming_Skills_II_Day_12
// #Level_1_Day_12_Sliding_Window/Two_Pointer #Big_O_Time_O(n+m)_Space_O(1)
// #2024_10_12_Time_318_ms_(100.00%)_Space_149.9_MB_(78.95%)

class Solution {
  List<int> findAnagrams(String s, String p) {
    List<int> map = List.filled(26, 0);

    // Fill the map with the frequency of characters in string p
    for (int i = 0; i < p.length; i++) {
      map[p.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    List<int> res = [];
    int i = 0;
    int j = 0;

    while (i < s.length) {
      int idx = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
      // Add the new character
      map[idx]--;

      // If the window size exceeds the length of p, remove the leftmost character
      if (i >= p.length) {
        map[s.codeUnitAt(j++) - 'a'.codeUnitAt(0)]++;
      }

      // Check if the current window is an anagram of p
      bool isAnagram = true;
      for (int k = 0; k < 26; k++) {
        if (map[k] != 0) {
          isAnagram = false;
          break;
        }
      }

      // If it is an anagram, add the start index of the window to the result
      if (i >= p.length - 1 && isAnagram) {
        res.add(j);
      }

      i++;
    }

    return res;
  }
}
