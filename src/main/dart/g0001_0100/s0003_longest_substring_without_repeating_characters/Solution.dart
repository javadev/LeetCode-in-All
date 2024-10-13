// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(1) #2024_09_28_Time_336_ms_(99.68%)_Space_149.1_MB_(64.29%)

class Solution {
  int lengthOfLongestSubstring(String s) {
    List<int> lastIndices = List.filled(256, -1);
    int maxLen = 0;
    int curLen = 0;
    int start = 0;

    for (int i = 0; i < s.length; i++) {
      int cur = s.codeUnitAt(i); // Getting ASCII value of the character
      if (lastIndices[cur] < start) {
        lastIndices[cur] = i;
        curLen++;
      } else {
        int lastIndex = lastIndices[cur];
        start = lastIndex + 1;
        curLen = i - start + 1;
        lastIndices[cur] = i;
      }
      if (curLen > maxLen) {
        maxLen = curLen;
      }
    }
    return maxLen;
  }
}
