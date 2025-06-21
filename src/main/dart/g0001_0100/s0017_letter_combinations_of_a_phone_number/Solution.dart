// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
// #LeetCode_75_Backtracking #Algorithm_II_Day_11_Recursion_Backtracking
// #Udemy_Backtracking/Recursion #Top_Interview_150_Backtracking #Big_O_Time_O(4^n)_Space_O(n)
// #2024_09_30_Time_293_ms_(92.50%)_Space_148.3_MB_(56.25%)

class Solution {
  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) {
      return [];
    }
    final Map<String, String> hashmap = {
      '2': 'abc',
      '3': 'def',
      '4': 'ghi',
      '5': 'jkl',
      '6': 'mno',
      '7': 'pqrs',
      '8': 'tuv',
      '9': 'wxyz',
    };
    List<String> ans = [];
    void backTracking(String digit, int index, List<String> ans) {
      if (digit.length == digits.length) {
        ans.add(digit);
        return;
      }
      for (String character in hashmap[digits[index]]!.split('')) {
        backTracking(digit + character, index + 1, ans);
      }
    }
    backTracking('', 0, ans);
    return ans;
  }
}
