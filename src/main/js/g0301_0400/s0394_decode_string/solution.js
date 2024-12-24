// #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(n) #2024_12_22_Time_0_ms_(100.00%)_Space_49.4_MB_(10.78%)

/**
 * @param {string} s
 * @return {string}
 */
var decodeString = function(s) {
    let i = 0

    const helper = () => {
        let count = 0
        let sb = ''

        while (i < s.length) {
            const c = s[i]
            i++

            if (/[a-zA-Z]/.test(c)) {
                sb += c
            } else if (/\d/.test(c)) {
                count = count * 10 + Number(c)
            } else if (c === ']') {
                break
            } else if (c === '[') {
                // Recursive call for the substring
                const repeat = helper()
                while (count > 0) {
                    sb += repeat
                    count--
                }
            }
        }

        return sb
    }

    return helper()
};

export { decodeString }
