// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
// #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2024_12_03_Time_0_ms_(100.00%)_Space_51.9_MB_(21.82%)

/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function (s) {
    const stack = []
    for (let c of s) {
        if (c === '(' || c === '[' || c === '{') {
            stack.push(c)
        } else if (c === ')' && stack.length > 0 && stack[stack.length - 1] === '(') {
            stack.pop()
        } else if (c === '}' && stack.length > 0 && stack[stack.length - 1] === '{') {
            stack.pop()
        } else if (c === ']' && stack.length > 0 && stack[stack.length - 1] === '[') {
            stack.pop()
        } else {
            return false
        }
    }
    return stack.length === 0
}

export { isValid }
