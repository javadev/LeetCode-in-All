// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
// #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n*2^n) #2024_10_05_Time_296_ms_(96.88%)_Space_148_MB_(65.63%)

class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> ans = [[]];
    int l;

    for (int n in nums) {
      l = ans.length;
      for (int i = 0; i < l; i++)
        ans.add([...ans[i], n]);
    }
    return ans;
  }
}
