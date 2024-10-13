// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
// #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
// #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Big_O_Time_O(M+max*N)_Space_O(M+N+max)
// #2024_10_07_Time_307_ms_(86.96%)_Space_148.9_MB_(56.52%)

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    Map<String, bool> memo = {};
    bool solve(String s1) {
      if (s1.length == 0) return true;
      if (memo.containsKey(s1)) {
        return memo[s1]!;
      }
      bool ans = false;
      for (var word in wordDict) {
        if (word.length > s1.length) continue;
        String s2 = s1.substring(0, word.length);
        if (s2 == word) {
          ans |= solve(s1.substring(word.length));
        }
      }
      memo[s1] = ans;
      return ans;
    }

    return solve(s);
  }
}
