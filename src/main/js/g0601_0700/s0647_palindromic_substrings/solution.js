// #Medium #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
// #2024_12_24_Time_3_ms_(99.10%)_Space_49.8_MB_(85.90%)

/**
 * @param {string} s
 * @return {number}
 */
var countSubstrings = function(s) {
    const expand = (a, l, r, res) => {
        while (l >= 0 && r < a.length) {
            if (a[l] !== a[r]) {
                return
            } else {
                res.count++
                l--
                r++
            }
        }
    }

    const a = s.split('')
    const res = { count: 0 }

    for (let i = 0; i < a.length; i++) {
        expand(a, i, i, res)       // Odd-length palindromes
        expand(a, i, i + 1, res)   // Even-length palindromes
    }

    return res.count
};

export { countSubstrings }
