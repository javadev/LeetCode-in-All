24\. Swap Nodes in Pairs

Medium

Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/03/swap_ex1.jpg)

**Input:** head = [1,2,3,4]

**Output:** [2,1,4,3] 

**Example 2:**

**Input:** head = []

**Output:** [] 

**Example 3:**

**Input:** head = [1]

**Output:** [1] 

**Constraints:**

*   The number of nodes in the list is in the range `[0, 100]`.
*   `0 <= Node.val <= 100`

To solve the "Swap Nodes in Pairs" problem in Swift with a `Solution` class, we can traverse the linked list while swapping pairs of nodes. Here are the steps:

1. Define a `Solution` class.
2. Define a method named `swapPairs` that takes the head of a linked list as input and returns the head of the modified list.
3. Create a dummy ListNode object and set its `next` pointer to the head of the input list. This dummy node will serve as the new head of the modified list.
4. Initialize three pointers: `prev`, `first`, and `second`.
5. Iterate through the list while `first` and `second` are not null:
   - Assign `first` to the `next` pointer of `prev`.
   - Assign `second` to the `next` pointer of `first`.
   - Assign the `next` pointer of `prev` to the `next` pointer of `second`.
   - Assign the `next` pointer of `second` to `first`.
   - Move `prev` to `first`.
   - Move `first` to `first.next` (which is the next pair of nodes).
6. Return the `next` pointer of the dummy node, which points to the head of the modified list.

Here's the implementation:

```swift
/*
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
public class Solution {
    public func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        let len = getLength(head)
        return reverse(head, len)
    }

    private func getLength(_ curr: ListNode?) -> Int {
        var cnt = 0
        var curr = curr
        while curr != nil {
            cnt += 1
            curr = curr?.next
        }
        return cnt
    }

    private func reverse(_ head: ListNode?, _ len: Int) -> ListNode? {
        if len < 2 {
            return head
        }
        var curr = head
        var prev: ListNode? = nil
        var next: ListNode?
        for _ in 0..<2 {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        head?.next = reverse(curr, len - 2)
        return prev
    }
}
```

This implementation provides a solution to the "Swap Nodes in Pairs" problem in Swift without modifying the values in the list's nodes.