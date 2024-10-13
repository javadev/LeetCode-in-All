// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Heap_Priority_Queue #Linked_List
// #Divide_and_Conquer #Merge_Sort #Big_O_Time_O(k*n*log(k))_Space_O(log(k))
// #2024_10_01_Time_366_ms_(94.59%)_Space_155.9_MB_(35.14%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) {
      return null;
    }
    return mergeKListsHelper(lists, 0, lists.length);
  }

  ListNode? mergeKListsHelper(List<ListNode?> lists, int leftIndex,
      int rightIndex) {
    if (rightIndex > leftIndex + 1) {
      int mid = (leftIndex + rightIndex) ~/ 2;
      ListNode? left = mergeKListsHelper(lists, leftIndex, mid);
      ListNode? right = mergeKListsHelper(lists, mid, rightIndex);
      return mergeTwoLists(left, right);
    } else {
      return lists[leftIndex];
    }
  }

  ListNode? mergeTwoLists(ListNode? left, ListNode? right) {
    if (left == null) {
      return right;
    }
    if (right == null) {
      return left;
    }

    ListNode? res;
    if (left.val <= right.val) {
      res = left;
      left = left.next;
    } else {
      res = right;
      right = right.next;
    }

    ListNode? node = res;
    while (left != null || right != null) {
      if (left == null) {
        node!.next = right;
        right = right!.next;
      } else if (right == null) {
        node!.next = left;
        left = left.next;
      } else {
        if (left.val <= right.val) {
          node!.next = left;
          left = left.next;
        } else {
          node!.next = right;
          right = right.next;
        }
      }
      node = node!.next;
    }
    return res;
  }
}
