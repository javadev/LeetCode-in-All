package g0201_0300.s0239_sliding_window_maximum

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Heap_Priority_Queue
// #Sliding_Window #Queue #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
// #2023_11_07_Time_1149_ms_(86.67%)_Space_83.5_MB_(46.67%)

object Solution {
    def maxSlidingWindow(nums: Array[Int], k: Int): Array[Int] = {
        val q = new java.util.ArrayDeque[(Int, Int)]()

        def populate(num: Int, index: Int): Unit = {
            while (!q.isEmpty && q.peekLast()._2 + k <= index) {
                q.pollLast()
            }
            while (!q.isEmpty && (q.peekFirst()._1 <= num)) {
                q.pollFirst()
            }
            q.addFirst((num, index))
        }

        if (k == 1) {
            nums
        } else {
            for (i <- (0 until k - 1)) {
                populate(nums(i), i)
            }
            ((k - 1) until nums.size).map { i =>
                populate(nums(i), i)
                q.peekLast()._1
            }.toArray
        }
    }
}
