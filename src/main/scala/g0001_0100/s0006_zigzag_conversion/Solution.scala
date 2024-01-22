package g0001_0100.s0006_zigzag_conversion

// #Medium #String #2023_11_09_Time_542_ms_(85.71%)_Space_55.7_MB_(90.48%)

import scala.collection.mutable

object Solution {
    def convert(s: String, numRows: Int): String = {
        if (numRows == 1) return s
        val map = new mutable.HashMap[Int, String]()
        var string = ""
        var counter = 0
        var counterBool = true
        for (i <- s) {
            val currentValue = map.getOrElse(counter, "")
            map(counter) = currentValue + i.toString
            counterBool = if (counter == numRows - 1) false else if (counter == 0) true else counterBool
            counter = if (counterBool) counter + 1 else counter - 1
        }
        map.foreach {
            case (_, value) => string += value
        }
        string
    }
}
