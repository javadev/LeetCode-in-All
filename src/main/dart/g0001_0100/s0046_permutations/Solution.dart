// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
// #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
// #Udemy_Backtracking/Recursion #Big_O_Time_O(n*n!)_Space_O(n+n!)
// #2024_10_04_Time_319_ms_(80.00%)_Space_146.8_MB_(92.00%)

class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> ans = [];
    List<bool> used = List<bool>.filled(nums.length, false);
    helper(ans, [], used, nums);
    return ans;
  }
  
  void helper(List<List<int>> ans, List<int> temp, List<bool> used, List<int> nums) {
    if (temp.length == nums.length) {
      ans.add(List<int>.from(temp));
      return;
    }

    for (int i = 0; i < nums.length; i++) {
      if (used[i]) continue;
      temp.add(nums[i]);
      used[i] = true;
      helper(ans, temp, used, nums);
      temp.removeLast();
      used[i] = false;
    }
  }
}
