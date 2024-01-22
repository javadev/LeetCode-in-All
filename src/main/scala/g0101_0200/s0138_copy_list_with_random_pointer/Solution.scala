package g0101_0200.s0138_copy_list_with_random_pointer

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Linked_List
// #Programming_Skills_II_Day_14 #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(N)
// #2023_11_04_Time_477_ms_(96.00%)_Space_56.6_MB_(61.00%)

import com_github_leetcode.random.Node

/*
 * Definition for a Node.
 * class Node(var _value: Int) {
 *   var value: Int = _value
 *   var next: Node = null
 *   var random: Node = null
 * }
 */
object Solution {
    def copyRandomList(head: Node): Node = {
        if (head == null) return null

        // First pass: Create cloned nodes and insert them next to the original nodes
        var curr = head
        while (curr != null) {
            val clonedNode = new Node(curr.value)
            clonedNode.next = curr.next
            curr.next = clonedNode
            curr = clonedNode.next
        }

        // Second pass: Update the random pointers of the cloned nodes
        curr = head
        while (curr != null) {
            if (curr.random != null) {
                curr.next.random = curr.random.next
            }
            curr = curr.next.next
        }

        // Third pass: Separate the original and cloned linked lists
        curr = head
        var newHead: Node = null
        while (curr != null) {
            val clonedNode =
                if (newHead == null) {
                    newHead = curr.next
                    newHead
                } else {
                    curr.next
                }
            curr.next = clonedNode.next
            if (curr.next != null) {
                clonedNode.next = curr.next.next
            }
            curr = curr.next
        }

        newHead
    }
}
