// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
// #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n*2^n) #2024_12_11_Time_0_ms_(100.00%)_Space_53.5_MB_(8.72%)

/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var subsets = function(nums) {
    const res = []
    
    const solve = (temp, start) => {
        // Add a copy of the current subset
        res.push([...temp])
        
        for (let i = start; i < nums.length; i++) {
            // Include nums[i] in the current subset
            temp.push(nums[i])
            
            // Recur for the next index
            solve(temp, i + 1)
            
            // Backtrack by removing the last added element
            temp.pop()
        }
    }
    
    solve([], 0) // Start with an empty subset and index 0
    return res
};

export { subsets }
