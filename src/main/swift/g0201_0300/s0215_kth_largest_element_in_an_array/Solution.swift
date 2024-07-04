// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Heap_Priority_Queue
// #Divide_and_Conquer #Quickselect #Data_Structure_II_Day_20_Heap_Priority_Queue
// #Big_O_Time_O(n*log(n))_Space_O(log(n)) #2024_06_30_Time_225_ms_(82.41%)_Space_19.6_MB_(37.22%)

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted()
        return sortedNums[sortedNums.count - k]
    }
}
