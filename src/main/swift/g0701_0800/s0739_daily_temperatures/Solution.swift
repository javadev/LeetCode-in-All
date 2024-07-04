// #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #Programming_Skills_II_Day_6
// #Big_O_Time_O(n)_Space_O(n) #2024_07_03_Time_535_ms_(99.24%)_Space_26.9_MB_(19.32%)

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var sol = [Int](repeating: 0, count: temperatures.count)
        sol[temperatures.count - 1] = 0
        for i in (0..<sol.count - 1).reversed() {
            var j = i + 1
            while j < sol.count {
                if temperatures[i] < temperatures[j] {
                    sol[i] = j - i
                    break
                } else {
                    if sol[j] == 0 {
                        break
                    }
                    j += sol[j]
                }
            }
        }
        return sol
    }
}
