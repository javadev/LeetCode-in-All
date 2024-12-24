// #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #Programming_Skills_II_Day_6
// #Big_O_Time_O(n)_Space_O(n) #2024_12_24_Time_9_ms_(99.89%)_Space_75.6_MB_(27.87%)

/**
 * @param {number[]} temperatures
 * @return {number[]}
 */
var dailyTemperatures = function(temperatures) {
    const sol = new Array(temperatures.length).fill(0)
    sol[temperatures.length - 1] = 0

    for (let i = temperatures.length - 2; i >= 0; i--) {
        let j = i + 1
        while (j < temperatures.length) {
            if (temperatures[i] < temperatures[j]) {
                sol[i] = j - i
                break
            } else {
                if (sol[j] === 0) {
                    break
                }
                j += sol[j]
            }
        }
    }

    return sol
};

export { dailyTemperatures }
