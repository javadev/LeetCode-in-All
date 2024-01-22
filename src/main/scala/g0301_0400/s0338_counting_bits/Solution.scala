package g0301_0400.s0338_counting_bits

// #Easy #Top_100_Liked_Questions #Dynamic_Programming #Bit_Manipulation #Udemy_Bit_Manipulation
// #Big_O_Time_O(num)_Space_O(num) #2023_11_08_Time_447_ms_(92.68%)_Space_54.6_MB_(43.90%)

object Solution {
    def countBits(num: Int): Array[Int] = {
        val result = new Array[Int](num + 1)
        var borderPos = 1
        var incrPos = 1

        for (i <- 1 until result.length) {
            if (incrPos == borderPos) {
                result(i) = 1
                incrPos = 1
                borderPos = i
            } else {
                result(i) = 1 + result(incrPos)
                incrPos += 1
            }
        }

        result
    }
}
