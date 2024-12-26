// #Hard #Top_100_Liked_Questions #Array #Heap_Priority_Queue #Sliding_Window #Queue
// #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
// #2024_12_21_Time_28_ms_(98.27%)_Space_83.4_MB_(17.86%)

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSlidingWindow = function (nums, k) {
    let dq = []
    let i = 0, j = 0
    let res = []

    while (j < nums.length) {
        if (dq.length === 0) {
            dq.push(j)
        } else {
            while (dq.length !== 0 && nums[dq[dq.length - 1]] <= nums[j]) {
                dq.pop()
            }
            dq.push(j)
        }
        if ((j - i + 1) === k) {
            res.push(nums[dq[0]])
            if (dq[0] === i) {
                dq.shift()
            }
            i++
        }
        j++
    }
    return res 
};

export { maxSlidingWindow }
