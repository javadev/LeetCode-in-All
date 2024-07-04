2\. Add Two Numbers

Medium

You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order**, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/10/02/addtwonumber1.jpg)

**Input:** l1 = [2,4,3], l2 = [5,6,4]

**Output:** [7,0,8]

**Explanation:** 342 + 465 = 807. 

**Example 2:**

**Input:** l1 = [0], l2 = [0]

**Output:** [0] 

**Example 3:**

**Input:** l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]

**Output:** [8,9,9,9,0,0,0,1] 

**Constraints:**

*   The number of nodes in each linked list is in the range `[1, 100]`.
*   `0 <= Node.val <= 9`
*   It is guaranteed that the list represents a number that does not have leading zeros.

To solve the Add Two Numbers problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `ListNode` class to represent nodes in a linked list.
2. Define a `Solution` class with a method named `addTwoNumbers`.
3. Inside the `addTwoNumbers` method, traverse both input linked lists simultaneously:
   - Keep track of a carry variable to handle cases where the sum of two digits exceeds 9.
   - Calculate the sum of the current nodes' values along with the carry.
   - Update the carry for the next iteration.
   - Create a new node with the sum % 10 and attach it to the result linked list.
   - Move to the next nodes in both input lists.
4. After finishing the traversal, check if there is any remaining carry. If so, add a new node with the carry to the result.
5. Return the head of the result linked list.

Here's the implementation:

```swift
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addNumbers(l1, l2, 0)
    }

    func addNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carryOver: Int) -> ListNode? {
        guard !(l1 == nil && l2 == nil && carryOver == 0 ) else { return nil }
        let sum = ( l1?.val ?? 0 ) + ( l2?.val ?? 0 ) + carryOver 
        let carryOver = sum / 10 
        let value = sum % 10 
        return ListNode(value, addNumbers(l1?.next, l2?.next, carryOver))
    }
}
```

This implementation provides a solution to the Add Two Numbers problem using linked lists in Swift.