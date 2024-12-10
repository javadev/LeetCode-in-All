// #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
// #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
// #2024_12_04_Time_1_ms_(100.00%)_Space_49.6_MB_(8.69%)

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
const swapPairs = function (head) {
    if (head === null) {
        return null
    }

    const getLength = (node) => {
        let count = 0
        while (node !== null) {
            count++
            node = node.next
        }
        return count
    };

    const reverse = (node, length) => {
        if (length < 2) {
            return node
        }

        let current = node
        let prev = null
        let next

        for (let i = 0; i < 2; i++) {
            next = current.next
            current.next = prev
            prev = current
            current = next
        }

        node.next = reverse(current, length - 2)
        return prev
    };

    const len = getLength(head)
    return reverse(head, len)
};

export { swapPairs }
