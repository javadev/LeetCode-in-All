// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
// #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Big_O_Time_O(N)_Space_O(N)
// #2024_12_13_Time_1_ms_(98.60%)_Space_53.9_MB_(86.87%)

import { TreeNode } from '../../com_github_leetcode/treenode';

/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {number[]} preorder
 * @param {number[]} inorder
 * @return {TreeNode}
 */
var buildTree = function(preorder, inorder) {
    let j = 0 // Tracks the index in the preorder array
    const map = new Map() // Maps values to their indices in the inorder array

    // Populate the map with indices of the inorder array
    for (let i = 0; i < inorder.length; i++) {
        map.set(inorder[i], i)
    }

    // Helper function to construct the tree
    const build = (start, end) => {
        if (start > end || j >= preorder.length) {
            return null
        }

        const value = preorder[j++]
        const index = map.get(value)
        const node = new TreeNode(value)

        // Recursively build left and right subtrees
        node.left = build(start, index - 1)
        node.right = build(index + 1, end)

        return node
    }

    return build(0, inorder.length - 1)
};

export { buildTree }
