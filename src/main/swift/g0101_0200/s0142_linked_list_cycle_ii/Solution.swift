// #Medium #Top_100_Liked_Questions #Hash_Table #Two_Pointers #Linked_List
// #Data_Structure_II_Day_10_Linked_List #Level_1_Day_4_Linked_List #Udemy_Linked_List
// #Big_O_Time_O(N)_Space_O(1) #2024_06_27_Time_17_ms_(97.87%)_Space_16.1_MB_(60.64%)

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }

        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next

            if slow === fast {
                break
            }
        }

        if fast == nil || fast?.next == nil {
            return nil
        }

        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
}
