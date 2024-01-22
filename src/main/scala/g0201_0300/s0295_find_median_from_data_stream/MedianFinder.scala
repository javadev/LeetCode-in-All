package g0201_0300.s0295_find_median_from_data_stream

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Design
// #Heap_Priority_Queue #Data_Stream #Big_O_Time_O(n*log_n)_Space_O(n)
// #2023_11_08_Time_1690_ms_(83.33%)_Space_96.2_MB_(8.33%)

import scala.collection.mutable

class MedianFinder() {
    private val maxHeap = mutable.PriorityQueue.empty[Int]
    private val minHeap = mutable.PriorityQueue.empty[Int](Ordering.Int.reverse)

    def addNum(num: Int): Unit = {
        maxHeap += num
        minHeap += maxHeap.dequeue()

        if (maxHeap.size < minHeap.size)
            maxHeap += minHeap.dequeue()
    }

    def findMedian(): Double = {
        if (maxHeap.size > minHeap.size)
            maxHeap.head
        else
            (maxHeap.head + minHeap.head).toDouble / 2
    }
}

/*
 * Your MedianFinder object will be instantiated and called as such:
 * var obj = new MedianFinder()
 * obj.addNum(num)
 * var param_2 = obj.findMedian()
 */
