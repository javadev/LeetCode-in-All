// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
// #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
// #Top_Interview_150_Linked_List #Big_O_Time_O(max(N,M))_Space_O(max(N,M))
// #AI_can_be_used_to_solve_the_task #2024_06_17_Time_17_ms_(76.59%)_Space_15.7_MB_(14.57%)

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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addNumbers(l1, l2, 0)
    }

    func addNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carryOver: Int) -> ListNode? {
        guard !(l1 == nil && l2 == nil && carryOver == 0 ) else { return nil }
        let sum = ( l1?.val ?? 0 ) + ( l2?.val ?? 0 ) + carryOver 
        let carryOver = sum / 10 
        let value = sum % 10 
        return ListNode(value, addNumbers(l1?.next, l2?.next, carryOver))
    }
}
