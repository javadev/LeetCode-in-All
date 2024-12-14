// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Stack #Linked_List
// #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(N)
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

    // Find the tail of the left subtree
    if (left !== null) {
        tail = findTail(left)
        // Stitch the right subtree below the tail
        root.left = null
        root.right = left
        tail.right = right
    } else {
        tail = root
    }

    // Find the tail of the right subtree
    if (tail.right === null) {
        return tail
    } else {
        return findTail(tail.right)
    }
};

export { flatten }
