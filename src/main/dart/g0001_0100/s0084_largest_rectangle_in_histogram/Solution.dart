// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Stack #Monotonic_Stack
// #Big_O_Time_O(n_log_n)_Space_O(log_n) #2024_10_06_Time_370_ms_(100.00%)_Space_184.6_MB_(88.89%)

class Solution {
  int largestRectangleArea(List<int> heights) {
    return largestArea(heights, 0, heights.length);
  }

  int largestArea(List<int> a, int start, int limit) {
    if (a.isEmpty) {
      return 0;
    }
    if (start == limit) {
      return 0;
    }
    if (limit - start == 1) {
      return a[start];
    }
    if (limit - start == 2) {
      int maxOfTwoBars = a[start] > a[start + 1] ? a[start] : a[start + 1];
      int areaFromTwo = (a[start] < a[start + 1] ? a[start] : a[start + 1]) * 2;
      return maxOfThreeNums(maxOfTwoBars, areaFromTwo, 0);
    }
    if (checkIfSorted(a, start, limit)) {
      int maxWhenSorted = 0;
      for (int i = start; i < limit; i++) {
        if (a[i] * (limit - i) > maxWhenSorted) {
          maxWhenSorted = a[i] * (limit - i);
        }
      }
      return maxWhenSorted;
    } else {
      int minInd = findMinInArray(a, start, limit);
      return maxOfThreeNums(
          largestArea(a, start, minInd),
          a[minInd] * (limit - start),
          largestArea(a, minInd + 1, limit));
    }
  }

  int findMinInArray(List<int> a, int start, int limit) {
    int min = a[start];
    int minIndex = start;
    for (int index = start + 1; index < limit; index++) {
      if (a[index] < min) {
        min = a[index];
        minIndex = index;
      }
    }
    return minIndex;
  }

  bool checkIfSorted(List<int> a, int start, int limit) {
    for (int i = start + 1; i < limit; i++) {
      if (a[i] < a[i - 1]) {
        return false;
      }
    }
    return true;
  }

  int maxOfThreeNums(int a, int b, int c) {
    return a > b ? (a > c ? a : c) : (b > c ? b : c);
  }
}
