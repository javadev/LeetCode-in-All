// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Breadth_First_Search #Tree
// #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_1_Day_6_Tree #Udemy_Tree_Stack_Queue
// #Big_O_Time_O(N)_Space_O(N) #2024_12_13_Time_1_ms_(87.97%)_Space_54.7_MB_(69.27%)

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
 * @return {number[][]}
 */
var levelOrder = function(root) {
    const result = []
    if (!root) {
        return result
    }

    const queue = []
    queue.push(root)
    queue.push(null)
    let level = []

    while (queue.length > 0) {
        root = queue.shift() // Remove the first element
        while (queue.length > 0 && root !== null) {
            level.push(root.val)
            if (root.left) {
                queue.push(root.left)
            }
            if (root.right) {
                queue.push(root.right)
            }
            root = queue.shift()
        }
        result.push(level)
        level = []
        if (queue.length > 0) {
            queue.push(null)
        }
    }

    return result
};

export { levelOrder }
