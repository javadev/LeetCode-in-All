// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Breadth_First_Search
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
// #Level_2_Day_12_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(amount)
// #2024_12_22_Time_26_ms_(95.33%)_Space_54.1_MB_(79.36%)

/**
 * @param {number[]} coins
 * @param {number} amount
 * @return {number}
 */
var coinChange = function(coins, amount) {
    const dp = new Array(amount + 1).fill(0)
    dp[0] = 1

    for (const coin of coins) {
        for (let i = coin; i <= amount; i++) {
            const prev = dp[i - coin]
            if (prev > 0) {
                if (dp[i] === 0) {
                    dp[i] = prev + 1
                } else {
                    dp[i] = Math.min(dp[i], prev + 1)
                }
            }
        }
    }

    return dp[amount] - 1
};

export { coinChange }
