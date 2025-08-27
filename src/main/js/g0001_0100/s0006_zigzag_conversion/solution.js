// #Medium #String #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(n)
// #2024_11_17_Time_2_ms_(99.71%)_Space_44.5_MB_(94.69%)

/**
 * @param {string} s
 * @param {number} numRows
 * @return {string}
 */
var convert = function (s, numRows) {
    const sLen = s.length
    if (numRows === 1) {
        return s
    }
    const maxDist = numRows * 2 - 2
    let result = ''

    for (let i = 0; i < numRows; i++) {
        let index = i
        if (i === 0 || i === numRows - 1) {
            while (index < sLen) {
                result += s[index]
                index += maxDist
            }
        } else {
            while (index < sLen) {
                result += s[index]
                index += maxDist - i * 2
                if (index >= sLen) {
                    break
                }
                result += s[index]
                index += i * 2
            }
        }
    }
    return result
}

export { convert }
