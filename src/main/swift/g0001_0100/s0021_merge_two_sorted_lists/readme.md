21\. Merge Two Sorted Lists

Easy

Merge two sorted linked lists and return it as a **sorted** list. The list should be made by splicing together the nodes of the first two lists.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/03/merge_ex1.jpg)

**Input:** l1 = [1,2,4], l2 = [1,3,4]

**Output:** [1,1,2,3,4,4] 

**Example 2:**

**Input:** l1 = [], l2 = []

**Output:** [] 

**Example 3:**

**Input:** l1 = [], l2 = [0]

**Output:** [0] 

**Constraints:**

*   The number of nodes in both lists is in the range `[0, 50]`.
*   `-100 <= Node.val <= 100`
*   Both `l1` and `l2` are sorted in **non-decreasing** order.

To solve the Merge Two Sorted Lists problem in Swift with a `Solution` class, we'll implement a recursive approach. Here are the steps:

1. Define a `ListNode` class to represent a node in the linked list.
2. Define a `Solution` class with a method named `mergeTwoLists` that takes two linked lists `l1` and `l2` as input and returns a merged sorted list.
3. The base case for the recursion is when either `l1` or `l2` is null. In this case, return the non-null list because it's already sorted.
4. Compare the values of the heads of `l1` and `l2`. Let `head` be the smaller value of the two heads.
5. Recursively call `mergeTwoLists` with the next node of the smaller head and the other list that remained unchanged.
6. Update the `next` pointer of the smaller head to point to the result of the recursive call.
7. Return the smaller head, which is the merged sorted list.

Here's the implementation:

```swift
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode()
        var current = dummy
        
        var copied1 = list1
        var copied2 = list2
        
        while let node1 = copied1, let node2 = copied2 {
            if node1.val <= node2.val {
                current.next = node1
                copied1 = node1.next
            } else {
                current.next = node2
                copied2 = node2.next
            }
            current = current.next!
        }
        if let copied1 = copied1 {
            current.next = copied1
        } else {
            current.next = copied2
        }
        
        return dummy.next
    }
}
```

This implementation provides a solution to the Merge Two Sorted Lists problem in Swift using a recursive approach.