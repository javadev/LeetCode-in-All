// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Binary_Search
// #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3 #Dynamic_Programming_I_Day_18
// #Udemy_Dynamic_Programming #Big_O_Time_O(n*log_n)_Space_O(n)
// #2024_12_21_Time_4_ms_(93.09%)_Space_51.3_MB_(34.72%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var lengthOfLIS = function (nums) {
    const dp = []
    for (let num of nums) {
        let start = 0
        let end = dp.length
        while (start < end) {
            const mid = Math.floor((start + end) / 2)
            if (dp[mid] < num) {
                start = mid + 1
            } else {
                end = mid
            }
        }
        dp[start] = num
    }
    return dp.length
};

export { lengthOfLIS }
