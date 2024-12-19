// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Big_O_Time_O(N*2^N)_Space_O(2^N*N)
// #2024_12_15_Time_21_ms_(89.90%)_Space_71.7_MB_(95.05%)

/**
 * @param {string} s
 * @return {string[][]}
 */
var partition = function(s) {
    const res = []
    backtracking(res, [], s, 0)
    return res
};

const backtracking = (res, currArr, s, start) => {
    if (start === s.length) {
        res.push([...currArr]) // Add a copy of the current array to the result
        return
    }

    for (let end = start; end < s.length; end++) {
        if (!isPalindrome(s, start, end)) {
            continue
        }
        currArr.push(s.substring(start, end + 1)) // Add the current substring
        backtracking(res, currArr, s, end + 1) // Recurse to the next part
        currArr.pop() // Remove the last element to backtrack
    }
};

const isPalindrome = (s, start, end) => {
    while (start < end && s[start] === s[end]) {
        start++
        end--
    }
    return start >= end
};

export { partition }
