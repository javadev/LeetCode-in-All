// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Linked_List
// #Algorithm_I_Day_5_Two_Pointers #Level_2_Day_3_Linked_List #Top_Interview_150_Linked_List
// #Big_O_Time_O(L)_Space_O(L) #2024_12_03_Time_0_ms_(100.00%)_Space_51.2_MB_(27.67%)

import { ListNode } from '../../com_github_leetcode/listnode'

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} n
 * @return {ListNode}
 */
var removeNthFromEnd = function (head, n) {
    let nth = n

    function removeNth(node) {
        if (node.next === null) {
            return
        }
        removeNth(node.next)
        nth--
        if (nth === 0) {
            node.next = node.next.next
        }
    }

    const dummy = new ListNode(0, head)
    removeNth(dummy)
    return dummy.next
}

export { removeNthFromEnd }
