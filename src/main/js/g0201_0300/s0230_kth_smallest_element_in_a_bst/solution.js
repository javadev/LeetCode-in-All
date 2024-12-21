// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Binary_Search_Tree
// #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree #Big_O_Time_O(n)_Space_O(n)
// #2024_12_21_Time_0_ms_(100.00%)_Space_55.4_MB_(48.16%)

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
 * @param {number} k
 * @return {number}
 */
var kthSmallest = function(root, k) {
    let count = 0
    let result = null

    const calculate = (node) => {
        if (!node) return
        if (node.left) calculate(node.left)

        count++
        if (count === k) {
            result = node.val
            return
        }

        if (node.right) calculate(node.right)
    }

    calculate(root)
    return result
};

export { kthSmallest }
