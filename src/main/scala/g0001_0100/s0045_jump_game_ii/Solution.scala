package g0001_0100.s0045_jump_game_ii

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
// #Big_O_Time_O(n)_Space_O(1) #2024_06_01_Time_653_ms_(83.87%)_Space_58.6_MB_(87.10%)

object Solution {
    def jump(nums: Array[Int]): Int = {
        var length = 0
        var maxLength = 0
        var minJump = 0

        var result = -1
        for (i <- 0 until nums.length - 1 if result == -1) {
            length -= 1
            maxLength -= 1
            maxLength = math.max(maxLength, nums(i))

            if (length <= 0) {
                length = maxLength
                minJump += 1
            }

            if (length >= nums.length - i - 1) {
                result = minJump
            }
        }

        if (result == -1) minJump else result
    }
}
