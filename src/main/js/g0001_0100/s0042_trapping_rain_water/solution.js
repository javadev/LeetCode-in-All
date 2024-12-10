// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
// #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
// #Big_O_Time_O(n)_Space_O(1) #2024_12_08_Time_0_ms_(100.00%)_Space_51.2_MB_(88.05%)

/**
 * @param {number[]} height
 * @return {number}
 */
var trap = function(height) {
    let l = 0
    let r = height.length - 1
    let res = 0
    let lowerWall = 0

    while (l < r) {
        let lVal = height[l]
        let rVal = height[r]

        // Determine the lower wall
        if (lVal < rVal) {
            // Update the lower wall based on the left pointer
            lowerWall = Math.max(lVal, lowerWall)
            // Add water trapped at the current position
            res += lowerWall - lVal
            // Move the left pointer
            l++
        } else {
            // Update the lower wall based on the right pointer
            lowerWall = Math.max(rVal, lowerWall)
            // Add water trapped at the current position
            res += lowerWall - rVal
            // Move the right pointer
            r--
        }
    }

    return res
};

export { trap }
