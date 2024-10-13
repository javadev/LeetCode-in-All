// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
// #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2024_09_30_Time_298_ms_(95.87%)_Space_149.5_MB_(44.13%)

class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (c == '(' || c == '[' || c == '{') {
        stack.add(c);
      } else if (c == ')' && stack.isNotEmpty && stack.last == '(') {
        stack.removeLast();
      } else if (c == '}' && stack.isNotEmpty && stack.last == '{') {
        stack.removeLast();
      } else if (c == ']' && stack.isNotEmpty && stack.last == '[') {
        stack.removeLast();
      } else {
        return false;
      }
    }

    return stack.isEmpty;
  }
}
