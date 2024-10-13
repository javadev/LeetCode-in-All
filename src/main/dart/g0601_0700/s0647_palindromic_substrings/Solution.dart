// #Medium #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
// #2024_10_12_Time_313_ms_(90.00%)_Space_148.2_MB_(70.00%)

class Solution {
  void expand(List<String> a, int l, int r, List<int> res) {
    while (l >= 0 && r < a.length) {
      if (a[l] != a[r]) {
        return;
      } else {
        res[0]++;
        l--;
        r++;
      }
    }
  }

  int countSubstrings(String s) {
    List<String> a = s.split(''); // Dart's equivalent of `toCharArray()`
    List<int> res = [0]; // Using a list to mimic the behavior of an int array
    for (int i = 0; i < a.length; i++) {
      expand(a, i, i, res);      // Odd length palindrome
      expand(a, i, i + 1, res);  // Even length palindrome
    }
    return res[0];
  }
}
