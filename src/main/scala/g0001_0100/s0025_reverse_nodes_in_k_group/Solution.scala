package g0001_0100.s0025_reverse_nodes_in_k_group

// #Hard #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_13_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(k)
// #2023_10_30_Time_520_ms_(80.00%)_Space_58_MB_(50.00%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def reverseKGroup(head: ListNode, k: Int): ListNode = {
        if (head == null || head.next == null || k == 1) {
            return head
        }
        var j = 0
        var len = head
        // Loop for checking the length of the linked list; if the linked list is less than k, then return as it is.
        while (j < k) {
            if (len == null) {
                return head
            }
            len = len.next
            j += 1
        }
        // Reverse linked list logic applied here.
        var c = head
        var n: ListNode = null
        var prev: ListNode = null
        var i = 0
        // Traverse the while loop for K times to reverse the nodes in K groups.
        while (i != k) {
            n = c.next
            c.next = prev
            prev = c
            c = n
            i += 1
        }
        // head.x is pointing to the next K group linked list; recursion for further remaining linked list.
        head.next = reverseKGroup(n, k)
        prev
    }
}
