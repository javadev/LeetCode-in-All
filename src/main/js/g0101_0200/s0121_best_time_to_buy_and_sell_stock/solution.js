// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
// #Big_O_Time_O(N)_Space_O(1) #2024_12_15_Time_1_ms_(97.34%)_Space_59.1_MB_(51.64%)

/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
    let maxProfit = 0
    let min = prices[0]
    
    for (let i = 1; i < prices.length; i++) {
        if (prices[i] > min) {
            maxProfit = Math.max(maxProfit, prices[i] - min)
        } else {
            min = prices[i]
        }
    }
    
    return maxProfit
};

export { maxProfit }
