// #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2024_10_01_Time_313_ms_(89.36%)_Space_148.6_MB_(78.72%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null) {
      return null;
    }
    int len = getLength(head);
    return reverse(head, len);
  }

  // Function to get the length of the linked list
  int getLength(ListNode? curr) {
    int cnt = 0;
    while (curr != null) {
      cnt++;
      curr = curr.next;
    }
    return cnt;
  }

  // Recursive function to reverse pairs of nodes
  ListNode? reverse(ListNode? head, int len) {
    // Base case: if less than 2 nodes, no need to swap
    if (len < 2) {
      return head;
    }
    ListNode? curr = head;
    ListNode? prev;
    ListNode? next;
    prev = null;

    // Reverse the first two nodes
    for (int i = 0; i < 2; i++) {
      next = curr!.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }

    // Recursively reverse the rest of the list
    head!.next = reverse(curr, len - 2);
    return prev;
  }
}
