// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
// #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Top_Interview_150_Divide_and_Conquer
// #Big_O_Time_O(log(N))_Space_O(log(N)) #2024_06_27_Time_166_ms_(100.00%)_Space_22.4_MB_(5.26%)

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        // simple check for empty & 1 value heads
        if head?.next == nil { return head }
        // start of solution
        var sortedArr = [Int]()
        var newHead = head
        // add all of the values in a simple array
        while newHead != nil {
            if let val = newHead?.val {
                sortedArr.append(val)
            }
            newHead = newHead?.next
        }
        // sort descending to get the array reversed
        sortedArr = sortedArr.sorted { $0 > $1 }
        // reuse the old ListNode var to add a new Object inside it
        // which is the first one in the array
        newHead = ListNode(sortedArr.removeFirst() ?? 0)
        // append the rest of the array to the ListNode
        for item in sortedArr {
            let new = ListNode(item)
            new.next = newHead
            newHead = new
        }
        return newHead
    }
}
