// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_II_Day_11_Linked_List #Udemy_Linked_List #Big_O_Time_O(M+N)_Space_O(1)
// #2024_12_16_Time_68_ms_(93.67%)_Space_58.1_MB_(73.26%)

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
    let node1 = headA
    let node2 = headB

    while (node1 !== node2) {
        node1 = node1 === null ? headB : node1.next
        node2 = node2 === null ? headA : node2.next
    }

    return node1
};

export { getIntersectionNode }
