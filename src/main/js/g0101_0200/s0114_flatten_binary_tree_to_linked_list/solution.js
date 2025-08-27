// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Stack #Linked_List
// #Udemy_Linked_List #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(N)_Space_O(N)
// #2024_12_13_Time_0_ms_(100.00%)_Space_52.4_MB_(70.97%)

/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {void} Do not return anything, modify root in-place instead.
 */
var flatten = function(root) {
    if (root !== null) {
        findTail(root)
    }
};

var findTail = function(root) {
    const left = root.left
    const right = root.right
    let tail

    if (left !== null) {
        tail = findTail(left)
        root.left = null
        root.right = left
        tail.right = right
    } else {
        tail = root
    }

    if (tail.right === null) {
        return tail
    } else {
        return findTail(tail.right)
    }
};

export { flatten }
