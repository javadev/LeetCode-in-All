// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
// #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
// #Big_O_Time_O(n*k_log_k)_Space_O(n) #2024_12_09_Time_24_ms_(91.62%)_Space_64.4_MB_(18.40%)

/**
 * @param {string[]} strs
 * @return {string[][]}
 */
var groupAnagrams = function(strs) {
    const anagrams = new Map()

    for (const word of strs) {
        const freq = new Array(26).fill(0)
        for (const char of word) {
            freq[char.charCodeAt(0) - 'a'.charCodeAt(0)]++
        }
        const keyString = freq.join(',')

        if (!anagrams.has(keyString)) {
            anagrams.set(keyString, [])
        }
        anagrams.get(keyString).push(word)
    }

    return Array.from(anagrams.values())
};

export { groupAnagrams }
