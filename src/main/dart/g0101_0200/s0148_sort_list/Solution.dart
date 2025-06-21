// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
// #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Top_Interview_150_Divide_and_Conquer
// #Big_O_Time_O(log(N))_Space_O(log(N)) #2024_10_07_Time_371_ms_(81.82%)_Space_165.6_MB_(90.91%)

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? sortList(ListNode? head) {
    if (head == null || head.next == null) return head;

    // Get the middle of the list and split it into two halves
    ListNode? mid = getMidNode(head);

    // Recursively sort both halves
    ListNode? left = sortList(head);
    ListNode? right = sortList(mid);

    // Merge the sorted halves
    return mergeLists(left, right);
  }

  ListNode? mergeLists(ListNode? node1, ListNode? node2) {
    ListNode dummyHead = ListNode(); // Use a dummy node
    ListNode? tail = dummyHead;

    while (node1 != null && node2 != null) {
      if (node1.val <= node2.val) {
        tail?.next = node1;
        node1 = node1.next;
      } else {
        tail?.next = node2;
        node2 = node2.next;
      }
      tail = tail?.next;
    }

    // Append the remaining nodes
    tail?.next = (node1 != null) ? node1 : node2;
    return dummyHead.next;
  }

  ListNode? getMidNode(ListNode? head) {
    ListNode? fast = head;
    ListNode? slow = head;
    ListNode? prevSlow; // To disconnect the first half

    while (fast != null && fast.next != null) {
      prevSlow = slow;
      slow = slow?.next;
      fast = fast.next?.next;
    }

    // Disconnect the first half from the second half
    prevSlow?.next = null;
    return slow;
  }
}
