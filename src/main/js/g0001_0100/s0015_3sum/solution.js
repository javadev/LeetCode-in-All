// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
// #Top_Interview_150_Two_Pointers #Big_O_Time_O(n*log(n))_Space_O(n^2)
// #2024_12_03_Time_31_ms_(91.92%)_Space_66.4_MB_(31.02%)

/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function (nums) {
    nums.sort((a, b) => a - b)
    const len = nums.length
    const result = []
    let i = 0;
    while (i < len - 2) {
        let l = i + 1
        let r = len - 1
        while (r > l) {
            const sum = nums[i] + nums[l] + nums[r]
            if (sum < 0) {
                l++
            } else if (sum > 0) {
                r--
            } else {
                result.push([nums[i], nums[l], nums[r]])

                while (l < r && nums[l + 1] === nums[l]) {
                    l++
                }

                while (r > l && nums[r - 1] === nums[r]) {
                    r--
                }

                l++
                r--
            }
        }
        while (i < len - 1 && nums[i + 1] === nums[i]) {
            i++
        }
        i++
    }
    return result
}

export { threeSum }
