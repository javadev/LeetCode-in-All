// #Hard #Top_Interview_Questions #String #Dynamic_Programming #Recursion #Udemy_Dynamic_Programming
// #Big_O_Time_O(m*n)_Space_O(m*n) #2024_12_03_Time_4_ms_(95.52%)_Space_51.8_MB_(60.30%)

/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
var isMatch = function (s, p) {
    const cache = Array.from({ length: s.length + 1 }, () => Array(p.length + 1).fill(null))

    function helper(i, j) {
        if (j === p.length) {
            return i === s.length
        }

        if (cache[i][j] !== null) {
            return cache[i][j]
        }

        const firstMatch = i < s.length && (s[i] === p[j] || p[j] === '.')

        let result
        if (j + 1 < p.length && p[j + 1] === '*') {
            result = (firstMatch && helper(i + 1, j)) || helper(i, j + 2)
        } else {
            result = firstMatch && helper(i + 1, j + 1)
        }

        cache[i][j] = result
        return result
    }

    return helper(0, 0)
}

export { isMatch }
