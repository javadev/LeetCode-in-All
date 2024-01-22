package g0001_0100.s0084_largest_rectangle_in_histogram

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Stack #Monotonic_Stack
// #Big_O_Time_O(n_log_n)_Space_O(log_n) #2023_11_02_Time_904_ms_(71.43%)_Space_77.5_MB_(35.71%)

object Solution {
    def largestRectangleArea(heights: Array[Int]): Int = {
        largestArea(heights, 0, heights.length)
    }

    private def largestArea(a: Array[Int], start: Int, limit: Int): Int = {
        if (a == null || a.isEmpty) {
            return 0
        }
        if (start == limit) {
            return 0
        }
        if (limit - start == 1) {
            return a(start)
        }
        if (limit - start == 2) {
            val maxOfTwoBars = math.max(a(start), a(start + 1))
            val areaFromTwo = math.min(a(start), a(start + 1)) * 2
            return math.max(maxOfTwoBars, areaFromTwo)
        }
        if (checkIfSorted(a, start, limit)) {
            var maxWhenSorted = 0
            for (i <- start until limit) {
                if (a(i) * (limit - i) > maxWhenSorted) {
                    maxWhenSorted = a(i) * (limit - i)
                }
            }
            return maxWhenSorted
        } else {
            val minInd = findMinInArray(a, start, limit)
            maxOfThreeNums(
                largestArea(a, start, minInd),
                a(minInd) * (limit - start),
                largestArea(a, minInd + 1, limit)
            )
        }
    }

    private def findMinInArray(a: Array[Int], start: Int, limit: Int): Int = {
        var min = Int.MaxValue
        var minIndex = -1
        for (index <- start until limit) {
            if (a(index) < min) {
                min = a(index)
                minIndex = index
            }
        }
        minIndex
    }

    private def checkIfSorted(a: Array[Int], start: Int, limit: Int): Boolean = {
        for (i <- start + 1 until limit) {
            if (a(i) < a(i - 1)) {
                return false
            }
        }
        true
    }

    private def maxOfThreeNums(a: Int, b: Int, c: Int): Int = {
        math.max(math.max(a, b), c)
    }
}
