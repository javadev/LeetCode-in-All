// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Data_Structure_II_Day_9_String #Algorithm_II_Day_14_Dynamic_Programming
// #Dynamic_Programming_I_Day_17 #Udemy_Strings #Top_Interview_150_Multidimensional_DP
// #Big_O_Time_O(n)_Space_O(n) #2024_09_28_Time_297_ms_(97.22%)_Space_146.7_MB_(92.59%)

class Solution {
  String longestPalindrome(String s) {
    List<String> newStr = List.filled(s.length * 2 + 1, '#');

    for (int i = 0; i < s.length; i++) {
      newStr[2 * i + 1] = s[i];
      newStr[2 * i + 2] = '#';
    }

    List<int> dp = List.filled(newStr.length, 0);
    int friendCenter = 0;
    int friendRadius = 0;
    int lpsCenter = 0;
    int lpsRadius = 0;

    for (int i = 0; i < newStr.length; i++) {
      dp[i] = (friendCenter + friendRadius > i)
          ? (dp[friendCenter * 2 - i] < (friendCenter + friendRadius) - i
          ? dp[friendCenter * 2 - i]
          : (friendCenter + friendRadius) - i)
          : 1;

      while (i + dp[i] < newStr.length &&
          i - dp[i] >= 0 &&
          newStr[i + dp[i]] == newStr[i - dp[i]]) {
        dp[i]++;
      }

      if (friendCenter + friendRadius < i + dp[i]) {
        friendCenter = i;
        friendRadius = dp[i];
      }

      if (lpsRadius < dp[i]) {
        lpsCenter = i;
        lpsRadius = dp[i];
      }
    }

    return s.substring(
        (lpsCenter - lpsRadius + 1) ~/ 2, (lpsCenter + lpsRadius - 1) ~/ 2);
  }
}
