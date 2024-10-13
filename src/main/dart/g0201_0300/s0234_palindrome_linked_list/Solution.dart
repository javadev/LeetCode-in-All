// #Easy #Top_100_Liked_Questions #Two_Pointers #Stack #Linked_List #Recursion
// #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2024_10_09_Time_365_ms_(87.93%)_Space_203.1_MB_(36.21%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  bool isPalindrome(ListNode? head) {
    List<int> list = [];
    while (head != null) {
      list.add(head.val);
      head = head.next;
    }
    int l = 0;
    int r = list.length - 1;
    while (l < list.length && r >= 0 && list[l] == list[r]) {
      l++;
      r--;
    }
    return l == list.length;
  }
}
