// #Hard #Top_100_Liked_Questions #Sorting #Two_Pointers #Design #Heap_Priority_Queue #Data_Stream
// #Big_O_Time_O(n*log_n)_Space_O(n) #2024_07_02_Time_671_ms_(91.08%)_Space_22.7_MB_(68.15%)

import HeapModule

class MedianFinder {
    var leftHeap: Heap<Int>
    var rightHeap: Heap<Int>

    init() {
        leftHeap = []
        rightHeap = []
    }
    
    func addNum(_ num: Int) {
        leftHeap.insert(num)
        while let rightMin = rightHeap.min, rightMin < leftHeap.max! {
            leftHeap.insert(rightHeap.removeMin())
            rightHeap.insert(leftHeap.removeMax())
        }
        let mid = (leftHeap.count + rightHeap.count) / 2
        while rightHeap.count < mid {
            rightHeap.insert(leftHeap.removeMax())
        }
    }
    
    func findMedian() -> Double {
        let count = leftHeap.count + rightHeap.count
        if count % 2 == 0 {
            return Double(leftHeap.max! + rightHeap.min!) / 2
        } else {
            return Double(leftHeap.max!)
        }
    }
}

/*
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
