139\. Word Break

Medium

Given a string `s` and a dictionary of strings `wordDict`, return `true` if `s` can be segmented into a space-separated sequence of one or more dictionary words.

**Note** that the same word in the dictionary may be reused multiple times in the segmentation.

**Example 1:**

**Input:** s = "leetcode", wordDict = ["leet","code"]

**Output:** true

**Explanation:** Return true because "leetcode" can be segmented as "leet code". 

**Example 2:**

**Input:** s = "applepenapple", wordDict = ["apple","pen"]

**Output:** true

**Explanation:** Return true because "applepenapple" can be segmented as "apple pen apple". Note that you are allowed to reuse a dictionary word. 

**Example 3:**

**Input:** s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]

**Output:** false 

**Constraints:**

*   `1 <= s.length <= 300`
*   `1 <= wordDict.length <= 1000`
*   `1 <= wordDict[i].length <= 20`
*   `s` and `wordDict[i]` consist of only lowercase English letters.
*   All the strings of `wordDict` are **unique**.

To solve the "Word Break" problem:

The problem requires us to determine if a string `s` can be segmented into a sequence of words from a dictionary `wordDict`.

### Steps to Approach:

1. **Understanding the Problem:**
   - We need to check if we can partition the string `s` such that each partition is a word from `wordDict`.
   - The same word from `wordDict` can be reused multiple times.

2. **Recursive Approach with Memoization:**
   - We'll use a recursive function (`canBeBroken`) that will attempt to break down the string `s` starting from each index.
   - Memoization (using `visited` array) helps avoid redundant computations by remembering if a substring starting from a particular index has already been processed.

3. **Implementation Details:**

   - **Initialization:** Convert each word in `wordDict` into an array of characters (`words`). Initialize `sSlice` as an array of characters from `s`.
   - **Recursive Function (`canBeBroken`):**
     - **Base Case:** If `startIndex` equals `chars.endIndex`, return `true`, indicating that the entire string has been successfully segmented.
     - Check if `visited[startIndex]` is `true` to skip processing if the substring starting from `startIndex` has already been explored.
     - Iterate through each word in `words`:
       - Check if the current substring (`chars`) starts with the current `word`.
       - If it does, recursively call `canBeBroken` with the remaining substring (`chars[startIndex.advanced(by: word.count)...]`).
       - If the recursive call returns `true`, return `true` immediately.
     - If no valid segmentation is found with any word, mark `visited[startIndex]` as `true` and return `false`.
   - **Edge Cases:** Handle cases where `s` is empty or where no segmentation is possible with the given `wordDict`.

4. **Complexity:** 
   - Time complexity is influenced by both the length of `s` and the number of words in `wordDict`.
   - Space complexity is primarily due to recursion depth and the `visited` array.

### Swift Implementation:

Here's the Swift implementation of the approach:

```swift
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var words = [[Character]]()
        for word in wordDict {
            words.append(Array(word))
        }
        let sSlice = Array(s)[...]
        var visited = Array(repeating: false, count: sSlice.count)
        return canBeBroken(sSlice, words, &visited)
    }

    func canBeBroken(
        _ chars: ArraySlice<Character>, 
        _ words: [[Character]],
        _ visited: inout [Bool]
    ) -> Bool {
        let startIndex = chars.startIndex
        guard startIndex != chars.endIndex else { return true }
        guard !visited[startIndex] else { return false }
        
        for word in words {
            guard chars.starts(with: word) else { continue }
            if canBeBroken(chars[startIndex.advanced(by: word.count)...], words, &visited) {
                return true
            }
        }
        
        visited[startIndex] = true
        return false
    }
}
```

### Explanation of the Swift Code:

- **Initialization (`wordBreak` function):**
  - Convert each word in `wordDict` into arrays of characters (`words`).
  - Convert the input string `s` into an array of characters (`sSlice`).
  - Initialize a `visited` array to keep track of whether a substring starting from each index has been explored.

- **Recursive Function (`canBeBroken`):**
  - **Base Case:** If `startIndex` equals `chars.endIndex`, return `true`, indicating successful segmentation.
  - Check if `visited[startIndex]` is `true` to avoid redundant computations.
  - Iterate through each word in `words`:
    - Check if the current substring (`chars`) starts with the current `word`.
    - If true, recursively call `canBeBroken` with the remaining substring (`chars[startIndex.advanced(by: word.count)...]`).
    - If the recursive call returns `true`, immediately return `true`.
  - If no valid segmentation is found, mark `visited[startIndex]` as `true` and return `false`.

This approach ensures that we explore all possible ways to segment `s` using words from `wordDict` while efficiently handling overlapping subproblems using memoization.