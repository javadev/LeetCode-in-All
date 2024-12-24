// #Medium #String #Hash_Table #Greedy #Two_Pointers #Data_Structure_II_Day_7_String
// #Big_O_Time_O(n)_Space_O(1) #2024_12_24_Time_3_ms_(94.02%)_Space_52.1_MB_(22.51%)

/**
 * @param {string} s
 * @return {number[]}
 */
var partitionLabels = function(s) {
    const letters = s.split('')
    const result = []
    const position = new Array(26).fill(0)

    // Record the last occurrence of each character
    for (let i = 0; i < letters.length; i++) {
        position[letters[i].charCodeAt(0) - 'a'.charCodeAt(0)] = i
    }

    let prev = -1
    let max = 0

    for (let i = 0; i < letters.length; i++) {
        max = Math.max(max, position[letters[i].charCodeAt(0) - 'a'.charCodeAt(0)])
        if (i === max) {
            result.push(i - prev)
            prev = i
        }
    }

    return result
};

export { partitionLabels }
