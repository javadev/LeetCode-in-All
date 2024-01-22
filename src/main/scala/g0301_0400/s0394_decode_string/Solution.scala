package g0301_0400.s0394_decode_string

// #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(n) #2023_11_09_Time_449_ms_(50.00%)_Space_56.5_MB_(45.45%)

object Solution {
    def decodeString(s: String): String = {
        val brStack = scala.collection.mutable.Stack[Int]()
        val stStack = scala.collection.mutable.Stack[String]()
        stStack.push("")
        var i = 0
        while (i < s.length) {
            if (s(i) - '0' <= 9) {
                var j = ""
                while (s(i) != '[') {
                    j += s(i)
                    i += 1
                }
                brStack.push(j.toInt)
                stStack.push("")
            } else if (s(i) == ']') {
                val o = brStack.pop()
                val o1 = stStack.pop()
                var r = ""
                for (_ <- 0 until o) r += o1
                stStack.push(stStack.pop() + r)
            } else {
                stStack.push(stStack.pop() + s(i))
            }
            i += 1
        }
        stStack.pop()
    }
}
