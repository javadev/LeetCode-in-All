// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
// #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2024_12_10_Time_0_ms_(100.00%)_Space_49_MB_(22.45%)

/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
    if (n < 2) {
        return n
    }

    // Create a cache (DP array) to store results
    const cache = new Array(n)

    // Initialize base cases
    cache[0] = 1
    cache[1] = 2

    // Fill the cache using the recurrence relation
    for (let i = 2; i < n; i++) {
        cache[i] = cache[i - 1] + cache[i - 2]
    }

    // Return the result for the nth step
    return cache[n - 1]
};

export { climbStairs }
