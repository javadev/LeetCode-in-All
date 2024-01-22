package g0001_0100.s0076_minimum_window_substring

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Level_2_Day_14_Sliding_Window/Two_Pointer #Big_O_Time_O(s.length())_Space_O(1)
// #2023_11_02_Time_453_ms_(100.00%)_Space_54.7_MB_(100.00%)

object Solution {
    def minWindow(s: String, t: String): String = {
        val map = new Array[Int](128)
        t.foreach(char => map(char - 'A') += 1)

        var count = t.length
        var begin = 0
        var end = 0
        var d = Int.MaxValue
        var head = 0

        while (end < s.length) {
            if (map(s.charAt(end) - 'A') > 0) {
                count -= 1
            }
            map(s.charAt(end) - 'A') -= 1
            end += 1

            while (count == 0) {
                if (end - begin < d) {
                    d = end - begin
                    head = begin
                }
                if (map(s.charAt(begin) - 'A') == 0) {
                    count += 1
                }
                map(s.charAt(begin) - 'A') += 1
                begin += 1
            }
        }

        if (d == Int.MaxValue) "" else s.substring(head, head + d)
    }
}
