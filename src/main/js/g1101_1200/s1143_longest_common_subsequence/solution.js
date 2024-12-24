// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
// #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
// #2024_12_24_Time_28_ms_(90.92%)_Space_56_MB_(89.99%)

/**
 * @param {string} text1
 * @param {string} text2
 * @return {number}
 */
var longestCommonSubsequence = function(text1, text2) {
    const rows = text1.length
    const columns = text2.length
    let prevRow = new Array(text2.length + 1).fill(0)

    for(let i = rows - 1; i >= 0; i--) {
        const curRow = new Array(text2.length + 1).fill(0)
        for(let j = columns - 1; j >= 0; j--) {
            if(text1[i] == text2[j]) {
                curRow[j] = 1 + prevRow[j + 1]
            } else {
                curRow[j] = Math.max(prevRow[j], curRow[j + 1])
            }
        }
        prevRow = curRow
    }

    return prevRow[0]
};

export { longestCommonSubsequence }
