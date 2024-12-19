// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
// #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
// #Big_O_Time_O(n)_Space_O(1) #2024_12_17_Time_0_ms_(100.00%)_Space_51.8_MB_(69.63%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function(arr) {
    let count = 1
    let majority = arr[0]

    // For Potential Majority Element
    for (let i = 1; i < arr.length; i++) {
        if (arr[i] === majority) {
            count++;
        } else if (count > 1) {
            count--;
        } else {
            majority = arr[i];
        }
    }

    // For Confirmation
    count = 0
    for (const num of arr) {
        if (num === majority) {
            count++
        }
    }

    if (count >= Math.floor(arr.length / 2) + 1) {
        return majority
    } else {
        return -1
    }
};

export { majorityElement }
