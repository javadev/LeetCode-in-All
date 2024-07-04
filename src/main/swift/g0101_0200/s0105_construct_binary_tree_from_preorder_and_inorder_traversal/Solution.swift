// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
// #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Big_O_Time_O(N)_Space_O(N)
// #2024_06_25_Time_9_ms_(93.01%)_Space_16.7_MB_(77.29%)

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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let n = preorder.count
        var preIndex = 0
        var map: [Int:Int] = [:]
        for (i, val) in inorder.enumerated() {
            map[val] = i
        }
        func findIndex(_ value: Int) -> Int {
            return map[value] ?? -1
        }
        func build(_ inStart: Int, _ inEnd: Int) -> TreeNode? {
            guard inStart <= inEnd else { return nil }
            let root = TreeNode(preorder[preIndex])
            let inIndex = findIndex(root.val)
            preIndex += 1
            root.left = build(inStart, inIndex - 1)
            root.right = build(inIndex + 1, inEnd)
            return root
        }
        return build(0, n - 1)
    }
}
