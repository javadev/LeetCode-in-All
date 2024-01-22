package g0001_0100.s0002_add_two_numbers

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
// #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
// #Big_O_Time_O(max(N,M))_Space_O(max(N,M))
// #2023_10_17_Time_571_ms_(75.12%)_Space_58.8_MB_(68.16%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def addTwoNumbers(l1: ListNode, l2: ListNode): ListNode = {
        val dummyHead = new ListNode(0)
        var p = l1
        var q = l2
        var curr = dummyHead
        var carry = 0
        while (p != null || q != null) {
            val x = if (p != null) p.x else 0
            val y = if (q != null) q.x else 0
            val sum = carry + x + y
            carry = sum / 10
            curr.next = new ListNode(sum % 10)
            curr = curr.next
            if (p != null) p = p.next
            if (q != null) q = q.next
        }
        if (carry > 0) {
            curr.next = new ListNode(carry)
        }
        dummyHead.next
    }
}
