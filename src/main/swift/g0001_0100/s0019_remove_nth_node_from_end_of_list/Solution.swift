// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Linked_List
// #Algorithm_I_Day_5_Two_Pointers #Level_2_Day_3_Linked_List #Big_O_Time_O(L)_Space_O(L)
// #2024_06_18_Time_0_ms_(100.00%)_Space_15.5_MB_(48.03%)

/*
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {        
        guard ((head?.next) != nil), n > 0 else {return nil}        
        var count = 0
        var current = head        
        while let currentNode = current{
            count += 1
            current = currentNode.next
        }        
        current = head
        count = count - n + 1      
        var prev: ListNode?        
        while let currentNode = current {            
            count -= 1            
            if count == 0 {            
                if prev == nil {
                    current = current?.next
                    return current
                } else {
                    prev?.next = current?.next
                }
                break
            }            
            prev = current
            current = current?.next            
        }        
        return head        
    }
}
