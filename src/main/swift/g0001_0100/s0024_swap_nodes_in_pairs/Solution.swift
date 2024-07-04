// #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2024_06_19_Time_0_ms_(100.00%)_Space_15.8_MB_(10.29%)

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
public class Solution {
    public func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        let len = getLength(head)
        return reverse(head, len)
    }

    private func getLength(_ curr: ListNode?) -> Int {
        var cnt = 0
        var curr = curr
        while curr != nil {
            cnt += 1
            curr = curr?.next
        }
        return cnt
    }

    private func reverse(_ head: ListNode?, _ len: Int) -> ListNode? {
        if len < 2 {
            return head
        }
        var curr = head
        var prev: ListNode? = nil
        var next: ListNode?
        for _ in 0..<2 {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        head?.next = reverse(curr, len - 2)
        return prev
    }
}
