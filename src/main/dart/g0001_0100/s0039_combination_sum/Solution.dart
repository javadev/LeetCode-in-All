// #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
// #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
// #Top_Interview_150_Backtracking #Big_O_Time_O(2^n)_Space_O(n+2^n)
// #2024_10_04_Time_316_ms_(96.88%)_Space_150_MB_(62.50%)

class Solution {
  List<List<int>> combinationSum(List<int> coins, int amount) {
    List<List<int>> ans = [];
    List<int> subList = [];
    combinationSumRec(coins.length, coins, amount, subList, ans);
    return ans;
  }

  void combinationSumRec(int n, List<int> coins, int amount, List<int> subList, List<List<int>> ans) {
    if (amount == 0 || n == 0) {
      if (amount == 0) {
        // Create a new list from subList and add to ans
        ans.add(List.from(subList));
      }
      return;
    }

    if (amount - coins[n - 1] >= 0) {
      subList.add(coins[n - 1]);
      combinationSumRec(n, coins, amount - coins[n - 1], subList, ans);
      // Remove the last element
      subList.removeLast();
    }

    combinationSumRec(n - 1, coins, amount, subList, ans);
  }
}
