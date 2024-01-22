package g0201_0300.s0234_palindrome_linked_list

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Stack #Linked_List
// #Recursion #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2023_11_07_Time_811_ms_(85.71%)_Space_67.7_MB_(78.57%)

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
        var len = 0
        var right = head

        // Calculate the length
        while (right != null) {
            right = right.next
            len += 1
        }

        // Reverse the right half of the list
        len = len / 2
        right = head
        for (_ <- 0 until len) {
            right = right.next
        }

        var prev: ListNode = null
        while (right != null) {
            val next = right.next
            right.next = prev
            prev = right
            right = next
        }
        var head2 = head
        // Compare left half and right half
        for (_ <- 0 until len) {
            if (prev != null && head2.x == prev.x) {
                head2 = head2.next
                prev = prev.next
            } else {
                return false
            }
        }

        true
    }
}
