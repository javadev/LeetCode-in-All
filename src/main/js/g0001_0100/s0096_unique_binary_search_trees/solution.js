// #Medium #Dynamic_Programming #Math #Tree #Binary_Tree #Binary_Search_Tree
// #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
// #2024_12_12_Time_0_ms_(100.00%)_Space_48.8_MB_(65.65%)

/**
 * @param {number} n
 * @return {number}
 */
var numTrees = function (n) {
    let result = 1

    for (let i = 0; i < n; i++) {
        result *= 2 * n - i
        result /= i + 1
    }

    result /= n + 1
    return Math.floor(result)
};

export { numTrees }
