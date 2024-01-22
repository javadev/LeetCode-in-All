package g0001_0100.s0007_reverse_integer

// #Medium #Top_Interview_Questions #Math #Udemy_Integers
// #2023_11_09_Time_405_ms_(90.16%)_Space_52.3_MB_(31.15%)

object Solution {
    def reverse(x: Int): Int = {
        var rev: Long = 0
        var remaining = x
        while (remaining != 0) {
            rev = (rev * 10) + (remaining % 10)
            remaining /= 10
        }
        if (rev > Integer.MAX_VALUE || rev < Integer.MIN_VALUE) {
            return 0
        }
        rev.toInt
    }
}
