// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
// #Data_Structure_I_Day_8_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
// #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(1)
// #2024_12_17_Time_0_ms_(100.00%)_Space_51.5_MB_(86.35%)

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var reverseList = function(head) {
    let prev = null
    let curr = head

    while (curr !== null) {
        let next = curr.next
        curr.next = prev
        prev = curr
        curr = next
    }

    return prev
};

export { reverseList }
