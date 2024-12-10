// #Medium #Top_Interview_Questions #Math #Udemy_Integers
// #2024_12_04_Time_67_ms_(85.38%)_Space_53.1_MB_(34.57%)

/**
 * @param {number} x
 * @return {number}
 */
var reverse = function (x) {
    let rev = 0
    while (x !== 0) {
        rev = rev * 10 + (x % 10)
        x = Math.trunc(x / 10)
    }
    if (rev > Math.pow(2, 31) - 1 || rev < -Math.pow(2, 31)) {
        return 0
    }
    return rev
}

export { reverse }
