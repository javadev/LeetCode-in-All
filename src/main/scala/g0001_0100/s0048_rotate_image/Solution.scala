package g0001_0100.s0048_rotate_image

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Matrix
// #Data_Structure_II_Day_3_Array #Programming_Skills_II_Day_7 #Udemy_2D_Arrays/Matrix
// #Big_O_Time_O(n^2)_Space_O(1) #2023_10_31_Time_472_ms_(66.67%)_Space_55.3_MB_(20.83%)

object Solution {
    def rotate(matrix: Array[Array[Int]]): Unit = {
        val n = matrix.length

        for (i <- 0 until n / 2) {
            for (j <- i until n - i - 1) {
                val positions = Array(
                    (i, j), (j, n - 1 - i), (n - 1 - i, n - 1 - j), (n - 1 - j, i)
                )
                var temp = matrix(positions(0)._1)(positions(0)._2)
                for (k <- 1 until positions.length) {
                    val nextTemp = matrix(positions(k)._1)(positions(k)._2)
                    matrix(positions(k)._1)(positions(k)._2) = temp
                    temp = nextTemp
                }
                matrix(positions(0)._1)(positions(0)._2) = temp
            }
        }
    }
}
