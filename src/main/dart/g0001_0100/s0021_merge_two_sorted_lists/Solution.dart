// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
// #Data_Structure_I_Day_7_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
// #Level_1_Day_3_Linked_List #Udemy_Linked_List #Top_Interview_150_Linked_List
// #Big_O_Time_O(m+n)_Space_O(m+n) #2024_10_01_Time_333_ms_(81.94%)_Space_150.6_MB_(46.30%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    ListNode? dummy = ListNode(0);
    ListNode? cur = dummy;
    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        cur!.next = list1;
        list1 = list1.next;
      } else {
        cur!.next = list2;
        list2 = list2.next;
      }
      cur = cur.next;
    }
    cur!.next = list1 ?? list2;
    return dummy.next;
  }
}
