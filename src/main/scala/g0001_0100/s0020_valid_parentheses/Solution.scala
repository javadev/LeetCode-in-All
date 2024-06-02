package g0001_0100.s0020_valid_parentheses

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
// #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2024_06_01_Time_587_ms_(69.29%)_Space_58.3_MB_(60.63%)

import scala.collection.mutable.Stack
import scala.util.control.Breaks._

object Solution {
    def isValid(s: String): Boolean = {
        val stack = Stack[Char]()
        var result = true

        breakable {
            for (i <- 0 until s.length) {
                val c = s.charAt(i)
                if (c == '(' || c == '[' || c == '{') {
                    stack.push(c)
                } else if (c == ')' && stack.nonEmpty && stack.top == '(') {
                    stack.pop()
                } else if (c == '}' && stack.nonEmpty && stack.top == '{') {
                    stack.pop()
                } else if (c == ']' && stack.nonEmpty && stack.top == '[') {
                    stack.pop()
                } else {
                    result = false
                    break()
                }
            }
        }

        result && stack.isEmpty
    }
}
