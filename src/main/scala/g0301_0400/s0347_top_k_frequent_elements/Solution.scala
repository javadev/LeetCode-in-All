package g0301_0400.s0347_top_k_frequent_elements

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting
// #Heap_Priority_Queue #Counting #Divide_and_Conquer #Quickselect #Bucket_Sort
// #Data_Structure_II_Day_20_Heap_Priority_Queue #Big_O_Time_O(n*log(n))_Space_O(k)
// #2023_11_08_Time_589_ms_(93.24%)_Space_59.4_MB_(72.97%)

import scala.collection.mutable

object Solution {
    def topKFrequent(nums: Array[Int], k: Int): Array[Int] = {
        val freqMap = mutable.HashMap.empty[Int, Int]
        for (n <- nums) {
            freqMap.put(n, freqMap.getOrElse(n, 0) + 1)
        }
        val bucket = new Array[List[Int]](nums.length + 1)
        for ((key, freq) <- freqMap) {
            Option(bucket(freq)) match {
                case Some(value) => bucket.update(freq, key :: value)
                case None => bucket.update(freq, List(key))
            }
        }
        val res = new Array[Int](k)
        var counter = 0
        var pos = bucket.length - 1
        while (pos >= 0 && counter < k) {
            if (bucket(pos) != null) {
                for (integer <- bucket(pos)) {
                    res(counter) = integer
                    counter += 1
                }
            }
            pos -= 1
        }
        res
    }
}
