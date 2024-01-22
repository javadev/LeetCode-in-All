package g0001_0100.s0049_group_anagrams

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
// #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
// #Big_O_Time_O(n*k_log_k)_Space_O(n) #2023_10_31_Time_618_ms_(91.67%)_Space_61.7_MB_(51.85%)

import scala.collection.mutable.{ArrayBuffer, Map}

object Solution {
    def groupAnagrams(strs: Array[String]): List[List[String]] = {
        val hm = Map[String, ArrayBuffer[String]]()

        for (s <- strs) {
            val ch = s.toCharArray
            ch.sortInPlace()
            val temp = new String(ch)
            hm.getOrElseUpdate(temp, ArrayBuffer.empty[String]) += s
        }

        hm.values.map(_.toList).toList
    }
}
