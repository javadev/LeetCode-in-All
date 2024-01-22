package g0001_0100.s0023_merge_k_sorted_lists

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Heap_Priority_Queue #Linked_List
// #Divide_and_Conquer #Merge_Sort #Big_O_Time_O(k*n*log(k))_Space_O(log(k))
// #2023_10_30_Time_549_ms_(94.74%)_Space_59.6_MB_(89.47%)

import com_github_leetcode.ListNode

/*
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def mergeKLists(lists: Array[ListNode]): ListNode = {
        if (lists.isEmpty) {
            null
        } else {
            mergeKLists(lists, 0, lists.length)
        }
    }

    def mergeKLists(lists: Array[ListNode], leftIndex: Int, rightIndex: Int): ListNode = {
        if (rightIndex > leftIndex + 1) {
            val mid = (leftIndex + rightIndex) / 2
            val left = mergeKLists(lists, leftIndex, mid)
            val right = mergeKLists(lists, mid, rightIndex)
            mergeTwoLists(left, right)
        } else {
            lists(leftIndex)
        }
    }

    @SuppressWarnings(Array("scala:S1871"))
    def mergeTwoLists(left: ListNode, right: ListNode): ListNode = {
        if (left == null) {
            right
        } else if (right == null) {
            left
        } else {
            var res: ListNode = null
            var (l, r) = (left, right)
            if (l.x <= r.x) {
                res = l
                l = l.next
            } else {
                res = r
                r = r.next
            }
            var node = res
            while (l != null || r != null) {
                if (l == null) {
                    node.next = r
                    r = r.next
                } else if (r == null) {
                    node.next = l
                    l = l.next
                } else if (l.x <= r.x) {
                    node.next = l
                    l = l.next
                } else {
                    node.next = r
                    r = r.next
                }
                node = node.next
            }
            res
        }
    }
}
