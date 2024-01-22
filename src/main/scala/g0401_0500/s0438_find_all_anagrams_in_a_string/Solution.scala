package g0401_0500.s0438_find_all_anagrams_in_a_string

// #Medium #Top_100_Liked_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_II_Day_5_Sliding_Window #Programming_Skills_II_Day_12
// #Level_1_Day_12_Sliding_Window/Two_Pointer #Big_O_Time_O(n+m)_Space_O(1)
// #2023_11_08_Time_576_ms_(100.00%)_Space_55.6_MB_(100.00%)

object Solution {
    def findAnagrams(s: String, p: String): List[Int] = {
        val map = new Array[Int](26)
        for (i <- 0 until p.length) {
            map(p.charAt(i) - 'a') += 1
        }
        var res = List[Int]()
        var i = 0
        var j = 0
        while (i < s.length) {
            val idx = s.charAt(i) - 'a'
            map(idx) -= 1
            if (i >= p.length) {
                map(s.charAt(j) - 'a') += 1
                j += 1
            }
            var finish = true
            for (k <- 0 until 26) {
                if (map(k) != 0) {
                    finish = false
                }
            }
            if (i >= p.length - 1 && finish) {
                res = j :: res
            }
            i += 1
        }
        res.reverse
    }
}
