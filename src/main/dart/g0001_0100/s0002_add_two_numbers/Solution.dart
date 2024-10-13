// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
// #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
// #Big_O_Time_O(max(N,M))_Space_O(max(N,M)) #AI_can_be_used_to_solve_the_task
// #2024_09_28_Time_386_ms_(97.18%)_Space_151.9_MB_(38.24%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode(0);
    ListNode? p = l1;
    ListNode? q = l2;
    ListNode curr = dummyHead;
    int carry = 0;

    while (p != null || q != null) {
      int x = (p != null) ? p.val : 0;
      int y = (q != null) ? q.val : 0;
      int sum = carry + x + y;
      carry = sum ~/ 10;
      curr.next = ListNode(sum % 10);
      curr = curr.next!;

      if (p != null) p = p.next;
      if (q != null) q = q.next;
    }

    if (carry > 0) {
      curr.next = ListNode(carry);
    }

    return dummyHead.next!;
  }
}
