17\. Letter Combinations of a Phone Number

Medium

Given a string containing digits from `2-9` inclusive, return all possible letter combinations that the number could represent. Return the answer in **any order**.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png)

**Example 1:**

**Input:** digits = "23"

**Output:** ["ad","ae","af","bd","be","bf","cd","ce","cf"] 

**Example 2:**

**Input:** digits = ""

**Output:** [] 

**Example 3:**

**Input:** digits = "2"

**Output:** ["a","b","c"] 

**Constraints:**

*   `0 <= digits.length <= 4`
*   `digits[i]` is a digit in the range `['2', '9']`.

To solve the Letter Combinations of a Phone Number problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `letterCombinations` that takes a string `digits` as input and returns a list of all possible letter combinations.
2. Create a mapping of digits to letters using a hashmap or an array.
3. Initialize an empty list `result` to store the combinations.
4. If the input string `digits` is empty, return an empty list `result`.
5. Call a recursive function `generateCombinations` to generate combinations for each digit.
6. Within the recursive function:
   - Base case: If the current combination length equals the length of the input `digits`, add the combination to the `result` list.
   - Recursive step: For the current digit, iterate over its corresponding letters and append each letter to the current combination, then recursively call the function with the next digit.
7. Return the `result` list containing all possible combinations.

Here's the implementation:

```swift
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }

        let letters = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var ans: [String] = []
        var curr = String()

        findCombinations(0, digits, letters, &curr, &ans)
        return ans
    }

    private func findCombinations(_ start: Int, _ digits: String, _ letters: [String], _ curr: inout String, _ ans: inout [String]) {
        if curr.count == digits.count {
            ans.append(curr)
            return
        }

        let index = digits.index(digits.startIndex, offsetBy: start)
        let digit = digits[index]
        let digitIndex = digit.wholeNumberValue!

        for letter in letters[digitIndex] {
            curr.append(letter)
            findCombinations(start + 1, digits, letters, &curr, &ans)
            curr.removeLast()
        }
    }
}
```

This implementation provides a solution to the Letter Combinations of a Phone Number problem in Swift.