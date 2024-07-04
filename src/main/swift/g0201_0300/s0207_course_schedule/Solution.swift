// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
// #Breadth_First_Search #Graph #Topological_Sort #Big_O_Time_O(N)_Space_O(N)
// #2024_06_28_Time_30_ms_(92.23%)_Space_15.6_MB_(98.23%)

class Solution {
    private let WHITE = 0
    private let GRAY = 1
    private let BLACK = 2

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj = Array(repeating: [Int](), count: numCourses)
        for pre in prerequisites {
            adj[pre[1]].append(pre[0])
        }

        var colors = Array(repeating: WHITE, count: numCourses)
        for i in 0..<numCourses {
            if colors[i] == WHITE && !adj[i].isEmpty && hasCycle(adj, i, &colors) {
                return false
            }
        }
        return true
    }

    private func hasCycle(_ adj: [[Int]], _ node: Int, _ colors: inout [Int]) -> Bool {
        colors[node] = GRAY
        for nei in adj[node] {
            if colors[nei] == GRAY {
                return true
            }
            if colors[nei] == WHITE && hasCycle(adj, nei, &colors) {
                return true
            }
        }
        colors[node] = BLACK
        return false
    }
}
