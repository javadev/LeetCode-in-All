// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
// #Breadth_First_Search #Graph #Topological_Sort #Big_O_Time_O(N)_Space_O(N)
// #2024_12_17_Time_6_ms_(95.35%)_Space_57_MB_(39.46%)

/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {boolean}
 */
const WHITE = 0;
const GRAY = 1;
const BLACK = 2;

var canFinish = function(numCourses, prerequisites) {
    const adj = Array.from({ length: numCourses }, () => []);

    for (const [course, prerequisite] of prerequisites) {
        adj[prerequisite].push(course);
    }

    const colors = new Array(numCourses).fill(WHITE);

    for (let i = 0; i < numCourses; i++) {
        if (colors[i] === WHITE && adj[i].length > 0 && hasCycle(adj, i, colors)) {
            return false;
        }
    }

    return true;
};

var hasCycle = function(adj, node, colors) {
    colors[node] = GRAY;

    for (const neighbor of adj[node]) {
        if (colors[neighbor] === GRAY) {
            return true;
        }
        if (colors[neighbor] === WHITE && hasCycle(adj, neighbor, colors)) {
            return true;
        }
    }

    colors[node] = BLACK;
    return false;
};

export { canFinish }
