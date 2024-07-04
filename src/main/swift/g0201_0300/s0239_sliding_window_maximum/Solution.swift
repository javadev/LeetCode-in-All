// #Hard #Top_100_Liked_Questions #Array #Heap_Priority_Queue #Sliding_Window #Queue
// #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
// #2024_07_01_Time_776_ms_(99.48%)_Space_27.7_MB_(56.25%)

import Collections

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int]
    {
        // monontonic decreasing queue, storing indexes of nums        
        var queue = Deque<Int>() 
        var ans: [Int] = []
        for i in 0..<nums.count
        {
            // mantain window size no bigger then k
            while !queue.isEmpty && i - queue.first! >= k {
                queue.removeFirst()
            }
            
            // mantain queue monotonic decreasing
            while !queue.isEmpty && nums[queue.last!] < nums[i] {
                queue.removeLast()
            }
            queue.append(i)
            
            if i >= k-1 {
                ans.append(nums[queue.first!]) // max value in window
            }
        }
        return ans
    }
}
