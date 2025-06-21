// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
// #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
// #Top_Interview_150_Hashmap #Big_O_Time_O(n*k_log_k)_Space_O(n)
// #2024_10_04_Time_376_ms_(92.86%)_Space_156.8_MB_(72.32%)

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String, List<String>> m = {};

    if (strs.length == 1) return [strs];
    else if (strs.length == 0) return [[""]];
    else {
      for (String s in strs) {
        List<String> charList = s.split('');
        charList.sort();
        String sortedS = charList.join();

        if (m[sortedS] == null) {
          m[sortedS] = [s];
        } else {
          m[sortedS]?.add(s);
        }
      }
      return m.values.toList();
    }
  }
}
