49\. Group Anagrams

Medium

Given an array of strings `strs`, group **the anagrams** together. You can return the answer in **any order**.

An **Anagram** is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**Example 1:**

**Input:** strs = ["eat","tea","tan","ate","nat","bat"]

**Output:** [["bat"],["nat","tan"],["ate","eat","tea"]] 

**Example 2:**

**Input:** strs = [""]

**Output:** [[""]] 

**Example 3:**

**Input:** strs = ["a"]

**Output:** [["a"]] 

**Constraints:**

*   <code>1 <= strs.length <= 10<sup>4</sup></code>
*   `0 <= strs[i].length <= 100`
*   `strs[i]` consists of lowercase English letters.

To solve the "Group Anagrams" problem in Swift with the Solution class, follow these steps:

1. Define a method `groupAnagrams` in the `Solution` class that takes an array of strings `strs` as input and returns a list of lists of strings.
2. Initialize an empty HashMap to store the groups of anagrams. The key will be the sorted string, and the value will be a list of strings.
3. Iterate through each string `str` in the input array `strs`.
4. Sort the characters of the current string `str` to create a key for the HashMap.
5. Check if the sorted string exists as a key in the HashMap:
   - If it does, add the original string `str` to the corresponding list of strings.
   - If it doesn't, create a new entry in the HashMap with the sorted string as the key and a new list containing `str` as the value.
6. After iterating through all strings, return the values of the HashMap as the result.

Here's the implementation of the `groupAnagrams` method in Swift:

```swift
public class Solution {
    public func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hm = [String: [String]]()
        for s in strs {
            let sortedStr = String(s.sorted())
            if hm[sortedStr] == nil {
                hm[sortedStr] = [String]()
            }
            hm[sortedStr]!.append(s)
        }
        return Array(hm.values)
    }
}
```

This implementation ensures that all anagrams are grouped together efficiently using a HashMap.