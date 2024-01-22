package g0201_0300.s0207_course_schedule

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
// #Breadth_First_Search #Graph #Topological_Sort #Big_O_Time_O(N)_Space_O(N)
// #2023_11_05_Time_548_ms_(87.81%)_Space_60_MB_(12.20%)

import scala.collection.mutable.ArrayBuffer

object Solution {
    val WHITE = 0
    val GRAY = 1
    val BLACK = 2

    def canFinish(numCourses: Int, prerequisites: Array[Array[Int]]): Boolean = {
        val adj = Array.fill(numCourses)(new ArrayBuffer[Int]())
        prerequisites.foreach { pre =>
            adj(pre(1)).append(pre(0))
        }

        val colors = Array.fill(numCourses)(WHITE)
        (0 until numCourses).forall { i =>
            if (colors(i) == WHITE && adj(i).nonEmpty && hasCycle(adj, i, colors)) {
                false
            } else {
                true
            }
        }
    }

    private def hasCycle(adj: Array[ArrayBuffer[Int]], node: Int, colors: Array[Int]): Boolean = {
        colors(node) = GRAY
        adj(node).foreach { nei =>
            if (colors(nei) == GRAY) {
                return true
            }
            if (colors(nei) == WHITE && hasCycle(adj, nei, colors)) {
                return true
            }
        }
        colors(node) = BLACK
        false
    }
}
