package g0001_0100.s0046_permutations

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
// #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
// #Udemy_Backtracking/Recursion #Big_O_Time_O(n*n!)_Space_O(n+n!)
// #2023_10_31_Time_470_ms_(92.31%)_Space_56.6_MB_(41.03%)

object Solution {
    def permute(nums: Array[Int]): List[List[Int]] = {
        if (nums == null || nums.isEmpty) {
            return List()
        }

        val finalResult = new scala.collection.mutable.ListBuffer[List[Int]]()
        val used = Array.fill[Boolean](nums.length)(false)

        def permuteRecur(currResult: scala.collection.mutable.ListBuffer[Int]): Unit = {
            if (currResult.size == nums.length) {
                finalResult += currResult.toList
                return
            }

            for (i <- nums.indices) {
                if (!used(i)) {
                    currResult += nums(i)
                    used(i) = true
                    permuteRecur(currResult)
                    used(i) = false
                    currResult.remove(currResult.size - 1)
                }
            }
        }

        permuteRecur(new scala.collection.mutable.ListBuffer[Int]())
        finalResult.toList
    }
}
