class TreeNode { // NOSONAR
    constructor(val = 0, left = null, right = null) {
        this.val = val
        this.left = left
        this.right = right
    }
};

function createTreeNode(treeValues) {
    if (treeValues.length === 0) return null

    const root = new TreeNode(treeValues[0])
    const queue = [root]
    let i = 1

    while (i < treeValues.length) {
        const curr = queue.shift()
        if (treeValues[i] !== null) {
            curr.left = new TreeNode(treeValues[i])
            queue.push(curr.left)
        }
        i++
        if (i < treeValues.length && treeValues[i] !== null) {
            curr.right = new TreeNode(treeValues[i])
            queue.push(curr.right)
        }
        i++
    }

    return root
};

export { TreeNode, createTreeNode }
