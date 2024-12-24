// #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_12_24_Time_1_ms_(87.35%)_Space_57.4_MB_(27.26%)

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
 * @return {number}
 */
var diameterOfBinaryTree = function(root) {
    let diameter = 0

    const diameterOfBinaryTreeUtil = (node) => {
        if (node === null) {
            return 0
        }

        const leftLength = node.left ? 1 + diameterOfBinaryTreeUtil(node.left) : 0
        const rightLength = node.right ? 1 + diameterOfBinaryTreeUtil(node.right) : 0

        // Update the diameter
        diameter = Math.max(diameter, leftLength + rightLength)

        // Return the longest path from this node
        return Math.max(leftLength, rightLength)
    }

    diameterOfBinaryTreeUtil(root)
    return diameter
};

export { diameterOfBinaryTree }
