// #Hard #Top_Interview_Questions #String #Dynamic_Programming #Recursion #Udemy_Dynamic_Programming
// #Big_O_Time_O(m*n)_Space_O(m*n) #2024_09_30_Time_341_ms_(81.82%)_Space_148.7_MB_(72.73%)

class Solution {
  List<List<bool?>>? cache;

  bool isMatch(String s, String p) {
    // Initialize the cache with null values, similar to Boolean[][] in Java
    cache = List.generate(s.length + 1, (_) => List.filled(p.length + 1, null));
    return isMatchHelper(s, p, 0, 0);
  }

  bool isMatchHelper(String s, String p, int i, int j) {
    // If pattern is fully traversed, check if string is fully matched
    if (j == p.length) {
      return i == s.length;
    }

    // Return cached result if available
    if (cache![i][j] != null) {
      return cache![i][j]!;
    }

    // Check if first characters match (either the same or the pattern has '.')
    bool firstMatch = i < s.length && (s[i] == p[j] || p[j] == '.');

    bool result;

    // Handle '*' wildcard in the pattern
    if (j + 1 < p.length && p[j + 1] == '*') {
      result = (firstMatch && isMatchHelper(s, p, i + 1, j)) ||
          isMatchHelper(s, p, i, j + 2);
    } else {
      result = firstMatch && isMatchHelper(s, p, i + 1, j + 1);
    }

    // Store the result in the cache
    cache![i][j] = result;
    return result;
  }
}
