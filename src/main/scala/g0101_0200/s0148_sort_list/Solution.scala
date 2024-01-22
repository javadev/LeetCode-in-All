package g0101_0200.s0148_sort_list

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
// #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Big_O_Time_O(log(N))_Space_O(log(N))
// #2023_11_04_Time_745_ms_(75.00%)_Space_68.2_MB_(75.00%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def sortList(head: ListNode): ListNode = {
        if (head == null || head.next == null) {
            return head
        }
        val (first, second) = splitList(head)
        mergeLists(sortList(first), sortList(second))
    }

    def splitList(head: ListNode): (ListNode, ListNode) = {
        var slow = head
        var fast = head
        var pre = slow
        while (fast != null && fast.next != null) {
            pre = slow
            slow = slow.next
            fast = fast.next.next
        }
        pre.next = null
        (head, slow)
    }

    private def mergeLists(first: ListNode, second: ListNode): ListNode = {
        val res = new ListNode(0)
        var cur = res
        var (firstPtr, secondPtr) = (first, second)

        while (firstPtr != null || secondPtr != null) {
            if (firstPtr != null && (secondPtr == null || firstPtr.x <= secondPtr.x)) {
                cur.next = firstPtr
                firstPtr = firstPtr.next
            } else {
                cur.next = secondPtr
                secondPtr = secondPtr.next
            }
            cur = cur.next
        }

        res.next
    }
}
