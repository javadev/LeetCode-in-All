// #Easy #Dynamic_Programming #Bit_Manipulation #Udemy_Bit_Manipulation
// #Big_O_Time_O(num)_Space_O(num) #2024_12_22_Time_0_ms_(100.00%)_Space_57_MB_(33.09%)

/**
 * @param {number} n
 * @return {number[]}
 */
var countBits = function(num) {
    const result = new Array(num + 1).fill(0)
    let borderPos = 1
    let incrPos = 1

    for (let i = 1; i <= num; i++) {
        // When we reach a power of 2, reset `borderPos` and `incrPos`
        if (incrPos === borderPos) {
            result[i] = 1
            incrPos = 1
            borderPos = i
        } else {
            result[i] = 1 + result[incrPos++]
        }
    }

    return result
}

export { countBits }
