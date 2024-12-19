// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
// #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
// #Udemy_Design #Big_O_Time_O(1)_Space_O(N) #2024_12_16_Time_6_ms_(99.32%)_Space_60.1_MB_(41.88%)

var MinStack = function () {
    this.stack = []
    this.minStack = []
};

/**
 * @param {number} val
 * @return {void}
 */
MinStack.prototype.push = function (val) {
    this.stack.push(val)


    if (this.minStack.length == 0) {
        this.minStack.push(val)
    } else {
        let min = Math.min(val, this.minStack[this.minStack.length - 1]);
        this.minStack.push(min)
    }

};

/**
 * @return {void}
 */
MinStack.prototype.pop = function () {
    this.stack.pop()
    this.minStack.pop()
};

/**
 * @return {number}
 */
MinStack.prototype.top = function () {
    return this.stack[this.stack.length - 1]
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function () {
    return this.minStack[this.minStack.length - 1]
};

/**
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(val)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */

export { MinStack }
