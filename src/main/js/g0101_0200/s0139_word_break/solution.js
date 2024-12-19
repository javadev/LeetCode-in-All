// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
// #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
// #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Big_O_Time_O(M+max*N)_Space_O(M+N+max)
// #2024_12_15_Time_0_ms_(100.00%)_Space_51.5_MB_(44.49%)

/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {boolean}
 */
var wordBreak = function(s, wordDict) {
    const memo = new Array(s.length + 1).fill(null)

    const dp = (i) => {
        if (i === s.length) {
            return true
        }
        if (memo[i] !== null) {
            return memo[i]
        }
        for (const word of wordDict) {
            const len = word.length
            if (i + len > s.length || s.substring(i, i + len) !== word) {
                continue
            }
            if (dp(i + len)) {
                memo[i] = true
                return true
            }
        }
        memo[i] = false
        return false
    }

    return dp(0)
};

export { wordBreak }
