// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree
// #Data_Structure_II_Day_18_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_12_21_Time_53_ms_(98.59%)_Space_58.7_MB_(88.33%)

/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */
var lowestCommonAncestor = function(root, p, q) {
    if(!root) {
        return null
    }
    if(p.val === root.val || q.val === root.val) {
        return root
    }
    const leftNode = lowestCommonAncestor(root.left, p, q)
    const rightNode = lowestCommonAncestor(root.right, p, q)
    if(leftNode && rightNode) {
        return root
    }
    return leftNode || rightNode
};

export { lowestCommonAncestor }
