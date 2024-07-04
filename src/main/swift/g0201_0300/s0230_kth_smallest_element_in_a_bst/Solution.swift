// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Binary_Search_Tree
// #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree #Big_O_Time_O(n)_Space_O(n)
// #2024_07_01_Time_20_ms_(97.99%)_Space_16.5_MB_(68.46%)

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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var vals = [Int]()
        var minVal = Int.max
        var maxVal = Int.min
        traverse(root, &vals, &minVal, &maxVal)
        var countingArray = Array(repeating: -1, count: maxVal - minVal + 1)
        for val in vals { countingArray[val - minVal] = val }
        var i = 0
        for val in countingArray {
            guard val != -1 else { continue }
            i += 1
            if i == k { return val }
        }
        return -1
    }

    private func traverse(
        _ node: TreeNode?, 
        _ arr: inout [Int], 
        _ minVal: inout Int, 
        _ maxVal: inout Int
    ) {
        guard let node else { return }
        minVal = min(minVal, node.val)
        maxVal = max(maxVal, node.val)
        arr.append(node.val)
        traverse(node.left, &arr, &minVal, &maxVal)
        traverse(node.right, &arr, &minVal, &maxVal)
    }
}
