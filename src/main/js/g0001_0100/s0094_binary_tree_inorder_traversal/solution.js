// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Stack #Data_Structure_I_Day_10_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_12_12_Time_0_ms_(100.00%)_Space_49.4_MB_(12.74%)

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
 * @return {number[]}
 */
var inorderTraversal = function(root) {
    if (root === null) {
        return []
    }
    const answer = []
    traverseInOrder(root, answer)
    return answer
};

var traverseInOrder = function(root, answer) {
    if (root === null) {
        return
    }
    if (root.left !== null) {
        traverseInOrder(root.left, answer)
    }
    answer.push(root.val)
    if (root.right !== null) {
        traverseInOrder(root.right, answer)
    }
};

export { inorderTraversal }
