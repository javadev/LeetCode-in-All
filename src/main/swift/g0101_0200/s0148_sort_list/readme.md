148\. Sort List

Medium

Given the `head` of a linked list, return _the list after sorting it in **ascending order**_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/09/14/sort_list_1.jpg)

**Input:** head = [4,2,1,3]

**Output:** [1,2,3,4] 

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/09/14/sort_list_2.jpg)

**Input:** head = [-1,5,3,4,0]

**Output:** [-1,0,3,4,5] 

**Example 3:**

**Input:** head = []

**Output:** [] 

**Constraints:**

*   The number of nodes in the list is in the range <code>[0, 5 * 10<sup>4</sup>]</code>.
*   <code>-10<sup>5</sup> <= Node.val <= 10<sup>5</sup></code>

**Follow up:** Can you sort the linked list in `O(n logn)` time and `O(1)` memory (i.e. constant space)?

To solve the "Sort List" problem, we need to sort a linked list in ascending order. The follow-up requirement is to achieve this in \( O(n \log n) \) time complexity and \( O(1) \) space complexity. The best way to meet these requirements is to use the merge sort algorithm, which naturally fits the linked list structure.

### Steps to Solve the Problem

1. **Split the List:**
   - Use the fast and slow pointer technique to split the list into two halves.
   - The fast pointer moves two steps at a time while the slow pointer moves one step. When the fast pointer reaches the end, the slow pointer will be at the midpoint.

2. **Merge Sort Recursively:**
   - Recursively split the list until the base case of a single node or an empty list is reached.

3. **Merge Sorted Lists:**
   - Merge two sorted lists into one sorted list.

### Swift Implementation

Here’s the Swift implementation of the `Solution` class with merge sort:

```swift
// Definition for singly-linked list.
class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        // Base case: if the list is empty or has a single node, it's already sorted
        guard head != nil && head?.next != nil else {
            return head
        }
        
        // Step 1: Split the list into two halves
        let mid = getMiddle(head)
        let left = head
        let right = mid?.next
        mid?.next = nil
        
        // Step 2: Sort each half
        let sortedLeft = sortList(left)
        let sortedRight = sortList(right)
        
        // Step 3: Merge the sorted halves
        return merge(sortedLeft, sortedRight)
    }
    
    // Helper function to get the middle of the linked list
    private func getMiddle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    // Helper function to merge two sorted linked lists
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current.next = l1
                l1 = l1?.next
            } else {
                current.next = l2
                l2 = l2?.next
            }
            current = current.next!
        }
        
        if l1 != nil {
            current.next = l1
        } else if l2 != nil {
            current.next = l2
        }
        
        return dummy.next
    }
}
```

### Explanation of the Swift Code

1. **Initialization and Base Case:**
   - The `sortList` function checks if the list is empty or has only one node, in which case it is already sorted.

2. **Split the List:**
   - The `getMiddle` function uses the fast and slow pointer technique to find the middle of the linked list. It returns the node just before the midpoint to split the list into two halves.

3. **Recursively Sort Each Half:**
   - The `sortList` function calls itself recursively on the left and right halves of the list.

4. **Merge Sorted Lists:**
   - The `merge` function merges two sorted linked lists into one sorted list. It uses a dummy node to simplify the merging process and iterates through both lists, attaching nodes in ascending order.

5. **Returning the Sorted List:**
   - After merging the two sorted halves, the merged list is returned as the sorted list.

This implementation ensures \( O(n \log n) \) time complexity due to the divide-and-conquer approach of merge sort and \( O(1) \) space complexity (not counting the recursive stack space) since we are sorting the list in place.