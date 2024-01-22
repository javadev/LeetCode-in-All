package g0001_0100.s0020_valid_parentheses

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
// #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2023_10_29_Time_449_ms_(65.58%)_Space_56.6_MB_(22.33%)

import scala.collection.mutable.Stack

object Solution {
    def isValid(s: String): Boolean = {
        val stack = Stack[Char]()

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
                return false
            }
        }

        stack.isEmpty
    }
}
