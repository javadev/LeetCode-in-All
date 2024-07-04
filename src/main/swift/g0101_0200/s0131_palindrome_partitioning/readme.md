131\. Palindrome Partitioning

Medium

Given a string `s`, partition `s` such that every substring of the partition is a **palindrome**. Return all possible palindrome partitioning of `s`.

A **palindrome** string is a string that reads the same backward as forward.

**Example 1:**

**Input:** s = "aab"

**Output:** [["a","a","b"],["aa","b"]] 

**Example 2:**

**Input:** s = "a"

**Output:** [["a"]] 

**Constraints:**

*   `1 <= s.length <= 16`
*   `s` contains only lowercase English letters.

To solve the "Palindrome Partitioning" problem in Swift with a `Solution` class, we'll use backtracking. Below are the steps:

1. **Create a `Solution` class**: Define a class named `Solution` to encapsulate our solution methods.

2. **Create a `partition` method**: This method takes a string `s` as input and returns all possible palindrome partitioning of `s`.

3. **Define a recursive helper method**: Define a recursive helper method `backtrack` to find all possible palindrome partitions.
   - The method should take the current index `start`, the current partition `partition`, and the list to store all partitions `result`.
   - Base case: If `start` reaches the end of the string `s`, add the current partition to the result list and return.
   - Iterate from `start` to the end of the string:
     - Check if the substring from `start` to `i` is a palindrome.
     - If it is a palindrome, add the substring to the current partition and recursively call the `backtrack` method with the updated index and partition.
     - After the recursive call, remove the last substring added to the partition to backtrack and explore other partitions.

4. **Initialize a list to store all partitions**: Create an ArrayList named `result` to store all possible palindrome partitions.

5. **Call the helper method**: Call the `backtrack` method with the initial index, an empty partition list, and the result list.

6. **Return the result list**: After exploring all possible partitions, return the list containing all palindrome partitions.

Here's the Swift implementation:

```swift
class Solution {
    func partition(_ s: String) -> [[String]] {
        var dict:[Int:[[String]]] = [:]
        var newStr = Array(s)
        dict[-1] = [[]]
        for i in 0..<newStr.count{
            var strArrs = [[String]]()
            for length in 1...i+1 {
                let candidate = String(newStr[(i+1-length)...i])
                if checkPalind(candidate){

                    for arr in dict[i-length]!{
                        var newArr = arr
                        newArr.append(candidate)
                        strArrs.append(newArr)
                    }

                }
            }

            dict[i] = strArrs
        }
        return dict[s.count-1]!
    }

    func checkPalind(_ str:String)->Bool{
        let strArr = Array(str)
        var valid = true
        var l = 0
        var r = strArr.count - 1
        while(l<=r){
            if strArr[l] == strArr[r]{
                l += 1
                r -= 1
            }else{
                valid = false
                break
            }
        }
        return valid
    }
}
```

This implementation follows the steps outlined above and efficiently finds all possible palindrome partitions of the given string in Swift.