// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Stack #Linked_List
// #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(N)
// #2024_06_25_Time_0_ms_(100.00%)_Space_16_MB_(77.78%)

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func flatten(_ root: TreeNode?) {
        var values: [Int] = []
        getAllValues(root, &values)
        let linkedList = TreeNode()
        var currLink: TreeNode? = linkedList
        for index in 0..<values.count {
            currLink?.right = TreeNode(values[index])
            currLink = currLink?.right
        }
        root?.right = linkedList.right?.right
        root?.left = nil
    }

    private func getAllValues(_ curr: TreeNode?, _ values: inout [Int]) {
        guard let curr = curr else { return }
        values.append(curr.val)
        if let left = curr.left {
            getAllValues(left, &values)
        }
        if let right = curr.right {
            getAllValues(right, &values)
        }
    }
}
