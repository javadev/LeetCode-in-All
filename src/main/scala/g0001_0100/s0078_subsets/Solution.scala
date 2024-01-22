package g0001_0100.s0078_subsets

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
// #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n*2^n) #2023_11_02_Time_452_ms_(87.50%)_Space_55.3_MB_(18.75%)

object Solution {
    def subsets(nums: Array[Int]): List[List[Int]] = {
        val res = new scala.collection.mutable.ListBuffer[List[Int]]
        solve(nums, List.empty[Int], res, 0)
        res.toList
    }

    private def solve(nums: Array[Int], temp: List[Int], res: scala.collection.mutable.ListBuffer[List[Int]], start: Int): Unit = {
        res += temp
        for (i <- start until nums.length) {
            solve(nums, nums(i) :: temp, res, i + 1)
        }
    }
}
