// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
// #Data_Structure_I_Day_7_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
// #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(m+n)_Space_O(m+n)
// #2024_06_18_Time_3_ms_(96.41%)_Space_15.9_MB_(6.39%)

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode()
        var current = dummy
        
        var copied1 = list1
        var copied2 = list2
        
        while let node1 = copied1, let node2 = copied2 {
            if node1.val <= node2.val {
                current.next = node1
                copied1 = node1.next
            } else {
                current.next = node2
                copied2 = node2.next
            }
            current = current.next!
        }
        if let copied1 = copied1 {
            current.next = copied1
        } else {
            current.next = copied2
        }
        
        return dummy.next
    }
}
