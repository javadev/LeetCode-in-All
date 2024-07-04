// #Hard #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_13_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(k)
// #2024_06_19_Time_12_ms_(87.05%)_Space_15.9_MB_(48.20%)

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
    public func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 1 {
            return head
        }
        
        var len = head
        var j = 0
        while j < k {
            if len == nil {
                return head
            }
            len = len?.next
            j += 1
        }
        
        var c = head
        var n: ListNode? = nil
        var prev: ListNode? = nil
        var i = 0
        
        while i < k {
            n = c?.next
            c?.next = prev
            prev = c
            c = n
            i += 1
        }
        
        head?.next = reverseKGroup(c, k)
        return prev
    }
}
