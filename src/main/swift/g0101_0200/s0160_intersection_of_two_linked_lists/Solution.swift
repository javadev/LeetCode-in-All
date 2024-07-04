// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_II_Day_11_Linked_List #Udemy_Linked_List #Big_O_Time_O(M+N)_Space_O(1)
// #2024_06_28_Time_102_ms_(88.82%)_Space_17.3_MB_(28.57%)

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var node1 = headA
        var node2 = headB
        while node1 !== node2 {
            node1 = (node1 == nil) ? headB : node1?.next
            node2 = (node2 == nil) ? headA : node2?.next
        }
        return node1
    }
}
