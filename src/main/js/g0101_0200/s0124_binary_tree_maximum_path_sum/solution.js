// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
// #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(N)
// #2024_12_15_Time_1_ms_(98.34%)_Space_59.8_MB_(12.47%)

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
var maxPathSum = function(root) {
    let max = Number.MIN_SAFE_INTEGER

    const helper = (node) => {
        if (node === null) {
            return 0
        }
        
        // Calculate max sum on the left and right subtrees, avoiding negatives
        const left = Math.max(0, helper(node.left))
        const right = Math.max(0, helper(node.right))
        
        // Current path sum including the node
        const current = node.val + left + right
        
        // Update the global max if the current path sum is greater
        max = Math.max(max, current)
        
        // Return the max sum of the path passing through the current node
        return node.val + Math.max(left, right)
    }

    helper(root)
    return max
};

export { maxPathSum }
