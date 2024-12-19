// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Linked_List
// #Programming_Skills_II_Day_14 #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(N)
// #2024_12_15_Time_43_ms_(97.07%)_Space_51.1_MB_(34.27%)

import { Node } from '../../com_github_leetcode/node'

/**
 * // Definition for a _Node.
 * function _Node(val, next, random) {
 *    this.val = val;
 *    this.next = next;
 *    this.random = random;
 * };
 */

/**
 * @param {_Node} head
 * @return {_Node}
 */
var copyRandomList = function(head) {
    if (head === null) {
        return null
    }

    // First pass: Clone each node and link it to the original node's next
    let curr = head
    while (curr !== null) {
        const clonedNode = new Node(curr.val)
        clonedNode.next = curr.next
        curr.next = clonedNode
        curr = clonedNode.next
    }

    // Second pass: Set the random pointers for the cloned nodes
    curr = head
    while (curr !== null) {
        if (curr.random !== null) {
            curr.next.random = curr.random.next
        } else {
            curr.next.random = null
        }
        curr = curr.next.next
    }

    // Third pass: Restore the original list and extract the cloned list
    curr = head
    let newHead = head.next
    while (curr !== null) {
        const clonedNode = curr.next
        curr.next = clonedNode.next
        if (curr.next !== null) {
            clonedNode.next = curr.next.next
        } else {
            clonedNode.next = null
        }
        curr = curr.next
    }

    return newHead
};

export { copyRandomList }
