// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
// #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree
// #Programming_Skills_I_Day_10_Linked_List_and_Tree #Udemy_Tree_Stack_Queue
// #Big_O_Time_O(N)_Space_O(H) #2024_12_13_Time_0_ms_(100.00%)_Space_52.6_MB_(22.16%)

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
var maxDepth = function(root) {
    return findDepth(root, 0)
};

var findDepth = function(node, currentDepth) {
    if (!node) {
        return 0
    }
    currentDepth++
    return 1 + Math.max(findDepth(node.left, currentDepth), findDepth(node.right, currentDepth))
};

export { maxDepth }
