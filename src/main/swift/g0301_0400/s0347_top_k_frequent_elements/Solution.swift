// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Sorting #Heap_Priority_Queue #Counting
// #Divide_and_Conquer #Quickselect #Bucket_Sort #Data_Structure_II_Day_20_Heap_Priority_Queue
// #Big_O_Time_O(n*log(n))_Space_O(k) #2024_07_02_Time_26_ms_(93.78%)_Space_17.8_MB_(29.79%)

import HeapModule

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        struct FreqElement: Comparable {
            let val: Int
            let freq: Int

            static func < (lhs: FreqElement, rhs: FreqElement) -> Bool {
                lhs.freq < rhs.freq
            }

            static func == (lhs: FreqElement, rhs: FreqElement) -> Bool {
                lhs.freq == rhs.freq
            }
        }
        var freqMap = [Int: Int]()
        for num in nums {
            freqMap[num, default: 0] += 1
        }
        var freqHeap = Heap<FreqElement>()
        for (key, value) in freqMap {
            freqHeap.insert(.init(val: key, freq: value))
            if freqHeap.count > k {
                freqHeap.removeMin()
            }
        }
        var res = [Int]()
        while let element = freqHeap.popMax() {
            res.append(element.val)
        }
        return res
    }
}
