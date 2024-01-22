package g0101_0200.s0155_min_stack

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
// #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
// #Udemy_Design #Big_O_Time_O(1)_Space_O(N)
// #2023_11_05_Time_566_ms_(90.91%)_Space_60.6_MB_(84.85%)

class MinStack {
    private class Node(var min: Int, var data: Int, var previousNode: Node, var nextNode: Node)

    private var currentNode: Node = _

    def push(`val`: Int): Unit = {
        if (currentNode == null) {
            currentNode = new Node(`val`, `val`, null, null)
        } else {
            currentNode.nextNode = new Node(Math.min(currentNode.min, `val`), `val`, currentNode, null)
            currentNode = currentNode.nextNode
        }
    }

    def pop(): Unit = {
        currentNode = currentNode.previousNode
    }

    def top(): Int = {
        currentNode.data
    }

    def getMin(): Int = {
        currentNode.min
    }
}

/*
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(`val`)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */
