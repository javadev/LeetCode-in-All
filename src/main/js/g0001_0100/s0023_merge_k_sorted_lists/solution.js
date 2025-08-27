// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Heap_Priority_Queue #Linked_List
// #Divide_and_Conquer #Merge_Sort #Top_Interview_150_Divide_and_Conquer
// #Big_O_Time_O(k*n*log(k))_Space_O(log(k)) #2024_12_04_Time_3_ms_(99.39%)_Space_55.8_MB_(67.69%)

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode[]} lists
 * @return {ListNode}
 */
const mergeKLists = function(lists) {
    if (lists.length === 0) {
        return null
    }
    return mergeKListsHelper(lists, 0, lists.length)
};

const mergeKListsHelper = function(lists, leftIndex, rightIndex) {
    if (rightIndex > leftIndex + 1) {
        const mid = Math.floor((leftIndex + rightIndex) / 2)
        const left = mergeKListsHelper(lists, leftIndex, mid)
        const right = mergeKListsHelper(lists, mid, rightIndex)
        return mergeTwoLists(left, right)
    } else {
        return lists[leftIndex]
    }
};

const mergeTwoLists = function(left, right) {
    if (left === null) {
        return right
    }
    if (right === null) {
        return left
    }
    let res;
    if (left.val <= right.val) {
        res = left
        left = left.next
    } else {
        res = right
        right = right.next
    }
    let current = res;
    while (left !== null && right !== null) {
        if (left.val <= right.val) {
            current.next = left;
            left = left.next;
        } else {
            current.next = right;
            right = right.next;
        }
        current = current.next;
    }
    current.next = left !== null ? left : right;
    return res
};

export { mergeKLists }
