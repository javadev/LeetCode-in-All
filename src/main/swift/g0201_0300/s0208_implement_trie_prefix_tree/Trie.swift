// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Design #Trie
// #LeetCode_75_Trie #Level_2_Day_16_Design #Udemy_Trie_and_Heap #Top_Interview_150_Trie
// #Big_O_Time_O(word.length())_or_O(prefix.length())_Space_O(N)
// #2024_06_28_Time_131_ms_(97.26%)_Space_21.2_MB_(91.78%)

final class TrieNode {
    let data: Character
    var children: [TrieNode] = []
    var endOfWord: Bool = false
    init(_ data: Character) {
        self.data = data
    }
}

class Trie {
    var trie: TrieNode
    init() {
        trie = TrieNode(" ")
    }
    // add the first letter to this class's children
    // recursively, create new node to the next child and move to the next index
    // once we hit the end of the word, set the TrieNode.endOfWord = true
    func insert(_ word: String) {
        var wordArray = Array(word)
        var startNode = trie
        self.insert(&wordArray, 0, startNode)
    }

    private func insert(_ word: inout [Character], _ index: Int, _ node: TrieNode?) {
        guard let node else { return }
        guard index < word.count else {
            node.endOfWord = true
            return
        }
        var currNode: TrieNode?
        for childNode in node.children {
            if childNode.data == word[index] {
                currNode = childNode
                break
            }
        }
        if currNode == nil {
            currNode = TrieNode(word[index])
            node.children.append(currNode!)
        }
        let index = index + 1
        self.insert(&word, index, currNode)
    }
    
    func search(_ word: String) -> Bool {
        var words = Array(word)
        var trie = self.trie
        for letter in words {
            var foundLetter = false
            for child in trie.children {
                if letter == child.data {
                    trie = child
                    foundLetter = true
                    break
                }
            }
            if foundLetter == false {
                return false
            }
        }
        return trie.endOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var words = Array(prefix)
        var trie = self.trie
        for letter in words {
            var foundLetter = false
            for child in trie.children {
                if letter == child.data {
                    trie = child
                    foundLetter = true
                    break
                }
            }
            if foundLetter == false {
                return false
            }
        }
        return true
    }
}

/*
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
