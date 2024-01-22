package g0001_0100.s0056_merge_intervals

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
// #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
// #Big_O_Time_O(n_log_n)_Space_O(n) #2023_10_31_Time_583_ms_(90.91%)_Space_60.2_MB_(90.91%)

object Solution {
    def merge(intervals: Array[Array[Int]]): Array[Array[Int]] = {
        // Sort intervals based on the start values.
        val sortedIntervals = intervals.sortBy(_(0))
        val list = new collection.mutable.ListBuffer[Array[Int]]
        var current = sortedIntervals(0)
        list += current

        for (i <- 1 until sortedIntervals.length) {
            val next = sortedIntervals(i)
            if (current(1) >= next(0)) {
                // Merge overlapping intervals by updating the end value.
                current(1) = math.max(current(1), next(1))
            } else {
                current = next
                list += current
            }
        }

        list.toArray
    }
}
