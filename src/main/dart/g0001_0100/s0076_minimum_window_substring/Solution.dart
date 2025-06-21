// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Level_2_Day_14_Sliding_Window/Two_Pointer #Top_Interview_150_Sliding_Window
// #Big_O_Time_O(s.length())_Space_O(1) #2024_10_05_Time_337_ms_(92.86%)_Space_150.5_MB_(57.14%)

class Solution {
  String minWindow(String s, String t) {
    List<int> map = List.filled(128, 0);

    for (int i = 0; i < t.length; i++) {
      map[t.codeUnitAt(i)]++;
    }

    int count = t.length;
    int begin = 0;
    int end = 0;
    int d = double.maxFinite
        .toInt();
    int head = 0;

    while (end < s.length) {
      if (map[s.codeUnitAt(end++)]-- > 0) {
        count--;
      }
      while (count == 0) {
        if (end - begin < d) {
          d = end - begin;
          head = begin;
        }
        if (map[s.codeUnitAt(begin++)]++ == 0) {
          count++;
        }
      }
    }

    return d == double.maxFinite.toInt() ? "" : s.substring(head, head + d);
  }
}
