// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Stack #Monotonic_Stack
// #Big_O_Time_O(n_log_n)_Space_O(log_n) #2024_12_12_Time_11_ms_(96.58%)_Space_61.2_MB_(84.95%)

/**
 * @param {number[]} heights
 * @return {number}
 */
var largestRectangleArea = function(heights) {
    let stack = []
    let maxArea = 0
    let index = 0

    while (index < heights.length) {
        if (stack.length === 0 || heights[stack[stack.length - 1]] <= heights[index]) {
            stack.push(index++)
        } else {
            let top = stack.pop()
            let area = heights[top] * (stack.length === 0 ? index : index - stack[stack.length - 1] - 1)
            maxArea = Math.max(maxArea, area)
        }
    }

    while (stack.length > 0) {
        let top = stack.pop()
        let area = heights[top] * (stack.length === 0 ? index : index - stack[stack.length - 1] - 1)
        maxArea = Math.max(maxArea, area)
    }

    return maxArea
};

export { largestRectangleArea }
