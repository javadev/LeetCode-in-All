// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Stack #Monotonic_Stack
// #Big_O_Time_O(n_log_n)_Space_O(log_n) #2024_06_25_Time_288_ms_(95.83%)_Space_19.9_MB_(54.17%)

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        return largestArea(heights, 0, heights.count)
    }

    private func largestArea(_ a: [Int], _ start: Int, _ limit: Int) -> Int {
        if a.isEmpty {
            return 0
        }
        if start == limit {
            return 0
        }
        if limit - start == 1 {
            return a[start]
        }
        if limit - start == 2 {
            let maxOfTwoBars = max(a[start], a[start + 1])
            let areaFromTwo = min(a[start], a[start + 1]) * 2
            return max(maxOfTwoBars, areaFromTwo)
        }
        if checkIfSorted(a, start, limit) {
            var maxWhenSorted = 0
            for i in start..<limit {
                if a[i] * (limit - i) > maxWhenSorted {
                    maxWhenSorted = a[i] * (limit - i)
                }
            }
            return maxWhenSorted
        } else {
            let minInd = findMinInArray(a, start, limit)
            return maxOfThreeNums(
                largestArea(a, start, minInd),
                a[minInd] * (limit - start),
                largestArea(a, minInd + 1, limit)
            )
        }
    }

    private func findMinInArray(_ a: [Int], _ start: Int, _ limit: Int) -> Int {
        var min = Int.max
        var minIndex = -1
        for index in start..<limit {
            if a[index] < min {
                min = a[index]
                minIndex = index
            }
        }
        return minIndex
    }

    private func checkIfSorted(_ a: [Int], _ start: Int, _ limit: Int) -> Bool {
        for i in (start + 1)..<limit {
            if a[i] < a[i - 1] {
                return false
            }
        }
        return true
    }

    private func maxOfThreeNums(_ a: Int, _ b: Int, _ c: Int) -> Int {
        return max(max(a, b), c)
    }
}
