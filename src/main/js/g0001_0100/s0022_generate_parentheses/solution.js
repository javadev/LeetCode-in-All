// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n) #2024_12_04_Time_0_ms_(100.00%)_Space_50.7_MB_(42.00%)

/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function(n) {
    const result = [];
    
    const generate = (current, open, close) => {
        if (open === 0 && close === 0) {
            result.push(current);
            return;
        }
        if (open > 0) {
            generate(current + '(', open - 1, close);
        }
        if (close > 0 && open < close) {
            generate(current + ')', open, close - 1);
        }
    };

    generate('', n, n);
    return result;
};

export { generateParenthesis }
