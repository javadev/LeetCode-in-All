// #Medium #Top_Interview_Questions #String #2024_12_03_Time_1_ms_(96.63%)_Space_53.7_MB_(52.53%)

/**
 * @param {string} s
 * @return {number}
 */
var myAtoi = function (str) {
    if (str == null || str.length === 0) {
        return 0
    }

    let i = 0
    let negativeSign = false
    const MAX_INT = 2147483647 // Equivalent to Integer.MAX_VALUE
    const MIN_INT = -2147483648 // Equivalent to Integer.MIN_VALUE

    // Skip leading whitespaces
    while (i < str.length && str[i] === ' ') {
        i++
    }

    if (i === str.length) {
        return 0
    }

    // Check for optional '+' or '-' sign
    if (str[i] === '+') {
        i++
    } else if (str[i] === '-') {
        i++
        negativeSign = true
    }

    let num = 0

    while (i < str.length && str[i] >= '0' && str[i] <= '9') {
        const digit = str[i].charCodeAt(0) - '0'.charCodeAt(0)

        // Check for overflow or underflow
        if (num > Math.floor(MAX_INT / 10) || (num === Math.floor(MAX_INT / 10) && digit > 7)) {
            return negativeSign ? MIN_INT : MAX_INT
        }

        num = num * 10 + digit
        i++
    }

    return negativeSign ? -num : num
}

export { myAtoi }
