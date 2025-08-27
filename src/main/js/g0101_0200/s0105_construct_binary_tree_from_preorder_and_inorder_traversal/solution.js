// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
// #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Top_Interview_150_Binary_Tree_General
// #Big_O_Time_O(N)_Space_O(N) #2024_12_13_Time_1_ms_(98.60%)_Space_53.9_MB_(86.87%)

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
    let j = 0
    const map = new Map()

    for (let i = 0; i < inorder.length; i++) {
        map.set(inorder[i], i)
    }

    const build = (start, end) => {
        if (start > end || j >= preorder.length) {
            return null
        }

        const value = preorder[j++]
        const index = map.get(value)
        const node = new TreeNode(value)

        node.left = build(start, index - 1)
        node.right = build(index + 1, end)

        return node
    }

    return build(0, inorder.length - 1)
};

export { buildTree }
