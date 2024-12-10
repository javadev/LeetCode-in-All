// #Hard #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_13_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(k)
// #2024_12_04_Time_0_ms_(100.00%)_Space_53.3_MB_(54.66%)

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
const reverseKGroup = function (head, k) {
    if (head === null || head.next === null || k === 1) {
        return head
    }

    let len = head
    let count = 0

    // Check if there are at least k nodes to reverse
    while (count < k) {
        if (len === null) {
            return head
        }
        len = len.next
        count++
    }

    // Reverse the first k nodes
    let current = head
    let next = null
    let prev = null
    let i = 0

    while (i < k) {
        next = current.next
        current.next = prev
        prev = current
        current = next
        i++
    }

    // Recursively reverse the next groups and connect the lists
    head.next = reverseKGroup(next, k)

    return prev
};

export { reverseKGroup }
