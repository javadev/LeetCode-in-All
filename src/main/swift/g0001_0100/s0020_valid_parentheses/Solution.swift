// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
// #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Top_Interview_150_Stack
// #Big_O_Time_O(n)_Space_O(n) #2024_06_18_Time_0_ms_(100.00%)_Space_16.3_MB_(43.79%)

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else if char == ")" && !stack.isEmpty && stack.last == "(" {
                stack.popLast()
            } else if char == "}" && !stack.isEmpty && stack.last == "{" {
                stack.popLast()
            } else if char == "]" && !stack.isEmpty && stack.last == "[" {
                stack.popLast()
            } else {
                return false
            }
        }
        
        return stack.isEmpty
    }
}
