package g0101_0200.s0141_linked_list_cycle

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_I_Day_7_Linked_List #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(1)
// #2023_11_04_Time_503_ms_(84.25%)_Space_55.9_MB_(33.07%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(var _x: Int = 0) {
 *   var next: ListNode = null
 *   var x: Int = _x
 * }
 */
object Solution {
    def hasCycle(head: ListNode): Boolean = {
        if (head == null) {
            return false
        }
        var fast = head.next
        var slow = head
        while (fast != null && fast.next != null) {
            if (fast == slow) {
                return true
            }
            fast = fast.next.next
            slow = slow.next
        }
        false
    }
}
