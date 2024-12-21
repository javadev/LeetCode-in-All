// #Easy #Top_100_Liked_Questions #Two_Pointers #Stack #Linked_List #Recursion
// #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2024_12_21_Time_3_ms_(93.71%)_Space_69.8_MB_(76.50%)

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
var isPalindrome = function(head) {
    let len = 0
    let right = head

    // Calculate the length of the linked list
    while (right !== null) {
        right = right.next
        len++
    }

    // Move to the start of the second half of the list
    len = Math.floor(len / 2)
    right = head
    for (let i = 0; i < len; i++) {
        right = right.next
    }

    // Reverse the right half of the list
    let prev = null
    while (right !== null) {
        let next = right.next
        right.next = prev
        prev = right
        right = next
    }

    // Compare the left half and the reversed right half
    for (let i = 0; i < len; i++) {
        if (prev !== null && head.val === prev.val) {
            head = head.next
            prev = prev.next
        } else {
            return false
        }
    }
    return true
};

export { isPalindrome }
