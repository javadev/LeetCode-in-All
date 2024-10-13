// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
// #Data_Structure_I_Day_8_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
// #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(1)
// #2024_10_08_Time_311_ms_(90.21%)_Space_151.9_MB_(10.49%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? curr = head;
    ListNode? prev = null;
    while (curr != null) {
      ListNode? Next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = Next;
    }
    return prev;
  }
}
