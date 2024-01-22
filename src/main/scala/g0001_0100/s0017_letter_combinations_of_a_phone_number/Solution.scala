package g0001_0100.s0017_letter_combinations_of_a_phone_number

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
// #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(4^n)_Space_O(n) #2023_10_29_Time_459_ms_(58.54%)_Space_54_MB_(92.68%)

import scala.collection.mutable.ListBuffer

object Solution {
    def letterCombinations(digits: String): List[String] = {
        if (digits.isEmpty) {
            return List.empty
        }

        val letters = Array("", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz")
        val ans = ListBuffer[String]()

        def findCombinations(start: Int, nums: String, letters: Array[String], curr: StringBuilder): Unit = {
            if (curr.length == nums.length) {
                ans += curr.toString()
                return
            }
            for (i <- start until nums.length) {
                val n = nums(i).asDigit
                for (j <- 0 until letters(n).length) {
                    val ch = letters(n)(j)
                    curr.append(ch)
                    findCombinations(i + 1, nums, letters, curr)
                    curr.deleteCharAt(curr.length - 1)
                }
            }
        }

        findCombinations(0, digits, letters, new StringBuilder())
        ans.toList
    }
}
