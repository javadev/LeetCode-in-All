// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
// #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
// #Udemy_Design #Big_O_Time_O(1)_Space_O(N) #2024_06_28_Time_34_ms_(95.89%)_Space_17.6_MB_(18.08%)

class MinStack {
    private class Node {
        var min: Int
        var data: Int
        var nextNode: Node?
        var previousNode: Node?
        
        init(_ min: Int, _ data: Int, _ previousNode: Node?, _ nextNode: Node?) {
            self.min = min
            self.data = data
            self.previousNode = previousNode
            self.nextNode = nextNode
        }
    }
    
    private var currentNode: Node?
    
    init() {}
    
    func push(_ val: Int) {
        if currentNode == nil {
            currentNode = Node(val, val, nil, nil)
        } else {
            let newNode = Node(min(currentNode!.min, val), val, currentNode, nil)
            currentNode!.nextNode = newNode
            currentNode = newNode
        }
    }
    
    func pop() {
        currentNode = currentNode?.previousNode
    }
    
    func top() -> Int {
        return currentNode!.data
    }
    
    func getMin() -> Int {
        return currentNode!.min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
