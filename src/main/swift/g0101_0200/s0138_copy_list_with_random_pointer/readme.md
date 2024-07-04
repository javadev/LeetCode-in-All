138\. Copy List with Random Pointer

Medium

A linked list of length `n` is given such that each node contains an additional random pointer, which could point to any node in the list, or `null`.

Construct a [**deep copy**](https://en.wikipedia.org/wiki/Object_copying#Deep_copy) of the list. The deep copy should consist of exactly `n` **brand new** nodes, where each new node has its value set to the value of its corresponding original node. Both the `next` and `random` pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. **None of the pointers in the new list should point to nodes in the original list**.

For example, if there are two nodes `X` and `Y` in the original list, where `X.random --> Y`, then for the corresponding two nodes `x` and `y` in the copied list, `x.random --> y`.

Return _the head of the copied linked list_.

The linked list is represented in the input/output as a list of `n` nodes. Each node is represented as a pair of `[val, random_index]` where:

*   `val`: an integer representing `Node.val`
*   `random_index`: the index of the node (range from `0` to `n-1`) that the `random` pointer points to, or `null` if it does not point to any node.

Your code will **only** be given the `head` of the original linked list.

**Example 1:**

![](https://assets.leetcode.com/uploads/2019/12/18/e1.png)

**Input:** head = [[7,null],[13,0],[11,4],[10,2],[1,0]]

**Output:** [[7,null],[13,0],[11,4],[10,2],[1,0]] 

**Example 2:**

![](https://assets.leetcode.com/uploads/2019/12/18/e2.png)

**Input:** head = [[1,1],[2,1]]

**Output:** [[1,1],[2,1]] 

**Example 3:**

**![](https://assets.leetcode.com/uploads/2019/12/18/e3.png)**

**Input:** head = [[3,null],[3,0],[3,null]]

**Output:** [[3,null],[3,0],[3,null]] 

**Example 4:**

**Input:** head = []

**Output:** []

**Explanation:** The given linked list is empty (null pointer), so return null. 

**Constraints:**

*   `0 <= n <= 1000`
*   `-10000 <= Node.val <= 10000`
*   `Node.random` is `null` or is pointing to some node in the linked list.

To solve the "Copy List with Random Pointer" problem in Swift with a `Solution` class, we'll use a HashMap to maintain a mapping between the original nodes and their corresponding copied nodes. Below are the steps:

1. **Create a `Solution` class**: Define a class named `Solution` to encapsulate our solution methods.

2. **Create a `copyRandomList` method**: This method takes the head node of the original linked list as input and returns the head node of the copied linked list.

3. **Initialize a HashMap**: Create a HashMap named `nodeMap` to store the mapping between original nodes and their corresponding copied nodes.

4. **Create a deep copy of the list**: Iterate through the original linked list and create a deep copy of each node. For each node `originalNode` in the original linked list:
   - Create a new node `copyNode` with the same value as `originalNode`.
   - Put the mapping between `originalNode` and `copyNode` in the `nodeMap`.
   - Set the `copyNode`'s `next` and `random` pointers accordingly.
   - Attach the `copyNode` to the copied linked list.

5. **Return the head of the copied linked list**: After creating the deep copy of the entire list, return the head node of the copied linked list.

Here's the Swift implementation:

```swift
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
```

This implementation follows the steps outlined above and efficiently constructs a deep copy of the linked list with random pointers in Swift.