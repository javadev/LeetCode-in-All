package g0101_0200.s0142_linked_list_cycle_ii

// #Medium #Top_100_Liked_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_II_Day_10_Linked_List #Level_1_Day_4_Linked_List #Udemy_Linked_List
// #Big_O_Time_O(N)_Space_O(1) #2023_11_04_Time_501_ms_(61.54%)_Space_55.8_MB_(46.15%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(var _x: Int = 0) {
 *   var next: ListNode = null
 *   var x: Int = _x
 * }
 */
object Solution {
    def detectCycle(head: ListNode): ListNode = {
        def getIntersect: Option[ListNode] = {
            var slow = head
            var fast = head

            while (fast != null && fast.next != null) {
                slow = slow.next
                fast = fast.next.next
                if (fast == slow) return Some(slow)
            }
            None
        }

        getIntersect match {
            case None => null
            case node => {
                var ptr1 = head
                var ptr2 = node.get

                while (ptr1 != ptr2) {
                    ptr1 = ptr1.next
                    ptr2 = ptr2.next
                }
                ptr1
            }
        }
    }
}
