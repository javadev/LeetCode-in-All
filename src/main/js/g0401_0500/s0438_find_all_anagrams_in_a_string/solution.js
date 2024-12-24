// #Medium #Top_100_Liked_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_II_Day_5_Sliding_Window #Programming_Skills_II_Day_12
// #Level_1_Day_12_Sliding_Window/Two_Pointer #Big_O_Time_O(n+m)_Space_O(1)
// #2024_12_24_Time_5_ms_(99.89%)_Space_52.4_MB_(99.43%)

/**
 * @param {string} s
 * @param {string} p
 * @return {number[]}
 */
var findAnagrams = function(s, p) {
    const map = new Array(26).fill(0)
    for (let i = 0; i < p.length; i++) {
        map[p.charCodeAt(i) - 'a'.charCodeAt(0)]++
    }

    const res = []
    let i = 0
    let j = 0

    while (i < s.length) {
        const idx = s.charCodeAt(i) - 'a'.charCodeAt(0)
        // Add the new character
        map[idx]--

        // If the length is greater than the window's length, pop the left character
        if (i >= p.length) {
            map[s.charCodeAt(j++) - 'a'.charCodeAt(0)]++
        }

        let finish = true
        for (let k = 0; k < 26; k++) {
            // If it's not an anagram of string p
            if (map[k] !== 0) {
                finish = false
                break
            }
        }

        if (i >= p.length - 1 && finish) {
            res.push(j)
        }
        i++
    }

    return res
};

export { findAnagrams }
