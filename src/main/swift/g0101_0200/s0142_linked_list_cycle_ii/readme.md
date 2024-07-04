142\. Linked List Cycle II

Medium

Given the `head` of a linked list, return _the node where the cycle begins. If there is no cycle, return_ `null`.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Internally, `pos` is used to denote the index of the node that tail's `next` pointer is connected to (**0-indexed**). It is `-1` if there is no cycle. **Note that** `pos` **is not passed as a parameter**.

**Do not modify** the linked list.

**Example 1:**

![](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)

**Input:** head = [3,2,0,-4], pos = 1

**Output:** tail connects to node index 1

**Explanation:** There is a cycle in the linked list, where tail connects to the second node. 

**Example 2:**

![](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)

**Input:** head = [1,2], pos = 0

**Output:** tail connects to node index 0

**Explanation:** There is a cycle in the linked list, where tail connects to the first node. 

**Example 3:**

![](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)

**Input:** head = [1], pos = -1

**Output:** no cycle

**Explanation:** There is no cycle in the linked list. 

**Constraints:**

*   The number of the nodes in the list is in the range <code>[0, 10<sup>4</sup>]</code>.
*   <code>-10<sup>5</sup> <= Node.val <= 10<sup>5</sup></code>
*   `pos` is `-1` or a **valid index** in the linked-list.

**Follow up:** Can you solve it using `O(1)` (i.e. constant) memory?

To solve the "Linked List Cycle II" problem, we need to find the node where the cycle begins in a linked list, if there is a cycle. We'll use Floyd's Tortoise and Hare algorithm to detect the cycle and then determine the starting node of the cycle.

### Steps to Solve the Problem

1. **Cycle Detection:**
   - Use two pointers, `slow` and `fast`, to detect if a cycle exists. Both pointers start at the head of the linked list.
   - Move `slow` one step at a time and `fast` two steps at a time.
   - If `slow` and `fast` meet, a cycle exists.

2. **Finding the Start of the Cycle:**
   - If a cycle is detected, initialize another pointer, `start`, at the head of the list.
   - Move both `start` and `slow` one step at a time.
   - The point where they meet is the start of the cycle.

3. **Return Result:**
   - If no cycle is detected, return `nil`.
   - If a cycle is detected, return the node where `start` and `slow` meet.

### Swift Implementation

Here’s the Swift implementation of the `Solution` class:

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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        
        var slow = head
        var fast = head
        
        // Cycle detection
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                // Cycle detected, now find the start of the cycle
                var start = head
                while start !== slow {
                    start = start?.next
                    slow = slow?.next
                }
                return start
            }
        }
        
        // No cycle detected
        return nil
    }
}
```

### Explanation of the Swift Code

1. **Initialization:**
   - The `ListNode` class defines the structure of a node in the linked list.
   - The `Solution` class contains the `detectCycle` method which finds the start of the cycle if it exists.

2. **Cycle Detection:**
   - Initialize `slow` and `fast` pointers to the head of the linked list.
   - Use a `while` loop to move `slow` one step and `fast` two steps at a time.
   - If `slow` and `fast` meet, a cycle is detected.

3. **Finding the Start of the Cycle:**
   - If a cycle is detected, initialize `start` at the head of the list.
   - Move both `start` and `slow` one step at a time until they meet.
   - The meeting point is the start of the cycle.

4. **Return Result:**
   - If no cycle is detected, the function returns `nil`.
   - If a cycle is detected, the function returns the node where `start` and `slow` meet.

This approach ensures that we detect the cycle efficiently and find the starting node of the cycle using constant space (`O(1)` memory), adhering to the problem constraints.