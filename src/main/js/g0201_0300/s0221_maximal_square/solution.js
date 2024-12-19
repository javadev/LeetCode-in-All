// #Medium #Array #Dynamic_Programming #Matrix #Dynamic_Programming_I_Day_16
// #Big_O_Time_O(m*n)_Space_O(m*n) #2024_12_17_Time_12_ms_(87.32%)_Space_58.1_MB_(64.73%)

/**
 * @param {character[][]} mArr
 * @return {number}
 */
var maximalSquare = function(mArr) {
    if (mArr.length === 0 || mArr[0].length === 0) return 0

    let maxLen = 0
    let rows = mArr.length
    let cols = mArr[0].length
    let dpArr = Array.from({ length: rows }, () => new Array(cols).fill(0))

    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (mArr[i][j] === '0') continue
            dpArr[i][j] = 1
            if (i > 0 && j > 0) {
                dpArr[i][j] = Math.min(
                    dpArr[i - 1][j],
                    dpArr[i][j - 1],
                    dpArr[i - 1][j - 1]
                ) + 1
            }
            maxLen = Math.max(maxLen, dpArr[i][j])
        }
    }
    return maxLen * maxLen
};

export { maximalSquare }
