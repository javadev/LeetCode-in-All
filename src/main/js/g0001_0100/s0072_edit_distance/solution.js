// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n2)
// #2024_12_10_Time_5_ms_(99.01%)_Space_54.5_MB_(81.30%)

/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function(w1, w2) {
    const n1 = w1.length
    const n2 = w2.length

    // Ensure the longer word is always w1
    if (n2 > n1) {
        return minDistance(w2, w1)
    }

    // Initialize the dp array
    const dp = new Array(n2 + 1).fill(0)
    for (let j = 0; j <= n2; j++) {
        dp[j] = j
    }

    // Compute minimum distance
    for (let i = 1; i <= n1; i++) {
        let pre = dp[0]
        dp[0] = i
        for (let j = 1; j <= n2; j++) {
            const tmp = dp[j]
            dp[j] =
                w1[i - 1] !== w2[j - 1]
                    ? 1 + Math.min(pre, Math.min(dp[j], dp[j - 1]))
                    : pre
            pre = tmp
        }
    }

    return dp[n2]
};

export { minDistance }
