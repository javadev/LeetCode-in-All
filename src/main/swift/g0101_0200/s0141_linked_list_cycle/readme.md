141\. Linked List Cycle

Easy

Given `head`, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Internally, `pos` is used to denote the index of the node that tail's `next` pointer is connected to. **Note that `pos` is not passed as a parameter**.

Return `true` _if there is a cycle in the linked list_. Otherwise, return `false`.

**Example 1:**

![](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)

**Input:** head = [3,2,0,-4], pos = 1

**Output:** true

**Explanation:** There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed). 

**Example 2:**

![](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)

**Input:** head = [1,2], pos = 0

**Output:** true

**Explanation:** There is a cycle in the linked list, where the tail connects to the 0th node. 

**Example 3:**

![](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)

**Input:** head = [1], pos = -1

**Output:** false

**Explanation:** There is no cycle in the linked list. 

**Constraints:**

*   The number of the nodes in the list is in the range <code>[0, 10<sup>4</sup>]</code>.
*   <code>-10<sup>5</sup> <= Node.val <= 10<sup>5</sup></code>
*   `pos` is `-1` or a **valid index** in the linked-list.

**Follow up:** Can you solve it using `O(1)` (i.e. constant) memory?

To solve the "Linked List Cycle" problem, we can use the Floyd's Tortoise and Hare algorithm. This algorithm uses two pointers moving at different speeds to detect if a cycle exists in the linked list. Here’s a step-by-step guide and the Swift implementation of the solution.

### Steps to Solve the Problem

1. **Initialization:**
   - Define two pointers, `slow` and `fast`, both starting at the head of the linked list.

2. **Traversal and Cycle Detection:**
   - Move the `slow` pointer one step at a time.
   - Move the `fast` pointer two steps at a time.
   - If there is a cycle, the `fast` pointer will eventually meet the `slow` pointer.
   - If the `fast` pointer reaches the end of the list (i.e., `fast` or `fast.next` becomes `nil`), there is no cycle in the linked list.

3. **Return Result:**
   - If the `fast` pointer meets the `slow` pointer, return `true` indicating a cycle.
   - If the `fast` pointer reaches the end, return `false`.

### Swift Implementation

Here’s the implementation of the `Solution` class using the Floyd's Tortoise and Hare algorithm:

```swift
// Definition for singly-linked list.
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // Initialize slow and fast pointers
        var slow = head
        var fast = head
        
        // Traverse the linked list
        while fast != nil && fast?.next != nil {
            slow = slow?.next         // Move slow pointer one step
            fast = fast?.next?.next   // Move fast pointer two steps
            
            // Check if slow and fast pointers meet
            if slow === fast {
                return true
            }
        }
        
        // If we reach here, there is no cycle
        return false
    }
}
```

### Explanation of the Swift Code

1. **Initialization:**
   - The `ListNode` class defines the structure of a node in the linked list.
   - The `Solution` class contains the `hasCycle` method which checks for a cycle.

2. **Traversal and Cycle Detection:**
   - The `while` loop continues as long as `fast` and `fast?.next` are not `nil`.
   - The `slow` pointer is moved one step (`slow = slow?.next`).
   - The `fast` pointer is moved two steps (`fast = fast?.next?.next`).

3. **Cycle Detection:**
   - If the `slow` pointer and `fast` pointer meet (`if slow === fast`), it indicates there is a cycle, and the method returns `true`.
   - If the loop exits because `fast` or `fast?.next` is `nil`, it means there is no cycle, and the method returns `false`.

This approach ensures that we use constant space (`O(1)`) while efficiently detecting the presence of a cycle in the linked list.