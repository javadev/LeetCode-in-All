// #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(n) #2024_10_12_Time_283_ms_(100.00%)_Space_148.4_MB_(43.75%)

class Solution {
  int i = 0;

  String decodeString(String s) {
    int count = 0;
    StringBuffer sb = StringBuffer();

    while (i < s.length) {
      String c = s[i];
      i++;

      if (RegExp(r'[a-zA-Z]').hasMatch(c)) {
        sb.write(c);
      } else if (RegExp(r'\d').hasMatch(c)) {
        count = count * 10 + int.parse(c);
      } else if (c == ']') {
        break;
      } else if (c == '[') {
        // Sub-problem: recursively decode the substring
        String repeat = decodeString(s);
        while (count > 0) {
          sb.write(repeat);
          count--;
        }
      }
    }

    return sb.toString();
  }
}
