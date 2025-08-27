// #Easy #Math #Udemy_Integers #Top_Interview_150_Math #Big_O_Time_O(log10(x))_Space_O(1)
// #2024_12_03_Time_4_ms_(97.14%)_Space_59.8_MB_(5.70%)

/**
 * @param {number} x
 * @return {boolean}
 */
var isPalindrome = function (x) {
    if (x < 0) {
        return false
    }

    let rev = 0
    let localX = x

    while (localX > 0) {
        rev = rev * 10 + (localX % 10)
        localX = Math.floor(localX / 10)
    }

    return rev === x
}

export { isPalindrome }
