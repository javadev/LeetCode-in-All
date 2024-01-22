package g0001_0100.s0022_generate_parentheses

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n) #2023_10_29_Time_380_ms_(100.00%)_Space_53.4_MB_(84.85%)

import scala.collection.mutable.ListBuffer

object Solution {
    def generateParenthesis(n: Int): List[String] = {
        val sb = new StringBuilder()
        val ans = ListBuffer[String]()
        generate(sb, ans, n, n).toList
    }

    private def generate(sb: StringBuilder, str: ListBuffer[String], open: Int, close: Int): ListBuffer[String] = {
        if (open == 0 && close == 0) {
            str += sb.toString()
            return str
        }
        if (open > 0) {
            sb.append('(')
            generate(sb, str, open - 1, close)
            sb.deleteCharAt(sb.length - 1)
        }
        if (close > 0 && open < close) {
            sb.append(')')
            generate(sb, str, open, close - 1)
            sb.deleteCharAt(sb.length - 1)
        }
        str
    }
}
