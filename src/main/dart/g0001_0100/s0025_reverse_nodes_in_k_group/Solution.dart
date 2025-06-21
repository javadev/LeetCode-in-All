// #Hard #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_13_Linked_List
// #Udemy_Linked_List #Top_Interview_150_Linked_List #Big_O_Time_O(n)_Space_O(k)
// #2024_10_01_Time_357_ms_(73.33%)_Space_153.5_MB_(6.67%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    if (head == null || head.next == null || k == 1) {
      return head;
    }

    int j = 0;
    ListNode? len = head;
    // Check if the linked list has fewer than `k` nodes, return the list as is.
    while (j < k) {
      if (len == null) {
        return head;
      }
      len = len.next;
      j++;
    }

    // Reverse `k` nodes.
    ListNode? current = head;
    ListNode? next;
    ListNode? prev = null;
    int i = 0;

    // Traverse and reverse the nodes in groups of `k`.
    while (i < k) {
      next = current!.next;
      current.next = prev;
      prev = current;
      current = next;
      i++;
    }

    // Recursively reverse the next `k` group of nodes.
    head!.next = reverseKGroup(current, k);

    // Return the new head of the reversed list.
    return prev;
  }
}
