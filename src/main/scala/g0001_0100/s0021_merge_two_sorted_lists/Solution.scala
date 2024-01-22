package g0001_0100.s0021_merge_two_sorted_lists

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
// #Data_Structure_I_Day_7_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
// #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(m+n)_Space_O(m+n)
// #2023_10_29_Time_480_ms_(89.72%)_Space_56.7_MB_(93.46%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def mergeTwoLists(l1: ListNode, l2: ListNode): ListNode = {
        var list: ListNode = new ListNode(-1)
        val head: ListNode = list
        var l1Temp: ListNode = l1
        var l2Temp: ListNode = l2
        while (l1Temp != null || l2Temp != null) {
            if (l1Temp != null && l2Temp != null) {
                if (l1Temp.x <= l2Temp.x) {
                    list.next = new ListNode(l1Temp.x)
                    l1Temp = l1Temp.next
                } else {
                    list.next = new ListNode(l2Temp.x)
                    l2Temp = l2Temp.next
                }
            } else if (l1Temp != null) {
                list.next = new ListNode(l1Temp.x)
                l1Temp = l1Temp.next
            } else {
                list.next = new ListNode(l2Temp.x)
                l2Temp = l2Temp.next
            }
            list = list.next
        }
        head.next
    }
}
