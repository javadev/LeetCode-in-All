// #Medium #Top_100_Liked_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_II_Day_10_Linked_List #Level_1_Day_4_Linked_List #Udemy_Linked_List
// #Big_O_Time_O(N)_Space_O(1) #2024_12_15_Time_58_ms_(92.76%)_Space_53.1_MB_(68.46%)

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val
 *     this.next = null
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
    if (head === null || head.next === null) {
        return null
    }

    let slow = head
    let fast = head

    while (fast !== null && fast.next !== null) {
        fast = fast.next.next
        slow = slow.next

        // If slow and fast pointers meet, cycle is detected.
        if (slow === fast) {
            break
        }
    }

    if (fast === null || fast.next === null) {
        return null
    }

    slow = head
    while (slow !== fast) {
        slow = slow.next
        fast = fast.next
    }

    return slow
};

export { detectCycle }
