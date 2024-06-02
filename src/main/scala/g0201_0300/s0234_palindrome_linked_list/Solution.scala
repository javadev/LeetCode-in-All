package g0201_0300.s0234_palindrome_linked_list

// #Easy #Top_100_Liked_Questions #Two_Pointers #Stack #Linked_List #Recursion
// #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2024_06_02_Time_912_ms_(100.00%)_Space_72_MB_(48.57%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def isPalindrome(head: ListNode): Boolean = {
        if (head == null || head.next == null) {
            return true
        }
        def reverseList(node: ListNode): ListNode = {
            var prev: ListNode = null
            var current: ListNode = node
            while (current != null) {
                val nextNode = current.next
                current.next = prev
                prev = current
                current = nextNode
            }
            prev
        }

        def findMiddle(node: ListNode): ListNode = {
            var slow = node
            var fast = node
            while (fast != null && fast.next != null) {
                slow = slow.next
                fast = fast.next.next
            }
            slow
        }

        val middle = findMiddle(head)
        var secondHalf = reverseList(middle)

        var firstHalf = head
        while (secondHalf != null) {
            if (firstHalf.x != secondHalf.x) {
                return false
            }
            firstHalf = firstHalf.next
            secondHalf = secondHalf.next
        }
        true
    }
}
