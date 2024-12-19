// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_I_Day_7_Linked_List #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(1)
// #2024_12_15_Time_49_ms_(99.06%)_Space_53_MB_(64.12%)

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val
 *     this.next = null
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
    if (head === null) {
        return false
    }
    let fast = head.next
    let slow = head
    while (fast !== null && fast.next !== null) {
        if (fast === slow) {
            return true
        }
        fast = fast.next.next
        slow = slow.next
    }
    return false
};

export { hasCycle }
