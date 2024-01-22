package g0101_0200.s0160_intersection_of_two_linked_lists

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_II_Day_11_Linked_List #Udemy_Linked_List #Big_O_Time_O(M+N)_Space_O(1)
// #2023_11_05_Time_564_ms_(96.43%)_Space_59.1_MB_(10.71%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(var _x: Int = 0) {
 *   var next: ListNode = null
 *   var x: Int = _x
 * }
 */
object Solution {
    def getIntersectionNode(headA: ListNode, headB: ListNode): ListNode = {
        var node1 = headA
        var node2 = headB

        while (node1 != node2) {
            node1 = if (node1 == null) headB else node1.next
            node2 = if (node2 == null) headA else node2.next
        }

        node1
    }
}
