// #Medium #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree #Big_O_Time_O(n)_Space_O(n)
// #2024_12_22_Time_2_ms_(97.05%)_Space_53.5_MB_(88.05%)

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
 * @param {number} targetSum
 * @return {number}
 */
var pathSum = function(root, targetSum) {
    const h = new Map()
    return dfs(root, targetSum, h, 0)
};

function dfs(root, targetSum, h, currentSum) {
    let count = 0
    if (root === null) {
        return 0
    }

    const sumKey = currentSum + root.val

    if (sumKey === targetSum) {
        count += 1
    }

    if (h.has(sumKey - targetSum)) {
        count += h.get(sumKey - targetSum)
    }

    h.set(sumKey, (h.get(sumKey) || 0) + 1)

    count += dfs(root.left, targetSum, h, sumKey)
    count += dfs(root.right, targetSum, h, sumKey)

    h.set(sumKey, h.get(sumKey) - 1)

    return count
};

export { pathSum }
