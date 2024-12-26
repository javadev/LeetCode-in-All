// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(1) #AI_can_be_used_to_solve_the_task
// #2024_11_29_Time_3_ms_(98.96%)_Space_53.9_MB_(69.91%)

/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function (s) {
    const lastIndices = new Array(256).fill(-1)
    let maxLen = 0
    let curLen = 0
    let start = 0

    for (let i = 0; i < s.length; i++) {
        const cur = s.charCodeAt(i)

        if (lastIndices[cur] < start) {
            lastIndices[cur] = i
            curLen++
        } else {
            const lastIndex = lastIndices[cur]
            start = lastIndex + 1
            curLen = i - start + 1
            lastIndices[cur] = i
        }

        maxLen = Math.max(maxLen, curLen)
    }

    return maxLen
}

export { lengthOfLongestSubstring }
