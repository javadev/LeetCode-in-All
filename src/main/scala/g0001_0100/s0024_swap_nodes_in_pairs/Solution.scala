package g0001_0100.s0024_swap_nodes_in_pairs

// #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2023_10_30_Time_441_ms_(95.65%)_Space_56.9_MB_(52.17%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def swapPairs(head: ListNode): ListNode = {
        if (head == null) {
            return null
        }
        val len = getLength(head)
        reverse(head, len)
    }

    private def getLength(curr: ListNode): Int = {
        var cnt = 0
        var current = curr
        while (current != null) {
            cnt += 1
            current = current.next
        }
        cnt
    }

    private def reverse(head: ListNode, len: Int): ListNode = {
        if (len < 2) {
            return head
        }
        var curr = head
        var prev: ListNode = null
        var next: ListNode = null
        for (i <- 0 until 2) {
            next = curr.next
            curr.next = prev
            prev = curr
            curr = next
        }
        head.next = reverse(curr, len - 2)
        prev
    }
}
