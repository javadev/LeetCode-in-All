// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Data_Structure_II_Day_9_String #Algorithm_II_Day_14_Dynamic_Programming
// #Dynamic_Programming_I_Day_17 #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2024_11_29_Time_10_ms_(99.54%)_Space_52.7_MB_(52.69%)

/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function (s) {
    // Create the transformed string with '#' characters
    const newStr = new Array(s.length * 2 + 1).fill('#')
    for (let i = 0; i < s.length; i++) {
        newStr[2 * i + 1] = s[i]
    }

    const dp = new Array(newStr.length).fill(0) // Array to store radius of palindromes
    let friendCenter = 0 // Center of the current known palindrome
    let friendRadius = 0 // Radius of the current known palindrome
    let lpsCenter = 0 // Center of the longest palindrome
    let lpsRadius = 0 // Radius of the longest palindrome

    for (let i = 0; i < newStr.length; i++) {
        // Calculate initial radius
        dp[i] =
            friendCenter + friendRadius > i ? Math.min(dp[2 * friendCenter - i], friendCenter + friendRadius - i) : 1

        // Expand the palindrome around the current center
        while (i + dp[i] < newStr.length && i - dp[i] >= 0 && newStr[i + dp[i]] === newStr[i - dp[i]]) {
            dp[i]++
        }

        // Update the friend palindrome if needed
        if (friendCenter + friendRadius < i + dp[i]) {
            friendCenter = i
            friendRadius = dp[i]
        }

        // Update the longest palindrome if needed
        if (lpsRadius < dp[i]) {
            lpsCenter = i
            lpsRadius = dp[i]
        }
    }

    // Extract the longest palindrome substring
    const start = Math.floor((lpsCenter - lpsRadius + 1) / 2)
    const end = Math.floor((lpsCenter + lpsRadius - 1) / 2)
    return s.substring(start, end)
}

export { longestPalindrome }
