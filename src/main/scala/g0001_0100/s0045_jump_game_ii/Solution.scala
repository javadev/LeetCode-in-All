package g0001_0100.s0045_jump_game_ii

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
// #Big_O_Time_O(n)_Space_O(1) #2023_10_31_Time_510_ms_(88.52%)_Space_56_MB_(65.57%)

object Solution {
    def jump(nums: Array[Int]): Int = {
        var length = 0
        var maxLength = 0
        var minJump = 0

        for (i <- 0 until nums.length - 1) {
            length -= 1
            maxLength -= 1
            maxLength = math.max(maxLength, nums(i))

            if (length <= 0) {
                length = maxLength
                minJump += 1
            }

            if (length >= nums.length - i - 1) {
                return minJump
            }
        }

        minJump
    }
}
