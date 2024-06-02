package g0201_0300.s0207_course_schedule

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
// #Breadth_First_Search #Graph #Topological_Sort #Big_O_Time_O(N)_Space_O(N)
// #2024_06_02_Time_720_ms_(91.11%)_Space_61.7_MB_(75.56%)

object Solution {
    def canFinish(numCourses: Int, prerequisites: Array[Array[Int]]): Boolean = {
        import scala.collection.mutable.{Queue, ListBuffer}
        val indegree = Array.fill(numCourses)(0)
        val graph = Array.fill(numCourses)(new ListBuffer[Int])
        for (data <- prerequisites) {
            val course = data.head
            val prerequisiteCourse = data.last
            indegree(course) = indegree(course) + 1
            graph(prerequisiteCourse) += course
        }
        val startingCourses = indegree.zipWithIndex.filter(_._1.equals(0)).map(_._2)
        val queue = Queue[Int](startingCourses: _*)
        var courseTaken = 0
        while (queue.nonEmpty) {
            val current = queue.dequeue
            courseTaken = courseTaken + 1
            for (neighbor <- graph(current)) {
                indegree(neighbor) = indegree(neighbor) - 1
                if (indegree(neighbor).equals(0)) {
                    queue.enqueue(neighbor)
                }
            }
        }
        courseTaken == numCourses
    }
}
