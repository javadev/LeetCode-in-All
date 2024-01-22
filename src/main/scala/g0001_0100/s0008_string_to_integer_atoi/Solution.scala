package g0001_0100.s0008_string_to_integer_atoi

// #Medium #Top_Interview_Questions #String #2023_11_09_Time_441_ms_(100.00%)_Space_54.7_MB_(67.86%)

object Solution {
    @SuppressWarnings(Array("scala:S3776"))
    def myAtoi(str: String): Int = {
        if (str == null || str.isEmpty) {
            return 0
        }

        var i = 0
        var negativeSign = false
        val input = str.toCharArray

        while (i < input.length && input(i) == ' ') {
            i += 1
        }

        if (i == input.length) {
            return 0
        } else if (input(i) == '+') {
            i += 1
        } else if (input(i) == '-') {
            i += 1
            negativeSign = true
        }

        var num = 0
        while (i < input.length && input(i) <= '9' && input(i) >= '0') {
            // current char
            val temp = input(i) - '0'
            val tempValue = if (negativeSign) -temp else temp

            // avoid invalid numbers like 038
            if (num == 0 && tempValue == 0) {
                i += 1
            } else if (num == Integer.MIN_VALUE / 10 && tempValue <= -8 || num < Integer.MIN_VALUE / 10) {
                return Integer.MIN_VALUE
            } else if (num == Integer.MAX_VALUE / 10 && tempValue >= 7 || num > Integer.MAX_VALUE / 10) {
                return Integer.MAX_VALUE
            } else {
                num = num * 10 + tempValue
                i += 1
            }
        }

        num
    }
}
