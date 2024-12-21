// #Hard #Top_100_Liked_Questions #Array #Heap_Priority_Queue #Sliding_Window #Queue
// #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
// #2024_12_21_Time_28_ms_(98.27%)_Space_83.4_MB_(17.86%)

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSlidingWindow = function (nums, k) {
    // initialize an empty deqeue
    let dq = []
    // initailize two pointers with 0
    let i = 0, j = 0

    // intiailize an empty result variable
    let res = []

    // loop till j reaches to the end of loop
    while (j < nums.length) {

        // if dq is empty, push j
        if (dq.length === 0) {
            dq.push(j)
        } else {
            // if dq is non empty & back element in deqeue is less or equals to nums[j],
            // pop back element from deqeue
            while (dq.length !== 0 && nums[dq[dq.length - 1]] <= nums[j]) {
                dq.pop()
            }

            // push j in deqeue
            dq.push(j)
        }

        // if current window size is equals to k,
        // push front deqeue element in res
        if ((j - i + 1) === k) {
            res.push(nums[dq[0]])

            // if front deqeue element is equals to i,
            // remove front deqeue element
            if (dq[0] === i) {
                dq.shift()
            }

            // increment i by 1
            i++
        }

        // increment j by 1
        j++
    }

    // return result
    return res 
};

export { maxSlidingWindow }
