// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
// #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
// #Udemy_Design #Top_Interview_150_Stack #Big_O_Time_O(1)_Space_O(N)
// #2024_10_08_Time_382_ms_(95.65%)_Space_158.5_MB_(47.83%)

// Node class to represent each element in the stack
class Node {
  int min;
  int data;
  Node? previousNode;
  Node? nextNode;

  Node(this.min, this.data, this.previousNode, this.nextNode);
}

class MinStack {
  Node? currentNode;

  // Initialize your data structure here
  MinStack();

  // Push a value onto the stack
  void push(int val) {
    if (currentNode == null) {
      currentNode = Node(val, val, null, null);
    } else {
      currentNode!.nextNode = Node(
        (currentNode!.min < val) ? currentNode!.min : val,
        val,
        currentNode,
        null,
      );
      currentNode = currentNode!.nextNode;
    }
  }

  // Remove the element on top of the stack
  void pop() {
    if (currentNode != null) {
      currentNode = currentNode!.previousNode;
    }
  }

  // Get the top element
  int top() {
    return currentNode!.data;
  }

  // Retrieve the minimum element in the stack
  int getMin() {
    return currentNode!.min;
  }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = MinStack();
 * obj.push(val);
 * obj.pop();
 * int param3 = obj.top();
 * int param4 = obj.getMin();
 */
