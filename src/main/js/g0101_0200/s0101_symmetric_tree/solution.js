// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Binary_Search_Tree #Data_Structure_I_Day_14_Tree #Level_1_Day_8_Binary_Search_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(log(N))
// #2024_12_12_Time_0_ms_(100.00%)_Space_53.7_MB_(22.50%)

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
 * @return {boolean}
 */
var isSymmetric = function isSymmetric(root) {
    if (!root) {
        return true
    }
    return helper(root.left, root.right)
};

var helper = function(leftNode, rightNode) {
    if (!leftNode || !rightNode) {
        return leftNode === null && rightNode === null
    }
    if (leftNode.val !== rightNode.val) {
        return false
    }
    return helper(leftNode.left, rightNode.right) && helper(leftNode.right, rightNode.left)
};

export { isSymmetric }
