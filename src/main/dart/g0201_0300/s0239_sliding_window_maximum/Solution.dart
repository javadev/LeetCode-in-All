// #Hard #Top_100_Liked_Questions #Array #Heap_Priority_Queue #Sliding_Window #Queue
// #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
// #2024_10_09_Time_440_ms_(100.00%)_Space_211.3_MB_(100.00%)

import 'dart:collection';

class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    int n = nums.length;
    List<int> res = List.filled(n - k + 1, 0);
    int x = 0;
    Queue<int> dq = Queue();
    int i = 0;
    int j = 0;

    while (j < nums.length) {
      // Remove elements from the deque that are smaller than the current element
      while (dq.isNotEmpty && dq.last < nums[j]) {
        dq.removeLast();
      }

      // Add the current element to the deque
      dq.addLast(nums[j]);

      // When the window size reaches k
      if (j - i + 1 == k) {
        // The element at the front of the deque is the largest in the current window
        res[x] = dq.first;
        x++;

        // If the element at the front of the deque is going out of the window, remove it
        if (dq.first == nums[i]) {
          dq.removeFirst();
        }

        // Slide the window to the right
        i++;
      }

      j++;
    }

    return res;
  }
}
