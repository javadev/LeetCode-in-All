// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
// #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
// #Big_O_Time_O(n_log_n)_Space_O(n) #2024_12_10_Time_7_ms_(81.68%)_Space_59.2_MB_(41.78%)

/**
 * @param {number[][]} intervals
 * @return {number[][]}
 */
var merge = function(intervals) {
    // Sort intervals based on the starting points
    intervals.sort((a, b) => a[0] - b[0])
    
    const result = []
    let current = intervals[0]
    result.push(current)
    
    for (const next of intervals) {
        if (current[1] >= next[0]) {
            // Merge intervals
            current[1] = Math.max(current[1], next[1])
        } else {
            // Move to the next interval
            current = next;
            result.push(current)
        }
    }
    
    return result;
};

export { merge }
