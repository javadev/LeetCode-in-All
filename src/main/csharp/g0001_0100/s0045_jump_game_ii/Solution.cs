namespace LeetCodeNet.G0001_0100.S0045_jump_game_ii {

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
// #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
// #2025_06_13_Time_0_ms_(100.00%)_Space_45.96_MB_(59.61%)

public class Solution {
    public int Jump(int[] nums) {
        int length = 0;
        int maxLength = 0;
        int minJump = 0;
        for (int i = 0; i < nums.Length - 1; ++i) {
            length--;
            maxLength--;
            maxLength = System.Math.Max(maxLength, nums[i]);
            if (length <= 0) {
                length = maxLength;
                minJump++;
            }
            if (length >= nums.Length - i - 1) {
                return minJump;
            }
        }
        return minJump;
    }
}
}
