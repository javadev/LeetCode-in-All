// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
// #Breadth_First_Search #Graph #Topological_Sort #Big_O_Time_O(N)_Space_O(N)
// #2024_10_08_Time_361_ms_(86.67%)_Space_154.1_MB_(26.67%)

class Solution {
  static const int WHITE = 0;
  static const int GRAY = 1;
  static const int BLACK = 2;

  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    List<List<int>> adj = List.generate(numCourses, (_) => []);

    for (var pre in prerequisites) {
      adj[pre[1]].add(pre[0]);
    }

    List<int> colors = List.filled(numCourses, WHITE);

    for (int i = 0; i < numCourses; i++) {
      if (colors[i] == WHITE && adj[i].isNotEmpty && _hasCycle(adj, i, colors)) {
        return false;
      }
    }
    return true;
  }

  bool _hasCycle(List<List<int>> adj, int node, List<int> colors) {
    colors[node] = GRAY;

    for (int nei in adj[node]) {
      if (colors[nei] == GRAY) {
        return true;
      }
      if (colors[nei] == WHITE && _hasCycle(adj, nei, colors)) {
        return true;
      }
    }
    colors[node] = BLACK;
    return false;
  }
}
