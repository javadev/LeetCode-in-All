// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
// #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Big_O_Time_O(log(N))_Space_O(log(N))
// #2024_12_16_Time_17_ms_(93.53%)_Space_72.5_MB_(66.21%)

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
var sortList = function(head) {
    let arr = []
    let current = head
    while (current) {
        arr.push(current)
        current = current.next
    }

    arr = arr.sort((a, b) => {
        if (a.val > b.val) {
            return 1
        } else {
            return -1
        }
    })

    const result = arr.reduce((acc, curr) => {
        acc.next = curr
        return acc.next
    }, arr[0])

    if (!result) {
        return null
    }
    result.next = null
    return arr[0]
};

export { sortList }
