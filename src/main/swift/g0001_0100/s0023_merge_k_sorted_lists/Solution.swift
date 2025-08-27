// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Heap_Priority_Queue #Linked_List
// #Divide_and_Conquer #Merge_Sort #Top_Interview_150_Divide_and_Conquer
// #Big_O_Time_O(k*n*log(k))_Space_O(log(k)) #2024_06_19_Time_25_ms_(94.57%)_Space_17.3_MB_(6.09%)

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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var array: [Int] = []
        let node = ListNode(0)

        for list in lists {
            var head: ListNode? = list
            while head != nil {
                array.append(head!.val)
                head = head?.next
            }
        }
        
        if !array.isEmpty {
            array.sort()
        
            var link = ListNode(array[0])
            node.next = link

            for i in array.dropFirst() {
                link.next =  ListNode(i)
                if let next = link.next {
                    link = next
                }
            }
        }
        
        return node.next
    }
}
