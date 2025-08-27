// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Linked_List
// #Programming_Skills_II_Day_14 #Udemy_Linked_List #Top_Interview_150_Linked_List
// #Big_O_Time_O(N)_Space_O(N) #2024_06_27_Time_13_ms_(98.58%)_Space_17.6_MB_(53.77%)

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */
class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else {
            return nil
        }
        
        var curr: Node? = head
        
        // First pass: create cloned nodes and insert them next to their originals
        while curr != nil {
            let clonedNode = Node(curr!.val)
            clonedNode.next = curr!.next
            curr!.next = clonedNode
            curr = clonedNode.next
        }
        
        curr = head
        
        // Second pass: assign random pointers for the cloned nodes
        while curr != nil {
            if let random = curr!.random {
                curr!.next!.random = random.next
            }
            curr = curr!.next!.next
        }
        
        curr = head
        var newHead: Node? = head.next
        
        // Third pass: restore the original list and extract the cloned list
        while curr != nil {
            let clonedNode = curr!.next
            curr!.next = clonedNode?.next
            if let nextOriginal = curr!.next {
                clonedNode?.next = nextOriginal.next
            } else {
                clonedNode?.next = nil
            }
            curr = curr!.next
        }
        return newHead
    }
}
