package g0701_0800.s0739_daily_temperatures

// #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #Programming_Skills_II_Day_6
// #Big_O_Time_O(n)_Space_O(n) #2023_11_09_Time_931_ms_(97.30%)_Space_69.2_MB_(97.30%)

object Solution {
    def dailyTemperatures(temperatures: Array[Int]): Array[Int] = {
        val sol = new Array[Int](temperatures.length)
        sol(temperatures.length - 1) = 0
        for (i <- (sol.length - 2) to 0 by -1) {
            var j = i + 1
            while (j < sol.length) {
                if (temperatures(i) < temperatures(j)) {
                    sol(i) = j - i
                    j = sol.length // exit loop
                } else {
                    if (sol(j) == 0) {
                        j = sol.length // exit loop
                    } else {
                        j += sol(j)
                    }
                }
            }
        }
        sol
    }
}
