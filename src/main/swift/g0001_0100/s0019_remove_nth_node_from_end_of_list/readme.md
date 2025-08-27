19\. Remove Nth Node From End of List

Medium

Given the `head` of a linked list, remove the `nth` node from the end of the list and return its head.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)

**Input:** head = [1,2,3,4,5], n = 2

**Output:** [1,2,3,5] 

**Example 2:**

**Input:** head = [1], n = 1

**Output:** [] 

**Example 3:**

**Input:** head = [1,2], n = 1

**Output:** [1] 

**Constraints:**

*   The number of nodes in the list is `sz`.
*   `1 <= sz <= 30`
*   `0 <= Node.val <= 100`
*   `1 <= n <= sz`

**Follow up:** Could you do this in one pass?

To solve the Remove Nth Node From End of List problem in Swift with a `Solution` class, we'll follow these steps:

1. Define a `ListNode` class representing the nodes of the linked list.
2. Define a `Solution` class with a method named `removeNthFromEnd` that takes the head of the linked list and an integer `n` as input and returns the head of the modified list.
3. Create two pointers, `fast` and `slow`, and initialize them to point to the head of the list.
4. Move the `fast` pointer `n` steps forward in the list.
5. If the `fast` pointer reaches the end of the list (`fast == null`), it means that `n` is equal to the length of the list. In this case, remove the head node by returning `head.next`.
6. Move both `fast` and `slow` pointers simultaneously until the `fast` pointer reaches the end of the list.
7. At this point, the `slow` pointer will be pointing to the node just before the node to be removed.
8. Remove the `nth` node by updating the `next` reference of the node pointed to by the `slow` pointer to skip the `nth` node.
9. Return the head of the modified list.

Here's the implementation:

```swift
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard ((head?.next) != nil), n > 0 else {return nil}
        var count = 0
        var current = head
        while let currentNode = current{
            count += 1
            current = currentNode.next
        }
        current = head
        count = count - n + 1
        var prev: ListNode?
        while let currentNode = current {
            count -= 1
            if count == 0 {
                if prev == nil {
                    current = current?.next
                    return current
                } else {
                    prev?.next = current?.next
                }
                break
            }
            prev = current
            current = current?.next
        }
        return head
    }
}
```

This implementation provides a solution to the Remove Nth Node From End of List problem in Swift.