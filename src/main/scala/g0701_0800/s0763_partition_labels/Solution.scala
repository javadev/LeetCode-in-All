package g0701_0800.s0763_partition_labels

// #Medium #Top_100_Liked_Questions #String #Hash_Table #Greedy #Two_Pointers
// #Data_Structure_II_Day_7_String #Big_O_Time_O(n)_Space_O(1)
// #2023_11_09_Time_442_ms_(100.00%)_Space_54.8_MB_(80.00%)

object Solution {
    def partitionLabels(s: String): List[Int] = {
        val letters = s.toCharArray
        val result = new scala.collection.mutable.ListBuffer[Int]()
        val position = new Array[Int](26)

        for (i <- 0 until letters.length) {
            position(letters(i) - 'a') = i
        }

        var i = 0
        var prev = -1
        var max = 0

        while (i < letters.length) {
            if (position(letters(i) - 'a') > max) {
                max = position(letters(i) - 'a')
            }
            if (i == max) {
                result += (i - prev)
                prev = i
            }
            i += 1
        }

        result.toList
    }
}
