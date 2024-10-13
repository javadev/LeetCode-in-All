// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Linked_List
// #Algorithm_I_Day_5_Two_Pointers #Level_2_Day_3_Linked_List #Big_O_Time_O(L)_Space_O(L)
// #2024_09_30_Time_321_ms_(93.59%)_Space_149.9_MB_(42.31%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  int n = 0;

  ListNode? removeNthFromEnd(ListNode? head, int n) {
    this.n = n;
    ListNode dummy = ListNode(0, head); // Create a dummy node
    removeNth(dummy);
    return dummy.next; // Return the new head
  }

  void removeNth(ListNode? node) {
    if (node?.next == null) {
      return;
    }
    removeNth(node!.next); // Recursive call
    n--;

    if (n == 0) {
      node.next = node.next?.next; // Remove the N-th node
    }
  }
}
