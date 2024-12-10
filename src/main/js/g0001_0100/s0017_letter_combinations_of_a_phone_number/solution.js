// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
// #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(4^n)_Space_O(n) #2024_12_03_Time_0_ms_(100.00%)_Space_49.9_MB_(6.39%)

/**
 * @param {string} digits
 * @return {string[]}
 */
var letterCombinations = function (digits) {
    if (digits.length === 0) {
        return []
    }

    const letters = ['', '', 'abc', 'def', 'ghi', 'jkl', 'mno', 'pqrs', 'tuv', 'wxyz']
    const result = []
    const current = []

    function findCombinations(index) {
        if (current.length === digits.length) {
            result.push(current.join(''))
            return
        }

        for (let i = index; i < digits.length; i++) {
            const digit = parseInt(digits[i])
            const letterGroup = letters[digit]

            for (const char of letterGroup) {
                current.push(char)
                findCombinations(i + 1)
                current.pop()
            }
        }
    }

    findCombinations(0)
    return result
}

export { letterCombinations }
