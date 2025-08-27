// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Level_2_Day_14_Sliding_Window/Two_Pointer #Top_Interview_150_Sliding_Window
// #Big_O_Time_O(s.length())_Space_O(1) #2024_12_11_Time_4_ms_(99.86%)_Space_51.7_MB_(98.27%)

/**
 * @param {string} s
 * @param {string} t
 * @return {string}
 */
var minWindow = function(s, t) {
    const map = new Array(128).fill(0)

    for (let i = 0; i < t.length; i++) {
        map[t.charCodeAt(i)]++
    }

    let count = t.length
    let begin = 0
    let end = 0
    let d = Number.MAX_VALUE
    let head = 0

    while (end < s.length) {
        if (map[s.charCodeAt(end++)]-- > 0) {
            count--
        }

        while (count === 0) {
            if (end - begin < d) {
                d = end - begin
                head = begin
            }
            if (map[s.charCodeAt(begin++)]++ === 0) {
                count++
            }
        }
    }

    return d === Number.MAX_VALUE ? '' : s.substring(head, head + d)
};

export { minWindow }
