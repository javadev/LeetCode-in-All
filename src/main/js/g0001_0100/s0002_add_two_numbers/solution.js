// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
// #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
// #Top_Interview_150_Linked_List #Big_O_Time_O(max(N,M))_Space_O(max(N,M))
// #AI_can_be_used_to_solve_the_task #2024_11_29_Time_3_ms_(81.61%)_Space_55.3_MB_(96.39%)

import { ListNode } from 'src/main/js/com_github_leetcode/listnode'

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function (l1, l2) {
    const dummyHead = new ListNode(0)
    let p = l1,
        q = l2,
        curr = dummyHead
    let carry = 0

    while (p !== null || q !== null) {
        const x = p !== null ? p.val : 0
        const y = q !== null ? q.val : 0
        const sum = carry + x + y
        carry = Math.floor(sum / 10)
        curr.next = new ListNode(sum % 10)
        curr = curr.next

        if (p !== null) p = p.next
        if (q !== null) q = q.next
    }

    if (carry > 0) {
        curr.next = new ListNode(carry)
    }

    return dummyHead.next
}

export { addTwoNumbers }
